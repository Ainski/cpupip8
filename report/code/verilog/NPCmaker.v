`timescale 1ns / 1ps

module NPCmaker(
    input PC_bobl,
    input detect_conflict,
    input [31:0]PC,
    input [31:0]NPC,
    input [31:0]B_PC,
    input B_PC_en,
    input [31:0]J_PC,
    input J_PC_en,
    output [31:0]NPC_out
);
    assign NPC_out =(PC_bobl||detect_conflict)? PC : 
                    (J_PC_en)? J_PC : 
                    (B_PC_en)? B_PC : 
                    NPC;
endmodule