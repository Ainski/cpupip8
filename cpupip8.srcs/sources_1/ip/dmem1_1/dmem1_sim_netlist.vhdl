-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Sun Nov 23 22:38:00 2025
-- Host        : Nicolas-ainski running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Homeworks/cpupip8/cpupip8.srcs/sources_1/ip/dmem1_1/dmem1_sim_netlist.vhdl
-- Design      : dmem1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dmem1_spram is
  port (
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dmem1_spram : entity is "spram";
end dmem1_spram;

architecture STRUCTURE of dmem1_spram is
  signal qspo_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qspo_int : signal is "true";
  signal ram_reg_0_255_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_255_0_0_n_0 : STD_LOGIC;
  signal ram_reg_0_255_1_1_n_0 : STD_LOGIC;
  signal ram_reg_0_255_2_2_n_0 : STD_LOGIC;
  signal ram_reg_0_255_3_3_n_0 : STD_LOGIC;
  signal ram_reg_0_255_4_4_n_0 : STD_LOGIC;
  signal ram_reg_0_255_5_5_n_0 : STD_LOGIC;
  signal ram_reg_0_255_6_6_n_0 : STD_LOGIC;
  signal ram_reg_0_255_7_7_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_0_0_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_1_1_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_2_2_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_3_3_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_4_4_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_5_5_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_6_6_n_0 : STD_LOGIC;
  signal ram_reg_1024_1279_7_7_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_0_0_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_1_1_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_2_2_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_3_3_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_4_4_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_5_5_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_6_6_n_0 : STD_LOGIC;
  signal ram_reg_1280_1535_7_7_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_0_0_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_1_1_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_2_2_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_3_3_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_4_4_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_5_5_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_6_6_n_0 : STD_LOGIC;
  signal ram_reg_1536_1791_7_7_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_0_0_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_1_1_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_2_2_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_3_3_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_4_4_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_5_5_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_6_6_n_0 : STD_LOGIC;
  signal ram_reg_1792_2047_7_7_n_0 : STD_LOGIC;
  signal ram_reg_256_511_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_256_511_0_0_n_0 : STD_LOGIC;
  signal ram_reg_256_511_1_1_n_0 : STD_LOGIC;
  signal ram_reg_256_511_2_2_n_0 : STD_LOGIC;
  signal ram_reg_256_511_3_3_n_0 : STD_LOGIC;
  signal ram_reg_256_511_4_4_n_0 : STD_LOGIC;
  signal ram_reg_256_511_5_5_n_0 : STD_LOGIC;
  signal ram_reg_256_511_6_6_n_0 : STD_LOGIC;
  signal ram_reg_256_511_7_7_n_0 : STD_LOGIC;
  signal ram_reg_512_767_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_512_767_0_0_n_0 : STD_LOGIC;
  signal ram_reg_512_767_1_1_n_0 : STD_LOGIC;
  signal ram_reg_512_767_2_2_n_0 : STD_LOGIC;
  signal ram_reg_512_767_3_3_n_0 : STD_LOGIC;
  signal ram_reg_512_767_4_4_n_0 : STD_LOGIC;
  signal ram_reg_512_767_5_5_n_0 : STD_LOGIC;
  signal ram_reg_512_767_6_6_n_0 : STD_LOGIC;
  signal ram_reg_512_767_7_7_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_0_0_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_1_1_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_2_2_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_3_3_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_4_4_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_5_5_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_6_6_n_0 : STD_LOGIC;
  signal ram_reg_768_1023_7_7_n_0 : STD_LOGIC;
  signal \^spo\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \spo[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \qspo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qspo_int_reg[0]\ : label is "no";
  attribute KEEP of \qspo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[1]\ : label is "no";
  attribute KEEP of \qspo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[2]\ : label is "no";
  attribute KEEP of \qspo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[3]\ : label is "no";
  attribute KEEP of \qspo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[4]\ : label is "no";
  attribute KEEP of \qspo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[5]\ : label is "no";
  attribute KEEP of \qspo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[6]\ : label is "no";
  attribute KEEP of \qspo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[7]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1024_1279_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1280_1535_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1536_1791_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_1792_2047_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_767_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_1023_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
begin
  spo(7 downto 0) <= \^spo\(7 downto 0);
\qspo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(0),
      Q => qspo_int(0),
      R => '0'
    );
\qspo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(1),
      Q => qspo_int(1),
      R => '0'
    );
\qspo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(2),
      Q => qspo_int(2),
      R => '0'
    );
\qspo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(3),
      Q => qspo_int(3),
      R => '0'
    );
\qspo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(4),
      Q => qspo_int(4),
      R => '0'
    );
\qspo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(5),
      Q => qspo_int(5),
      R => '0'
    );
\qspo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(6),
      Q => qspo_int(6),
      R => '0'
    );
\qspo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(7),
      Q => qspo_int(7),
      R => '0'
    );
