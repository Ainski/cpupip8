# CPU Pipeline Test Scripts

This directory contains all automated testing scripts for the CPU pipeline project. The original Vivado project remains unchanged.

## Scripts Overview

### Vivado Scripts

1. **vivado_auto_test.tcl** - Original Vivado automation script for running batch tests
   - Automatically iterates through all test files mentioned in IMEM.v comments
   - Runs behavioral simulation in batch mode without opening waveform viewer
   - Compares results with reference outputs using txt_compare
   - Generates detailed reports

### ModelSim Scripts

1. **simple_modelsim_batch.do** - Simplified ModelSim batch script for running all tests
   - Designed to work in ModelSim's console environment
   - Iterates through all test files and runs simulations sequentially
   - Includes automatic compilation and test execution

2. **modelsim_basic_sim.do** - Basic ModelSim simulation script
   - Compiles all necessary source files
   - Loads testbench and runs simulation
   - Useful for quick individual tests

## Usage Instructions

### Using Vivado Script
1. Open Vivado and load the project
2. In the Tcl console, run:
   ```
   source test_scripts/vivado_auto_test.tcl
   ```

### Using ModelSim Scripts
1. Open ModelSim
2. Change directory to project root:
   ```
   cd E:/Homeworks/cpupip8/
   ```
3. Run the batch script:
   ```
   do test_scripts/simple_modelsim_batch.do
   ```

## Test Files Processed

Both scripts will iterate through these test files:
- testdata/1_addi.hex.txt
- testdata/2_addiu.hex.txt
- testdata/9_addu.hex.txt
- testdata/11_beq.hex.txt
- testdata/12_bne.hex.txt
- testdata/16.26_lwsw.hex.txt
- testdata/16.26_lwsw2.hex.txt
- testdata/20_sll.hex.txt
- testdata/22_sltu.hex.txt
- testdata/25_subu.hex.txt

## Results

Test results are stored in the `test_results/` directory with:
- Individual comparison reports for each test
- Overall summary report
- Simulation output files