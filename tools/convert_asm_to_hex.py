#!/usr/bin/env python3
"""
将汇编代码文件（.txt）转换为十六进制机器码文件（.hex.txt）
用于您的CPU流水线仿真器项目
"""

import sys
import re

# 指令操作码定义 (基于 def.v)
OPCODES = {
    # Special instructions
    'halt': {'opcode': 0b111111, 'type': 'HALT'},  # halt_instr = 0xffffffff

    # R-type instructions (opcode = 0)
    'add': {'func': 0b100000, 'type': 'R'},
    'addu': {'func': 0b100001, 'type': 'R'},
    'sub': {'func': 0b100010, 'type': 'R'},
    'subu': {'func': 0b100011, 'type': 'R'},
    'and': {'func': 0b100100, 'type': 'R'},
    'or': {'func': 0b100101, 'type': 'R'},
    'xor': {'func': 0b100110, 'type': 'R'},
    'nor': {'func': 0b100111, 'type': 'R'},
    'slt': {'func': 0b101010, 'type': 'R'},
    'sltu': {'func': 0b101011, 'type': 'R'},
    'sll': {'func': 0b000000, 'type': 'R', 'shamt_pos': True},  # shift amount in [10:6]
    'srl': {'func': 0b000010, 'type': 'R', 'shamt_pos': True},
    'sra': {'func': 0b000011, 'type': 'R', 'shamt_pos': True},

    # I-type instructions
    'addi': {'opcode': 0b001000, 'type': 'I'},
    'addiu': {'opcode': 0b001001, 'type': 'I'},
    'slti': {'opcode': 0b001010, 'type': 'I'},
    'sltiu': {'opcode': 0b001011, 'type': 'I'},
    'andi': {'opcode': 0b001100, 'type': 'I'},
    'ori': {'opcode': 0b001101, 'type': 'I'},
    'xori': {'opcode': 0b001110, 'type': 'I'},
    'lui': {'opcode': 0b001111, 'type': 'I'},
    'beq': {'opcode': 0b000100, 'type': 'I'},
    'bne': {'opcode': 0b000101, 'type': 'I'},
    'lw': {'opcode': 0b100011, 'type': 'I'},
    'sw': {'opcode': 0b101011, 'type': 'I'},

    # J-type instructions
    'j': {'opcode': 0b000010, 'type': 'J'},
    'jal': {'opcode': 0b000011, 'type': 'J'},
}

def parse_register(reg_str):
    """解析寄存器表示，支持 $0, $1, ..., $31 """
    reg_str = reg_str.strip().lower()
    
    # 检查数字寄存器表示
    if reg_str.startswith('$'):
        reg_name = reg_str[1:]
        if reg_name.isdigit():
            reg_num = int(reg_name)
            if 0 <= reg_num <= 31:
                return reg_num
            else:
                raise ValueError(f"Invalid register number: {reg_num}")
        else:
            raise ValueError(f"Invalid register format: {reg_str}")
    else:
        raise ValueError(f"Invalid register format: {reg_str}")

def assemble_r_type(instruction_parts):
    """组装R型指令"""
    inst_name = instruction_parts[0].lower()
    op_info = OPCODES[inst_name]
    
    # 初始化字段
    opcode = 0  # R型指令opcode为0
    rs = 0
    rt = 0  
    rd = 0
    shamt = 0
    funct = op_info['func']
    
    # 根据指令确定寄存器位置
    if inst_name in ['add', 'addu', 'sub', 'subu', 'and', 'or', 'xor', 'nor', 'slt', 'sltu']:
        # add rd, rs, rt
        if len(instruction_parts) < 4:
            raise ValueError(f"Instruction {inst_name} requires 3 operands")
        rd = parse_register(instruction_parts[1])
        rs = parse_register(instruction_parts[2])
        rt = parse_register(instruction_parts[3])
    elif inst_name in ['sll', 'srl', 'sra']:
        # sll rd, rt, sa
        if len(instruction_parts) < 4:
            raise ValueError(f"Instruction {inst_name} requires 3 operands")
        rd = parse_register(instruction_parts[1])
        rt = parse_register(instruction_parts[2])
        shamt_str = instruction_parts[3]
        if shamt_str.startswith('0x') or shamt_str.startswith('0X'):
            shamt = int(shamt_str, 16)
        else:
            shamt = int(shamt_str)
        if shamt < 0 or shamt > 31:
            raise ValueError(f"Shift amount must be between 0 and 31: {shamt}")
    elif inst_name in ['jr']:
        # jr rs
        if len(instruction_parts) < 2:
            raise ValueError(f"Instruction {inst_name} requires 1 operand")
        rs = parse_register(instruction_parts[1])
    else:
        raise ValueError(f"Unsupported R-type instruction: {inst_name}")
    
    # 构建32位指令
    instruction = (opcode << 26) | (rs << 21) | (rt << 16) | (rd << 11) | (shamt << 6) | funct
    return instruction