ram_reg_0_255_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_0_255_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => we,
      I1 => a(10),
      I2 => a(8),
      I3 => a(9),
      O => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_0_255_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_0_255_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_0_255_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_0_255_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_0_255_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_0_255_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_0_255_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_1024_1279_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_1024_1279_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(8),
      I1 => a(9),
      I2 => a(10),
      I3 => we,
      O => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_1024_1279_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_1024_1279_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_1024_1279_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_1024_1279_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_1024_1279_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_1024_1279_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1024_1279_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_1024_1279_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_1024_1279_0_0_i_1_n_0
    );
ram_reg_1280_1535_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_1280_1535_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(9),
      I2 => a(8),
      I3 => a(10),
      O => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_1280_1535_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_1280_1535_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_1280_1535_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_1280_1535_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_1280_1535_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_1280_1535_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1280_1535_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_1280_1535_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_1280_1535_0_0_i_1_n_0
    );
ram_reg_1536_1791_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_1536_1791_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(8),
      I2 => a(9),
      I3 => a(10),
      O => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_1536_1791_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_1536_1791_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_1536_1791_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_1536_1791_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_1536_1791_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_1536_1791_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1536_1791_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_1536_1791_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_1536_1791_0_0_i_1_n_0
    );
ram_reg_1792_2047_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_1792_2047_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => a(10),
      I1 => we,
      I2 => a(8),
      I3 => a(9),
      O => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_1792_2047_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_1792_2047_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_1792_2047_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_1792_2047_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_1792_2047_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_1792_2047_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_1792_2047_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_1792_2047_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_1792_2047_0_0_i_1_n_0
    );
ram_reg_256_511_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_256_511_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(9),
      I1 => a(10),
      I2 => a(8),
      I3 => we,
      O => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_256_511_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_256_511_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_256_511_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_256_511_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_256_511_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_256_511_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_256_511_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_512_767_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_512_767_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(8),
      I1 => a(10),
      I2 => a(9),
      I3 => we,
      O => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_512_767_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_512_767_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_512_767_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_512_767_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_512_767_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_512_767_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_512_767_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_512_767_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_512_767_0_0_i_1_n_0
    );
ram_reg_768_1023_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_768_1023_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(10),
      I2 => a(8),
      I3 => a(9),
      O => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_768_1023_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_768_1023_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_768_1023_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_768_1023_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_768_1023_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_768_1023_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
ram_reg_768_1023_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_768_1023_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_768_1023_0_0_i_1_n_0
    );
\spo[0]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[0]_INST_0_i_1_n_0\,
      I1 => \spo[0]_INST_0_i_2_n_0\,
      O => \^spo\(0),
      S => a(10)
    );
\spo[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_0_0_n_0,
      I1 => ram_reg_512_767_0_0_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_0_0_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_0_0_n_0,
      O => \spo[0]_INST_0_i_1_n_0\
    );
\spo[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_0_0_n_0,
      I1 => ram_reg_1536_1791_0_0_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_0_0_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_0_0_n_0,
      O => \spo[0]_INST_0_i_2_n_0\
    );
\spo[1]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[1]_INST_0_i_1_n_0\,
      I1 => \spo[1]_INST_0_i_2_n_0\,
      O => \^spo\(1),
      S => a(10)
    );
\spo[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_1_1_n_0,
      I1 => ram_reg_512_767_1_1_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_1_1_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_1_1_n_0,
      O => \spo[1]_INST_0_i_1_n_0\
    );
\spo[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_1_1_n_0,
      I1 => ram_reg_1536_1791_1_1_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_1_1_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_1_1_n_0,
      O => \spo[1]_INST_0_i_2_n_0\
    );
\spo[2]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[2]_INST_0_i_1_n_0\,
      I1 => \spo[2]_INST_0_i_2_n_0\,
      O => \^spo\(2),
      S => a(10)
    );
\spo[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_2_2_n_0,
      I1 => ram_reg_512_767_2_2_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_2_2_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_2_2_n_0,
      O => \spo[2]_INST_0_i_1_n_0\
    );
\spo[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_2_2_n_0,
      I1 => ram_reg_1536_1791_2_2_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_2_2_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_2_2_n_0,
      O => \spo[2]_INST_0_i_2_n_0\
    );
\spo[3]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[3]_INST_0_i_1_n_0\,
      I1 => \spo[3]_INST_0_i_2_n_0\,
      O => \^spo\(3),
      S => a(10)
    );
\spo[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_3_3_n_0,
      I1 => ram_reg_512_767_3_3_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_3_3_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_3_3_n_0,
      O => \spo[3]_INST_0_i_1_n_0\
    );
\spo[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_3_3_n_0,
      I1 => ram_reg_1536_1791_3_3_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_3_3_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_3_3_n_0,
      O => \spo[3]_INST_0_i_2_n_0\
    );
\spo[4]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[4]_INST_0_i_1_n_0\,
      I1 => \spo[4]_INST_0_i_2_n_0\,
      O => \^spo\(4),
      S => a(10)
    );
