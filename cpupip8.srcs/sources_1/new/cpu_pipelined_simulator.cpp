#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <string>
#include <cstdint>

using namespace std;

// 模拟您的精确流水线CPU行为
class ExactPipelinedCPUSimulator {
private:
    // 32个通用寄存器
    vector<int32_t> registers;
    vector<int32_t> instruction_memory;
    
    // 5级流水线：IF, ID, EX, MEM, WB
    struct PipelineStage {
        bool valid;      // 流水线阶段是否有效
        int32_t pc;      // 程序计数器
        int32_t instr;   // 指令
        uint32_t dest_reg; // 目标寄存器
        int32_t result;  // 计算结果
        uint32_t rs, rt, rd; // 源和目标寄存器编号
        
        PipelineStage() : valid(false), pc(0), instr(0), dest_reg(0), result(0), rs(0), rt(0), rd(0) {}
    };
    
    PipelineStage pipe[5]; // 5 stages: 0=IF, 1=ID, 2=EX, 3=MEM, 4=WB
    
    int32_t display_pc; // 显示用的PC，对应当前周期IF阶段的PC
    
    // 指令解码函数
    void decode_instruction(int32_t instr, uint8_t& opcode, uint8_t& funct, 
                          uint32_t& rs, uint32_t& rt, uint32_t& rd, uint32_t& shamt, uint32_t& imm) {
        opcode = (instr >> 26) & 0x3F;  // 31-26位
        rs = (instr >> 21) & 0x1F;      // 25-21位
        rt = (instr >> 16) & 0x1F;      // 20-16位
        rd = (instr >> 11) & 0x1F;      // 15-11位
        shamt = (instr >> 6) & 0x1F;    // 10-6位
        imm = instr & 0xFFFF;           // 15-0位
        funct = instr & 0x3F;           // 5-0位，R类型
    }
    
    // 符号扩展
    int32_t sign_extend_16_to_32(uint16_t value) {
        if (value & 0x8000) {
            return static_cast<int32_t>(0xFFFF0000 | value);
        } else {
            return static_cast<int32_t>(value);
        }
    }
    
    // ALU操作
    int32_t alu_operation(uint8_t alu_op, int32_t a, int32_t b) {
        switch(alu_op) {
            case 0:  return static_cast<uint32_t>(a) + static_cast<uint32_t>(b);  // ADDU
            case 1:  return a - b;                                                 // SUBU
            case 2:  return a + b;                                                 // ADD
            case 3:  return a - b;                                                 // SUB
            case 4:  return a & b;                                                 // AND
            case 5:  return a | b;                                                 // OR
            case 6:  return a ^ b;                                                 // XOR
            case 7:  return ~(a | b);                                              // NOR
            case 8:  return static_cast<int32_t>((b & 0xFFFF) << 16);             // LUI
            case 10: return (static_cast<uint32_t>(a) < static_cast<uint32_t>(b)) ? 1 : 0; // SLTU
            case 11: return (a < b) ? 1 : 0;                                      // SLT
            case 12: { // SRA - 算术右移
                int shift = a & 0x1F;
                if (shift >= 32) return (b & 0x80000000) ? 0xFFFFFFFF : 0x00000000;
                else return (b >> shift) | ((b & 0x80000000) ? ((1 << (32-shift)) - 1) << (32-shift) : 0);
            }
            case 13: // SRL - 逻辑右移
                return static_cast<uint32_t>(b) >> (a & 0x1F);
            case 14: // SLL - 逻辑左移
                return b << (a & 0x1F);
            default: return 0;
        }
    }
    
    // 获取ALU操作码
    uint8_t get_alu_op(int32_t instr) {
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        if (opcode == 0x00) { // R-type
            switch(funct) {
                case 0x20: return 2;  // ADD
                case 0x21: return 0;  // ADDU
                case 0x22: return 3;  // SUB
                case 0x23: return 1;  // SUBU
                case 0x24: return 4;  // AND
                case 0x25: return 5;  // OR
                case 0x26: return 6;  // XOR
                case 0x27: return 7;  // NOR
                case 0x2A: return 11; // SLT
                case 0x2B: return 10; // SLTU
                case 0x00: return 14; // SLL
                case 0x02: return 13; // SRL
                case 0x03: return 12; // SRA
                default: return 0;
            }
        } else if (opcode == 0x08) { // ADDI
            return 2;  // 使用ADD
        } else if (opcode == 0x09) { // ADDIU
            return 0;  // 使用ADDU
        } else if (opcode == 0x0C || opcode == 0x0D || opcode == 0x0E) { // ANDI, ORI, XORI
            return (opcode == 0x0C) ? 4 : (opcode == 0x0D) ? 5 : 6;  // AND, OR, XOR
        } else if (opcode == 0x0F) { // LUI
            return 8;  // LUI
        } else if (opcode == 0x23 || opcode == 0x2B) { // LW, SW
            return 0;  // ADDU for address calculation
        } else {
            return 0;
        }
    }

public:
    ExactPipelinedCPUSimulator() : registers(32, 0) {
        registers[0] = 0; // $0寄存器始终为0
        display_pc = 0;
        
        // 初始化流水线阶段
        for (int i = 0; i < 5; i++) {
            pipe[i] = PipelineStage();
        }
    }
    
