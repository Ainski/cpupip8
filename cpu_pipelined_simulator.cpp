#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <string>
#include <cstdint>

#define DEBUG_BRANCH 0  // 设置为1启用分支调试输出，完成后设为0

using namespace std;

class ExactPipelinedCPUSimulator {
private:
    vector<int32_t> registers;
    vector<int32_t> instruction_memory;
    
    struct PipelineStage {
        bool valid;
        int32_t pc;
        int32_t instr;
        uint32_t dest_reg;
        int32_t result;
        uint32_t rs, rt, rd;
        
        PipelineStage() : valid(false), pc(0), instr(0), dest_reg(0), result(0), rs(0), rt(0), rd(0) {}
    };
    
    PipelineStage pipe[5];
    int32_t display_pc;
    
    void decode_instruction(int32_t instr, uint8_t& opcode, uint8_t& funct, 
                          uint32_t& rs, uint32_t& rt, uint32_t& rd, uint32_t& shamt, uint32_t& imm) {
        opcode = (instr >> 26) & 0x3F;
        rs = (instr >> 21) & 0x1F;
        rt = (instr >> 16) & 0x1F;
        rd = (instr >> 11) & 0x1F;
        shamt = (instr >> 6) & 0x1F;
        imm = instr & 0xFFFF;
        funct = instr & 0x3F;
    }
    
    int32_t sign_extend_16_to_32(uint16_t value) {
        if (value & 0x8000) {
            return static_cast<int32_t>(0xFFFF0000 | value);
        } else {
            return static_cast<int32_t>(value);
        }
    }
    
    int32_t alu_operation(uint8_t alu_op, int32_t a, int32_t b) {
        switch(alu_op) {
            case 0:  return static_cast<uint32_t>(a) + static_cast<uint32_t>(b);
            case 1:  return a - b;
            case 2:  return a + b;
            case 3:  return a - b;
            case 4:  return a & b;
            case 5:  return a | b;
            case 6:  return a ^ b;
            case 7:  return ~(a | b);
            case 8:  return static_cast<int32_t>((b & 0xFFFF) << 16);
            case 10: return (static_cast<uint32_t>(a) < static_cast<uint32_t>(b)) ? 1 : 0;
            case 11: return (a < b) ? 1 : 0;
            case 12: {
                int shift = a & 0x1F;
                if (shift >= 32) return (b & 0x80000000) ? 0xFFFFFFFF : 0x00000000;
                else return (b >> shift) | ((b & 0x80000000) ? ((1 << (32-shift)) - 1) << (32-shift) : 0);
            }
            case 13: return static_cast<uint32_t>(b) >> (a & 0x1F);
            case 14: return b << (a & 0x1F);
            default: return 0;
        }
    }
    
    uint8_t get_alu_op(int32_t instr) {
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        if (opcode == 0x00) {
            switch(funct) {
                case 0x20: return 2;
                case 0x21: return 0;
                case 0x22: return 3;
                case 0x23: return 1;
                case 0x24: return 4;
                case 0x25: return 5;
                case 0x26: return 6;
                case 0x27: return 7;
                case 0x2A: return 11;
                case 0x2B: return 10;
                case 0x00: return 14;
                case 0x02: return 13;
                case 0x03: return 12;
                default: return 0;
            }
        } else if (opcode == 0x08) {
            return 2;
        } else if (opcode == 0x09) {
            return 0;
        } else if (opcode == 0x0C || opcode == 0x0D || opcode == 0x0E) {
            return (opcode == 0x0C) ? 4 : (opcode == 0x0D) ? 5 : 6;
        } else if (opcode == 0x0F) {
            return 8;
        } else if (opcode == 0x23 || opcode == 0x2B) {
            return 0;
        } else {
            return 0;
        }
    }

public:
    bool halted;
    bool branch_detected_in_id;
    int32_t branch_target;
    int32_t branch_pc;
    bool insert_bubble_next_cycle;

    ExactPipelinedCPUSimulator() : registers(32, 0), halted(false), 
                                  branch_detected_in_id(false), branch_target(0), 
                                  branch_pc(0), insert_bubble_next_cycle(false) {
        registers[0] = 0;
        display_pc = 0;
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

        int addr = current_display_pc / 4;
        if (addr < instruction_memory.size()) {
            out << "instr: " << setw(8) << setfill('0') << hex << instruction_memory[addr] << endl;
        } else {
            out << "instr: " << setw(8) << setfill('0') << hex << 0 << endl;
        }

        for (int i = 0; i < 32; i++) {
            out << "regfile" << dec << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
        }
    }