\spo[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_4_4_n_0,
      I1 => ram_reg_512_767_4_4_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_4_4_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_4_4_n_0,
      O => \spo[4]_INST_0_i_1_n_0\
    );
\spo[4]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_4_4_n_0,
      I1 => ram_reg_1536_1791_4_4_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_4_4_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_4_4_n_0,
      O => \spo[4]_INST_0_i_2_n_0\
    );
\spo[5]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[5]_INST_0_i_1_n_0\,
      I1 => \spo[5]_INST_0_i_2_n_0\,
      O => \^spo\(5),
      S => a(10)
    );
\spo[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_5_5_n_0,
      I1 => ram_reg_512_767_5_5_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_5_5_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_5_5_n_0,
      O => \spo[5]_INST_0_i_1_n_0\
    );
\spo[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_5_5_n_0,
      I1 => ram_reg_1536_1791_5_5_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_5_5_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_5_5_n_0,
      O => \spo[5]_INST_0_i_2_n_0\
    );
\spo[6]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[6]_INST_0_i_1_n_0\,
      I1 => \spo[6]_INST_0_i_2_n_0\,
      O => \^spo\(6),
      S => a(10)
    );
\spo[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_6_6_n_0,
      I1 => ram_reg_512_767_6_6_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_6_6_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_6_6_n_0,
      O => \spo[6]_INST_0_i_1_n_0\
    );
\spo[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_6_6_n_0,
      I1 => ram_reg_1536_1791_6_6_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_6_6_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_6_6_n_0,
      O => \spo[6]_INST_0_i_2_n_0\
    );
\spo[7]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[7]_INST_0_i_1_n_0\,
      I1 => \spo[7]_INST_0_i_2_n_0\,
      O => \^spo\(7),
      S => a(10)
    );
\spo[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_768_1023_7_7_n_0,
      I1 => ram_reg_512_767_7_7_n_0,
      I2 => a(9),
      I3 => ram_reg_256_511_7_7_n_0,
      I4 => a(8),
      I5 => ram_reg_0_255_7_7_n_0,
      O => \spo[7]_INST_0_i_1_n_0\
    );
\spo[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_1792_2047_7_7_n_0,
      I1 => ram_reg_1536_1791_7_7_n_0,
      I2 => a(9),
      I3 => ram_reg_1280_1535_7_7_n_0,
      I4 => a(8),
      I5 => ram_reg_1024_1279_7_7_n_0,
      O => \spo[7]_INST_0_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dmem1_dist_mem_gen_v8_0_10_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dmem1_dist_mem_gen_v8_0_10_synth : entity is "dist_mem_gen_v8_0_10_synth";
end dmem1_dist_mem_gen_v8_0_10_synth;

architecture STRUCTURE of dmem1_dist_mem_gen_v8_0_10_synth is
begin
\gen_sp_ram.spram_inst\: entity work.dmem1_spram
     port map (
      a(10 downto 0) => a(10 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      spo(7 downto 0) => spo(7 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dmem1_dist_mem_gen_v8_0_10 is
  port (
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of dmem1_dist_mem_gen_v8_0_10 : entity is 11;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of dmem1_dist_mem_gen_v8_0_10 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of dmem1_dist_mem_gen_v8_0_10 : entity is 2048;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of dmem1_dist_mem_gen_v8_0_10 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of dmem1_dist_mem_gen_v8_0_10 : entity is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of dmem1_dist_mem_gen_v8_0_10 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of dmem1_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of dmem1_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of dmem1_dist_mem_gen_v8_0_10 : entity is 8;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dmem1_dist_mem_gen_v8_0_10 : entity is "dist_mem_gen_v8_0_10";
end dmem1_dist_mem_gen_v8_0_10;

architecture STRUCTURE of dmem1_dist_mem_gen_v8_0_10 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.dmem1_dist_mem_gen_v8_0_10_synth
     port map (
      a(10 downto 0) => a(10 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      spo(7 downto 0) => spo(7 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dmem1 is
  port (
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dmem1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dmem1 : entity is "dmem1,dist_mem_gen_v8_0_10,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of dmem1 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of dmem1 : entity is "dist_mem_gen_v8_0_10,Vivado 2016.2";
end dmem1;

architecture STRUCTURE of dmem1 is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 1;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "true";
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 11;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 2048;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 8;
begin
U0: entity work.dmem1_dist_mem_gen_v8_0_10
     port map (
      a(10 downto 0) => a(10 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpo(7 downto 0) => NLW_U0_dpo_UNCONNECTED(7 downto 0),
      dpra(10 downto 0) => B"00000000000",
      i_ce => '1',
      qdpo(7 downto 0) => NLW_U0_qdpo_UNCONNECTED(7 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(7 downto 0) => NLW_U0_qspo_UNCONNECTED(7 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(7 downto 0) => spo(7 downto 0),
      we => we
    );
end STRUCTURE;
