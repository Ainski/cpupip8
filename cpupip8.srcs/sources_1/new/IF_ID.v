`include "def.v"
module IF_ID(
    input clk,
    input reset,
    input [3:0] jpc_head,
    input [31:0] NPC,
    input [31:0] instr,
    input [31:0] PC,
    input reg_detect_confict,
    output [4:0] rsc,
    output [4:0] rtc,
    output PC_bobl,
    output JPC_en,
    output [31:0] JPC,
    output reg [3:0] doing_op,
    output [31:0] instr_if_id,
    output [31:0] NPC_if_id,
    output halt

);

    reg [31:0] NPC_reg, instr_reg;
    assign instr_if_id=instr_reg;
    assign NPC_if_id=NPC_reg;

    always @(posedge clk)begin
        if (!reset) begin
            NPC_reg <= 0;
            instr_reg<=0;
        end else if(reg_detect_confict) begin
            NPC_reg<=NPC_reg;
            instr_reg<=instr_reg;
        end else begin
            NPC_reg <= NPC;
            instr_reg<=instr;
        end
    end
    assign halt=instr==`halt_instr;

    //遇到跳转指令，直接跳转
    assign JPC_en=0;
    assign JPC={jpc_head, instr[25:21],1'b0,instr[19:0],2'b0};

    assign PC_bobl=(instr[31:26]==`beq_op||
                    instr[31:26]==`bne_op);
    always @(posedge clk) begin
        if (reset) begin
            doing_op <= 0;
        end else if(reg_detect_confict) begin
            doing_op<=doing_op;
        end else if (instr[31:0] == `halt_instr) begin
            doing_op <= `halt;
        end else begin
            case (instr[31:26])
                `lw_op: doing_op <= `lw;
                `sw_op: doing_op <= `sw;
                `beq_op: doing_op <= `beq;
                `bne_op: doing_op <= `bne;
                `r_op: begin
                    case (instr[5:0])
                        `add_func: doing_op <= `add;
                        `addu_func: doing_op <= `addu;
                        `subu_func: doing_op <= `subu;
                        `sll_func: doing_op <= `sll;
                        `sltu_func: doing_op <= `sltu;
                        default: doing_op <= 0;
                    endcase
                end
                default: doing_op <= 0;
            endcase
        end
    end
    assign rsc= instr[25:21];
    assign rtc= instr[20:16];
endmodule