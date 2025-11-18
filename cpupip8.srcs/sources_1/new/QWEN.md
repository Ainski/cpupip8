# Pipelined CPU Design Project

## Project Overview

This is a pipelined MIPS-like CPU implementation written in Verilog. The design follows a classic 5-stage pipeline architecture (IF: Instruction Fetch, ID: Instruction Decode, EX: Execute, MEM: Memory Access, WB: Write Back) with various pipeline registers between stages to store intermediate results.

### Key Components

- **ALU.v**: Arithmetic Logic Unit that performs various arithmetic and logical operations
- **regfile.v**: 32-register register file with forwarding and hazard detection capabilities
- **PC.v**: Program Counter module to manage instruction address sequencing
- **Pipeline Registers**: 
  - IF_ID.v: Instruction Fetch to Instruction Decode register
  - ID_EX.v: Instruction Decode to Execute register  
  - EX_MEM.v: Execute to Memory register
  - MEM_WB.v: Memory to Write Back register
- **Memory Modules**:
  - IMEM.v: Instruction Memory
  - DMEM.v: Data Memory
- **def.v**: Definition file containing operation codes, ALU control signals, and other constants
- **top.v**: Top-level module that integrates all components
- **NPCmaker.v**: Next Program Counter maker for handling jumps and branches
- **BJudge.v**: Branch judgment module for conditional branches

### Architecture Features

The CPU supports various MIPS-like instructions including:
- Arithmetic operations: ADD, ADDU, SUBU
- Logical operations: AND, OR, XOR, NOR
- Shift operations: SLL, SRL, SRA
- Load/Store operations: LW, SW
- Branch operations: BEQ, BNE
- Immediate operations: ADDI, ADDIU
- Comparison operations: SLT, SLTU

The design includes:
- Data forwarding to handle data hazards
- Hazard detection and stalling mechanisms
- Forwarding logic to reduce pipeline stalls
- Support for load-use hazards with proper stalling

### Simulation and Testing

The project includes simulation result files that demonstrate the CPU executing test programs:
- 1_addi_simulated.result.txt
- 1_addi.hex.txt  
- 1_addi.result.txt

These result files show the CPU executing various instructions and tracking register values, program counter changes, and instruction execution over time.

### Building and Running

This project appears to be designed for synthesis and simulation using a tool like Xilinx Vivado (based on the file path structure). To build and simulate:

1. Open the project in a Verilog simulator or synthesis tool
2. Compile all Verilog files in the project
3. Load test programs into the instruction memory
4. Run the simulation to observe CPU behavior
5. Analyze the results to verify correct operation of the pipeline

### Development Conventions

- Verilog modules follow standard naming conventions with descriptive names
- Use of `def.v` for all constants to maintain consistency
- Pipeline registers use appropriate control signals to manage data flow
- The design handles hazards through stalling and forwarding mechanisms
- Clock and reset signals are properly used for synchronous operation

### Key Design Concepts

- **Pipelining**: The 5-stage pipeline enables instruction-level parallelism
- **Hazard Handling**: Data and control hazards are handled through forwarding and stalling
- **Forwarding**: Results are forwarded between pipeline stages to reduce stalls
- **Stalling**: Pipeline bubbles are inserted when forwarding cannot resolve hazards
- **Control Logic**: Complex control logic manages pipeline operation and hazard detection