def assemble_i_type(instruction_parts):
    """组装I型指令"""
    inst_name = instruction_parts[0].lower()
    op_info = OPCODES[inst_name]
    
    opcode = op_info['opcode']
    rs = 0
    rt = 0
    immediate = 0
    
    if inst_name in ['addi', 'addiu', 'slti', 'sltiu', 'andi', 'ori', 'xori']:
        # addi rt, rs, immediate
        if len(instruction_parts) < 4:
            raise ValueError(f"Instruction {inst_name} requires 3 operands")
        rt = parse_register(instruction_parts[1])
        rs = parse_register(instruction_parts[2])
        immediate_str = instruction_parts[3]
        if immediate_str.startswith('0x') or immediate_str.startswith('0X'):
            immediate = int(immediate_str, 16)
        else:
            immediate = int(immediate_str)
        # 符号扩展到16位
        immediate = immediate & 0xFFFF
    elif inst_name in ['lw', 'sw']:
        # lw rt, offset(rs)  or  sw rt, offset(rs)
        if len(instruction_parts) < 3:
            raise ValueError(f"Instruction {inst_name} requires 2 operands")
        
        # 解析 rt, offset(rs) 格式
        rt = parse_register(instruction_parts[1])
        
        offset_rs = instruction_parts[2]
        match = re.match(r'(-?0[xX][0-9a-fA-F]+|-?\d+)\((\$\w+)\)', offset_rs)
        if match:
            immediate_str = match.group(1)
            if immediate_str.startswith('0x') or immediate_str.startswith('0X'):
                immediate = int(immediate_str, 16)
            else:
                immediate = int(immediate_str)
            rs = parse_register(match.group(2))
        else:
            raise ValueError(f"Invalid format for {inst_name} instruction: {offset_rs}")
        
        # 符号扩展到16位
        immediate = immediate & 0xFFFF
    elif inst_name in ['beq', 'bne']:
        # beq rs, rt, label_offset
        if len(instruction_parts) < 4:
            raise ValueError(f"Instruction {inst_name} requires 3 operands")
        rs = parse_register(instruction_parts[1])
        rt = parse_register(instruction_parts[2])
        immediate_str = instruction_parts[3]
        if immediate_str.startswith('0x') or immediate_str.startswith('0X'):
            immediate = int(immediate_str, 16)
        else:
            immediate = int(immediate_str)
        # 符号扩展到16位
        immediate = immediate & 0xFFFF
    elif inst_name == 'lui':
        # lui rt, immediate
        if len(instruction_parts) < 3:
            raise ValueError(f"Instruction {inst_name} requires 2 operands")
        rt = parse_register(instruction_parts[1])
        immediate_str = instruction_parts[2]
        if immediate_str.startswith('0x') or immediate_str.startswith('0X'):
            immediate = int(immediate_str, 16)
        else:
            immediate = int(immediate_str)
        immediate = immediate & 0xFFFF
    else:
        raise ValueError(f"Unsupported I-type instruction: {inst_name}")
    
    # 构建32位指令
    instruction = (opcode << 26) | (rs << 21) | (rt << 16) | immediate
    return instruction

def assemble_halt_type(instruction_parts):
    """组装HALT特殊指令 (返回0xffffffff)"""
    inst_name = instruction_parts[0].lower()

    if inst_name != 'halt':
        raise ValueError(f"Invalid HALT instruction: {inst_name}")

    # HALT指令是0xffffffff
    return 0xFFFFFFFF

def assemble_j_type(instruction_parts):
    """组装J型指令"""
    inst_name = instruction_parts[0].lower()
    op_info = OPCODES[inst_name]

    opcode = op_info['opcode']
    address = 0

    if inst_name in ['j', 'jal']:
        # j/jal address
        if len(instruction_parts) < 2:
            raise ValueError(f"Instruction {inst_name} requires 1 operand")
        address_str = instruction_parts[1]
        if address_str.startswith('0x') or address_str.startswith('0X'):
            address = int(address_str, 16)
        else:
            address = int(address_str)
        # 仅使用低26位，因为高4位从PC获取
        address = (address >> 2) & 0x03FFFFFF  # 需要右移2位因为地址是字对齐的
    else:
        raise ValueError(f"Unsupported J-type instruction: {inst_name}")

    # 构建32位指令
    instruction = (opcode << 26) | address
    return instruction

def assemble_line(line):
    """组装单行汇编指令"""
    if not line.strip() or line.strip().startswith('#'):
        return None  # 跳过空行和注释

    # 移除注释部分
    line = line.split('#')[0].strip()
    if not line:
        return None

    # 按逗号和空格分割指令
    parts = re.split(r'[,\s]+', line.strip())
    parts = [p for p in parts if p]  # 移除空元素

    if not parts:
        return None

    inst_name = parts[0].lower()

    if inst_name not in OPCODES:
        raise ValueError(f"Unknown instruction: {inst_name}")

    op_info = OPCODES[inst_name]

    if op_info['type'] == 'R':
        return assemble_r_type(parts)
    elif op_info['type'] == 'I':
        return assemble_i_type(parts)
    elif op_info['type'] == 'J':
        return assemble_j_type(parts)
    elif op_info['type'] == 'HALT':
        return assemble_halt_type(parts)
    else:
        raise ValueError(f"Unknown instruction type for {inst_name}")

def convert_asm_to_hex(input_file, output_file):
    """将汇编代码文件转换为十六进制机器码文件"""
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    instructions = []
    
    for i, line in enumerate(lines):
        try:
            instruction = assemble_line(line)
            if instruction is not None:
                instructions.append(instruction)
        except ValueError as e:
            print(f"Error at line {i+1}: {e}")
            print(f"Line content: {line.strip()}")
            return False
    
    # 将指令写入输出文件（十六进制格式，每行一个32位指令）
    with open(output_file, 'w') as f:
        for instr in instructions:
            f.write(f"{instr:08x}\n")
    
    print(f"Conversion completed. {len(instructions)} instructions generated.")
    return True

def main():
    if len(sys.argv) < 3:
        print("Usage:")
        print("  python convert_asm_to_hex.py input.txt output.hex.txt")
        return
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    print(f"Converting {input_file} to {output_file}")
    success = convert_asm_to_hex(input_file, output_file)
    if success:
        print("Conversion completed successfully!")
    else:
        print("Conversion failed!")

if __name__ == "__main__":
    main()