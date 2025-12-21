`define r_op          6'b000000
`define sll_func      6'b000000
`define srl_func      6'b000010
`define sra_func      6'b000011
`define sllv_func     6'b000100
`define srlv_func     6'b000110
`define srav_func     6'b000111
`define jr_func       6'b001000
`define jalr_func     6'b001001
`define mfhi_func     6'b010000
`define mthi_func     6'b010001
`define mflo_func     6'b010010
`define mtlo_func     6'b010011
`define mult_func     6'b011000
`define multu_func    6'b011001
`define div_func      6'b011010
`define divu_func     6'b011011
`define add_func      6'b100000
`define clz_func      6'b100000
`define addu_func     6'b100001
`define sub_func      6'b100010
`define subu_func     6'b100011
`define and_func      6'b100100
`define or_func       6'b100101
`define xor_func      6'b100110
`define nor_func      6'b100111
`define slt_func      6'b101010
`define sltu_func     6'b101011
`define teq_func      6'b110100


`define bgez_op       6'b000001
`define j_op          6'b000010
`define jal_op        6'b000011
`define beq_op        6'b000100
`define bne_op        6'b000101
`define addi_op       6'b001000
`define addiu_op      6'b001001
`define slti_op       6'b001010
`define sltiu_op      6'b001011
`define andi_op       6'b001100
`define ori_op        6'b001101
`define xori_op       6'b001110
`define lui_op        6'b001111
`define mfc0_op       6'b010000
`define mtc0_op       6'b010000
`define clz_op        6'b011100
`define lb_op         6'b100000
`define lh_op         6'b100001
`define lw_op         6'b100011
`define lbu_op        6'b100100
`define lhu_op        6'b100101
`define sb_op         6'b101000
`define sh_op         6'b101001
`define sw_op         6'b101011

`define bgez_rt       5'b00001

`define mfc0_rs       5'b00000
`define mtc0_rs       5'b00100

`define break_instr   32'b000000_00000_00000_00000_00000_001101
`define syscall_instr 32'b000000_00000_00000_00000_00000_001100
`define eret_instr    32'b010000_10000_00000_00000_00000_011000
`define halt_instr    32'b111111_11111_11111_11111_11111_111111
`define nop_instr     32'b000000_00000_00000_00000_00000_000000

`define add_aluc      4'b0010
`define addu_aluc     4'b0000
`define sub_aluc      4'b0011
`define subu_aluc     4'b0001
`define and_aluc      4'b0100
`define or_aluc       4'b0101
`define xor_aluc      4'b0110
`define nor_aluc      4'b0111
`define slt_aluc      4'b1011
`define sltu_aluc     4'b1010
`define sll_aluc      4'b1110
`define srl_aluc      4'b1101
`define sra_aluc      4'b1100
`define lui_aluc      4'b1000
`define bgez_aluc     4'b1001
`define sla_aluc      4'b1111

`define nvl_alumctr   3'b000
`define mult_alumctr  3'b001
`define multu_alumctr 3'b010
`define div_alumctr   3'b011
`define divu_alumctr  3'b100
`define mthi_alumctr  3'b101
`define mtlo_alumctr  3'b110

`define SYSCALL_cause 4'b1000
`define BREAK_cause   4'b1001
`define TEQ_cause     4'b1101

`define sb_dmem 2'b10
`define sh_dmem 2'b01
`define sw_dmem 2'b00
`define lw_dmem 3'b000
`define lhu_dmem 3'b001
`define lh_dmem  3'b010
`define lb_dmem  3'b100
`define lbu_dmem 3'b011

//下面定义关于对应op在doing_op当中对应的宏

`define add 1
`define addu 2
`define addi 3
`define addiu 4
`define sll 5
`define halt 6
`define lw 7
`define sw 8
`define subu 9
`define bne 10
`define beq 11
`define sltu 12
