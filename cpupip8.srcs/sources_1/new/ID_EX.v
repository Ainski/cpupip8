`timescale 1ns / 1ps

`include "def.v"
module ID_EX(
    input clk,
    input reset,
    input [31:0] instr,
    input [31:0] rs,
    input [31:0] rt,
    input [3:0] doing_op,
    output [31:0] a,
    output [31:0] b,
    output [3:0] aluc,
    output [31:0] instr_id_ex,
    output [3:0] doing_op_id_ex,
    output [31:0] rt_id_ex
);


reg [31:0] instr_reg, rs_reg, rt_reg;
reg [3:0] doing_op_reg;

assign instr_id_ex = instr_reg;
assign doing_op_id_ex = doing_op_reg;
assign rt_id_ex = rt_reg;

always @(posedge clk) begin
    if (reset) begin
        instr_reg <= 0;
        rs_reg <= 0;
        rt_reg <= 0;
        doing_op_reg <= 0;
    end else begin
        instr_reg<=instr;
        rs_reg<=rs;
        rt_reg<=rt;
        doing_op_reg <= doing_op;
    end
end

assign a = 
    (doing_op_reg==`add) ? rs_reg:
    (doing_op_reg==`addu) ? rs_reg:
    (doing_op_reg==`addi) ? rs_reg:
    (doing_op_reg==`addiu) ? rs_reg:
    (doing_op_reg==`subu) ? rs_reg:
    (doing_op_reg==`sltu) ? rs_reg:
    (doing_op_reg==`lw) ? rs_reg:
    (doing_op_reg==`sw) ? rs_reg:
    (doing_op_reg==`sll) ? {27'b0,instr_reg[10:6]}://shamt
    (doing_op_reg==`beq) ? rs_reg:
    (doing_op_reg==`bne) ? rs_reg:
    32'b0;
assign b = 
    (doing_op_reg==`add) ? rt_reg:
    (doing_op_reg==`addu) ? rt_reg:
    (doing_op_reg==`addi) ? {{16{instr_reg[15]}},instr_reg[15:0]}: // sign extend imdt
    (doing_op_reg==`addiu) ? {{16{instr_reg[15]}},instr_reg[15:0]}: // sign extend imdt
    (doing_op_reg==`subu) ? rt_reg:
    (doing_op_reg==`sltu) ? rt_reg:
    (doing_op_reg==`lw) ? {{16{instr_reg[15]}},instr_reg[15:0]}: // sign extend imdt
    (doing_op_reg==`sw) ? {{16{instr_reg[15]}},instr_reg[15:0]}: // sign extend imdt
    (doing_op_reg==`sll) ? rt_reg:
    (doing_op_reg==`beq) ? rt_reg:
    (doing_op_reg==`bne) ? rt_reg:
    32'b0;
assign aluc =
    (doing_op_reg==`add) ? `add_aluc:
    (doing_op_reg==`addu) ? `addu_aluc:
    (doing_op_reg==`addi) ? `add_aluc:
    (doing_op_reg==`addiu) ? `addu_aluc:
    (doing_op_reg==`subu) ? `subu_aluc:
    (doing_op_reg==`sltu) ? `sltu_aluc:
    (doing_op_reg==`lw) ? `add_aluc:
    (doing_op_reg==`sw) ? `add_aluc:
    (doing_op_reg==`sll) ? `sll_aluc:
    (doing_op_reg==`beq) ? `sub_aluc:
    (doing_op_reg==`bne) ? `sub_aluc:
    4'b0;




endmodule