    void load_hex_file(const string& filename) {
        ifstream file(filename);
        string line;
        
        while (getline(file, line)) {
            if (line.empty()) continue;
            
            uint32_t hex_val;
            stringstream ss;
            ss << std::hex << line;
            ss >> hex_val;
            
            instruction_memory.push_back(static_cast<int32_t>(hex_val));
        }
    }
    
    void print_state(ostream& out, int32_t current_display_pc) {
        out << "pc: " << setw(8) << setfill('0') << hex << current_display_pc << endl;
        
        // 获取当前PC处的指令
        int addr = current_display_pc / 4;
        if (addr < instruction_memory.size()) {
            out << "instr: " << setw(8) << setfill('0') << hex << instruction_memory[addr] << endl;
        } else {
            out << "instr: " << setw(8) << setfill('0') << hex << 0 << endl;
        }
        
        for (int i = 0; i < 32; i++) {
            out << "regfile" << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
        }
    }
    
    void execute_cycle() {
        // 5. 执行每个流水线阶段
        // 首先执行WB阶段（写回已完成的指令结果）
        if (pipe[4].valid && pipe[4].dest_reg != 0) {  // WB阶段
            registers[pipe[4].dest_reg] = pipe[4].result;
        }
        
        // 4. 移动流水线 (从后往前移动，防止覆盖)
        for (int i = 4; i > 0; i--) {
            pipe[i] = pipe[i-1];
        }
        
        // 3. 新的IF阶段 (获取新的指令)
        int next_instr_addr = display_pc / 4;
        if (next_instr_addr < instruction_memory.size()) {
            pipe[0].valid = true;
            pipe[0].pc = display_pc;
            pipe[0].instr = instruction_memory[next_instr_addr];
            
            // 解码指令
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[0].instr, opcode, funct, rs, rt, rd, shamt, imm);
            
            pipe[0].rs = rs;
            pipe[0].rt = rt;
            if (opcode == 0x00) { // R-type
                pipe[0].rd = rd;
                pipe[0].dest_reg = rd;
            } else { // I-type
                pipe[0].rd = 0; // 仅对R-type有效
                pipe[0].dest_reg = rt; // I-type指令目标是rt
            }
        } else {
            pipe[0].valid = false;
            pipe[0].pc = display_pc;
            pipe[0].instr = 0;
            pipe[0].dest_reg = 0;
        }
        
        // 2. EX阶段: 执行ALU操作
        if (pipe[2].valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[2].instr, opcode, funct, rs, rt, rd, shamt, imm);
            
            // 获取操作数
            int32_t a = registers[pipe[2].rs];
            int32_t b;
            
            if (opcode == 0x00) { // R-type
                b = registers[pipe[2].rt];
            } else if (opcode == 0x08 || opcode == 0x09 || 
                      opcode == 0x23 || opcode == 0x2B || 
                      opcode == 0x0C || opcode == 0x0D || 
                      opcode == 0x0E) { // I-type with immediate
                b = sign_extend_16_to_32(imm);
            } else if (opcode == 0x0F) { // LUI
                b = static_cast<int32_t>(imm << 16);
            } else {
                b = registers[pipe[2].rt];
            }
            
            // 执行ALU操作
            uint8_t alu_op = get_alu_op(pipe[2].instr);
            pipe[2].result = alu_operation(alu_op, a, b);
        }
        
        // 1. 更新显示PC (为下一周期准备)
        display_pc += 4;
        
        // 确保$0寄存器始终为0
        registers[0] = 0;
    }
    
    void simulate(const string& input_file, const string& output_file) {
        load_hex_file(input_file);
        
        ofstream outfile(output_file);
        
        // 运行足够的周期来填充、执行和排空流水线
        int total_cycles = instruction_memory.size() + 5; // +5确保流水线完全排空
        
        for (int cycle = 0; cycle < total_cycles; cycle++) {
            print_state(outfile, display_pc);
            execute_cycle();
        }
    }
};

int main(int argc, char* argv[]) {
    ExactPipelinedCPUSimulator cpu;
    
    string input_file = "1_addi.hex.txt";
    string output_file = "1_pipelined.result.txt";
    
    if (argc >= 2) {
        input_file = argv[1];
    }
    if (argc >= 3) {
        output_file = argv[2];
    }
    
    cpu.simulate(input_file, output_file);
    
    cout << "精确流水线CPU模拟完成。结果已保存到 " << output_file << endl;
    return 0;
}