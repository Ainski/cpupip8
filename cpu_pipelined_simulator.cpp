#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <string>
#include <cstdint>

#define DEBUG_BRANCH 0
#define DEBUG_CONFLICT 1
#define DEBUG_ALU 1

using namespace std;

class ExactPipelinedCPUSimulator {
private:
    vector<int32_t> registers;
    vector<int32_t> instruction_memory;
    
    vector<uint8_t> reg_lock;
    
    struct PipelineStage {
        bool valid;
        int32_t pc;
        int32_t instr;
        uint32_t dest_reg;
        int32_t result;
        uint32_t rs, rt, rd;
        uint8_t op_type;
        uint8_t opcode;
        
        PipelineStage() : valid(false), pc(0), instr(0), dest_reg(0), 
                         result(0), rs(0), rt(0), rd(0), op_type(0), opcode(0) {}
    };
    
    PipelineStage pipe[5];
    int32_t display_pc;
    int32_t actual_pc;
    
    bool detect_conflict;
    bool stall_next_cycle;
    
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
        return static_cast<int16_t>(value);
    }
    
    uint32_t zero_extend_16_to_32(uint16_t value) {
        return static_cast<uint32_t>(value);
    }
    
    // 修复：对于ADDIU使用无符号扩展
    int32_t get_extended_immediate(uint8_t opcode, uint32_t imm) {
        if (opcode == 0x09 || opcode == 0x0C || opcode == 0x0D || opcode == 0x0E) {
            // ADDIU, ANDI, ORI, XORI 使用零扩展
            return zero_extend_16_to_32(imm);
        } else {
            // 其他指令使用符号扩展
            return sign_extend_16_to_32(imm);
        }
    }
    
    int32_t alu_operation(uint8_t alu_op, int32_t a, int32_t b) {
        #if DEBUG_ALU
        cout << "DEBUG_ALU: op=" << (int)alu_op << " a=" << hex << a << " b=" << b << endl;
        #endif
        
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
            case 12: { // SRA
                int shift = a & 0x1F;
                if (shift >= 32) return (b & 0x80000000) ? 0xFFFFFFFF : 0x00000000;
                else return (b >> shift) | ((b & 0x80000000) ? ((1 << (32-shift)) - 1) << (32-shift) : 0);
            }
            case 13: return static_cast<uint32_t>(b) >> (a & 0x1F);               // SRL
            case 14: return b << (a & 0x1F);                                      // SLL
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
            return 2;
        } else if (opcode == 0x09) { // ADDIU
            return 0;  // 使用ADDU操作
        } else if (opcode == 0x0C) { // ANDI
            return 4;
        } else if (opcode == 0x0D) { // ORI
            return 5;
        } else if (opcode == 0x0E) { // XORI
            return 6;
        } else if (opcode == 0x0F) { // LUI
            return 8;
        } else if (opcode == 0x23 || opcode == 0x2B) { // LW, SW
            return 0;
        } else {
            return 0;
        }
    }
    
    uint8_t get_op_type(int32_t instr) {
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        if (opcode == 0x23) {
            return 2;
        } else if (opcode == 0x00 || opcode == 0x08 || opcode == 0x09 || 
                  opcode == 0x0C || opcode == 0x0D || opcode == 0x0E || opcode == 0x0F) {
            return 1;
        }
        return 0;
    }
    
    uint32_t get_dest_reg(int32_t instr) {
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        if (opcode == 0x00) {
            return rd;
        } else if (opcode == 0x23 || opcode == 0x08 || opcode == 0x09 || 
                  opcode == 0x0C || opcode == 0x0D || opcode == 0x0E || opcode == 0x0F) {
            return rt;
        }
        return 0;
    }
    
    void update_reg_locks() {
        for (int i = 0; i < 32; i++) {
            if (reg_lock[i] != 0) {
                uint8_t timer = reg_lock[i] & 0x03;
                if (timer > 0) {
                    timer--;
                    reg_lock[i] = (reg_lock[i] & 0xFC) | timer;
                } else {
                    reg_lock[i] = 0;
                }
            }
        }
        
        if (pipe[0].valid && pipe[0].dest_reg != 0) {
            uint32_t dest_reg = pipe[0].dest_reg;
            uint8_t op_type = pipe[0].op_type;
            
            if (op_type == 1) {
                reg_lock[dest_reg] = 0x0E;
            } else if (op_type == 2) {
                reg_lock[dest_reg] = 0x0A;
            }
            
            #if DEBUG_CONFLICT
            cout << "DEBUG: Setting lock for reg " << dec << dest_reg 
                 << " type: " << (int)op_type << " lock: " << hex << (int)reg_lock[dest_reg] << endl;
            #endif
        }
    }
    
    bool detect_data_conflict(int32_t instr) {
        uint8_t opcode, funct;
        uint32_t rs, rt, rd, shamt;
        uint32_t imm;
        decode_instruction(instr, opcode, funct, rs, rt, rd, shamt, imm);
        
        bool rs_conflict = false;
        bool rt_conflict = false;
        
        if (rs != 0 && reg_lock[rs] != 0) {
            uint8_t lock_type = (reg_lock[rs] >> 2) & 0x03;
            uint8_t timer = reg_lock[rs] & 0x03;
            
            if (lock_type == 0x02 && timer == 0x02) {
                rs_conflict = true;
            }
        }
        
        if (rt != 0 && reg_lock[rt] != 0) {
            uint8_t lock_type = (reg_lock[rt] >> 2) & 0x03;
            uint8_t timer = reg_lock[rt] & 0x03;
            
            if (lock_type == 0x02 && timer == 0x02) {
                rt_conflict = true;
            }
        }
        
        bool check_rt = false;
        if (opcode == 0x00 ||
            opcode == 0x04 || opcode == 0x05 ||
            opcode == 0x2B) {
            check_rt = true;
        }
        
        bool conflict = rs_conflict || (check_rt && rt_conflict);
        
        #if DEBUG_CONFLICT
        if (conflict) {
            cout << "DEBUG: Data conflict detected! Instruction: " << hex << instr 
                 << " rs: " << dec << rs << " rt: " << rt 
                 << " rs_conflict: " << rs_conflict << " rt_conflict: " << rt_conflict << endl;
        }
        #endif
        
        return conflict;
    }
    
    int32_t get_forwarded_value(uint32_t reg, int32_t original_value) {
        if (reg == 0) return 0;
        
        if (reg_lock[reg] != 0) {
            uint8_t lock_type = (reg_lock[reg] >> 2) & 0x03;
            uint8_t timer = reg_lock[reg] & 0x03;
            
            if (lock_type == 0x03) {
                if (timer == 0x01) {
                    return pipe[2].result;
                } else if (timer == 0x00) {
                    return pipe[3].result;
                }
            } else if (lock_type == 0x02) {
                if (timer == 0x01) {
                    return pipe[3].result;
                } else if (timer == 0x00) {
                    return pipe[4].result;
                }
            }
        }
        
        return original_value;
    }

