# Example MIPS-like assembly program for the 5-stage pipeline processor
# This program adds two numbers and stores the result

# Initialize registers
addi $t0, $zero, 10     # $t0 = 10
addi $t1, $zero, 20     # $t1 = 20
add $t2, $t0, $t1       # $t2 = $t0 + $t1 = 30
addiu $t3, $zero, 50    # $t3 = unsigned 50
sub $t4, $t1, $t0       # $t4 = $t1 - $t0 = 10
and $t5, $t0, $t1       # $t5 = $t0 AND $t1
or $t6, $t0, $t1        # $t6 = $t0 OR $t1
slt $t7, $t0, $t1       # $t7 = 1 if $t0 < $t1, else 0
sw $t2, 0($sp)          # Store $t2 to stack pointer location
lw $t8, 0($sp)          # Load from stack pointer to $t8

# More complex operations
sll $t9, $t0, 2         # $t9 = $t0 << 2
addi $s0, $zero, -5     # $s0 = -5
slti $s1, $s0, 0        # $s1 = 1 if $s0 < 0, else 0

# Test branch
beq $s1, $t7, skip      # Branch if equal
addi $s2, $zero, 100    # This won't execute if branch taken
skip:
addi $s3, $zero, 200    # This always executes

# End of program - halt
j 0x3c                  # Jump to specific address (placeholder for halt)