    void execute_cycle() {
        if (halted) {
            return;
        }

        // 1. WB阶段: 写回结果（关键修改：在周期开始时执行WB）
        if (pipe[4].valid && pipe[4].dest_reg != 0) {
            registers[pipe[4].dest_reg] = pipe[4].result;
        }

        // 2. ID阶段: 分支检测
        if (pipe[1].valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[1].instr, opcode, funct, rs, rt, rd, shamt, imm);

            #if DEBUG_BRANCH
            cout << "DEBUG: ID stage - PC: " << hex << pipe[1].pc 
                 << " Instr: " << pipe[1].instr << " Opcode: " << (int)opcode << endl;
            #endif

            // 检查HALT指令
            if (pipe[1].instr == 0xffffffff) {
                halted = true;
            }
            // 在ID阶段处理分支指令
            else if (opcode == 0x04) { // BEQ
                int32_t offset = sign_extend_16_to_32(imm) << 2;
                int32_t a = registers[pipe[1].rs];
                int32_t b = registers[pipe[1].rt];
                
                #if DEBUG_BRANCH
                cout << "DEBUG: BEQ detected in ID, a=" << a << " b=" << b << " offset=" << offset 
                     << " branch_pc=" << hex << pipe[1].pc << " target=" << (pipe[1].pc + 4 + offset) << endl;
                #endif
                
                if (a == b) {
                    branch_target = pipe[1].pc + 4 + offset;
                    branch_pc = pipe[1].pc;
                    branch_detected_in_id = true;
                    insert_bubble_next_cycle = true;
                    #if DEBUG_BRANCH
                    cout << "DEBUG: BEQ taken in ID! Setting insert_bubble_next_cycle=true" << endl;
                    #endif
                }
            }
            else if (opcode == 0x05) { // BNE
                int32_t offset = sign_extend_16_to_32(imm) << 2;
                int32_t a = registers[pipe[1].rs];
                int32_t b = registers[pipe[1].rt];
                
                #if DEBUG_BRANCH
                cout << "DEBUG: BNE detected in ID, a=" << a << " b=" << b << " offset=" << offset 
                     << " branch_pc=" << hex << pipe[1].pc << " target=" << (pipe[1].pc + 4 + offset) << endl;
                #endif
                
                if (a != b) {
                    branch_target = pipe[1].pc + 4 + offset;
                    branch_pc = pipe[1].pc;
                    branch_detected_in_id = true;
                    insert_bubble_next_cycle = true;
                    #if DEBUG_BRANCH
                    cout << "DEBUG: BNE taken in ID! Setting insert_bubble_next_cycle=true" << endl;
                    #endif
                }
            }
        }

        // 3. EX阶段: 执行ALU操作
        if (pipe[2].valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[2].instr, opcode, funct, rs, rt, rd, shamt, imm);

            // 获取操作数
            int32_t a = registers[pipe[2].rs];
            int32_t b = registers[pipe[2].rt];

            // 检查前递
            if (pipe[3].valid && pipe[3].dest_reg != 0) {
                if (pipe[3].dest_reg == pipe[2].rs) a = pipe[3].result;
                if (pipe[3].dest_reg == pipe[2].rt) b = pipe[3].result;
            }
            if (pipe[4].valid && pipe[4].dest_reg != 0) {
                if (pipe[4].dest_reg == pipe[2].rs) a = pipe[4].result;
                if (pipe[4].dest_reg == pipe[2].rt) b = pipe[4].result;
            }

            // 对于立即数指令，使用符号扩展的立即数作为b
            if (opcode == 0x08 || opcode == 0x09 || opcode == 0x23 || opcode == 0x2B ||
                opcode == 0x0C || opcode == 0x0D || opcode == 0x0E) {
                b = sign_extend_16_to_32(imm);
            } else if (opcode == 0x0F) {
                b = static_cast<int32_t>(imm << 16);
            }

