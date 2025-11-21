# CPU流水线仿真器工具

## 文件说明

### asm_disasm_tool.py
- 汇编器和反汇编器工具
- 可以将MIPS-like汇编代码转换为机器码
- 可以将机器码反汇编为汇编代码

### convert_asm_to_hex.py
- 专用的汇编到十六进制转换工具
- 用于将.txt格式的汇编代码转换为.hex.txt格式的机器码

### test_and_compare.py
- 测试脚本，用于验证转换工具的准确性
- 使用txt_compare比较转换结果与原始数据

## 说明

您的项目中有两类文件：
- `testdata/N_*.txt`: 包含汇编代码
- `testdata/N_*.hex.txt`: 包含对应的机器码（由仿真器生成）

这些工具可以帮助您：
1. 将汇编代码转换为机器码格式
2. 将机器码反汇编为可读的汇编代码以进行调试
3. 验证您的CPU设计是否正确执行指令

## 使用方法

### 汇编（汇编到机器码）
```bash
python asm_disasm_tool.py -a input.asm output.hex
```

### 反汇编（机器码到汇编）
```bash
python asm_disasm_tool.py -d input.hex output.asm
```

### 运行测试
```bash
python test_and_compare.py
```

### 直接转换汇编到机器码
```bash
python convert_asm_to_hex.py input.txt output.hex.txt
```

注意：不要用这些工具覆盖项目中的原始测试数据文件，这些文件是由参考仿真器生成的正确结果。

## 支持的指令

- R型指令: add, addu, sub, subu, and, or, xor, nor, slt, sltu, sll, srl, sra
- I型指令: addi, addiu, slti, sltiu, andi, ori, xori, lui, beq, bne, lw, sw
- J型指令: j, jal
- 特殊指令: halt