# Vivado Automated Testing Script with Logging

# Start logging
set log_file_name "batch_test_execution.log"
set log_file [open $log_file_name w]
puts $log_file "Batch Test Execution Log"
puts $log_file [clock format [clock seconds]]
puts $log_file "===================================="
close $log_file

# Redirect puts to also write to log
proc log_puts {args} {
    set log_file [open "batch_test_execution.log" a]
    foreach arg $args {
        puts $arg
        puts $log_file $arg
    }
    flush $log_file
    close $log_file
}

# Set project related variables
set project_name "cpupip8"
set tb_name "_246tb_ex10_tb"
set simulation_time "100000ns"
set tb_file_name "top_tb"  ;# File name is top_tb.v but module name is _246tb_ex10_tb

# Get all test files from IMEM.v comments
proc get_test_files {} {
    set imem_file "./cpupip8.srcs/sources_1/new/IMEM.v"
    set test_files [list]

    if {[file exists $imem_file]} {
        set fp [open $imem_file r]
        set content [read $fp]
        close $fp

        # Match commented $readmemh lines
        set lines [split $content "\n"]
        foreach line $lines {
            # Match file paths in comments
            if {[regexp {^.*//\s*\$readmemh\(\"[^\"]*testdata/([^"]+\.hex\.txt)\"} $line match filepath]} {
                lappend test_files "testdata/$filepath"
            } elseif {[regexp {^.*//\s*\$readmemh\(\"[^\"]*testdata\\\\([^"]+\.hex\.txt)\"} $line match filepath]} {
                lappend test_files "testdata/$filepath"
            } elseif {[regexp {^.*//\s*\$readmemh\(\"[^\"]*/Homeworks/cpupip8/testdata/([^"]+\.hex\.txt)\"} $line match filepath]} {
                lappend test_files "testdata/$filepath"
            }
        }

        # Add currently active file
        foreach line $lines {
            if {[regexp {^.*\$readmemh\(\"[^\"]*testdata/([^"]+\.hex\.txt)\"} $line match filepath] && ![regexp {^.*//} $line]} {
                if {[lsearch $test_files "testdata/$filepath"] == -1} {
                    lappend test_files "testdata/$filepath"
                }
            } elseif {[regexp {^.*\$readmemh\(\"[^\"]*testdata\\\\([^"]+\.hex\.txt)\"} $line match filepath] && ![regexp {^.*//} $line]} {
                if {[lsearch $test_files "testdata/$filepath"] == -1} {
                    lappend test_files "testdata/$filepath"
                }
            } elseif {[regexp {^.*\$readmemh\(\"[^\"]*/Homeworks/cpupip8/testdata/([^"]+\.hex\.txt)\"} $line match filepath] && ![regexp {^.*//} $line]} {
                if {[lsearch $test_files "testdata/$filepath"] == -1} {
                    lappend test_files "testdata/$filepath"
                }
            }
        }
    }

    # Remove duplicates
    set unique_test_files [list]
    foreach file $test_files {
        if {[lsearch $unique_test_files $file] == -1} {
            lappend unique_test_files $file
        }
    }

    return $unique_test_files
}

# Backup original IMEM.v file
proc backup_imem_file {} {
    set imem_file "./cpupip8.srcs/sources_1/new/IMEM.v"
    set backup_file "./cpupip8.srcs/sources_1/new/IMEM.v.backup"

    if {[file exists $backup_file]} {
        file delete $backup_file
    }

    file copy $imem_file $backup_file
    log_puts "IMEM.v backed up to $backup_file"
}

# Restore original IMEM.v file
proc restore_imem_file {} {
    set imem_file "./cpupip8.srcs/sources_1/new/IMEM.v"
    set backup_file "./cpupip8.srcs/sources_1/new/IMEM.v.backup"

    if {[file exists $backup_file]} {
        file copy -force $backup_file $imem_file
        log_puts "IMEM.v restored from backup"
        file delete $backup_file
    }
}

# Update IMEM.v file to use specified hex file
proc update_imem_file {hex_file} {
    set imem_file "./cpupip8.srcs/sources_1/new/IMEM.v"
    set backup_file "./cpupip8.srcs/sources_1/new/IMEM.v.backup"

    if {![file exists $backup_file]} {
        error "IMEM.v backup file does not exist, please run backup first"
    }

    # Restore from backup to temp file, then modify
    file copy -force $backup_file $imem_file

    set fp [open $imem_file r]
    set content [read $fp]
    close $fp

    # Replace currently active $readmemh line to use new hex file
    set lines [split $content "\n"]
    set updated_lines [list]

    set updated 0
    foreach line $lines {
        if {![regexp {^\s*//} $line] && [regexp {^\s*\$readmemh\(\"[^\"]*\",\s*IMEMreg\);} $line] && $updated == 0} {
            # Replace with new file path
            set new_line "       \$readmemh(\"E:/Homeworks/cpupip8/$hex_file\", IMEMreg);"
            lappend updated_lines $new_line
            set updated 1
        } else {
            lappend updated_lines $line
        }
    }

    set new_content [join $updated_lines "\n"]

    set fp [open $imem_file w]
    puts -nonewline $fp $new_content
    close $fp
}

# Execute single test file simulation and comparison
proc run_single_test {hex_file} {
    set tb_name "_246tb_ex10_tb"        ;# Module name
    set tb_file_name "top_tb"            ;# File name
    set simulation_time "100000ns"       ;# Simulation time

    log_puts "\n==========================================="
    log_puts "Testing: $hex_file"
    log_puts "==========================================="

    # Update IMEM.v to use current test file
    update_imem_file $hex_file

    # Set top module - use the correct module name
    set_property top $tb_name [get_filesets sim_1]

    # Launch simulation in batch mode (no GUI/waveform)
    launch_simulation -mode behavioral

    # Run simulation for the specified time
    run $simulation_time

    # Close simulation
    close_sim

    # Simulation result file location
    set sim_result_file "./cpupip8.sim/sim_1/behav/_246tb_ex10_result.txt"

    # Generate standard test result using cpu_pipelined_simulator.exe
    set base_filename [file rootname [file tail $hex_file]]
    set expected_ref_file "./testdata/[string map {.hex ""} $base_filename].result.txt"

    log_puts "Running standard simulator to generate reference result..."
    set cmd_result [catch {exec ./cpu_pipelined_simulator.exe "E:/Homeworks/cpupip8/$hex_file"} exec_output]
    if {$cmd_result == 0} {
        log_puts "Standard test result generated successfully"
    } else {
        log_puts "Failed to generate standard test result: $exec_output"
        return 0
    }

    # From program output get reference file path
    set ref_result_file $expected_ref_file

    # Verify reference result file exists
    if {![file exists $ref_result_file]} {
        log_puts "ERROR: Reference result file does not exist $ref_result_file"
        return 0
    }

    # Create comparison result file name
    set test_name [file rootname [file tail $hex_file]]
    set comparison_result_file "./test_results/${test_name}_comparison_result.txt"

    # Create test_results directory if it doesn't exist
    if {![file exists "./test_results"]} {
        file mkdir "./test_results"
    }

    # Use txt_compare to compare two files and save result to comparison result file
    log_puts "Comparing simulation result with standard result..."
    set compare_result [catch {exec txt_compare --file1 $sim_result_file --file2 $ref_result_file --display detailed > $comparison_result_file} comparison_output]

    if {$compare_result == 0} {
        # Read and display comparison result
        set result_fp [open $comparison_result_file r]
        set result_content [read $result_fp]
        close $result_fp
        log_puts "Comparison result:"
        log_puts $result_content

        if {[string match "*PASS*" $result_content] || [string match "*MATCH*" $result_content]} {
            log_puts "PASS: $hex_file"
            return 1
        } else {
            log_puts "FAIL: $hex_file"
            return 0
        }
    } else {
        # If txt_compare command fails, use Tcl built-in comparison
        log_puts "txt_compare execution failed, using built-in comparison tool"
        set comparison_result [compare_files $sim_result_file $ref_result_file]
        if {$comparison_result} {
            log_puts "PASS: $hex_file"
            return 1
        } else {
            log_puts "FAIL: $hex_file"
            return 0
        }
    }
}

# Built-in file comparison function
proc compare_files {file1 file2} {
    if {![file exists $file1] || ![file exists $file2]} {
        log_puts "ERROR: File does not exist - file1: $file1, file2: $file2"
        return 0
    }

    set f1 [open $file1 r]
    set f2 [open $file2 r]

    set line_num 1
    set all_match 1

    while {![eof $f1] && ![eof $f2]} {
        set line1 [gets $f1]
        set line2 [gets $f2]

        if {$line1 ne $line2} {
            log_puts "Line $line_num does not match:"
            log_puts "  Simulation result: $line1"
            log_puts "  Standard result: $line2"
            set all_match 0
        }

        incr line_num
    }

    # Check if there are remaining lines
    if {![eof $f1]} {
        log_puts "Standard result file ended but simulation result has more content"
        set all_match 0
    }
    if {![eof $f2]} {
        log_puts "Simulation result file ended but standard result has more content"
        set all_match 0
    }

    close $f1
    close $f2

    return $all_match
}

# Main test flow
log_puts "Starting multi-file simulation test flow..."

# Backup IMEM.v file
backup_imem_file

# Get test file list
set test_files [get_test_files]

if {[llength $test_files] == 0} {
    log_puts "No test files found"
} else {
    log_puts "[llength $test_files] test files found:"
    foreach file $test_files {
        log_puts "  - $file"
    }

    # Iterate all test files and execute test
    set total_tests [llength $test_files]
    set passed_tests 0

    foreach hex_file $test_files {
        if {[run_single_test $hex_file]} {
            incr passed_tests
        }

        # Reset simulation environment
        if {[get_runs -quiet -of_objects [get_filesets sim_1]] ne ""} {
            reset_run [get_filesets sim_1]
        }
    }

    # Generate summary
    set summary_file "./test_results/test_summary.txt"
    if {![file exists "./test_results"]} {
        file mkdir "./test_results"
    }

    set summary_fp [open $summary_file w]
    puts $summary_fp "Test Summary"
    puts $summary_fp "============"
    puts $summary_fp "Total tests: $total_tests"
    puts $summary_fp "Passed tests: $passed_tests"
    puts $summary_fp "Failed tests: [expr $total_tests - $passed_tests]"
    puts $summary_fp "Success rate: [format %.2f [expr ($passed_tests * 100.0) / $total_tests]]%"
    puts $summary_fp "============"
    close $summary_fp

    log_puts "\n==========================================="
    log_puts "All tests completed!"
    log_puts "Total tests: $total_tests"
    log_puts "Passed tests: $passed_tests"
    log_puts "Failed tests: [expr $total_tests - $passed_tests]"
    log_puts "Success rate: [format %.2f [expr ($passed_tests * 100.0) / $total_tests]]%"
    log_puts "Detailed results are saved in ./test_results/"
    log_puts "==========================================="
}

# Restore original IMEM.v file
restore_imem_file

log_puts "Script execution completed!"
log_puts "Full execution log saved to batch_test_execution.log"