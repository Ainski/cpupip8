`timescale 1ns / 1ps

`include "def.v"
module IMEM(
    input [31:0] address,
    input [31:0] instr_if_id,

    output [31:0] instr
); 
    wire [31:0] instrT;
    wire PC_bobl;
    assign PC_bobl=(instr_if_id[31:26]==`beq_op||
                instr_if_id[31:26]==`bne_op);
    assign instr = PC_bobl?`nop_instr:instrT;

    // imem imem_ip(
    //     .a(address[12:2]),
    //     .spo(instrT)
    // );
  reg [31:0] IMEMreg [0:2047];
  assign instrT=IMEMreg[address[12:2]];

    initial begin
    //$readmemh("E:/Homeworks/cpupip8/testdata/1_addi.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/2_addiu.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/9_addu.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/11_beq.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/12_bne.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/16.26_lwsw.hex.txt",IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/16.26_lwsw2.hex.txt",IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/20_sll.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/22_sltu.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/25_subu.hex.txt", IMEMreg);
    $readmemh("E:/Homeworks/cpupip8/testdata/101_swlwbnebeq.hex.txt", IMEMreg);
    //$readmemh("E:/Homeworks/cpupip8/testdata/102_regconflict.hex.txt", IMEMreg);

    end


endmodule