public:
    bool halted;
    bool branch_detected_in_id;
    int32_t branch_target;
    int32_t branch_pc;
    bool insert_bubble_next_cycle;
    bool branch_taken;
    bool is_bubble_cycle;

    ExactPipelinedCPUSimulator() : registers(32, 0), reg_lock(32, 0), 
                                  halted(false), branch_detected_in_id(false), 
                                  branch_target(0), branch_pc(0), 
                                  insert_bubble_next_cycle(false),
                                  branch_taken(false), is_bubble_cycle(false),
                                  display_pc(0), actual_pc(0),
                                  detect_conflict(false), stall_next_cycle(false) {
        registers[0] = 0;
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

        if (is_bubble_cycle) {
            out << "instr: " << setw(8) << setfill('0') << hex << 0 << endl;
        } else {
            int addr = current_display_pc / 4;
            if (addr < instruction_memory.size()) {
                out << "instr: " << setw(8) << setfill('0') << hex << instruction_memory[addr] << endl;
            } else {
                out << "instr: " << setw(8) << setfill('0') << hex << 0 << endl;
            }
        }

        for (int i = 0; i < 32; i++) {
            out << "regfile" << dec << i << ": " << setw(8) << setfill('0') << hex << registers[i] << endl;
        }
    }

    void execute_cycle() {
        if (halted) {
            return;
        }

        is_bubble_cycle = false;

        // 1. WB阶段：更新寄存器
        if (pipe[4].valid && pipe[4].dest_reg != 0) {
            registers[pipe[4].dest_reg] = pipe[4].result;
            #if DEBUG_ALU
            cout << "DEBUG_WB: Writing " << hex << pipe[4].result << " to reg " << dec << pipe[4].dest_reg << endl;
            #endif
        }

        // 2. 更新寄存器锁
        update_reg_locks();

        // 3. 移动流水线
        for (int i = 4; i > 0; i--) {
            pipe[i] = pipe[i-1];
        }

        // 4. 冲突检测和停顿处理
        if (stall_next_cycle) {
            pipe[0].valid = false;
            pipe[0].instr = 0x00000000;
            pipe[0].dest_reg = 0;
            pipe[0].op_type = 0;
            display_pc = actual_pc;
            stall_next_cycle = false;
            is_bubble_cycle = true;
            return;
        }

        // 5. ID阶段: 分支检测和冲突检测
        detect_conflict = false;
        if (pipe[1].valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[1].instr, opcode, funct, rs, rt, rd, shamt, imm);

            if (pipe[1].instr == 0xffffffff) {
                halted = true;
            }
            else if (opcode == 0x04 || opcode == 0x05) {
                int32_t offset = sign_extend_16_to_32(imm) << 2;
                int32_t a = get_forwarded_value(rs, registers[rs]);
                int32_t b = get_forwarded_value(rt, registers[rt]);
                
                branch_target = pipe[1].pc + 4 + offset;
                branch_pc = pipe[1].pc;
                branch_detected_in_id = true;
                insert_bubble_next_cycle = true;
                
                if ((opcode == 0x04 && a == b) || (opcode == 0x05 && a != b)) {
                    branch_taken = true;
                } else {
                    branch_taken = false;
                }
            }
            
            detect_conflict = detect_data_conflict(pipe[1].instr);
            if (detect_conflict) {
                stall_next_cycle = true;
                actual_pc -= 4;
                #if DEBUG_CONFLICT
                cout << "DEBUG: Data conflict detected, stalling pipeline" << endl;
                #endif
            }
        }

        // 6. EX阶段: 执行ALU操作
        if (pipe[2].valid) {
            uint8_t opcode, funct;
            uint32_t rs, rt, rd, shamt;
            uint32_t imm;
            decode_instruction(pipe[2].instr, opcode, funct, rs, rt, rd, shamt, imm);

            int32_t a = get_forwarded_value(pipe[2].rs, registers[pipe[2].rs]);
            int32_t b = get_forwarded_value(pipe[2].rt, registers[pipe[2].rt]);

            #if DEBUG_ALU
            cout << "DEBUG_EX: PC=" << hex << pipe[2].pc << " Instr=" << pipe[2].instr 
                 << " opcode=" << (int)opcode << " rs=" << dec << pipe[2].rs 
                 << " rt=" << pipe[2].rt << " a=" << hex << a << " b=" << b;
            #endif

            // 修复：使用正确的立即数扩展方式
            if (opcode == 0x08 || opcode == 0x09 || opcode == 0x23 || opcode == 0x2B ||
                opcode == 0x0C || opcode == 0x0D || opcode == 0x0E || opcode == 0x0F) {
                b = get_extended_immediate(opcode, imm);
                #if DEBUG_ALU
                cout << " immediate=" << hex << imm << " extended=" << b;
                #endif
            } else if (opcode == 0x00 && funct == 0x00) {
                a = shamt;
            }

            #if DEBUG_ALU
            cout << endl;
            #endif

            if (!halted) {
                uint8_t alu_op = get_alu_op(pipe[2].instr);
                pipe[2].result = alu_operation(alu_op, a, b);
                #if DEBUG_ALU
                cout << "DEBUG_EX: ALU result=" << hex << pipe[2].result << endl;
                #endif
            }
        }

        // 7. 新的IF阶段
        if (insert_bubble_next_cycle) {
            pipe[0].valid = true;
            pipe[0].pc = branch_pc;
            pipe[0].instr = 0x00000000;
            pipe[0].dest_reg = 0;
            pipe[0].rs = 0;
            pipe[0].rt = 0;
            pipe[0].rd = 0;
            pipe[0].op_type = 0;
            
            display_pc = branch_pc;
            insert_bubble_next_cycle = false;
            is_bubble_cycle = true;
            
            if (branch_taken) {
                actual_pc = branch_target;
            } else {
                actual_pc = branch_pc + 4;
            }
        } else if (!stall_next_cycle) {
            int next_instr_addr = actual_pc / 4;
            if (next_instr_addr < instruction_memory.size() && !halted) {
                int32_t next_instr = instruction_memory[next_instr_addr];

                uint8_t opcode, funct;
                uint32_t rs, rt, rd, shamt;
                uint32_t imm;
                decode_instruction(next_instr, opcode, funct, rs, rt, rd, shamt, imm);
                
                if (opcode == 0x04 || opcode == 0x05) {
                    int32_t offset = sign_extend_16_to_32(imm) << 2;
                    branch_target = actual_pc + 4 + offset;
                    branch_pc = actual_pc;
                    branch_detected_in_id = true;
                    insert_bubble_next_cycle = true;
                    
                    int32_t a = get_forwarded_value(rs, registers[rs]);
                    int32_t b = get_forwarded_value(rt, registers[rt]);
                    if ((opcode == 0x04 && a == b) || (opcode == 0x05 && a != b)) {
                        branch_taken = true;
                    } else {
                        branch_taken = false;
                    }
                }

                if (next_instr == 0xffffffff) {
                    pipe[0].valid = true;
                    pipe[0].pc = actual_pc;
                    pipe[0].instr = next_instr;
                    pipe[0].opcode = opcode;

                    pipe[0].rs = rs;
                    pipe[0].rt = rt;
                    pipe[0].rd = rd;
                    pipe[0].dest_reg = 0;
                    pipe[0].op_type = 0;

                    halted = true;
                } else {
                    pipe[0].valid = true;
                    pipe[0].pc = actual_pc;
                    pipe[0].instr = next_instr;
                    pipe[0].opcode = opcode;

                    pipe[0].rs = rs;
                    pipe[0].rt = rt;
                    if (opcode == 0x00) {
                        pipe[0].rd = rd;
                        pipe[0].dest_reg = rd;
                    } else {
                        pipe[0].rd = 0;
                        pipe[0].dest_reg = rt;
                    }
                    
                    pipe[0].op_type = get_op_type(next_instr);
                }
                
                display_pc = actual_pc;
                actual_pc += 4;
            } else {
                pipe[0].valid = false;
                pipe[0].pc = actual_pc;
                pipe[0].instr = 0;
                pipe[0].dest_reg = 0;
                pipe[0].op_type = 0;
                
                display_pc = actual_pc;
                actual_pc += 4;
            }
        }

        registers[0] = 0;
    }
    
    void simulate(const string& input_file, const string& output_file) {
        load_hex_file(input_file);

        ofstream outfile(output_file);

        int total_cycles = instruction_memory.size() + 20;

        for (int cycle = 0; cycle < total_cycles; cycle++) {
            execute_cycle();
            print_state(outfile, display_pc);

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