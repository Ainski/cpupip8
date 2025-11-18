`include "def.v"
module regfile(
    input clk,
    input reset,
    input wen,
    input [4:0] rdc,
    input [31:0] rdd,
    input [4:0]rsc,
    input [4:0]rtc,
    input [3:0] doing_op,
    input [31:0] instr,
    input [31:0] ALUo_EX,
    input [31:0] ALUo_MEM,
    input [31:0] ALUo_WB,
    input [31:0] Data_MEM,
    input [31:0] Data_WB,
    output [31:0] rt,
    output [31:0] rd,
    output [31:0] rs,
    output detect_conflict,
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

    reg [31:0] array_reg[31:0];
    reg [3:0] reg_lock[31:0];

    assign regfile0 = array_reg[0];
    assign regfile1 = array_reg[1];
    assign regfile2 = array_reg[2];
    assign regfile3 = array_reg[3];
    assign regfile4 = array_reg[4];
    assign regfile5 = array_reg[5];
    assign regfile6 = array_reg[6];
    assign regfile7 = array_reg[7];
    assign regfile8 = array_reg[8];
    assign regfile9 = array_reg[9];
    assign regfile10 = array_reg[10];
    assign regfile11 = array_reg[11];
    assign regfile12 = array_reg[12];
    assign regfile13 = array_reg[13];
    assign regfile14 = array_reg[14];
    assign regfile15 = array_reg[15];
    assign regfile16 = array_reg[16];
    assign regfile17 = array_reg[17];
    assign regfile18 = array_reg[18];
    assign regfile19 = array_reg[19];
    assign regfile20 = array_reg[20];
    assign regfile21 = array_reg[21];
    assign regfile22 = array_reg[22];
    assign regfile23 = array_reg[23];
    assign regfile24 = array_reg[24];
    assign regfile25 = array_reg[25];
    assign regfile26 = array_reg[26];
    assign regfile27 = array_reg[27];
    assign regfile28 = array_reg[28];
    assign regfile29 = array_reg[29];
    assign regfile30 = array_reg[30];
    assign regfile31 = array_reg[31];

    integer i;  // 循环变量      
        
    always @(posedge clk) begin
        if (!reset) begin
            for (i = 0; i < 32; i=i+1) begin
                array_reg[i] <= 32'h0;  // 寄存器复位清零   
            end
        end else if(wen && rdc != 5'b0) begin  // 写使能且写入地址不为0（寄存器0恒为0）   
            for (i = 0; i < 32; i=i+1) begin
                if (rdc == i) begin
                    array_reg[i] <= rdd;  // 写入指定寄存器
                end else begin
                    array_reg[i] <= array_reg[i];  // 其他寄存器保持不变
                end
            end
        end else begin
            for (i=0;i<32;i=i+1) begin
                array_reg[i] = array_reg[i];
            end
        end
    end
    
    // 寄存器值读出逻辑
    



    wire lock_en;
    assign lock_en=(doing_op==`add 
        ||doing_op==`addu
        ||doing_op==`addi
        ||doing_op==`addiu
        ||doing_op==`sll
        ||doing_op==`lw
        ||doing_op==`subu
        ||doing_op==`sltu);
    wire [4:0] rdc_to_lock;
    assign rdc_to_lock=(doing_op==`add ||
                        doing_op==`addu ||
                        doing_op==`sll ||
                        doing_op==`subu||doing_op==`sltu)? instr[15:11]:
                        (doing_op==`lw||doing_op==`addi||doing_op==`addiu)?instr[20:16]:5'b0;
    always @(posedge clk) begin
        if (!reset) begin
            for(i=0;i<32;i=i+1)begin
                reg_lock[i]<=4'b0;
            end
        end else begin
            for(i=0;i<32;i=i+1) begin
                if(lock_en && rdc_to_lock==i) begin
                    reg_lock[i]<=(doing_op==`add ||
                        doing_op==`addu ||
                        doing_op==`sll ||
                        doing_op==`subu||doing_op==`sltu)? 4'b1110:
                        (doing_op==`lw||doing_op==`addi||doing_op==`addiu)? 4'b1010 :4'b0;
                end else begin
                    if(reg_lock[i][1:0]!=2'b0) begin
                        reg_lock[i]<=reg_lock[i]-1;
                    end
                    else begin
                        reg_lock[i]<=4'b0;
                    end
                end
            end
        end
    end
    assign rs = (reg_lock[rsc]==0)?array_reg[rsc]:
                (reg_lock[rsc]==4'b1110)?ALUo_EX:
                (reg_lock[rsc]==4'b1101)?ALUo_MEM:
                (reg_lock[rsc]==4'b1100)?rdd:
                (reg_lock[rsc]==4'b1001)?Data_MEM:
                (reg_lock[rsc]==4'b1000)?rdd:array_reg[rsc];
    assign rt = (reg_lock[rtc]==0)?array_reg[rtc]:
                (reg_lock[rtc]==4'b1110)?ALUo_EX:
                (reg_lock[rtc]==4'b1101)?ALUo_MEM:
                (reg_lock[rtc]==4'b1100)?rdd:
                (reg_lock[rtc]==4'b1001)?Data_MEM:
                (reg_lock[rtc]==4'b1000)?rdd:array_reg[rtc];
    assign rd = (reg_lock[rdc]==0)?array_reg[rdc]:
                (reg_lock[rdc]==4'b1110)?ALUo_EX:
                (reg_lock[rdc]==4'b1101)?ALUo_MEM:
                (reg_lock[rdc]==4'b1100)?rdd:
                (reg_lock[rdc]==4'b1001)?Data_MEM:
                (reg_lock[rdc]==4'b1000)?rdd:array_reg[rdc];

    wire rs_conflict,rt_conflict,rd_conflict;
    assign rs_conflict=
    (doing_op==`addu||
    doing_op==`add||
    doing_op==`subu||
    doing_op==`sltu||
    doing_op==`addi||
    doing_op==`addiu||
    doing_op==`sw||
    doing_op==`bne||
    doing_op==`beq||
    doing_op==`lw) && (reg_lock[rsc]==4'b1010);

    assign rt_conflict=
    (doing_op==`addu||
    doing_op==`add||
    doing_op==`subu||
    doing_op==`sltu||
    doing_op==`sw||
    doing_op==`bne||
    doing_op==`beq||
    doing_op==`sll)  && (reg_lock[rtc]==4'b1010);

    assign rd_conflict=(0)&& (reg_lock[rdc]==4'b1010);

    assign detect_conflict=rs_conflict||rt_conflict||rd_conflict;//这里不需要用这个信号去关闭上锁信号，下一个周期用新的上锁信号覆盖即可
endmodule