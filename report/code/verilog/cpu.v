`include "def.v"
`timescale 1ns / 1ps

module cpu (
    input clk,
    input reset,
    // alu
    output [31:0] a,
    output [31:0] b,
    output [3:0] aluc,
    output [31:0] aluo,
    output zero,
    output carry,
    output negative,
    output overflow,
    // bjudge
    output [31:0] rs,
    output [31:0] rt,
    input [31:0] instr,
    output [31:0] NPC_if_id,
    output B_PC_en,
    output [31:0] B_PC,
    //DMEM
    output [1:0] SC,
    output [2:0] LC,
    output [31:0] Data_in,
    output [31:0] DMEMaddr,
    output CS,
    output DM_W,
    output DM_R,
    input [31:0] Dataout,
    //EX_MEM
    output [3:0] doing_op_id_ex,
    output [31:0] instr_id_ex,
    output [31:0] aluo_ex_mem,
    output [31:0] b_ex_mem,
    output [31:0] instr_ex_mem,
    output [3:0] doing_op_ex_mem,


    //ID_EX
    output [31:0] instr_if_id,
    output [3:0] doing_op ,
    output [31:0] rt_id_ex,

    // IF_ID
    output [3:0] jpc_head,
    output [31:0] NPC,
    output [31:0] PC,
    output reg_detect_confict,
    output PC_bobl,
    output JPC_en,
    output [31:0] JPC,
    output halt,

    //IMEM

    //MEM_WB
    output [4:0] rdc,
    output [31:0] rdd,
    output wen ,

    //NPCmaker
    output [31:0] NPC_out,

    //regfile
    output [4:0] rsc,
    output [4:0] rtc,
    output [31:0] rd,
    output [31:0] regfile0,
    output [31:0] regfile1,
    output [31:0] regfile2,
    output [31:0] regfile3,
    output [31:0] regfile4,
    output [31:0] regfile5,
    output [31:0] regfile6,
    output [31:0] regfile7,
    output [31:0] regfile8,
    output [31:0] regfile9,
    output [31:0] regfile10,
    output [31:0] regfile11,
    output [31:0] regfile12,
    output [31:0] regfile13,
    output [31:0] regfile14,
    output [31:0] regfile15,
    output [31:0] regfile16,
    output [31:0] regfile17,
    output [31:0] regfile18,
    output [31:0] regfile19,
    output [31:0] regfile20,
    output [31:0] regfile21,
    output [31:0] regfile22,
    output [31:0] regfile23,
    output [31:0] regfile24,
    output [31:0] regfile25,
    output [31:0] regfile26,
    output [31:0] regfile27,
    output [31:0] regfile28,
    output [31:0] regfile29,
    output [31:0] regfile30,
    output [31:0] regfile31

);
    alu alu_inst(
        .a(a),
        .b(b),
        .aluc(aluc),
        .r(aluo),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow)
    );
    BJudge BJudge_inst(
        .rs(rs),
        .rt(rt),
        .instr(instr_if_id),
        .NPC_if_id(NPC_if_id),
        .B_PC_en(B_PC_en),
        .B_PC(B_PC)
    );

    EX_MEM EX_MEM_inst(
        .clk(clk),
        .reset(reset),
        .doing_op(doing_op_id_ex),
        .instr(instr_id_ex),
        .aluo(aluo),
        .b(b),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow),
        .SC(SC),
        .LC(LC),
        .Data_in(Data_in),
        .DMEMaddr(DMEMaddr),
        .CS(CS),
        .DM_W(DM_W),
        .DM_R(DM_R),
        .rt_id_ex(rt_id_ex),
        .aluo_ex_mem(aluo_ex_mem),
        .b_ex_mem(b_ex_mem),
        .instr_ex_mem(instr_ex_mem),
        .doing_op_ex_mem(doing_op_ex_mem)
    );

    ID_EX ID_EX_inst(
        .clk(clk),
        .reset(reset),
        .instr(instr_if_id),
        .rs(rs),
        .rt(rt),
        .doing_op(doing_op),
        .a(a),
        .b(b),
        .aluc(aluc),
        .instr_id_ex(instr_id_ex),
        .doing_op_id_ex(doing_op_id_ex),
        .rt_id_ex(rt_id_ex),
        .reg_conflict_detected(reg_detect_confict)
    );

    IF_ID IF_ID_inst(
        .clk(clk),
        .reset(reset),
        .jpc_head(jpc_head),
        .NPC(NPC),
        .instr(instr),
        .PC(PC),
        .reg_detect_confict(reg_detect_confict),
        .PC_bobl(PC_bobl),
        .JPC_en(JPC_en),
        .JPC(JPC),
        .doing_op(doing_op),
        .instr_if_id(instr_if_id),
        .NPC_if_id(NPC_if_id),
        .halt(halt),
        .rsc(rsc),
        .rtc(rtc)
    );


    MEM_WB MEM_WB_inst(
        .clk(clk),
        .reset(reset),
        .doing_op(doing_op_ex_mem),
        .instr(instr_ex_mem),
        .ALUo(aluo_ex_mem),
        .Dataout(Dataout),
        .rdc(rdc),
        .rdd(rdd),
        .wen(wen)
    );

    NPCmaker NPCmaker_inst(
        .PC_bobl(PC_bobl),
        .detect_conflict(reg_detect_confict),
        .PC(PC),
        .NPC(NPC),
        .B_PC(B_PC),
        .B_PC_en(B_PC_en),
        .J_PC(JPC),
        .J_PC_en(JPC_en),
        .NPC_out(NPC_out)
    );

    PCreg PCreg_inst(
        .pc_clk(clk),
        .reset(reset),
        .npc_in(NPC_out),
        .halt(halt),
        .npc(NPC),
        .pc(PC),
        .jpc_head(jpc_head)
    );
    regfile cpu_ref(
        .clk(clk),
        .reset(reset),
        .wen(wen),
        .rdc(rdc),
        .rdd(rdd),
        .rsc(rsc),
        .rtc(rtc),
        .doing_op(doing_op),
        .instr(instr_if_id),
        .ALUo_EX(aluo),
        .ALUo_MEM(aluo_ex_mem),
        .ALUo_WB(rdd),
        .Data_MEM(Dataout),
        .Data_WB(rdd),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .detect_conflict(reg_detect_confict),
        .regfile0(regfile0),
        .regfile1(regfile1),
        .regfile2(regfile2),
        .regfile3(regfile3),
        .regfile4(regfile4),
        .regfile5(regfile5),
        .regfile6(regfile6),
        .regfile7(regfile7),
        .regfile8(regfile8),
        .regfile9(regfile9),
        .regfile10(regfile10),
        .regfile11(regfile11),    
        .regfile12(regfile12),
        .regfile13(regfile13),
        .regfile14(regfile14),
        .regfile15(regfile15),
        .regfile16(regfile16),
        .regfile17(regfile17),
        .regfile18(regfile18),
        .regfile19(regfile19),
        .regfile20(regfile20),
        .regfile21(regfile21),
        .regfile22(regfile22),
        .regfile23(regfile23),
        .regfile24(regfile24),
        .regfile25(regfile25),
        .regfile26(regfile26),
        .regfile27(regfile27),
        .regfile28(regfile28),
        .regfile29(regfile29),
        .regfile30(regfile30),
        .regfile31(regfile31)
    );


    
    
endmodule