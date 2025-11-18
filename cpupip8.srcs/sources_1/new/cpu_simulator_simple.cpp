#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <string>
#include <cstdint>

using namespace std;

class SimpleCPUSimulator {
private:
    vector<int32_t> registers;
    vector<int32_t> instruction_memory;
    int32_t pc;
    
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
    SimpleCPUSimulator() : registers(32, 0), pc(0) {
        // Register $0 is always 0
        registers[0] = 0;
    }
    
    void load_hex_file(const string& filename) {
        ifstream file(filename);
        string line;
        
        while (getline(file, line)) {
            if (line.empty()) continue;
            
            // Convert hex string to integer
            uint32_t hex_val;
            stringstream ss;
            ss << std::hex << line;
            ss >> hex_val;
            
            instruction_memory.push_back(static_cast<int32_t>(hex_val));
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
    
    void print_state(ostream& out) {
        out << "pc: " << setw(8) << setfill('0') << hex << pc << endl;
        out << "instr: " << setw(8) << setfill('0') << hex << get_current_instruction() << endl;
        
        for (int i = 0; i < 32; i++) {
            out << "regfile" << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
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
    
    // Execute one instruction
    bool execute_instruction() {
        if (pc / 4 >= instruction_memory.size()) {
            return false; // No more instructions
        }
        
        int32_t instr = get_current_instruction();
        
        // Decode instruction
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        // Execute instruction
        switch(opcode) {
            case R_OP: // R-type instructions
                switch(funct) {
                    case ADD_FUNC: // add rd, rs, rt
                        registers[rd] = registers[rs] + registers[rt];
                        break;
                    case ADDU_FUNC: // addu rd, rs, rt
                        registers[rd] = static_cast<uint32_t>(registers[rs]) + static_cast<uint32_t>(registers[rt]);
                        break;
                    case SUB_FUNC: // sub rd, rs, rt
                        registers[rd] = registers[rs] - registers[rt];
                        break;
                    case SUBU_FUNC: // subu rd, rs, rt
                        registers[rd] = static_cast<uint32_t>(registers[rs]) - static_cast<uint32_t>(registers[rt]);
                        break;
                    case AND_FUNC: // and rd, rs, rt
                        registers[rd] = registers[rs] & registers[rt];
                        break;
                    case OR_FUNC: // or rd, rs, rt
                        registers[rd] = registers[rs] | registers[rt];
                        break;
                    case XOR_FUNC: // xor rd, rs, rt
                        registers[rd] = registers[rs] ^ registers[rt];
                        break;
                    case NOR_FUNC: // nor rd, rs, rt
                        registers[rd] = ~(registers[rs] | registers[rt]);
                        break;
                    case SLT_FUNC: // slt rd, rs, rt
                        registers[rd] = (registers[rs] < registers[rt]) ? 1 : 0;
                        break;
                    case SLTU_FUNC: // sltu rd, rs, rt
                        registers[rd] = (static_cast<uint32_t>(registers[rs]) < static_cast<uint32_t>(registers[rt])) ? 1 : 0;
                        break;
                    case SLL_FUNC: // sll rd, rt, sa
                        registers[rd] = registers[rt] << shamt;
                        break;
                    case SRL_FUNC: // srl rd, rt, sa
                        registers[rd] = static_cast<uint32_t>(registers[rt]) >> shamt;
                        break;
                    case SRA_FUNC: // sra rd, rt, sa
                        registers[rd] = registers[rt] >> shamt;  // Right arithmetic shift
                        break;
                    default:
                        // Unknown R-type instruction
                        return false;
                }
                break;
                
            case ADDI_OP: // addi rt, rs, immediate
                registers[rt] = registers[rs] + static_cast<int32_t>(sign_extend_16_to_32(imm));
                break;
                
            case ADDIU_OP: // addiu rt, rs, immediate
                registers[rt] = static_cast<uint32_t>(registers[rs]) + sign_extend(imm);
                break;
                
            case ANDI_OP: // andi rt, rs, immediate
                registers[rt] = registers[rs] & imm;
                break;
                
            case ORI_OP: // ori rt, rs, immediate
                registers[rt] = registers[rs] | imm;
                break;
                
            case XORI_OP: // xori rt, rs, immediate
                registers[rt] = registers[rs] ^ imm;
                break;
                
            case LUI_OP: // lui rt, immediate
                registers[rt] = static_cast<int32_t>(imm << 16);
                break;
                
            case LW_OP: // lw rt, offset(rs)
                // Simplified: just calculate effective address and use it
                // In a real implementation, this would access data memory
                break;
                
            case SW_OP: // sw rt, offset(rs)
                // Simplified: just calculate effective address
                // In a real implementation, this would store to data memory
                break;
                
            case BEQ_OP: // beq rs, rt, offset
                // Simplified: just advance PC by 4
                break;
                
            case BNE_OP: // bne rs, rt, offset
                // Simplified: just advance PC by 4
                break;
                
            default:
                // Unknown instruction
                return false;
        }
        
        // For non-branch instructions, advance PC by 4
        pc += 4;
        
        // Ensure register $0 is always 0
        registers[0] = 0;
        
        return true;
    }
    
    void simulate(const string& input_file, const string& output_file) {
        load_hex_file(input_file);
        
        ofstream outfile(output_file);
        
        int cycle = 0;
        while (pc / 4 < instruction_memory.size() && cycle < 1000) {  // Prevent infinite loop
            print_state(outfile);
            if (!execute_instruction()) {
                break; // Stop on error
            }
            cycle++;
            
            // Check for halt condition (if there's a halt instruction)
            int32_t current_instr = get_current_instruction();
            if (current_instr == 0xFFFFFFFF) { // Assume halt instruction
                break;
            }
        }
        
        // Print final state
        if (cycle < 1000) {
            print_state(outfile);
        }
    }
    
    // For debugging
    void print_registers() {
        for (int i = 0; i < 32; i++) {
            cout << "regfile" << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
        }
    }
};

int main(int argc, char* argv[]) {
    SimpleCPUSimulator cpu;
    
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