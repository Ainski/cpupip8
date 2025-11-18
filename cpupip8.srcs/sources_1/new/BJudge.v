`include "def.v"
module BJudge(
    input [31:0] rs,
    input [31:0] rt,
    input [31:0] instr,
    input [31:0] NPC_if_id,
    output B_PC_en,
    output [31:0] B_PC
);

assign B_PC=NPC_if_id+{{16{instr[15]}},instr[15:0]};

assign B_PC_en=(instr[31:26]==`beq_op)?(rs==rt):
                (instr[31:26]==`bne_op)?(rs!=rt):
                0;

endmodule 