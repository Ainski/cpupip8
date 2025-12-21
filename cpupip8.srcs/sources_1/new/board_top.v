
`timescale 1ns / 1ps

module board_top(
    input           clk,
    input           rst,
    input           ena,
    input  [2:0]    switch,
    output [7:0]    o_seg,
    output [7:0]    o_sel,
    output          halt
    );

    wire [31:0] display_data;
    wire [31:0] pc, instr;
    wire [31:0] reg4;
    wire [31:0] reg5;
    wire [31:0] reg20;
    wire [31:0] reg21;


    wire        clk_cpu;
    reg [20:0]  clk_div;

    always@(posedge clk)
        clk_div = clk_div + 1;
    
    assign clk_cpu = clk_div[20]&&ena;       // 下板
    //assign clk_cpu = clk && ena;               // 仿真

    mux8_32 mux_display(pc, instr, 32'b0,32'b0,reg4,reg5,reg20,reg21, switch, display_data);

    seg7x16 seg7x16_inst(clk, rst, 1'b1, display_data, o_seg, o_sel);

    // cpu cpu_inst(clk, rs, ena, pc, instr, reg4,reg5,reg20,reg21,halt);
    sccomp_dataflow cpu_inst(
        .clk(clk_cpu),
        .reset(rst),
        .PC(pc),
        .instr(instr),
        .regfile4(reg4),
        .regfile5(reg5),
        .regfile20(reg20),
        .regfile21(reg21)
    );
endmodule
