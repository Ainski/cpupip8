// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Mon Dec 22 01:40:26 2025
// Host        : Nicolas-ainski running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim E:/Homeworks/cpupip8/cpupip8.srcs/sources_1/ip/imem/imem_sim_netlist.v
// Design      : imem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "imem,dist_mem_gen_v8_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_10,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module imem
   (a,
    spo);
  input [10:0]a;
  output [31:0]spo;

  wire [10:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_addr_width = "11" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "2048" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "imem.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  imem_dist_mem_gen_v8_0_10 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* C_ADDR_WIDTH = "11" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "2048" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "artix7" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "imem.mif" *) (* C_MEM_TYPE = "0" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "32" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0_10" *) 
module imem_dist_mem_gen_v8_0_10
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [10:0]a;
  input [31:0]d;
  input [10:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [31:0]spo;
  output [31:0]dpo;
  output [31:0]qspo;
  output [31:0]qdpo;

  wire \<const0> ;
  wire [10:0]a;
  wire [31:0]\^spo ;

  assign dpo[31] = \<const0> ;
  assign dpo[30] = \<const0> ;
  assign dpo[29] = \<const0> ;
  assign dpo[28] = \<const0> ;
  assign dpo[27] = \<const0> ;
  assign dpo[26] = \<const0> ;
  assign dpo[25] = \<const0> ;
  assign dpo[24] = \<const0> ;
  assign dpo[23] = \<const0> ;
  assign dpo[22] = \<const0> ;
  assign dpo[21] = \<const0> ;
  assign dpo[20] = \<const0> ;
  assign dpo[19] = \<const0> ;
  assign dpo[18] = \<const0> ;
  assign dpo[17] = \<const0> ;
  assign dpo[16] = \<const0> ;
  assign dpo[15] = \<const0> ;
  assign dpo[14] = \<const0> ;
  assign dpo[13] = \<const0> ;
  assign dpo[12] = \<const0> ;
  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[31] = \<const0> ;
  assign qdpo[30] = \<const0> ;
  assign qdpo[29] = \<const0> ;
  assign qdpo[28] = \<const0> ;
  assign qdpo[27] = \<const0> ;
  assign qdpo[26] = \<const0> ;
  assign qdpo[25] = \<const0> ;
  assign qdpo[24] = \<const0> ;
  assign qdpo[23] = \<const0> ;
  assign qdpo[22] = \<const0> ;
  assign qdpo[21] = \<const0> ;
  assign qdpo[20] = \<const0> ;
  assign qdpo[19] = \<const0> ;
  assign qdpo[18] = \<const0> ;
  assign qdpo[17] = \<const0> ;
  assign qdpo[16] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[31] = \<const0> ;
  assign qspo[30] = \<const0> ;
  assign qspo[29] = \<const0> ;
  assign qspo[28] = \<const0> ;
  assign qspo[27] = \<const0> ;
  assign qspo[26] = \<const0> ;
  assign qspo[25] = \<const0> ;
  assign qspo[24] = \<const0> ;
  assign qspo[23] = \<const0> ;
  assign qspo[22] = \<const0> ;
  assign qspo[21] = \<const0> ;
  assign qspo[20] = \<const0> ;
  assign qspo[19] = \<const0> ;
  assign qspo[18] = \<const0> ;
  assign qspo[17] = \<const0> ;
  assign qspo[16] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  assign spo[31:28] = \^spo [31:28];
  assign spo[27] = \^spo [31];
  assign spo[26:9] = \^spo [26:9];
  assign spo[8] = \^spo [9];
  assign spo[7] = \^spo [9];
  assign spo[6] = \^spo [9];
  assign spo[5:0] = \^spo [5:0];
  GND GND
       (.G(\<const0> ));
  imem_dist_mem_gen_v8_0_10_synth \synth_options.dist_mem_inst 
       (.a(a),
        .spo({\^spo [31:28],\^spo [26:9],\^spo [5:0]}));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_10_synth" *) 
module imem_dist_mem_gen_v8_0_10_synth
   (spo,
    a);
  output [27:0]spo;
  input [10:0]a;

  wire [10:0]a;
  wire [27:0]spo;

  imem_rom \gen_rom.rom_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "rom" *) 
