#!/usr/bin/env python3
"""
MIPS-like CPU Assembler and Disassembler for the 5-stage pipeline processor
Based on the instruction set defined in def.v
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

# 反向映射用于反汇编
OPCODE_MAP = {}
FUNC_MAP = {}

for inst_name, info in OPCODES.items():
    if info['type'] == 'R':
        FUNC_MAP[info['func']] = inst_name
    else:
        OPCODE_MAP[info['opcode']] = inst_name

def parse_register(reg_str):
    """解析寄存器表示，支持 $0, $1, ..., $31 或 $zero, $at, 等"""
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
        
        # MIPS标准寄存器名映射
        reg_names = {
            'zero': 0, 'at': 1, 'v0': 2, 'v1': 3,
            'a0': 4, 'a1': 5, 'a2': 6, 'a3': 7,
            't0': 8, 't1': 9, 't2': 10, 't3': 11, 't4': 12, 't5': 13, 't6': 14, 't7': 15,
            's0': 16, 's1': 17, 's2': 18, 's3': 19, 's4': 20, 's5': 21, 's6': 22, 's7': 23,
            't8': 24, 't9': 25,
            'k0': 26, 'k1': 27,
            'gp': 28, 'sp': 29, 'fp': 30, 'ra': 31
        }
        
        if reg_name in reg_names:
            return reg_names[reg_name]
        else:
            raise ValueError(f"Unknown register name: {reg_str}")
    
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
        shamt = int(instruction_parts[3])
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
        # 支持十进制和十六进制偏移
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

def assemble_program(input_lines):
    """汇编整个程序，包括标签处理"""
    # 第一遍：识别标签和地址
    instructions = []
    addresses = []
    labels = {}
    line_num = 0

    for i, line in enumerate(input_lines):
        if not line.strip() or line.strip().startswith('#'):
            continue  # 跳过空行和注释

        # 移除注释部分
        line_no_comment = line.split('#')[0].strip()
        if not line_no_comment:
            continue

        # 检查是否有标签 (以冒号结尾的标识符)
        parts = line_no_comment.split(':')
        if len(parts) > 1:
            label_name = parts[0].strip()
            if label_name:  # 标签名不为空
                labels[label_name] = len(instructions) * 4  # 标签对应的地址
                # 处理冒号后的指令
                remaining_line = parts[1].strip()
                if remaining_line:
                    # 为后续处理准备指令行
                    input_lines[i] = remaining_line
                else:
                    continue  # 只有标签没有指令
        elif line_no_comment.strip():  # 没有标签，只是指令
            pass  # 我们会在第二遍处理这个

    # 第二遍：处理所有指令并替换标签
    for i, line in enumerate(input_lines):
        if not line.strip() or line.strip().startswith('#'):
            continue  # 跳过空行和注释

        # 移除注释部分
        line_no_comment = line.split('#')[0].strip()
        if not line_no_comment:
            continue

        # 检查是否仍有标签前缀
        parts = line_no_comment.split(':')
        if len(parts) > 1:
            remaining_line = parts[1].strip()
            if not remaining_line:
                continue
            line_no_comment = remaining_line

        if not line_no_comment.strip():
            continue

        # 按逗号和空格分割指令
        instruction_parts = re.split(r'[,\s]+', line_no_comment.strip())
        instruction_parts = [p for p in instruction_parts if p]  # 移除空元素

        if not instruction_parts:
            continue

        inst_name = instruction_parts[0].lower()

        if inst_name not in OPCODES:
            raise ValueError(f"Unknown instruction: {inst_name}")

        # 处理分支指令中的标签
        if inst_name in ['beq', 'bne'] and len(instruction_parts) >= 4:
            label_name = instruction_parts[3]
            if label_name in labels:
                # 计算相对地址
                current_addr = len(instructions) * 4
                target_addr = labels[label_name]
                relative_addr = (target_addr - current_addr - 4) // 4  # -4因为PC已更新到下一条
                instruction_parts[3] = str(relative_addr)
        elif inst_name in ['j', 'jal'] and len(instruction_parts) >= 2:
            label_name = instruction_parts[1]
            if label_name in labels:
                # 使用标签的绝对地址
                instruction_parts[1] = str(labels[label_name])

        op_info = OPCODES[inst_name]

        if op_info['type'] == 'R':
            instruction = assemble_r_type(instruction_parts)
        elif op_info['type'] == 'I':
            instruction = assemble_i_type(instruction_parts)
        elif op_info['type'] == 'J':
            instruction = assemble_j_type(instruction_parts)
        elif op_info['type'] == 'HALT':
            instruction = assemble_halt_type(instruction_parts)
        else:
            raise ValueError(f"Unknown instruction type for {inst_name}")

        instructions.append(instruction)
        addresses.append(len(instructions) * 4 - 4)  # 当前地址

    return instructions, labels

def assemble_line_with_labels(line, labels, current_addr):
    """组装单行汇编指令（已处理标签）"""
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

    # 处理分支指令中的标签
    if inst_name in ['beq', 'bne'] and len(parts) >= 4:
        label_name = parts[3]
        if label_name in labels:
            # 计算相对地址
            target_addr = labels[label_name]
            relative_addr = (target_addr - current_addr - 4) // 4
            parts[3] = str(relative_addr)
    elif inst_name in ['j', 'jal'] and len(parts) >= 2:
        label_name = parts[1]
        if label_name in labels:
            # 使用标签的绝对地址
            parts[1] = str(labels[label_name])

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

def assemble_line(line):
    """组装单行汇编指令，不处理标签（用于简化处理）"""
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

    # 检查是否有标签参数（如分支指令的目标）
    if inst_name in ['beq', 'bne', 'j', 'jal']:
        # 对于有标签的指令，需要特殊处理
        raise ValueError(f"Instruction {inst_name} requires label resolution, use assemble_program instead")

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

def disassemble(instruction):
    """将机器码反汇编为汇编指令"""
    # 检查是否是HALT指令 (0xffffffff)
    if instruction == 0xFFFFFFFF:
        return "halt"

    # 提取各字段
    opcode = (instruction >> 26) & 0x3F
    rs = (instruction >> 21) & 0x1F
    rt = (instruction >> 16) & 0x1F
    rd = (instruction >> 11) & 0x1F
    shamt = (instruction >> 6) & 0x1F
    funct = instruction & 0x3F
    immediate = instruction & 0xFFFF
    address = instruction & 0x03FFFFFF

    # 符号扩展立即数
    if immediate & 0x8000:  # 检查符号位
        immediate = immediate - 0x10000  # 补码转换

    if opcode == 0x00:  # R-type
        if funct in FUNC_MAP:
            inst_name = FUNC_MAP[funct]

            # 根据指令类型格式化输出
            if inst_name in ['add', 'addu', 'sub', 'subu', 'and', 'or', 'xor', 'nor', 'slt', 'sltu']:
                return f"{inst_name} ${rd}, ${rs}, ${rt}"
            elif inst_name in ['sll', 'srl', 'sra']:
                return f"{inst_name} ${rd}, ${rt}, {shamt}"
            elif inst_name == 'jr':
                return f"{inst_name} ${rs}"
            else:
                return f"Unknown R-type instruction: funct={funct}"
        else:
            return f"Unknown R-type instruction: funct={funct}"
    else:  # I-type or J-type
        if opcode in OPCODE_MAP:
            inst_name = OPCODE_MAP[opcode]

            if inst_name in ['addi', 'addiu', 'slti', 'sltiu', 'andi', 'ori', 'xori']:
                return f"{inst_name} ${rt}, ${rs}, {immediate}"
            elif inst_name in ['lw', 'sw']:
                return f"{inst_name} ${rt}, {immediate}(${rs})"
            elif inst_name in ['beq', 'bne']:
                return f"{inst_name} ${rs}, ${rt}, {immediate}"
            elif inst_name in ['j', 'jal']:
                target_addr = address << 2  # 左移2位得到实际地址
                return f"{inst_name} {target_addr}"
            elif inst_name == 'lui':
                return f"{inst_name} ${rt}, {immediate}"
            else:
                return f"Unknown instruction: opcode={opcode}"
        else:
            return f"Unknown instruction: opcode={opcode}"

def assemble_file(input_file, output_file):
    """汇编整个文件"""
    with open(input_file, 'r') as f:
        lines = f.readlines()

    try:
        instructions, labels = assemble_program(lines)
    except ValueError as e:
        print(f"Assembly error: {e}")
        return False

    # 将指令写入输出文件（十六进制格式，每行一个32位指令）
    with open(output_file, 'w') as f:
        for instr in instructions:
            f.write(f"{instr:08x}\n")

    print(f"Assembly completed. {len(instructions)} instructions generated.")
    print(f"Labels found: {labels}")
    return True

def disassemble_file(input_file, output_file):
    """反汇编整个文件"""
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    with open(output_file, 'w') as f:
        current_addr = 0
        for i, line in enumerate(lines):
            line = line.strip()
            if not line:
                continue
                
            try:
                # 读取十六进制指令
                instr_int = int(line, 16)
                disassembled = disassemble(instr_int)
                
                f.write(f"// Address 0x{current_addr:08x}: 0x{instr_int:08x}\n")
                f.write(f"{disassembled}\n\n")
                
                current_addr += 4
            except ValueError as e:
                print(f"Error at line {i+1}: {e}")
                print(f"Line content: {line}")
                continue
    
    print(f"Disassembly completed.")

def main():
    if len(sys.argv) < 3:
        print("Usage:")
        print("  Assemble: python asm_disasm_tool.py -a input.asm output.hex")
        print("  Disassemble: python asm_disasm_tool.py -d input.hex output.asm")
        return
    
    mode = sys.argv[1]
    input_file = sys.argv[2]
    output_file = sys.argv[3]
    
    if mode == '-a':
        print(f"Assembling {input_file} to {output_file}")
        success = assemble_file(input_file, output_file)
        if success:
            print("Assembly completed successfully!")
        else:
            print("Assembly failed!")
    elif mode == '-d':
        print(f"Disassembling {input_file} to {output_file}")
        disassemble_file(input_file, output_file)
        print("Disassembly completed successfully!")
    else:
        print("Invalid mode. Use -a for assemble or -d for disassemble")

if __name__ == "__main__":
    main()