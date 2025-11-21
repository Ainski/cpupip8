# ModelSim Batch Script for CPU Pipeline Testing

# Clean up any existing libraries and files
if {[file exists work]} {
    vdel -lib work -all
}
# Don't delete transcript and vsim.wlf as they might be in use
# Clean up any old result files if they exist
catch {file delete _246tb_ex10_result.txt}

# Create fresh working library
vlib work

# Compile IP core files first (these are required for the design to work)
vlog -work work -quiet ./cpupip8.srcs/sources_1/ip/dmem1/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/ip/dmem1/sim/dmem1.v

# Compile source files
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/def.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/alu.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/BJudge.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/PCreg.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/DMEM.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/EX_MEM.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/ID_EX.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/IF_ID.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/IMEM.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/MEM_WB.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/NPCmaker.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/regfile.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/cpu.v
vlog -work work -quiet ./cpupip8.srcs/sources_1/new/sccomp_dataflow.v
vlog -work work -quiet ./cpupip8.srcs/sim_1/new/_246tb_ex10_tb.v

# Create results directory using Tcl commands
set results_dir "./test_scripts/results"
if {![file exists $results_dir]} {
    file mkdir $results_dir
}

# List of all test files to run
set test_files [list \
    "testdata/1_addi.hex.txt" \
    "testdata/2_addiu.hex.txt" \
    "testdata/9_addu.hex.txt" \
    "testdata/11_beq.hex.txt" \
    "testdata/12_bne.hex.txt" \
    "testdata/16.26_lwsw.hex.txt" \
    "testdata/16.26_lwsw2.hex.txt" \
    "testdata/20_sll.hex.txt" \
    "testdata/22_sltu.hex.txt" \
    "testdata/25_subu.hex.txt" \
]

# Procedure to run a single test
proc run_single_test {test_file results_dir} {
    # Get test name without extension
    set test_name [file rootname [file tail $test_file]]
    set test_name [string map {.hex ""} $test_name]

    puts "\n-----------------------------"
    puts "RUNNING TEST: $test_file"
    puts "-----------------------------"

    # Clean up any old result files before starting the test
    if {[file exists ./_246tb_ex10_result.txt]} {
        catch {file delete ./_246tb_ex10_result.txt}
    }

    # Backup original IMEM.v
    file copy -force ./cpupip8.srcs/sources_1/new/IMEM.v ./cpupip8.srcs/sources_1/new/IMEM.v.bak

    # Read the original IMEM.v
    set fid [open "./cpupip8.srcs/sources_1/new/IMEM.v" r]
    set content [read $fid]
    close $fid

    # Replace the readmemh line with the current test file
    set lines [split $content "\n"]
    set new_lines {}
    foreach line $lines {
        if {[string match "*\$readmemh*" $line] && [string match "*IMEMreg*" $line] && ![string match "*//*" [string trimleft $line]]} {
            # Found the active $readmemh line, replace it
            lappend new_lines "       \$readmemh(\"E:/Homeworks/cpupip8/$test_file\", IMEMreg);"
        } else {
            lappend new_lines $line
        }
    }

    set new_content [join $new_lines "\n"]

    # Write the modified IMEM.v
    set fid [open "./cpupip8.srcs/sources_1/new/IMEM.v" w]
    puts -nonewline $fid $new_content
    close $fid

    # Recompile only IMEM.v
    vlog -work work -quiet ./cpupip8.srcs/sources_1/new/IMEM.v

    # Load and run simulation
    vsim -quiet work._246tb_ex10_tb

    # Run simulation for 100000ns
    run 100000ns

    # Copy the test result file to the results directory
    set sim_result_file "./_246tb_ex10_result.txt"
    set output_result_file "$results_dir/${test_name}_sim_result.txt"

    if {[file exists $sim_result_file]} {
        file copy -force $sim_result_file $output_result_file
        puts "Saved simulation result to: $output_result_file"
    } else {
        puts "Warning: Simulation result file not found: $sim_result_file"
    }

    # Restore original IMEM.v
    file copy -force ./cpupip8.srcs/sources_1/new/IMEM.v.bak ./cpupip8.srcs/sources_1/new/IMEM.v
    file delete ./cpupip8.srcs/sources_1/new/IMEM.v.bak

    # Generate standard result using external simulator
    set cmd_result [catch {exec ./cpu_pipelined_simulator.exe E:/Homeworks/cpupip8/$test_file} std_output]
    if {$cmd_result == 0} {
        puts "Standard test result generated successfully for $test_file"
    } else {
        puts "Failed to generate standard test result for $test_file: $std_output"
        return 0
    }

    # Expected standard result file
    set expected_result_file "./testdata/${test_name}.result.txt"

    # Generate standard result using external simulator and save it
    set std_result_file "$results_dir/${test_name}_std_result.txt"
    set cmd_result [catch {exec ./cpu_pipelined_simulator.exe E:/Homeworks/cpupip8/$test_file $std_result_file} std_output]
    if {$cmd_result == 0} {
        puts "Standard test result saved to: $std_result_file"
    } else {
        # Fallback: run without explicit output file and capture output
        set cmd_result [catch {exec ./cpu_pipelined_simulator.exe E:/Homeworks/cpupip8/$test_file} std_output_temp]
        if {$cmd_result == 0} {
            set std_fid [open $std_result_file w]
            puts $std_fid $std_output_temp
            close $std_fid
            puts "Standard test result saved to: $std_result_file from captured output"
        } else {
            puts "Failed to generate standard test result for $test_file: $std_output_temp"
            return 0
        }
    }

    # Compare results using external tool
    set compare_result [catch {exec txt_compare --file1 $output_result_file --file2 $expected_result_file --display detailed > "$results_dir/${test_name}_comparison_result.txt"} compare_output]

    # Check the comparison result
    set comp_file "$results_dir/${test_name}_comparison_result.txt"
    if {[file exists $comp_file]} {
        set comp_fid [open $comp_file r]
        set comp_content [read $comp_fid]
        close $comp_fid

        if {[string match "*PASS*" $comp_content] || [string match "*MATCH*" $comp_content]} {
            puts "RESULT: PASS - $test_file"
            return 1
        } else {
            puts "RESULT: FAIL - $test_file"
            return 0
        }
    } else {
        puts "Comparison result file not found: $comp_file"
        return 0
    }
}

# Run all tests
set total_tests [llength $test_files]
set pass_count 0

puts "Starting batch simulation for $total_tests tests..."

foreach test_file $test_files {
    set result [run_single_test $test_file $results_dir]
    if {$result == 1} {
        incr pass_count
    }
}

# Generate final summary
set summary_text [subst "BATCH TEST SUMMARY\n==================================\nTotal tests: $total_tests\nPassed tests: $pass_count\nFailed tests: [expr $total_tests - $pass_count]\nSuccess rate: [format %.2f [expr double($pass_count)*100/double($total_tests)]]%\n=================================="]

puts "\n$summary_text"

# Write summary to file
set sum_fid [open "$results_dir/test_summary.txt" w]
puts $sum_fid $summary_text
close $sum_fid

puts "\nAll tests completed. Results saved in $results_dir/"
puts "Success rate: [format %.2f [expr double($pass_count)*100/double($total_tests)]]%"

# Quit ModelSim
quit