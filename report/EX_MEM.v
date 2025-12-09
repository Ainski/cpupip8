`timescale 1ns / 1ps

`include "def.v"
module EX_MEM(
    input clk,
    input reset,
    input [3:0] doing_op,
    input [31:0] instr,
    
    input [31:0] aluo,
    input [31:0] b,

    input zero,
    input carry,    
    //0 标志位 
    // 进位标志位 
    input negative,   // 负数标志位 
    input overflow,   // 溢出标志位 
    output [1:0]SC,
    output [2:0]LC,
    output [31:0] Data_in,
    output [31:0] DMEMaddr,
    output CS,
    output DM_W,
    output DM_R,

    output [31:0] aluo_ex_mem,
    output [31:0] b_ex_mem,
    output [31:0] instr_ex_mem,
    output [3:0] doing_op_ex_mem
);
    reg zero_r, carry_r, negative_r, overflow_r;
    always @(posedge clk) begin
        if (reset) begin
            zero_r <= 0;
            carry_r <= 0;
            negative_r <= 0;
            overflow_r <= 0;
        end else begin
            zero_r <= zero;
            carry_r <= carry;
            negative_r <= negative;
            overflow_r <= overflow;
        end
    end
    reg [31:0] aluo_r , b_r , instr_r;
    reg [3:0] doing_op_r;

    always @ (posedge clk) begin
        if (reset) begin
            aluo_r <= 0;
            b_r <= 0;
            doing_op_r <= 0;
            instr_r <= 0;
        end else begin
            aluo_r<=aluo;
            b_r<=b;
            doing_op_r<=doing_op;
            instr_r<=instr;
        end
    end

    assign aluo_ex_mem = aluo_r;
    assign b_ex_mem = b_r;
    assign instr_ex_mem = instr_r;
    assign doing_op_ex_mem = doing_op_r;
    assign SC = (doing_op_r==`sw) ? `sw_dmem:2'b0;
    assign LC = (doing_op_r==`lw) ? `lw_dmem:2'b0;

    assign CS= (doing_op_r==`sw) || (doing_op_r==`lw) ? 1'b1:1'b0;
    assign DM_W = (doing_op_r==`sw) ? 1'b1:1'b0;
    assign DM_R = (doing_op_r==`lw) ? 1'b1:1'b0;
    assign DMEMaddr = (doing_op_r==`sw || doing_op_r==`lw) ? aluo_r:32'b0;
    assign Data_in = (doing_op_r==`sw) ? b_r:32'b0;

endmodule