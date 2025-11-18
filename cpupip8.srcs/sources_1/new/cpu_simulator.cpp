#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <string>
#include <bitset>
#include <cstdint>

using namespace std;

class CPUSimulator {
private:
    // 32 general-purpose registers
    vector<int32_t> registers;
    vector<int32_t> instruction_memory;
    vector<int32_t> data_memory;
    
    // Program counter
    int32_t pc;
    int32_t next_pc;
    
    // Pipeline registers: IF/ID, ID/EX, EX/MEM, MEM/WB
    struct IF_ID {
        int32_t instr;
        int32_t pc;
        int32_t npc;
        bool valid;

        IF_ID() : instr(0), pc(0), npc(0), valid(false) {}
    };
    IF_ID if_id;

    struct ID_EX {
        int32_t instr;
        int32_t rs_data;
        int32_t rt_data;
        int32_t imm;
        uint32_t rs_addr;
        uint32_t rt_addr;
        uint32_t rd_addr;
        uint8_t alu_op;
        bool valid;

        ID_EX() : instr(0), rs_data(0), rt_data(0), imm(0), rs_addr(0), rt_addr(0), rd_addr(0), alu_op(0), valid(false) {}
    };
    ID_EX id_ex;

    struct EX_MEM {
        int32_t alu_result;
        int32_t rt_data;
        uint32_t rd_addr;
        uint32_t rt_addr;
        bool valid;
        bool is_load;
        bool is_store;

        EX_MEM() : alu_result(0), rt_data(0), rd_addr(0), rt_addr(0), valid(false), is_load(false), is_store(false) {}
    };
    EX_MEM ex_mem;

    struct MEM_WB {
        int32_t alu_result;
        int32_t mem_data;
        uint32_t rd_addr;
        bool valid;
        bool is_load;

        MEM_WB() : alu_result(0), mem_data(0), rd_addr(0), valid(false), is_load(false) {}
    };
    MEM_WB mem_wb;
    
    // ALU control constants (from def.v)
    static const uint8_t ADD_ALUC = 2;    // 0010 - signed addition
    static const uint8_t ADDU_ALUC = 0;   // 0000 - unsigned addition  
    static const uint8_t SUB_ALUC = 3;    // 0011 - signed subtraction
    static const uint8_t SUBU_ALUC = 1;   // 0001 - unsigned subtraction
    static const uint8_t AND_ALUC = 4;    // 0100 - AND
    static const uint8_t OR_ALUC = 5;     // 0101 - OR
    static const uint8_t XOR_ALUC = 6;    // 0110 - XOR
    static const uint8_t NOR_ALUC = 7;    // 0111 - NOR
    static const uint8_t SLT_ALUC = 11;   // 1011 - Set on Less Than
    static const uint8_t SLTU_ALUC = 10;  // 1010 - Set on Less Than Unsigned
    static const uint8_t SLL_ALUC = 14;   // 1110 - Shift Left Logical
    static const uint8_t SRL_ALUC = 13;   // 1101 - Shift Right Logical
    static const uint8_t SRA_ALUC = 12;   // 1100 - Shift Right Arithmetic
    static const uint8_t LUI_ALUC = 8;    // 1000 - Load Upper Immediate
    
    // Instruction opcodes (from def.v)
    static const uint8_t LW_OP = 0x23;    // 35 - Load Word
    static const uint8_t SW_OP = 0x2B;    // 43 - Store Word
    static const uint8_t BEQ_OP = 0x04;   // 4 - Branch Equal
    static const uint8_t BNE_OP = 0x05;   // 5 - Branch Not Equal
    static const uint8_t ADDI_OP = 0x08;  // 8 - Add Immediate
    static const uint8_t ADDIU_OP = 0x09; // 9 - Add Immediate Unsigned
    static const uint8_t ANDI_OP = 0x0C;  // 12 - And Immediate
    static const uint8_t ORI_OP = 0x0D;   // 13 - Or Immediate
    static const uint8_t XORI_OP = 0x0E;  // 14 - Xor Immediate
    static const uint8_t LUI_OP = 0x0F;   // 15 - Load Upper Immediate
    static const uint8_t R_OP = 0x00;     // 0 - R-type instructions
    
