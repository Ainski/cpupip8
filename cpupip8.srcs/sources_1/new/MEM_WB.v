`include "def.v"
module MEM_WB (
    input clk,
    input reset,
    input [3:0] doing_op,
    input [31:0] instr,

    input [31:0]ALUo,
    input [31:0] Dataout,

    output [5:0] rdc,
    output [31:0] rdd,
    output wen
    
);


    reg [31:0] doing_op_r, instr_r , ALUo_r, Dataout_r;
    always @(posedge clk) begin
        if (!reset) begin
            doing_op_r <= 0;
            instr_r <= 0;
            ALUo_r <= 0;
            Dataout_r <= 0;
        end else begin
            doing_op_r<=doing_op;
            instr_r<=instr;
            ALUo_r <= ALUo;
            Dataout_r <= Dataout;
        end
    end 
    assign wen = (
        doing_op_r == `add||
        doing_op_r == `addu||
        doing_op_r == `addi||
        doing_op_r == `addiu||
        doing_op_r == `subu||
        doing_op_r == `sll||
        doing_op_r == `lw ||
        doing_op_r == `sltu
    );
    assign rdc = (
        doing_op_r == `add || 
        doing_op_r == `addu ||
        doing_op_r == `subu ||
        doing_op_r == `sll ||
        doing_op_r == `sltu 
    ) ? instr_r[15:11]:
    (
        doing_op_r == `addi||
        doing_op_r == `addiu||
        doing_op_r == `lw 
    ) ? instr_r[20:16]:
     5'b0;
    assign rdd = (
        doing_op_r == `add || 
        doing_op_r == `addu ||
        doing_op_r == `subu ||
        doing_op_r == `sll ||
        doing_op_r == `sltu ||
        doing_op_r == `addi ||
        doing_op_r == `addiu
    ) ? ALUo_r:
    (
        doing_op_r == `lw 
    )? Dataout_r: 
    32'b0;

    
endmodule