            // 执行ALU操作
            if (!halted) {
                uint8_t alu_op = get_alu_op(pipe[2].instr);
                pipe[2].result = alu_operation(alu_op, a, b);
            }
        }

        // 4. 移动流水线
        for (int i = 4; i > 0; i--) {
            pipe[i] = pipe[i-1];
        }

        // 5. 新的IF阶段
        if (insert_bubble_next_cycle) {
            // 插入气泡周期：PC保持，指令为0
            pipe[0].valid = true;
            pipe[0].pc = branch_pc;  // 保持为分支指令地址
            pipe[0].instr = 0x00000000;
            pipe[0].dest_reg = 0;
            pipe[0].rs = 0;
            pipe[0].rt = 0;
            pipe[0].rd = 0;
            
            display_pc = branch_pc;  // PC保持为分支指令地址
            insert_bubble_next_cycle = false;
            #if DEBUG_BRANCH
            cout << "DEBUG: Inserting bubble, PC kept at " << hex << branch_pc << endl;
            #endif
        } else if (branch_detected_in_id) {
            // 气泡后的周期：从目标地址取指
            pipe[0].valid = true;
            pipe[0].pc = branch_target;
            
            int next_instr_addr = branch_target / 4;
            if (next_instr_addr < instruction_memory.size()) {
                pipe[0].instr = instruction_memory[next_instr_addr];
                
                uint8_t opcode, funct;
                uint32_t rs, rt, rd, shamt;
                uint32_t imm;
                decode_instruction(pipe[0].instr, opcode, funct, rs, rt, rd, shamt, imm);

                pipe[0].rs = rs;
                pipe[0].rt = rt;
                if (opcode == 0x00) {
                    pipe[0].rd = rd;
                    pipe[0].dest_reg = rd;
                } else {
                    pipe[0].rd = 0;
                    pipe[0].dest_reg = rt;
                }
            } else {
                pipe[0].valid = false;
                pipe[0].instr = 0;
                pipe[0].dest_reg = 0;
            }

            display_pc = branch_target;
            branch_detected_in_id = false;
            #if DEBUG_BRANCH
            cout << "DEBUG: Branch target fetch, PC set to " << hex << branch_target << endl;
            #endif
        } else {
            // 正常取指
            int next_instr_addr = display_pc / 4;
            if (next_instr_addr < instruction_memory.size() && !halted) {
                int32_t next_instr = instruction_memory[next_instr_addr];

                if (next_instr == 0xffffffff) {
                    pipe[0].valid = true;
                    pipe[0].pc = display_pc;
                    pipe[0].instr = next_instr;

                    uint8_t opcode, funct;
                    uint32_t rs, rt, rd, shamt;
                    uint32_t imm;
                    decode_instruction(next_instr, opcode, funct, rs, rt, rd, shamt, imm);

                    pipe[0].rs = rs;
                    pipe[0].rt = rt;
                    pipe[0].rd = rd;
                    pipe[0].dest_reg = 0;

                    halted = true;
                } else {
                    pipe[0].valid = true;
                    pipe[0].pc = display_pc;
                    pipe[0].instr = next_instr;

                    uint8_t opcode, funct;
                    uint32_t rs, rt, rd, shamt;
                    uint32_t imm;
                    decode_instruction(next_instr, opcode, funct, rs, rt, rd, shamt, imm);

                    pipe[0].rs = rs;
                    pipe[0].rt = rt;
                    if (opcode == 0x00) {
                        pipe[0].rd = rd;
                        pipe[0].dest_reg = rd;
                    } else {
                        pipe[0].rd = 0;
                        pipe[0].dest_reg = rt;
                    }
                }
            } else {
                pipe[0].valid = false;
                pipe[0].pc = display_pc;
                pipe[0].instr = 0;
                pipe[0].dest_reg = 0;
            }

            // 正常情况下PC递增
            if (!halted) {
                display_pc += 4;
            }
        }

        // 确保$0寄存器始终为0
        registers[0] = 0;
    }
    
    void simulate(const string& input_file, const string& output_file) {
        load_hex_file(input_file);

        ofstream outfile(output_file);

        int total_cycles = instruction_memory.size() + 10;

        for (int cycle = 0; cycle < total_cycles; cycle++) {
            // 关键修改：在打印状态前先执行WB阶段
            if (pipe[4].valid && pipe[4].dest_reg != 0) {
                registers[pipe[4].dest_reg] = pipe[4].result;
            }
            
            print_state(outfile, display_pc);
            execute_cycle();

            if (halted) {
                break;
            }
        }
    }
};

int main(int argc, char* argv[]) {
    ExactPipelinedCPUSimulator cpu;
    
    string input_file = "test_custom_instructions.hex.txt";
    string output_file = "test_output.result.txt";
    
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