    // R-type function codes (from def.v)
    static const uint8_t ADD_FUNC = 0x20;   // 32
    static const uint8_t ADDU_FUNC = 0x21;  // 33
    static const uint8_t SUB_FUNC = 0x22;   // 34
    static const uint8_t SUBU_FUNC = 0x23;  // 35
    static const uint8_t AND_FUNC = 0x24;   // 36
    static const uint8_t OR_FUNC = 0x25;    // 37
    static const uint8_t XOR_FUNC = 0x26;   // 38
    static const uint8_t NOR_FUNC = 0x27;   // 39
    static const uint8_t SLT_FUNC = 0x2A;   // 42
    static const uint8_t SLTU_FUNC = 0x2B;  // 43
    static const uint8_t SLL_FUNC = 0x00;   // 0
    static const uint8_t SRL_FUNC = 0x02;   // 2
    static const uint8_t SRA_FUNC = 0x03;   // 3
    
public:
    int32_t pc;
    int32_t next_pc;

    CPUSimulator() : registers(32, 0), pc(0), next_pc(0) {
        // Register $0 is always 0
        registers[0] = 0;
    }
    
    void load_hex_file(const string& filename) {
        ifstream file(filename);
        string line;
        int32_t addr = 0;
        
        while (getline(file, line)) {
            if (line.empty()) continue;
            
            // Convert hex string to integer
            uint32_t hex_val;
            stringstream ss;
            ss << std::hex << line;
            ss >> hex_val;
            
            instruction_memory.push_back(static_cast<int32_t>(hex_val));
            addr += 4;
        }
    }
    
    uint32_t sign_extend(uint16_t value) {
        if (value & 0x8000) {  // Check if sign bit is set
            return 0xFFFF0000 | value;  // Sign extend
        } else {
            return value;
        }
    }
    
    int32_t sign_extend_16_to_32(uint16_t value) {
        if (value & 0x8000) {
            return static_cast<int32_t>(0xFFFF0000 | value);
        } else {
            return static_cast<int32_t>(value);
        }
    }
    
    // ALU implementation based on alu.v
    int32_t alu_operation(uint8_t alu_op, int32_t a, int32_t b) {
        switch(alu_op) {
            case 0: // Unsigned add
                return a + b;
            case 1: // Signed add
                return a + b;
            case 2: // Unsigned sub
                return a - b;
            case 3: // Signed sub
                return a - b;
            case 4: // AND
                return a & b;
            case 5: // OR
                return a | b;
            case 6: // XOR
                return a ^ b;
            case 7: // NOR
                return ~(a | b);
            case 8: // LUI - Load Upper Immediate
                return static_cast<int32_t>((b & 0xFFFF) << 16);
            case 11: // SLT - Set on Less Than
                return (a < b) ? 1 : 0;
            case 10: // SLTU - Set on Less Than Unsigned
                return (static_cast<uint32_t>(a) < static_cast<uint32_t>(b)) ? 1 : 0;
            case 12: // SRA - Shift Right Arithmetic
                return (b >> a) | ((b & 0x80000000) ? ((1 << (32 - a)) - 1) << (32 - a) : 0);
            case 13: // SRL - Shift Right Logical
                return b >> a;
            case 14: // SLL - Shift Left Logical
                return b << a;
            default:
                return 0;
        }
    }
    
    void print_state() {
        cout << "pc: " << setw(8) << setfill('0') << hex << pc << endl;
        cout << "instr: " << setw(8) << setfill('0') << hex << get_current_instruction() << endl;
        
        for (int i = 0; i < 32; i++) {
            cout << "regfile" << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
        }
    }
    
    int32_t get_current_instruction() {
        if (pc / 4 < instruction_memory.size()) {
            return instruction_memory[pc / 4];
        }
        return 0; // No instruction at this PC
    }
    
    // Instruction decoder
    void decode_instruction(int32_t instr, uint8_t& opcode, uint8_t& funct, 
                          uint32_t& rs, uint32_t& rt, uint32_t& rd, uint32_t& shamt, uint32_t& imm) {
        opcode = (instr >> 26) & 0x3F;  // bits 31-26
        rs = (instr >> 21) & 0x1F;      // bits 25-21
        rt = (instr >> 16) & 0x1F;      // bits 20-16
        rd = (instr >> 11) & 0x1F;      // bits 15-11
        shamt = (instr >> 6) & 0x1F;    // bits 10-6
        imm = instr & 0xFFFF;           // bits 15-0
        funct = instr & 0x3F;           // bits 5-0 for R-type
    }
    
