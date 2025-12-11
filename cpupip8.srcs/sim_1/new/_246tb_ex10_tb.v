`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2025/11/19 11:22:11
// Design Name:
// Module Name: top_tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module _246tb_ex10_tb(

    );

    reg clk,reset;
    reg [31:0] count;
    reg [31:0]pc_end_count;

    wire [31:0] a;
    wire [31:0] b;
    wire [3:0] aluc;
    wire [31:0] aluo;
    wire zero;
    wire carry;
    wire negative;
    wire overflow;
    // bjudge
    wire [31:0] rs;
    wire [31:0] rt;
    wire [31:0] instr;
    wire [31:0] NPC_if_id;
    wire B_PC_en;
    wire [31:0] B_PC;
    //DMEM
    wire [1:0] SC;
    wire [2:0] LC;
    wire [31:0] Data_in;
    wire [31:0] DMEMaddr;
    wire CS;
    wire DM_W;
    wire DM_R;
    wire [31:0] Dataout;
    //EX_MEM
    wire [3:0] doing_op_id_ex;
    wire [31:0] instr_id_ex;
    wire [31:0] aluo_ex_mem;
    wire [31:0] b_ex_mem;
    wire [31:0] instr_ex_mem;
    wire [3:0] doing_op_ex_mem;

    //ID_EX
    wire [31:0] instr_if_id;
    wire [3:0] doing_op ;

    // IF_ID
    wire [3:0] jpc_head;
    wire [31:0] NPC;
    wire [31:0] PC;
    wire reg_detect_confict;
    wire PC_bobl;
    wire JPC_en;
    wire [31:0] JPC;
    wire halt;

    //IMEM

    //MEM_WB
    wire [4:0] rdc;
    wire [31:0] rdd;
    wire wen ;

    //NPCmaker
    wire [31:0] NPC_out;

    //regfile
    wire [4:0] rsc;
    wire [4:0] rtc;
    wire [31:0] rd;
    wire [31:0] regfile0;
    wire [31:0] regfile1;
    wire [31:0] regfile2;
    wire [31:0] regfile3;
    wire [31:0] regfile4;
    wire [31:0] regfile5;
    wire [31:0] regfile6;
    wire [31:0] regfile7;
    wire [31:0] regfile8;
    wire [31:0] regfile9;
    wire [31:0] regfile10;
    wire [31:0] regfile11;
    wire [31:0] regfile12;
    wire [31:0] regfile13;
    wire [31:0] regfile14;
    wire [31:0] regfile15;
    wire [31:0] regfile16;
    wire [31:0] regfile17;
    wire [31:0] regfile18;
    wire [31:0] regfile19;
    wire [31:0] regfile20;
    wire [31:0] regfile21;
    wire [31:0] regfile22;
    wire [31:0] regfile23;
    wire [31:0] regfile24;
    wire [31:0] regfile25;
    wire [31:0] regfile26;
    wire [31:0] regfile27;
    wire [31:0] regfile28;
    wire [31:0] regfile29;
    wire [31:0] regfile30;
    wire [31:0] regfile31;

    sccomp_dataflow uut (
        .clk                (clk                ),
        .reset              (reset              ),
        .a                  (a                  ),
        .b                  (b                  ),
        .aluc               (aluc               ),
        .aluo               (aluo               ),
        .zero               (zero               ),
        .carry              (carry              ),
        .negative           (negative           ),
        .overflow           (overflow           ),
        .rs                 (rs                 ),
        .rt                 (rt                 ),
        .instr              (instr              ),
        .NPC_if_id          (NPC_if_id          ),
        .B_PC_en            (B_PC_en            ),
        .B_PC               (B_PC               ),
        .SC                 (SC                 ),
        .LC                 (LC                 ),
        .Data_in            (Data_in            ),
        .DMEMaddr           (DMEMaddr           ),
        .CS                 (CS                 ),
        .DM_W               (DM_W               ),
        .DM_R               (DM_R               ),
        .Dataout            (Dataout            ),
        .doing_op_id_ex     (doing_op_id_ex     ),
        .instr_id_ex        (instr_id_ex        ),
        .aluo_ex_mem        (aluo_ex_mem        ),
        .b_ex_mem           (b_ex_mem           ),
        .instr_ex_mem       (instr_ex_mem       ),
        .doing_op_ex_mem    (doing_op_ex_mem    ),
        .instr_if_id        (instr_if_id        ),
        .doing_op           (doing_op           ),
        .jpc_head           (jpc_head           ),
        .NPC                (NPC                ),
        .PC                 (PC                 ),
        .reg_detect_confict (reg_detect_confict ),
        .PC_bobl            (PC_bobl            ),
        .JPC_en             (JPC_en             ),
        .JPC                (JPC                ),
        .halt               (halt               ),
        .rdc                (rdc                ),
        .rdd                (rdd                ),
        .wen                (wen                ),
        .NPC_out            (NPC_out            ),
        .rsc                (rsc                ),
        .rtc                (rtc                ),
        .rd                 (rd                 ),
        .regfile0           (regfile0           ),
        .regfile1           (regfile1           ),
        .regfile2           (regfile2           ),
        .regfile3           (regfile3           ),
        .regfile4           (regfile4           ),
        .regfile5           (regfile5           ),
        .regfile6           (regfile6           ),
        .regfile7           (regfile7           ),
        .regfile8           (regfile8           ),
        .regfile9           (regfile9           ),
        .regfile10          (regfile10          ),
        .regfile11          (regfile11          ),
        .regfile12          (regfile12          ),
        .regfile13          (regfile13          ),
        .regfile14          (regfile14          ),
        .regfile15          (regfile15          ),
        .regfile16          (regfile16          ),
        .regfile17          (regfile17          ),
        .regfile18          (regfile18          ),
        .regfile19          (regfile19          ),
        .regfile20          (regfile20          ),
        .regfile21          (regfile21          ),
        .regfile22          (regfile22          ),
        .regfile23          (regfile23          ),
        .regfile24          (regfile24          ),
        .regfile25          (regfile25          ),
        .regfile26          (regfile26          ),
        .regfile27          (regfile27          ),
        .regfile28          (regfile28          ),
        .regfile29          (regfile29          ),
        .regfile30          (regfile30          ),
        .regfile31          (regfile31          )
    );
    wire [3:0] reg_lock[31:0];
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : reg_lock_assign
            assign reg_lock[i] = _246tb_ex10_tb.uut.sccpu.cpu_ref.reg_lock[i];
        end
    endgenerate


    integer file_output;

    initial
    begin
        file_output = $fopen("_246tb_ex10_result.txt");
		// Initialize Inputs
		clk = 0;
		reset = 1;
		count=0;
        pc_end_count=0;


		// Wait 100 ns for global reset to finish
		#10;
        reset = 0;
		// Add stimulus here

		//#100;
		//$fclose(file_output);
	end
	always begin
        #5;
        if(instr==32'hffffffff)begin
            pc_end_count=pc_end_count+1;
        end
        if(pc_end_count==20) begin
            $fdisplay(file_output, "regfile0: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[0]);
            $fdisplay(file_output, "regfile1: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[1]);
            $fdisplay(file_output, "regfile2: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[2]);
            $fdisplay(file_output, "regfile3: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[3]);
            $fdisplay(file_output, "regfile4: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[4]);
            $fdisplay(file_output, "regfile5: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[5]);
            $fdisplay(file_output, "regfile6: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[6]);
            $fdisplay(file_output, "regfile7: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[7]);
            $fdisplay(file_output, "regfile8: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[8]);
            $fdisplay(file_output, "regfile9: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[9]);
            $fdisplay(file_output, "regfile10: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[10]);
            $fdisplay(file_output, "regfile11: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[11]);
            $fdisplay(file_output, "regfile12: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[12]);
            $fdisplay(file_output, "regfile13: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[13]);
            $fdisplay(file_output, "regfile14: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[14]);
            $fdisplay(file_output, "regfile15: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[15]);
            $fdisplay(file_output, "regfile16: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[16]);
            $fdisplay(file_output, "regfile17: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[17]);
            $fdisplay(file_output, "regfile18: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[18]);
            $fdisplay(file_output, "regfile19: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[19]);
            $fdisplay(file_output, "regfile20: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[20]);
            $fdisplay(file_output, "regfile21: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[21]);
            $fdisplay(file_output, "regfile22: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[22]);
            $fdisplay(file_output, "regfile23: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[23]);
            $fdisplay(file_output, "regfile24: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[24]);
            $fdisplay(file_output, "regfile25: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[25]);
            $fdisplay(file_output, "regfile26: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[26]);
            $fdisplay(file_output, "regfile27: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[27]);
            $fdisplay(file_output, "regfile28: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[28]);
            $fdisplay(file_output, "regfile29: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[29]);
            $fdisplay(file_output, "regfile30: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[30]);
            $fdisplay(file_output, "regfile31: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[31]);
            $stop;
        end
        count=count+clk;

        clk= ~clk;
        // if(clk== 1'b1&&count!=0) begin
        //     $fdisplay(file_output, "pc: %h", PC);
        //     $fdisplay(file_output, "instr: %h", instr);
        //     $fdisplay(file_output, "regfile0: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[0]);
        //     $fdisplay(file_output, "regfile1: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[1]);
        //     $fdisplay(file_output, "regfile2: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[2]);
        //     $fdisplay(file_output, "regfile3: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[3]);
        //     $fdisplay(file_output, "regfile4: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[4]);
        //     $fdisplay(file_output, "regfile5: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[5]);
        //     $fdisplay(file_output, "regfile6: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[6]);
        //     $fdisplay(file_output, "regfile7: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[7]);
        //     $fdisplay(file_output, "regfile8: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[8]);
        //     $fdisplay(file_output, "regfile9: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[9]);
        //     $fdisplay(file_output, "regfile10: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[10]);
        //     $fdisplay(file_output, "regfile11: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[11]);
        //     $fdisplay(file_output, "regfile12: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[12]);
        //     $fdisplay(file_output, "regfile13: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[13]);
        //     $fdisplay(file_output, "regfile14: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[14]);
        //     $fdisplay(file_output, "regfile15: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[15]);
        //     $fdisplay(file_output, "regfile16: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[16]);
        //     $fdisplay(file_output, "regfile17: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[17]);
        //     $fdisplay(file_output, "regfile18: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[18]);
        //     $fdisplay(file_output, "regfile19: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[19]);
        //     $fdisplay(file_output, "regfile20: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[20]);
        //     $fdisplay(file_output, "regfile21: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[21]);
        //     $fdisplay(file_output, "regfile22: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[22]);
        //     $fdisplay(file_output, "regfile23: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[23]);
        //     $fdisplay(file_output, "regfile24: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[24]);
        //     $fdisplay(file_output, "regfile25: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[25]);
        //     $fdisplay(file_output, "regfile26: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[26]);
        //     $fdisplay(file_output, "regfile27: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[27]);
        //     $fdisplay(file_output, "regfile28: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[28]);
        //     $fdisplay(file_output, "regfile29: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[29]);
        //     $fdisplay(file_output, "regfile30: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[30]);
        //     $fdisplay(file_output, "regfile31: %h", _246tb_ex10_tb.uut.sccpu.cpu_ref.array_reg[31]);

        // end
	end

endmodule
