# CPU流水线仿真器项目

## 项目概述

这是一个实现5级流水线处理器的MIPS CPU仿真器项目。项目包含硬件设计文件（Verilog语言）和一个用于比较的软件仿真器。

### 主要组件

- **硬件设计**: 用Verilog实现，文件位于 `cpupip8.srcs/sources_1/new/`
- **测试平台**: 位于 `cpupip8.srcs/sim_1/new/`
- **仿真控制**: ModelSim批处理脚本 `run_cpu_tests.do` 用于自动化测试
- **软件仿真器**: `cpu_pipelined_simulator.cpp` - 一个C++参考实现

### CPU架构

CPU实现5级流水线：
1. IF (指令获取)
2. ID (指令译码)
3. EX (执行)
4. MEM (内存访问)
5. WB (写回)

支持的指令类型包括：
- R型: ADD, ADDU, SUBU, SLL, SLTU等
- I型: ADDI, ADDIU, LW, SW, BEQ, BNE等
- J型: J, JAL

## 构建和运行

### 硬件仿真
1. 在Vivado中打开项目
2. 或使用ModelSim运行自动化测试:
   ```bash
   vsim -c -do "do run_cpu_tests.do; quit" > log
   ```

### 软件仿真器
1. 编译C++仿真器:
   ```bash
   g++ -o cpu_pipelined_simulator.exe cpu_pipelined_simulator.cpp
   ```
2. 使用测试hex文件运行:
   ```bash
   ./cpu_pipelined_simulator.exe testdata/1_addi.hex.txt
   ```

### 自动化测试
- 使用 `run_cpu_tests.do` 脚本运行所有测试用例
- 结果保存在 `test_scripts/results/` 目录
- 每个测试将仿真结果与标准模型进行比较

## 关键文件

### 硬件文件 (Verilog)
- `sccomp_dataflow.v`: 顶层CPU模块
- `cpu.v`: 主CPU实现
- `ALU.v`: 算术逻辑单元
- `regfile.v`: 带转发功能的寄存器文件
- `IF_ID.v`, `ID_EX.v`, `EX_MEM.v`, `MEM_WB.v`: 流水线级间寄存器
- `def.v`: 定义和操作码

### 测试文件
- `_246tb_ex10_tb.v`: 测试平台
- `run_cpu_tests.do`: ModelSim自动化脚本
- `test_scripts/results/`: 测试结果输出目录

### 测试数据
- `testdata/*.hex.txt`: 以hex格式表示的输入测试程序
- `testdata/*.result.txt`: 期望结果

### 其他重要文件
- `cpu_pipelined_simulator.cpp`: C++参考模型实现
- `log`: 仿真日志文件

## 开发规范

- 使用5级MIPS流水线架构
- 实现冒险检测和数据转发
- 包括全面的测试套件
- 使用模块化设计，每个组件使用单独文件

## 项目状态

当前实现显示硬件仿真与参考模型在ADDI指令上存在差异，如比较日志所证明。这表明可能存在以下问题：
- ADDI指令的数据转发
- 寄存器写回时序
- 立即数的符号扩展逻辑
- 流水线冒险检测

## 测试结果位置

- 日志文件: `log`
- 测试结果: `test_scripts/results/`
- 比较结果: `test_scripts/results/*_comparison_result.txt`
- 标准模型结果: `test_scripts/results/*_std_result.txt`
- 仿真结果: `test_scripts/results/*_sim_result.txt`