module imem_rom
   (spo,
    a);
  output [27:0]spo;
  input [10:0]a;

  wire [10:0]a;
  wire [27:0]spo;
  wire \spo[0]_INST_0_i_1_n_0 ;
  wire \spo[0]_INST_0_i_2_n_0 ;
  wire \spo[0]_INST_0_i_3_n_0 ;
  wire \spo[0]_INST_0_i_4_n_0 ;
  wire \spo[0]_INST_0_i_5_n_0 ;
  wire \spo[0]_INST_0_i_6_n_0 ;
  wire \spo[10]_INST_0_i_1_n_0 ;
  wire \spo[10]_INST_0_i_2_n_0 ;
  wire \spo[10]_INST_0_i_3_n_0 ;
  wire \spo[11]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_2_n_0 ;
  wire \spo[11]_INST_0_i_3_n_0 ;
  wire \spo[11]_INST_0_i_4_n_0 ;
  wire \spo[11]_INST_0_i_5_n_0 ;
  wire \spo[11]_INST_0_i_6_n_0 ;
  wire \spo[12]_INST_0_i_1_n_0 ;
  wire \spo[12]_INST_0_i_2_n_0 ;
  wire \spo[12]_INST_0_i_3_n_0 ;
  wire \spo[12]_INST_0_i_4_n_0 ;
  wire \spo[12]_INST_0_i_5_n_0 ;
  wire \spo[12]_INST_0_i_6_n_0 ;
  wire \spo[13]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_2_n_0 ;
  wire \spo[13]_INST_0_i_3_n_0 ;
  wire \spo[13]_INST_0_i_4_n_0 ;
  wire \spo[14]_INST_0_i_1_n_0 ;
  wire \spo[14]_INST_0_i_2_n_0 ;
  wire \spo[14]_INST_0_i_3_n_0 ;
  wire \spo[14]_INST_0_i_4_n_0 ;
  wire \spo[15]_INST_0_i_1_n_0 ;
  wire \spo[15]_INST_0_i_2_n_0 ;
  wire \spo[16]_INST_0_i_1_n_0 ;
  wire \spo[16]_INST_0_i_2_n_0 ;
  wire \spo[16]_INST_0_i_3_n_0 ;
  wire \spo[16]_INST_0_i_4_n_0 ;
  wire \spo[16]_INST_0_i_5_n_0 ;
  wire \spo[16]_INST_0_i_6_n_0 ;
  wire \spo[17]_INST_0_i_1_n_0 ;
  wire \spo[17]_INST_0_i_2_n_0 ;
  wire \spo[17]_INST_0_i_3_n_0 ;
  wire \spo[18]_INST_0_i_1_n_0 ;
  wire \spo[18]_INST_0_i_2_n_0 ;
  wire \spo[18]_INST_0_i_3_n_0 ;
  wire \spo[18]_INST_0_i_4_n_0 ;
  wire \spo[18]_INST_0_i_5_n_0 ;
  wire \spo[18]_INST_0_i_6_n_0 ;
  wire \spo[19]_INST_0_i_1_n_0 ;
  wire \spo[19]_INST_0_i_2_n_0 ;
  wire \spo[19]_INST_0_i_3_n_0 ;
  wire \spo[19]_INST_0_i_4_n_0 ;
  wire \spo[19]_INST_0_i_5_n_0 ;
  wire \spo[19]_INST_0_i_6_n_0 ;
  wire \spo[1]_INST_0_i_1_n_0 ;
  wire \spo[1]_INST_0_i_2_n_0 ;
  wire \spo[1]_INST_0_i_3_n_0 ;
  wire \spo[1]_INST_0_i_4_n_0 ;
  wire \spo[1]_INST_0_i_5_n_0 ;
  wire \spo[1]_INST_0_i_6_n_0 ;
  wire \spo[20]_INST_0_i_1_n_0 ;
  wire \spo[20]_INST_0_i_2_n_0 ;
  wire \spo[21]_INST_0_i_1_n_0 ;
  wire \spo[21]_INST_0_i_2_n_0 ;
  wire \spo[21]_INST_0_i_3_n_0 ;
  wire \spo[21]_INST_0_i_4_n_0 ;
  wire \spo[21]_INST_0_i_5_n_0 ;
  wire \spo[21]_INST_0_i_6_n_0 ;
  wire \spo[22]_INST_0_i_1_n_0 ;
  wire \spo[22]_INST_0_i_2_n_0 ;
  wire \spo[22]_INST_0_i_3_n_0 ;
  wire \spo[22]_INST_0_i_4_n_0 ;
  wire \spo[22]_INST_0_i_5_n_0 ;
  wire \spo[22]_INST_0_i_6_n_0 ;
  wire \spo[23]_INST_0_i_1_n_0 ;
  wire \spo[23]_INST_0_i_2_n_0 ;
  wire \spo[23]_INST_0_i_3_n_0 ;
  wire \spo[23]_INST_0_i_4_n_0 ;
  wire \spo[23]_INST_0_i_5_n_0 ;
  wire \spo[23]_INST_0_i_6_n_0 ;
  wire \spo[24]_INST_0_i_1_n_0 ;
  wire \spo[24]_INST_0_i_2_n_0 ;
  wire \spo[24]_INST_0_i_3_n_0 ;
  wire \spo[24]_INST_0_i_4_n_0 ;
  wire \spo[24]_INST_0_i_5_n_0 ;
  wire \spo[24]_INST_0_i_6_n_0 ;
  wire \spo[26]_INST_0_i_1_n_0 ;
  wire \spo[26]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_1_n_0 ;
  wire \spo[27]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_3_n_0 ;
  wire \spo[27]_INST_0_i_4_n_0 ;
  wire \spo[28]_INST_0_i_1_n_0 ;
  wire \spo[28]_INST_0_i_2_n_0 ;
  wire \spo[28]_INST_0_i_3_n_0 ;
  wire \spo[29]_INST_0_i_1_n_0 ;
  wire \spo[29]_INST_0_i_2_n_0 ;
  wire \spo[29]_INST_0_i_3_n_0 ;
  wire \spo[29]_INST_0_i_4_n_0 ;
  wire \spo[29]_INST_0_i_5_n_0 ;
  wire \spo[29]_INST_0_i_6_n_0 ;
  wire \spo[29]_INST_0_i_7_n_0 ;
  wire \spo[2]_INST_0_i_1_n_0 ;
  wire \spo[2]_INST_0_i_2_n_0 ;
  wire \spo[2]_INST_0_i_3_n_0 ;
  wire \spo[30]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_2_n_0 ;
  wire \spo[3]_INST_0_i_3_n_0 ;
  wire \spo[4]_INST_0_i_1_n_0 ;
  wire \spo[4]_INST_0_i_2_n_0 ;
  wire \spo[5]_INST_0_i_1_n_0 ;
  wire \spo[5]_INST_0_i_2_n_0 ;
  wire \spo[6]_INST_0_i_1_n_0 ;

  MUXF8 \spo[0]_INST_0 
       (.I0(\spo[0]_INST_0_i_1_n_0 ),
        .I1(\spo[0]_INST_0_i_2_n_0 ),
        .O(spo[0]),
        .S(a[5]));
  MUXF7 \spo[0]_INST_0_i_1 
       (.I0(\spo[0]_INST_0_i_3_n_0 ),
        .I1(\spo[0]_INST_0_i_4_n_0 ),
        .O(\spo[0]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[0]_INST_0_i_2 
       (.I0(\spo[0]_INST_0_i_5_n_0 ),
        .I1(\spo[0]_INST_0_i_6_n_0 ),
        .O(\spo[0]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h00800000FA210000)) 
    \spo[0]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3020104000000000)) 
    \spo[0]_INST_0_i_4 
       (.I0(a[0]),
        .I1(a[6]),
        .I2(\spo[29]_INST_0_i_7_n_0 ),
        .I3(a[4]),
        .I4(a[1]),
        .I5(a[3]),
        .O(\spo[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8F3B8C0BBC088C0)) 
    \spo[0]_INST_0_i_5 
       (.I0(\spo[29]_INST_0_i_6_n_0 ),
        .I1(a[3]),
        .I2(\spo[27]_INST_0_i_4_n_0 ),
        .I3(a[1]),
        .I4(\spo[29]_INST_0_i_5_n_0 ),
        .I5(a[0]),
        .O(\spo[0]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h2F202020)) 
    \spo[0]_INST_0_i_6 
       (.I0(\spo[29]_INST_0_i_6_n_0 ),
        .I1(a[0]),
        .I2(a[3]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .O(\spo[0]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3000300030BB3088)) 
    \spo[10]_INST_0 
       (.I0(\spo[10]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[10]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[10]_INST_0_i_3_n_0 ),
        .I5(a[3]),
        .O(spo[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \spo[10]_INST_0_i_1 
       (.I0(a[0]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .O(\spo[10]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \spo[10]_INST_0_i_2 
       (.I0(a[1]),
        .I1(\spo[28]_INST_0_i_3_n_0 ),
        .I2(a[0]),
        .I3(a[3]),
        .O(\spo[10]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \spo[10]_INST_0_i_3 
       (.I0(a[0]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[1]),
        .O(\spo[10]_INST_0_i_3_n_0 ));
  MUXF8 \spo[11]_INST_0 
       (.I0(\spo[11]_INST_0_i_1_n_0 ),
        .I1(\spo[11]_INST_0_i_2_n_0 ),
        .O(spo[8]),
        .S(a[5]));
  MUXF7 \spo[11]_INST_0_i_1 
       (.I0(\spo[11]_INST_0_i_3_n_0 ),
        .I1(\spo[11]_INST_0_i_4_n_0 ),
        .O(\spo[11]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[11]_INST_0_i_2 
       (.I0(\spo[11]_INST_0_i_5_n_0 ),
        .I1(\spo[11]_INST_0_i_6_n_0 ),
        .O(\spo[11]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h0000200000903080)) 
    \spo[11]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[6]),
        .I2(\spo[29]_INST_0_i_7_n_0 ),
        .I3(a[4]),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[11]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100800002002000)) 
    \spo[11]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(a[4]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[6]),
        .I5(a[1]),
        .O(\spo[11]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h30000B08)) 
    \spo[11]_INST_0_i_5 
       (.I0(\spo[29]_INST_0_i_6_n_0 ),
        .I1(a[3]),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .O(\spo[11]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hF808C000)) 
    \spo[11]_INST_0_i_6 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(a[3]),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[1]),
        .O(\spo[11]_INST_0_i_6_n_0 ));
  MUXF8 \spo[12]_INST_0 
       (.I0(\spo[12]_INST_0_i_1_n_0 ),
        .I1(\spo[12]_INST_0_i_2_n_0 ),
        .O(spo[9]),
        .S(a[5]));
  MUXF7 \spo[12]_INST_0_i_1 
       (.I0(\spo[12]_INST_0_i_3_n_0 ),
        .I1(\spo[12]_INST_0_i_4_n_0 ),
        .O(\spo[12]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[12]_INST_0_i_2 
       (.I0(\spo[12]_INST_0_i_5_n_0 ),
        .I1(\spo[12]_INST_0_i_6_n_0 ),
        .O(\spo[12]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \spo[12]_INST_0_i_3 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[3]),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .O(\spo[12]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h033B0008)) 
    \spo[12]_INST_0_i_4 
       (.I0(\spo[28]_INST_0_i_3_n_0 ),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(\spo[30]_INST_0_i_1_n_0 ),
        .O(\spo[12]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00004D48)) 
    \spo[12]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[0]),
        .O(\spo[12]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF0A000A0CF00C000)) 
    \spo[12]_INST_0_i_6 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[29]_INST_0_i_6_n_0 ),
        .I5(a[1]),
        .O(\spo[12]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[13]_INST_0 
       (.I0(\spo[13]_INST_0_i_1_n_0 ),
        .I1(\spo[13]_INST_0_i_2_n_0 ),
        .I2(a[5]),
        .I3(\spo[13]_INST_0_i_3_n_0 ),
        .I4(a[2]),
        .I5(\spo[13]_INST_0_i_4_n_0 ),
        .O(spo[10]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBC800000)) 
    \spo[13]_INST_0_i_1 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(a[3]),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[1]),
        .O(\spo[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4400440050F550A0)) 
    \spo[13]_INST_0_i_2 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(\spo[29]_INST_0_i_6_n_0 ),
        .I3(a[1]),
        .I4(\spo[29]_INST_0_i_5_n_0 ),
        .I5(a[0]),
        .O(\spo[13]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0900400002002000)) 
    \spo[13]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[6]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[4]),
        .I5(a[0]),
        .O(\spo[13]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h001F000062000000)) 
    \spo[13]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[13]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[14]_INST_0 
       (.I0(\spo[14]_INST_0_i_1_n_0 ),
        .I1(\spo[14]_INST_0_i_2_n_0 ),
        .I2(a[5]),
        .I3(\spo[14]_INST_0_i_3_n_0 ),
        .I4(a[2]),
        .I5(\spo[14]_INST_0_i_4_n_0 ),
        .O(spo[11]));
  LUT6 #(
    .INIT(64'hB8FFB800C000C000)) 
    \spo[14]_INST_0_i_1 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[1]),
        .I2(\spo[29]_INST_0_i_5_n_0 ),
        .I3(a[3]),
        .I4(\spo[29]_INST_0_i_6_n_0 ),
        .I5(a[0]),
        .O(\spo[14]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0000D484)) 
    \spo[14]_INST_0_i_2 
       (.I0(a[0]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[3]),
        .O(\spo[14]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0057000092000000)) 
    \spo[14]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[14]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h40408D88)) 
    \spo[14]_INST_0_i_4 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(\spo[28]_INST_0_i_3_n_0 ),
        .I4(a[0]),
        .O(\spo[14]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \spo[15]_INST_0 
       (.I0(a[3]),
        .I1(\spo[15]_INST_0_i_1_n_0 ),
        .I2(a[1]),
        .I3(a[2]),
        .I4(a[5]),
        .I5(\spo[15]_INST_0_i_2_n_0 ),
        .O(spo[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \spo[15]_INST_0_i_1 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[0]),
        .O(\spo[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0033000003B00080)) 
    \spo[15]_INST_0_i_2 
       (.I0(\spo[28]_INST_0_i_3_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(a[1]),
        .I4(\spo[30]_INST_0_i_1_n_0 ),
        .I5(a[0]),
        .O(\spo[15]_INST_0_i_2_n_0 ));
  MUXF8 \spo[16]_INST_0 
       (.I0(\spo[16]_INST_0_i_1_n_0 ),
        .I1(\spo[16]_INST_0_i_2_n_0 ),
        .O(spo[13]),
        .S(a[5]));
  MUXF7 \spo[16]_INST_0_i_1 
       (.I0(\spo[16]_INST_0_i_3_n_0 ),
        .I1(\spo[16]_INST_0_i_4_n_0 ),
        .O(\spo[16]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[16]_INST_0_i_2 
       (.I0(\spo[16]_INST_0_i_5_n_0 ),
        .I1(\spo[16]_INST_0_i_6_n_0 ),
        .O(\spo[16]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h001A00004E1F0000)) 
    \spo[16]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[16]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0300F808)) 
    \spo[16]_INST_0_i_4 
       (.I0(\spo[27]_INST_0_i_3_n_0 ),
        .I1(a[3]),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[0]),
        .O(\spo[16]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0B08BFBF0B088080)) 
    \spo[16]_INST_0_i_5 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[3]),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[0]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[16]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hC000C00033B800B8)) 
    \spo[16]_INST_0_i_6 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(a[3]),
        .I2(\spo[29]_INST_0_i_6_n_0 ),
        .I3(a[0]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[16]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[17]_INST_0 
       (.I0(\spo[17]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[17]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[17]_INST_0_i_3_n_0 ),
        .O(spo[14]));
  LUT6 #(
    .INIT(64'h5808080800000000)) 
    \spo[17]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[0]),
        .I3(a[3]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[2]),
        .O(\spo[17]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0D0000001D370000)) 
    \spo[17]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[6]),
        .I3(a[0]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[4]),
        .O(\spo[17]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00920000C1C20000)) 
    \spo[17]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[17]_INST_0_i_3_n_0 ));
  MUXF8 \spo[18]_INST_0 
       (.I0(\spo[18]_INST_0_i_1_n_0 ),
        .I1(\spo[18]_INST_0_i_2_n_0 ),
        .O(spo[15]),
        .S(a[5]));
  MUXF7 \spo[18]_INST_0_i_1 
       (.I0(\spo[18]_INST_0_i_3_n_0 ),
        .I1(\spo[18]_INST_0_i_4_n_0 ),
        .O(\spo[18]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[18]_INST_0_i_2 
       (.I0(\spo[18]_INST_0_i_5_n_0 ),
        .I1(\spo[18]_INST_0_i_6_n_0 ),
        .O(\spo[18]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h0800EA000000D800)) 
    \spo[18]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[6]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[4]),
        .I5(a[0]),
        .O(\spo[18]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h48484848CFCAC0C0)) 
    \spo[18]_INST_0_i_4 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(a[6]),
        .I4(\spo[27]_INST_0_i_3_n_0 ),
        .I5(a[0]),
        .O(\spo[18]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE540DF85E540DA80)) 
    \spo[18]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[0]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[18]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEF400000)) 
    \spo[18]_INST_0_i_6 
       (.I0(a[1]),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(a[3]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[0]),
        .O(\spo[18]_INST_0_i_6_n_0 ));
  MUXF8 \spo[19]_INST_0 
       (.I0(\spo[19]_INST_0_i_1_n_0 ),
        .I1(\spo[19]_INST_0_i_2_n_0 ),
        .O(spo[16]),
        .S(a[5]));
  MUXF7 \spo[19]_INST_0_i_1 
       (.I0(\spo[19]_INST_0_i_3_n_0 ),
        .I1(\spo[19]_INST_0_i_4_n_0 ),
        .O(\spo[19]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[19]_INST_0_i_2 
       (.I0(\spo[19]_INST_0_i_5_n_0 ),
        .I1(\spo[19]_INST_0_i_6_n_0 ),
        .O(\spo[19]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h00B70000DE400000)) 
    \spo[19]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00520000F4BD0000)) 
    \spo[19]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4F4ADFDF45408080)) 
    \spo[19]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[19]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hF4FBB040)) 
    \spo[19]_INST_0_i_6 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(\spo[29]_INST_0_i_5_n_0 ),
        .I3(a[0]),
        .I4(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[19]_INST_0_i_6_n_0 ));
  MUXF8 \spo[1]_INST_0 
       (.I0(\spo[1]_INST_0_i_1_n_0 ),
        .I1(\spo[1]_INST_0_i_2_n_0 ),
        .O(spo[1]),
        .S(a[5]));
  MUXF7 \spo[1]_INST_0_i_1 
       (.I0(\spo[1]_INST_0_i_3_n_0 ),
        .I1(\spo[1]_INST_0_i_4_n_0 ),
        .O(\spo[1]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[1]_INST_0_i_2 
       (.I0(\spo[1]_INST_0_i_5_n_0 ),
        .I1(\spo[1]_INST_0_i_6_n_0 ),
        .O(\spo[1]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT5 #(
    .INIT(32'h5C0C8888)) 
    \spo[1]_INST_0_i_3 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .O(\spo[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000800002002400)) 
    \spo[1]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(a[4]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[6]),
        .I5(a[1]),
        .O(\spo[1]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h44A044A050555000)) 
    \spo[1]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(\spo[29]_INST_0_i_6_n_0 ),
        .I3(a[1]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[1]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h4040D580)) 
    \spo[1]_INST_0_i_6 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .O(\spo[1]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h000000002222E222)) 
    \spo[20]_INST_0 
       (.I0(\spo[20]_INST_0_i_1_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(\spo[20]_INST_0_i_2_n_0 ),
        .I4(a[1]),
        .I5(a[5]),
        .O(spo[17]));
  LUT6 #(
    .INIT(64'h0100C0000E008000)) 
    \spo[20]_INST_0_i_1 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[6]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[4]),
        .I5(a[0]),
        .O(\spo[20]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \spo[20]_INST_0_i_2 
       (.I0(\spo[30]_INST_0_i_1_n_0 ),
        .I1(a[0]),
        .O(\spo[20]_INST_0_i_2_n_0 ));
  MUXF8 \spo[21]_INST_0 
       (.I0(\spo[21]_INST_0_i_1_n_0 ),
        .I1(\spo[21]_INST_0_i_2_n_0 ),
        .O(spo[18]),
        .S(a[5]));
  MUXF7 \spo[21]_INST_0_i_1 
       (.I0(\spo[21]_INST_0_i_3_n_0 ),
        .I1(\spo[21]_INST_0_i_4_n_0 ),
        .O(\spo[21]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[21]_INST_0_i_2 
       (.I0(\spo[21]_INST_0_i_5_n_0 ),
        .I1(\spo[21]_INST_0_i_6_n_0 ),
        .O(\spo[21]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h0040209020802020)) 
    \spo[21]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[6]),
        .I2(\spo[29]_INST_0_i_7_n_0 ),
        .I3(a[4]),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[21]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00300000BCB38080)) 
    \spo[21]_INST_0_i_4 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[6]),
        .I4(\spo[27]_INST_0_i_3_n_0 ),
        .I5(a[0]),
        .O(\spo[21]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC033C000F088F088)) 
    \spo[21]_INST_0_i_5 
       (.I0(\spo[29]_INST_0_i_6_n_0 ),
        .I1(a[3]),
        .I2(\spo[27]_INST_0_i_4_n_0 ),
        .I3(a[1]),
        .I4(\spo[29]_INST_0_i_5_n_0 ),
        .I5(a[0]),
        .O(\spo[21]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hC0C0AF00)) 
    \spo[21]_INST_0_i_6 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .O(\spo[21]_INST_0_i_6_n_0 ));
  MUXF8 \spo[22]_INST_0 
       (.I0(\spo[22]_INST_0_i_1_n_0 ),
        .I1(\spo[22]_INST_0_i_2_n_0 ),
        .O(spo[19]),
        .S(a[5]));
  MUXF7 \spo[22]_INST_0_i_1 
       (.I0(\spo[22]_INST_0_i_3_n_0 ),
        .I1(\spo[22]_INST_0_i_4_n_0 ),
        .O(\spo[22]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[22]_INST_0_i_2 
       (.I0(\spo[22]_INST_0_i_5_n_0 ),
        .I1(\spo[22]_INST_0_i_6_n_0 ),
        .O(\spo[22]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT5 #(
    .INIT(32'hCDC80A00)) 
    \spo[22]_INST_0_i_3 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(\spo[30]_INST_0_i_1_n_0 ),
        .I4(a[0]),
        .O(\spo[22]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0017000030000000)) 
    \spo[22]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[22]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h45405F5F45400000)) 
    \spo[22]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(a[0]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[1]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[22]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEF208080)) 
    \spo[22]_INST_0_i_6 
       (.I0(\spo[27]_INST_0_i_4_n_0 ),
        .I1(a[0]),
        .I2(a[3]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[1]),
        .O(\spo[22]_INST_0_i_6_n_0 ));
  MUXF8 \spo[23]_INST_0 
       (.I0(\spo[23]_INST_0_i_1_n_0 ),
        .I1(\spo[23]_INST_0_i_2_n_0 ),
        .O(spo[20]),
        .S(a[5]));
  MUXF7 \spo[23]_INST_0_i_1 
       (.I0(\spo[23]_INST_0_i_3_n_0 ),
        .I1(\spo[23]_INST_0_i_4_n_0 ),
        .O(\spo[23]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[23]_INST_0_i_2 
       (.I0(\spo[23]_INST_0_i_5_n_0 ),
        .I1(\spo[23]_INST_0_i_6_n_0 ),
        .O(\spo[23]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h0C0040000C003000)) 
    \spo[23]_INST_0_i_3 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[4]),
        .I5(a[0]),
        .O(\spo[23]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0000700B000)) 
    \spo[23]_INST_0_i_4 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[4]),
        .I3(\spo[29]_INST_0_i_7_n_0 ),
        .I4(a[6]),
        .I5(a[0]),
        .O(\spo[23]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF3F03B3B03000808)) 
    \spo[23]_INST_0_i_5 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(a[3]),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[23]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0A0C0F00F0000)) 
    \spo[23]_INST_0_i_6 
       (.I0(\spo[29]_INST_0_i_6_n_0 ),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[23]_INST_0_i_6_n_0 ));
  MUXF8 \spo[24]_INST_0 
       (.I0(\spo[24]_INST_0_i_1_n_0 ),
        .I1(\spo[24]_INST_0_i_2_n_0 ),
        .O(spo[21]),
        .S(a[5]));
  MUXF7 \spo[24]_INST_0_i_1 
       (.I0(\spo[24]_INST_0_i_3_n_0 ),
        .I1(\spo[24]_INST_0_i_4_n_0 ),
        .O(\spo[24]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[24]_INST_0_i_2 
       (.I0(\spo[24]_INST_0_i_5_n_0 ),
        .I1(\spo[24]_INST_0_i_6_n_0 ),
        .O(\spo[24]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h00070000EA000000)) 
    \spo[24]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[24]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00520000B5000000)) 
    \spo[24]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[24]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h5C0C0000)) 
    \spo[24]_INST_0_i_5 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .O(\spo[24]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hEE004400F055F000)) 
    \spo[24]_INST_0_i_6 
       (.I0(a[3]),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(\spo[29]_INST_0_i_6_n_0 ),
        .I3(a[1]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[24]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004004008)) 
    \spo[25]_INST_0 
       (.I0(a[1]),
        .I1(\spo[30]_INST_0_i_1_n_0 ),
        .I2(a[0]),
        .I3(a[3]),
        .I4(a[2]),
        .I5(a[5]),
        .O(spo[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[26]_INST_0 
       (.I0(\spo[29]_INST_0_i_1_n_0 ),
        .I1(\spo[29]_INST_0_i_2_n_0 ),
        .I2(a[5]),
        .I3(\spo[26]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(\spo[26]_INST_0_i_2_n_0 ),
        .O(spo[23]));
  LUT6 #(
    .INIT(64'h70C47080F8F77080)) 
    \spo[26]_INST_0_i_1 
       (.I0(a[0]),
        .I1(a[3]),
        .I2(\spo[29]_INST_0_i_5_n_0 ),
        .I3(a[1]),
        .I4(\spo[27]_INST_0_i_3_n_0 ),
        .I5(a[6]),
        .O(\spo[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00C80000B4EF0000)) 
    \spo[26]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[26]_INST_0_i_2_n_0 ));
  MUXF7 \spo[27]_INST_0 
       (.I0(\spo[27]_INST_0_i_1_n_0 ),
        .I1(\spo[27]_INST_0_i_2_n_0 ),
        .O(spo[27]),
        .S(a[5]));
  LUT6 #(
    .INIT(64'h1400220008000600)) 
    \spo[27]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(\spo[27]_INST_0_i_3_n_0 ),
        .I4(a[6]),
        .I5(a[1]),
        .O(\spo[27]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h34000000)) 
    \spo[27]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[2]),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[3]),
        .O(\spo[27]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \spo[27]_INST_0_i_3 
       (.I0(a[10]),
        .I1(a[8]),
        .I2(a[9]),
        .I3(a[7]),
        .I4(a[4]),
        .O(\spo[27]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \spo[27]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[27]_INST_0_i_4_n_0 ));
  MUXF7 \spo[28]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(\spo[28]_INST_0_i_2_n_0 ),
        .O(spo[24]),
        .S(a[5]));
  LUT6 #(
    .INIT(64'h0300080800000C00)) 
    \spo[28]_INST_0_i_1 
       (.I0(\spo[28]_INST_0_i_3_n_0 ),
        .I1(a[2]),
        .I2(a[1]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[3]),
        .O(\spo[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1040104022330000)) 
    \spo[28]_INST_0_i_2 
       (.I0(a[2]),
        .I1(a[3]),
        .I2(\spo[29]_INST_0_i_6_n_0 ),
        .I3(a[1]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[28]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000002)) 
    \spo[28]_INST_0_i_3 
       (.I0(a[6]),
        .I1(a[10]),
        .I2(a[8]),
        .I3(a[9]),
        .I4(a[7]),
        .I5(a[4]),
        .O(\spo[28]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[29]_INST_0 
       (.I0(\spo[29]_INST_0_i_1_n_0 ),
        .I1(\spo[29]_INST_0_i_2_n_0 ),
        .I2(a[5]),
        .I3(\spo[29]_INST_0_i_3_n_0 ),
        .I4(a[2]),
        .I5(\spo[29]_INST_0_i_4_n_0 ),
        .O(spo[25]));
  LUT6 #(
    .INIT(64'h0F002F2F0F002020)) 
    \spo[29]_INST_0_i_1 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(a[1]),
        .I2(a[3]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[29]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hAD08E848)) 
    \spo[29]_INST_0_i_2 
       (.I0(a[3]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[1]),
        .I3(\spo[29]_INST_0_i_5_n_0 ),
        .I4(a[0]),
        .O(\spo[29]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0002000078BF0000)) 
    \spo[29]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[29]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00C8000094ED0000)) 
    \spo[29]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[6]),
        .O(\spo[29]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \spo[29]_INST_0_i_5 
       (.I0(a[10]),
        .I1(a[8]),
        .I2(a[9]),
        .I3(a[7]),
        .I4(a[6]),
        .O(\spo[29]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \spo[29]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[29]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \spo[29]_INST_0_i_7 
       (.I0(a[7]),
        .I1(a[9]),
        .I2(a[8]),
        .I3(a[10]),
        .O(\spo[29]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[2]_INST_0 
       (.I0(\spo[2]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[2]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[2]_INST_0_i_3_n_0 ),
        .O(spo[2]));
  LUT6 #(
    .INIT(64'h00000000E0804080)) 
    \spo[2]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .I2(a[0]),
        .I3(a[3]),
        .I4(\spo[27]_INST_0_i_4_n_0 ),
        .I5(a[2]),
        .O(\spo[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0010315100102040)) 
    \spo[2]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(\spo[27]_INST_0_i_3_n_0 ),
        .I3(a[6]),
        .I4(a[0]),
        .I5(\spo[27]_INST_0_i_4_n_0 ),
        .O(\spo[2]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h40000020)) 
    \spo[2]_INST_0_i_3 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(\spo[27]_INST_0_i_3_n_0 ),
        .I3(a[6]),
        .I4(a[1]),
        .O(\spo[2]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \spo[30]_INST_0 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(\spo[30]_INST_0_i_1_n_0 ),
        .I3(a[0]),
        .I4(a[3]),
        .I5(a[5]),
        .O(spo[26]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \spo[30]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[30]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[3]_INST_0 
       (.I0(\spo[3]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[3]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[3]_INST_0_i_3_n_0 ),
        .O(spo[3]));
  LUT6 #(
    .INIT(64'h0000000088888A80)) 
    \spo[3]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[0]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[3]),
        .I5(a[2]),
        .O(\spo[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000B08)) 
    \spo[3]_INST_0_i_2 
       (.I0(\spo[28]_INST_0_i_3_n_0 ),
        .I1(a[3]),
        .I2(a[0]),
        .I3(\spo[27]_INST_0_i_4_n_0 ),
        .I4(a[1]),
        .O(\spo[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0FA000A000C000C0)) 
    \spo[3]_INST_0_i_3 
       (.I0(\spo[30]_INST_0_i_1_n_0 ),
        .I1(\spo[27]_INST_0_i_4_n_0 ),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[29]_INST_0_i_5_n_0 ),
        .I5(a[1]),
        .O(\spo[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE5405555E5400000)) 
    \spo[4]_INST_0 
       (.I0(a[5]),
        .I1(\spo[4]_INST_0_i_1_n_0 ),
        .I2(a[3]),
        .I3(\spo[10]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(\spo[4]_INST_0_i_2_n_0 ),
        .O(spo[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \spo[4]_INST_0_i_1 
       (.I0(a[0]),
        .I1(\spo[28]_INST_0_i_3_n_0 ),
        .I2(a[1]),
        .O(\spo[4]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6000)) 
    \spo[4]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[0]),
        .I2(\spo[30]_INST_0_i_1_n_0 ),
        .I3(a[1]),
        .O(\spo[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[5]_INST_0 
       (.I0(\spo[5]_INST_0_i_1_n_0 ),
        .I1(\spo[13]_INST_0_i_2_n_0 ),
        .I2(a[5]),
        .I3(\spo[14]_INST_0_i_3_n_0 ),
        .I4(a[2]),
        .I5(\spo[5]_INST_0_i_2_n_0 ),
        .O(spo[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hCFC08080)) 
    \spo[5]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[29]_INST_0_i_5_n_0 ),
        .I2(a[3]),
        .I3(\spo[29]_INST_0_i_6_n_0 ),
        .I4(a[0]),
        .O(\spo[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h004B000037000000)) 
    \spo[5]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[6]),
        .I4(\spo[29]_INST_0_i_7_n_0 ),
        .I5(a[4]),
        .O(\spo[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000300000000808)) 
    \spo[6]_INST_0 
       (.I0(\spo[15]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(a[3]),
        .I3(\spo[6]_INST_0_i_1_n_0 ),
        .I4(a[1]),
        .I5(a[2]),
        .O(spo[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \spo[6]_INST_0_i_1 
       (.I0(\spo[28]_INST_0_i_3_n_0 ),
        .I1(a[0]),
        .O(\spo[6]_INST_0_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
