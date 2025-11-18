`include "def.v"
module IMEM(
    input [31:0] address,
    input PC_bobl,
    output [31:0] instr
); 
    wire [31:0] instrT;
    assign instr = PC_bobl?`halt:instrT;

    // imem imem_ip(
    //     .a(address[12:2]),
    //     .spo(instrT)
    // );
    reg [31:0] IMEM [0:2047];
    assign instrT=IMEM[address[12:2]];

    initial begin
       // $readmemb("E:/github/cpu31/test_datas/_1_addi.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_1_addiu.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_1_lui.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_add.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_addu.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_and.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_andi.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_lwsw.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_lwsw2.txt", IMEM);
      // $readmemb("E:/github/cpu31/test_datas/_2_nor.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_or.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_ori.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sll.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sllv.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_slt.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_slti.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sltiu.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sltu.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sra.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_srav.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_srl.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_srlv.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_sub.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_subu.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_xor.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_2_xori.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_3.5_beq.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_3.5_bne.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_3_j.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_3_jal.txt", IMEM);
       //$readmemb("E:/github/cpu31/test_datas/_4_jr.txt", IMEM);

    end


endmodule