    // Execute one clock cycle of the pipeline
    void execute_cycle() {
        // Forward WB stage result back to registers
        if (mem_wb.valid && mem_wb.rd_addr != 0) {
            if (mem_wb.is_load) {
                registers[mem_wb.rd_addr] = mem_wb.mem_data;
            } else {
                registers[mem_wb.rd_addr] = mem_wb.alu_result;
            }
        }
        
        // MEM stage (memory access)
        MEM_WB next_mem_wb;
        if (ex_mem.valid) {
            next_mem_wb.valid = true;
            next_mem_wb.alu_result = ex_mem.alu_result;
            next_mem_wb.rd_addr = ex_mem.rd_addr;
            next_mem_wb.is_load = ex_mem.is_load;
            
            if (ex_mem.is_load) {
                // Load from data memory
                next_mem_wb.mem_data = registers[ex_mem.rt_addr]; // Simplified - in real CPU this loads from DMEM
            } else if (ex_mem.is_store) {
                // Store to data memory - simplified
            }
        } else {
            next_mem_wb.valid = false;
        }
        mem_wb = next_mem_wb;
        
        // EX stage (execution)
        EX_MEM next_ex_mem;
        if (id_ex.valid) {
            // Decode instruction to determine operation
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(id_ex.instr, opcode, funct, rs, rt, rd, shamt, imm);
            
            int32_t a = id_ex.rs_data;
            int32_t b = id_ex.rt_data;
            
            // Handle immediate instructions
            if (opcode == ADDI_OP) {
                b = sign_extend_16_to_32(id_ex.imm);
            } else if (opcode == ADDIU_OP || opcode == LW_OP || opcode == SW_OP) {
                b = sign_extend_16_to_32(id_ex.imm);
            } else if (opcode == R_OP) {
                // For R-type, use rt data as second operand
                b = id_ex.rt_data;
            }
            
            // Determine ALU operation
            uint8_t alu_ctrl = id_ex.alu_op;
            if (opcode == R_OP) {
                // Map function code to ALU operation
                switch(funct) {
                    case ADD_FUNC: alu_ctrl = ADD_ALUC; break;
                    case ADDU_FUNC: alu_ctrl = ADDU_ALUC; break;
                    case SUB_FUNC: alu_ctrl = SUB_ALUC; break;
                    case SUBU_FUNC: alu_ctrl = SUBU_ALUC; break;
                    case AND_FUNC: alu_ctrl = AND_ALUC; break;
                    case OR_FUNC: alu_ctrl = OR_ALUC; break;
                    case XOR_FUNC: alu_ctrl = XOR_ALUC; break;
                    case NOR_FUNC: alu_ctrl = NOR_ALUC; break;
                    case SLT_FUNC: alu_ctrl = SLT_ALUC; break;
                    case SLTU_FUNC: alu_ctrl = SLTU_ALUC; break;
                    case SLL_FUNC: alu_ctrl = SLL_ALUC; break;
                    case SRL_FUNC: alu_ctrl = SRL_ALUC; break;
                    case SRA_FUNC: alu_ctrl = SRA_ALUC; break;
                }
            } else if (opcode == ADDI_OP) {
                alu_ctrl = ADD_ALUC;
            } else if (opcode == ADDIU_OP) {
                alu_ctrl = ADDU_ALUC;
            } else if (opcode == LW_OP || opcode == SW_OP) {
                alu_ctrl = ADDU_ALUC;  // Address calculation for load/store
            }
            
            // Perform ALU operation
            int32_t alu_result = alu_operation(alu_ctrl, a, b);
            
            next_ex_mem.alu_result = alu_result;
            next_ex_mem.rt_data = b;
            next_ex_mem.rd_addr = (opcode == R_OP) ? rd : rt;  // For R-type use rd, for I-type use rt as target
            next_ex_mem.rt_addr = rt;
            next_ex_mem.valid = true;
            next_ex_mem.is_load = (opcode == LW_OP);
            next_ex_mem.is_store = (opcode == SW_OP);
        } else {
            next_ex_mem.valid = false;
        }
        ex_mem = next_ex_mem;
        
        // ID stage (instruction decode)
        ID_EX next_id_ex;
        if (if_id.valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(if_id.instr, opcode, funct, rs, rt, rd, shamt, imm);
            
            next_id_ex.instr = if_id.instr;
            next_id_ex.rs_addr = rs;
            next_id_ex.rt_addr = rt;
            next_id_ex.rd_addr = rd;
            next_id_ex.rs_data = registers[rs];
            next_id_ex.rt_data = registers[rt];
            next_id_ex.imm = imm;
            next_id_ex.valid = true;
            
            // Set ALU operation based on instruction type
            if (opcode == R_OP) {
                // R-type instruction - map based on function code
                switch(funct) {
                    case ADD_FUNC: next_id_ex.alu_op = ADD_ALUC; break;
                    case ADDU_FUNC: next_id_ex.alu_op = ADDU_ALUC; break;
                    case SUB_FUNC: next_id_ex.alu_op = SUB_ALUC; break;
                    case SUBU_FUNC: next_id_ex.alu_op = SUBU_ALUC; break;
                    case AND_FUNC: next_id_ex.alu_op = AND_ALUC; break;
                    case OR_FUNC: next_id_ex.alu_op = OR_ALUC; break;
                    case XOR_FUNC: next_id_ex.alu_op = XOR_ALUC; break;
                    case NOR_FUNC: next_id_ex.alu_op = NOR_ALUC; break;
                    case SLT_FUNC: next_id_ex.alu_op = SLT_ALUC; break;
                    case SLTU_FUNC: next_id_ex.alu_op = SLTU_ALUC; break;
                    case SLL_FUNC: next_id_ex.alu_op = SLL_ALUC; break;
                    case SRL_FUNC: next_id_ex.alu_op = SRL_ALUC; break;
                    case SRA_FUNC: next_id_ex.alu_op = SRA_ALUC; break;
                    default: next_id_ex.alu_op = ADDU_ALUC; break;
                }
            } else if (opcode == ADDI_OP) {
                next_id_ex.alu_op = ADD_ALUC;
            } else if (opcode == ADDIU_OP) {
                next_id_ex.alu_op = ADDU_ALUC;
            } else if (opcode == LW_OP || opcode == SW_OP) {
                next_id_ex.alu_op = ADDU_ALUC;  // Address calculation
            } else {
                next_id_ex.alu_op = ADDU_ALUC;
            }
        } else {
            next_id_ex.valid = false;
        }
        id_ex = next_id_ex;
        
        // IF stage (instruction fetch)
        IF_ID next_if_id;
        if (pc / 4 < instruction_memory.size()) {
            next_if_id.instr = instruction_memory[pc / 4];
            next_if_id.pc = pc;
            next_if_id.npc = next_pc;
            next_if_id.valid = true;
        } else {
            next_if_id.valid = false;
        }
        if_id = next_if_id;
        
        // Update PC for next cycle
        pc = next_pc;
        next_pc += 4;  // Next instruction is 4 bytes ahead
        
        // Reset register $0 to 0 (it should always be 0)
        registers[0] = 0;
    }
    
    void simulate(const string& input_file, const string& output_file) {
        load_hex_file(input_file);
        
        ofstream outfile(output_file);
        streambuf* orig_cout = cout.rdbuf();  // Save original cout buffer
        cout.rdbuf(outfile.rdbuf());          // Redirect cout to file
        
        int cycle = 0;
        while (pc / 4 < instruction_memory.size() && cycle < 1000) {  // Prevent infinite loop
            execute_cycle();
            print_state();
            cycle++;
            
            // Check for halt condition (if there's a halt instruction)
            int32_t current_instr = get_current_instruction();
            if (current_instr == 0xFFFFFFFF) { // Assume halt instruction
                break;
            }
        }
        
        cout.rdbuf(orig_cout);  // Restore original cout buffer
    }
};

int main(int argc, char* argv[]) {
    CPUSimulator cpu;
    
    string input_file = "1_addi.hex.txt";
    string output_file = "1_addi_cpp.result.txt";
    
    if (argc >= 2) {
        input_file = argv[1];
    }
    if (argc >= 3) {
        output_file = argv[2];
    }
    
    cpu.simulate(input_file, output_file);
    
    cout << "Simulation completed. Results saved to " << output_file << endl;
    return 0;
}