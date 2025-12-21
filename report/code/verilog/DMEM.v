//// 被注释掉的是前仿真的版本，会出现在后仿真的过程中synthesis过慢的问题，原因是过大的寄存器数组
`timescale 1ns / 1ps
`include "def.v"

module DMEM(
    input clk,
    input [1:0]SC,
    input [2:0]LC,
    input [31:0] Data_in,
    input [31:0] DMEMaddr,
    input CS,
    input DM_W,
    input DM_R,
    output [31:0] Dataout
);

wire [7:0] dmem1_w;
wire [7:0] dmem2_w;
wire [7:0] dmem3_w;
wire [7:0] dmem4_w;
wire [7:0] dmem1_r;
wire [7:0] dmem2_r;
wire [7:0] dmem3_r;
wire [7:0] dmem4_r;

wire we1;
wire we2;
wire we3;
wire we4;



assign dmem1_w = Data_in[7:0];
assign dmem2_w = Data_in[15:8];
assign dmem3_w = Data_in[23:16];
assign dmem4_w = Data_in[31:24];

assign we1 = (SC == `sw_dmem || SC == `sh_dmem || SC == `sb_dmem) && DM_W && CS;
assign we2 = (SC == `sw_dmem || SC == `sh_dmem) && DM_W && CS;
assign we3 = (SC == `sw_dmem) && DM_W && CS;
assign we4 = (SC == `sw_dmem) && DM_W && CS;

assign Dataout = (CS && DM_R) ? (LC == `lw_dmem) ? {dmem4_r, dmem3_r, dmem2_r, dmem1_r} :
                                (LC == `lhu_dmem) ? {16'b0, dmem2_r, dmem1_r} :
                                (LC == `lh_dmem)  ? {{16{dmem2_r[7]}}, dmem2_r, dmem1_r} :
                                (LC == `lb_dmem)  ? {{24{dmem1_r[7]}}, dmem1_r} :
                                (LC == `lbu_dmem) ? {24'b0, dmem1_r} : 32'bz : 32'bz;
                                
dmem1 dmem1_uut(
    .a(DMEMaddr[10:0]),
    .d(dmem1_w),
    .clk(clk),
    .we(we1),
    .spo(dmem1_r)
);

dmem1 dmem2_uut(
    .a(DMEMaddr[10:0]),
    .d(dmem2_w),
    .clk(clk),
    .we(we2),
    .spo(dmem2_r)
);

dmem1 dmem3_uut(
    .a(DMEMaddr[10:0]),
    .d(dmem3_w),
    .clk(clk),
    .we(we3),
    .spo(dmem3_r)
);

dmem1 dmem4_uut(
    .a(DMEMaddr[10:0]),
    .d(dmem4_w),
    .clk(clk),
    .we(we4),
    .spo(dmem4_r)
);


endmodule