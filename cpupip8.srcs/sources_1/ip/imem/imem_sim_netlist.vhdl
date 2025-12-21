-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Dec 22 01:40:26 2025
-- Host        : Nicolas-ainski running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim E:/Homeworks/cpupip8/cpupip8.srcs/sources_1/ip/imem/imem_sim_netlist.vhdl
-- Design      : imem
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity imem_rom is
  port (
    spo : out STD_LOGIC_VECTOR ( 27 downto 0 );
    a : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of imem_rom : entity is "rom";
end imem_rom;

architecture STRUCTURE of imem_rom is
  signal \spo[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[10]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[11]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[12]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[13]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[13]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[14]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[14]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[16]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[17]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[17]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[17]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[18]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[19]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[20]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[20]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[21]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[22]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[23]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[24]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[26]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[26]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[27]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[27]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[27]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[27]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[28]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[28]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[28]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[29]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \spo[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[30]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \spo[10]_INST_0_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spo[10]_INST_0_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spo[10]_INST_0_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \spo[13]_INST_0_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spo[14]_INST_0_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \spo[14]_INST_0_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \spo[15]_INST_0_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spo[20]_INST_0_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spo[29]_INST_0_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spo[29]_INST_0_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spo[29]_INST_0_i_7\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spo[3]_INST_0_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \spo[4]_INST_0_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \spo[4]_INST_0_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spo[5]_INST_0_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spo[6]_INST_0_i_1\ : label is "soft_lutpair6";
begin
\spo[0]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[0]_INST_0_i_1_n_0\,
      I1 => \spo[0]_INST_0_i_2_n_0\,
      O => spo(0),
      S => a(5)
    );
\spo[0]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[0]_INST_0_i_3_n_0\,
      I1 => \spo[0]_INST_0_i_4_n_0\,
      O => \spo[0]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[0]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[0]_INST_0_i_5_n_0\,
      I1 => \spo[0]_INST_0_i_6_n_0\,
      O => \spo[0]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00800000FA210000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[0]_INST_0_i_3_n_0\
    );
\spo[0]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3020104000000000"
    )
        port map (
      I0 => a(0),
      I1 => a(6),
      I2 => \spo[29]_INST_0_i_7_n_0\,
      I3 => a(4),
      I4 => a(1),
      I5 => a(3),
      O => \spo[0]_INST_0_i_4_n_0\
    );
\spo[0]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8F3B8C0BBC088C0"
    )
        port map (
      I0 => \spo[29]_INST_0_i_6_n_0\,
      I1 => a(3),
      I2 => \spo[27]_INST_0_i_4_n_0\,
      I3 => a(1),
      I4 => \spo[29]_INST_0_i_5_n_0\,
      I5 => a(0),
      O => \spo[0]_INST_0_i_5_n_0\
    );
\spo[0]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2F202020"
    )
        port map (
      I0 => \spo[29]_INST_0_i_6_n_0\,
      I1 => a(0),
      I2 => a(3),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(1),
      O => \spo[0]_INST_0_i_6_n_0\
    );
\spo[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000300030BB3088"
    )
        port map (
      I0 => \spo[10]_INST_0_i_1_n_0\,
      I1 => a(5),
      I2 => \spo[10]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => \spo[10]_INST_0_i_3_n_0\,
      I5 => a(3),
      O => spo(7)
    );
\spo[10]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => a(0),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      O => \spo[10]_INST_0_i_1_n_0\
    );
\spo[10]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => a(1),
      I1 => \spo[28]_INST_0_i_3_n_0\,
      I2 => a(0),
      I3 => a(3),
      O => \spo[10]_INST_0_i_2_n_0\
    );
\spo[10]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => a(0),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(1),
      O => \spo[10]_INST_0_i_3_n_0\
    );
\spo[11]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[11]_INST_0_i_1_n_0\,
      I1 => \spo[11]_INST_0_i_2_n_0\,
      O => spo(8),
      S => a(5)
    );
\spo[11]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[11]_INST_0_i_3_n_0\,
      I1 => \spo[11]_INST_0_i_4_n_0\,
      O => \spo[11]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[11]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[11]_INST_0_i_5_n_0\,
      I1 => \spo[11]_INST_0_i_6_n_0\,
      O => \spo[11]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[11]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000903080"
    )
        port map (
      I0 => a(3),
      I1 => a(6),
      I2 => \spo[29]_INST_0_i_7_n_0\,
      I3 => a(4),
      I4 => a(0),
      I5 => a(1),
      O => \spo[11]_INST_0_i_3_n_0\
    );
\spo[11]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100800002002000"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => a(4),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(6),
      I5 => a(1),
      O => \spo[11]_INST_0_i_4_n_0\
    );
\spo[11]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30000B08"
    )
        port map (
      I0 => \spo[29]_INST_0_i_6_n_0\,
      I1 => a(3),
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      O => \spo[11]_INST_0_i_5_n_0\
    );
\spo[11]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F808C000"
    )
        port map (
      I0 => \spo[29]_INST_0_i_5_n_0\,
      I1 => a(3),
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(1),
      O => \spo[11]_INST_0_i_6_n_0\
    );
\spo[12]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[12]_INST_0_i_1_n_0\,
      I1 => \spo[12]_INST_0_i_2_n_0\,
      O => spo(9),
      S => a(5)
    );
\spo[12]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[12]_INST_0_i_3_n_0\,
      I1 => \spo[12]_INST_0_i_4_n_0\,
      O => \spo[12]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[12]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[12]_INST_0_i_5_n_0\,
      I1 => \spo[12]_INST_0_i_6_n_0\,
      O => \spo[12]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[12]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(3),
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(1),
      O => \spo[12]_INST_0_i_3_n_0\
    );
\spo[12]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"033B0008"
    )
        port map (
      I0 => \spo[28]_INST_0_i_3_n_0\,
      I1 => a(3),
      I2 => a(0),
      I3 => a(1),
      I4 => \spo[30]_INST_0_i_1_n_0\,
      O => \spo[12]_INST_0_i_4_n_0\
    );
\spo[12]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004D48"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(0),
      O => \spo[12]_INST_0_i_5_n_0\
    );
\spo[12]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0A000A0CF00C000"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => a(3),
      I3 => a(0),
      I4 => \spo[29]_INST_0_i_6_n_0\,
      I5 => a(1),
      O => \spo[12]_INST_0_i_6_n_0\
    );
\spo[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[13]_INST_0_i_1_n_0\,
      I1 => \spo[13]_INST_0_i_2_n_0\,
      I2 => a(5),
      I3 => \spo[13]_INST_0_i_3_n_0\,
      I4 => a(2),
      I5 => \spo[13]_INST_0_i_4_n_0\,
      O => spo(10)
    );
\spo[13]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BC800000"
    )
        port map (
      I0 => \spo[29]_INST_0_i_5_n_0\,
      I1 => a(3),
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(1),
      O => \spo[13]_INST_0_i_1_n_0\
    );
\spo[13]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4400440050F550A0"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => \spo[29]_INST_0_i_6_n_0\,
      I3 => a(1),
      I4 => \spo[29]_INST_0_i_5_n_0\,
      I5 => a(0),
      O => \spo[13]_INST_0_i_2_n_0\
    );
\spo[13]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0900400002002000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(6),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(4),
      I5 => a(0),
      O => \spo[13]_INST_0_i_3_n_0\
    );
\spo[13]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F000062000000"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => a(1),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[13]_INST_0_i_4_n_0\
    );
\spo[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[14]_INST_0_i_1_n_0\,
      I1 => \spo[14]_INST_0_i_2_n_0\,
      I2 => a(5),
      I3 => \spo[14]_INST_0_i_3_n_0\,
      I4 => a(2),
      I5 => \spo[14]_INST_0_i_4_n_0\,
      O => spo(11)
    );
\spo[14]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB800C000C000"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(1),
      I2 => \spo[29]_INST_0_i_5_n_0\,
      I3 => a(3),
      I4 => \spo[29]_INST_0_i_6_n_0\,
      I5 => a(0),
      O => \spo[14]_INST_0_i_1_n_0\
    );
\spo[14]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000D484"
    )
        port map (
      I0 => a(0),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(3),
      O => \spo[14]_INST_0_i_2_n_0\
    );
\spo[14]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0057000092000000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[14]_INST_0_i_3_n_0\
    );
\spo[14]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40408D88"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => \spo[28]_INST_0_i_3_n_0\,
      I4 => a(0),
      O => \spo[14]_INST_0_i_4_n_0\
    );
\spo[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004FFFF00040000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[15]_INST_0_i_1_n_0\,
      I2 => a(1),
      I3 => a(2),
      I4 => a(5),
      I5 => \spo[15]_INST_0_i_2_n_0\,
      O => spo(12)
    );
\spo[15]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(0),
      O => \spo[15]_INST_0_i_1_n_0\
    );
\spo[15]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033000003B00080"
    )
        port map (
      I0 => \spo[28]_INST_0_i_3_n_0\,
      I1 => a(2),
      I2 => a(3),
      I3 => a(1),
      I4 => \spo[30]_INST_0_i_1_n_0\,
      I5 => a(0),
      O => \spo[15]_INST_0_i_2_n_0\
    );
\spo[16]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[16]_INST_0_i_1_n_0\,
      I1 => \spo[16]_INST_0_i_2_n_0\,
      O => spo(13),
      S => a(5)
    );
\spo[16]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[16]_INST_0_i_3_n_0\,
      I1 => \spo[16]_INST_0_i_4_n_0\,
      O => \spo[16]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[16]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[16]_INST_0_i_5_n_0\,
      I1 => \spo[16]_INST_0_i_6_n_0\,
      O => \spo[16]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[16]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001A00004E1F0000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[16]_INST_0_i_3_n_0\
    );
\spo[16]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0300F808"
    )
        port map (
      I0 => \spo[27]_INST_0_i_3_n_0\,
      I1 => a(3),
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(0),
      O => \spo[16]_INST_0_i_4_n_0\
    );
\spo[16]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0B08BFBF0B088080"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(3),
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(0),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[16]_INST_0_i_5_n_0\
    );
\spo[16]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000C00033B800B8"
    )
        port map (
      I0 => \spo[29]_INST_0_i_5_n_0\,
      I1 => a(3),
      I2 => \spo[29]_INST_0_i_6_n_0\,
      I3 => a(0),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(1),
      O => \spo[16]_INST_0_i_6_n_0\
    );
\spo[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \spo[17]_INST_0_i_1_n_0\,
      I1 => a(5),
      I2 => \spo[17]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => \spo[17]_INST_0_i_3_n_0\,
      O => spo(14)
    );
\spo[17]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5808080800000000"
    )
        port map (
      I0 => a(1),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(0),
      I3 => a(3),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(2),
      O => \spo[17]_INST_0_i_1_n_0\
    );
\spo[17]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0D0000001D370000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(6),
      I3 => a(0),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(4),
      O => \spo[17]_INST_0_i_2_n_0\
    );
\spo[17]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00920000C1C20000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[17]_INST_0_i_3_n_0\
    );
\spo[18]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[18]_INST_0_i_1_n_0\,
      I1 => \spo[18]_INST_0_i_2_n_0\,
      O => spo(15),
      S => a(5)
    );
\spo[18]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[18]_INST_0_i_3_n_0\,
      I1 => \spo[18]_INST_0_i_4_n_0\,
      O => \spo[18]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[18]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[18]_INST_0_i_5_n_0\,
      I1 => \spo[18]_INST_0_i_6_n_0\,
      O => \spo[18]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[18]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800EA000000D800"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(6),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(4),
      I5 => a(0),
      O => \spo[18]_INST_0_i_3_n_0\
    );
\spo[18]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"48484848CFCAC0C0"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => a(6),
      I4 => \spo[27]_INST_0_i_3_n_0\,
      I5 => a(0),
      O => \spo[18]_INST_0_i_4_n_0\
    );
\spo[18]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E540DF85E540DA80"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(0),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[18]_INST_0_i_5_n_0\
    );
\spo[18]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EF400000"
    )
        port map (
      I0 => a(1),
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => a(3),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(0),
      O => \spo[18]_INST_0_i_6_n_0\
    );
\spo[19]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[19]_INST_0_i_1_n_0\,
      I1 => \spo[19]_INST_0_i_2_n_0\,
      O => spo(16),
      S => a(5)
    );
\spo[19]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[19]_INST_0_i_3_n_0\,
      I1 => \spo[19]_INST_0_i_4_n_0\,
      O => \spo[19]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[19]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[19]_INST_0_i_5_n_0\,
      I1 => \spo[19]_INST_0_i_6_n_0\,
      O => \spo[19]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[19]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00B70000DE400000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[19]_INST_0_i_3_n_0\
    );
\spo[19]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00520000F4BD0000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[19]_INST_0_i_4_n_0\
    );
\spo[19]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4ADFDF45408080"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(1),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[19]_INST_0_i_5_n_0\
    );
\spo[19]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4FBB040"
    )
        port map (
      I0 => a(1),
      I1 => a(3),
      I2 => \spo[29]_INST_0_i_5_n_0\,
      I3 => a(0),
      I4 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[19]_INST_0_i_6_n_0\
    );
\spo[1]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[1]_INST_0_i_1_n_0\,
      I1 => \spo[1]_INST_0_i_2_n_0\,
      O => spo(1),
      S => a(5)
    );
\spo[1]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[1]_INST_0_i_3_n_0\,
      I1 => \spo[1]_INST_0_i_4_n_0\,
      O => \spo[1]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[1]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[1]_INST_0_i_5_n_0\,
      I1 => \spo[1]_INST_0_i_6_n_0\,
      O => \spo[1]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[1]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5C0C8888"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(1),
      O => \spo[1]_INST_0_i_3_n_0\
    );
\spo[1]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800002002400"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => a(4),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(6),
      I5 => a(1),
      O => \spo[1]_INST_0_i_4_n_0\
    );
\spo[1]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44A044A050555000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => \spo[29]_INST_0_i_6_n_0\,
      I3 => a(1),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(0),
      O => \spo[1]_INST_0_i_5_n_0\
    );
\spo[1]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4040D580"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      O => \spo[1]_INST_0_i_6_n_0\
    );
\spo[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002222E222"
    )
        port map (
      I0 => \spo[20]_INST_0_i_1_n_0\,
      I1 => a(2),
      I2 => a(3),
      I3 => \spo[20]_INST_0_i_2_n_0\,
      I4 => a(1),
      I5 => a(5),
      O => spo(17)
    );
\spo[20]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100C0000E008000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(6),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(4),
      I5 => a(0),
      O => \spo[20]_INST_0_i_1_n_0\
    );
\spo[20]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \spo[30]_INST_0_i_1_n_0\,
      I1 => a(0),
      O => \spo[20]_INST_0_i_2_n_0\
    );
\spo[21]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[21]_INST_0_i_1_n_0\,
      I1 => \spo[21]_INST_0_i_2_n_0\,
      O => spo(18),
      S => a(5)
    );
\spo[21]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[21]_INST_0_i_3_n_0\,
      I1 => \spo[21]_INST_0_i_4_n_0\,
      O => \spo[21]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[21]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[21]_INST_0_i_5_n_0\,
      I1 => \spo[21]_INST_0_i_6_n_0\,
      O => \spo[21]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[21]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040209020802020"
    )
        port map (
      I0 => a(3),
      I1 => a(6),
      I2 => \spo[29]_INST_0_i_7_n_0\,
      I3 => a(4),
      I4 => a(0),
      I5 => a(1),
      O => \spo[21]_INST_0_i_3_n_0\
    );
\spo[21]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00300000BCB38080"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(3),
      I2 => a(1),
      I3 => a(6),
      I4 => \spo[27]_INST_0_i_3_n_0\,
      I5 => a(0),
      O => \spo[21]_INST_0_i_4_n_0\
    );
\spo[21]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C033C000F088F088"
    )
        port map (
      I0 => \spo[29]_INST_0_i_6_n_0\,
      I1 => a(3),
      I2 => \spo[27]_INST_0_i_4_n_0\,
      I3 => a(1),
      I4 => \spo[29]_INST_0_i_5_n_0\,
      I5 => a(0),
      O => \spo[21]_INST_0_i_5_n_0\
    );
\spo[21]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0C0AF00"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      O => \spo[21]_INST_0_i_6_n_0\
    );
\spo[22]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[22]_INST_0_i_1_n_0\,
      I1 => \spo[22]_INST_0_i_2_n_0\,
      O => spo(19),
      S => a(5)
    );
\spo[22]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[22]_INST_0_i_3_n_0\,
      I1 => \spo[22]_INST_0_i_4_n_0\,
      O => \spo[22]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[22]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[22]_INST_0_i_5_n_0\,
      I1 => \spo[22]_INST_0_i_6_n_0\,
      O => \spo[22]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[22]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CDC80A00"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => \spo[30]_INST_0_i_1_n_0\,
      I4 => a(0),
      O => \spo[22]_INST_0_i_3_n_0\
    );
\spo[22]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0017000030000000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[22]_INST_0_i_4_n_0\
    );
\spo[22]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45405F5F45400000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => a(0),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(1),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[22]_INST_0_i_5_n_0\
    );
\spo[22]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EF208080"
    )
        port map (
      I0 => \spo[27]_INST_0_i_4_n_0\,
      I1 => a(0),
      I2 => a(3),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(1),
      O => \spo[22]_INST_0_i_6_n_0\
    );
\spo[23]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[23]_INST_0_i_1_n_0\,
      I1 => \spo[23]_INST_0_i_2_n_0\,
      O => spo(20),
      S => a(5)
    );
\spo[23]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[23]_INST_0_i_3_n_0\,
      I1 => \spo[23]_INST_0_i_4_n_0\,
      O => \spo[23]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[23]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[23]_INST_0_i_5_n_0\,
      I1 => \spo[23]_INST_0_i_6_n_0\,
      O => \spo[23]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[23]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0040000C003000"
    )
        port map (
      I0 => a(1),
      I1 => a(3),
      I2 => a(6),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(4),
      I5 => a(0),
      O => \spo[23]_INST_0_i_3_n_0\
    );
\spo[23]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0000700B000"
    )
        port map (
      I0 => a(1),
      I1 => a(3),
      I2 => a(4),
      I3 => \spo[29]_INST_0_i_7_n_0\,
      I4 => a(6),
      I5 => a(0),
      O => \spo[23]_INST_0_i_4_n_0\
    );
\spo[23]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F3F03B3B03000808"
    )
        port map (
      I0 => \spo[29]_INST_0_i_5_n_0\,
      I1 => a(3),
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[23]_INST_0_i_5_n_0\
    );
\spo[23]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0C0A0C0F00F0000"
    )
        port map (
      I0 => \spo[29]_INST_0_i_6_n_0\,
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => a(3),
      I3 => a(0),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(1),
      O => \spo[23]_INST_0_i_6_n_0\
    );
\spo[24]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \spo[24]_INST_0_i_1_n_0\,
      I1 => \spo[24]_INST_0_i_2_n_0\,
      O => spo(21),
      S => a(5)
    );
\spo[24]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[24]_INST_0_i_3_n_0\,
      I1 => \spo[24]_INST_0_i_4_n_0\,
      O => \spo[24]_INST_0_i_1_n_0\,
      S => a(2)
    );
\spo[24]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[24]_INST_0_i_5_n_0\,
      I1 => \spo[24]_INST_0_i_6_n_0\,
      O => \spo[24]_INST_0_i_2_n_0\,
      S => a(2)
    );
\spo[24]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00070000EA000000"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => a(1),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[24]_INST_0_i_3_n_0\
    );
\spo[24]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00520000B5000000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[24]_INST_0_i_4_n_0\
    );
\spo[24]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5C0C0000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(1),
      O => \spo[24]_INST_0_i_5_n_0\
    );
\spo[24]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE004400F055F000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => \spo[29]_INST_0_i_6_n_0\,
      I3 => a(1),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(0),
      O => \spo[24]_INST_0_i_6_n_0\
    );
\spo[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004004008"
    )
        port map (
      I0 => a(1),
      I1 => \spo[30]_INST_0_i_1_n_0\,
      I2 => a(0),
      I3 => a(3),
      I4 => a(2),
      I5 => a(5),
      O => spo(22)
    );
\spo[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[29]_INST_0_i_1_n_0\,
      I1 => \spo[29]_INST_0_i_2_n_0\,
      I2 => a(5),
      I3 => \spo[26]_INST_0_i_1_n_0\,
      I4 => a(2),
      I5 => \spo[26]_INST_0_i_2_n_0\,
      O => spo(23)
    );
\spo[26]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"70C47080F8F77080"
    )
        port map (
      I0 => a(0),
      I1 => a(3),
      I2 => \spo[29]_INST_0_i_5_n_0\,
      I3 => a(1),
      I4 => \spo[27]_INST_0_i_3_n_0\,
      I5 => a(6),
      O => \spo[26]_INST_0_i_1_n_0\
    );
\spo[26]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C80000B4EF0000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[26]_INST_0_i_2_n_0\
    );
\spo[27]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[27]_INST_0_i_1_n_0\,
      I1 => \spo[27]_INST_0_i_2_n_0\,
      O => spo(27),
      S => a(5)
    );
\spo[27]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1400220008000600"
    )
        port map (
      I0 => a(2),
      I1 => a(3),
      I2 => a(0),
      I3 => \spo[27]_INST_0_i_3_n_0\,
      I4 => a(6),
      I5 => a(1),
      O => \spo[27]_INST_0_i_1_n_0\
    );
\spo[27]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"34000000"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(3),
      O => \spo[27]_INST_0_i_2_n_0\
    );
\spo[27]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => a(10),
      I1 => a(8),
      I2 => a(9),
      I3 => a(7),
      I4 => a(4),
      O => \spo[27]_INST_0_i_3_n_0\
    );
\spo[27]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => a(4),
      I1 => a(7),
      I2 => a(9),
      I3 => a(8),
      I4 => a(10),
      I5 => a(6),
      O => \spo[27]_INST_0_i_4_n_0\
    );
\spo[28]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[28]_INST_0_i_1_n_0\,
      I1 => \spo[28]_INST_0_i_2_n_0\,
      O => spo(24),
      S => a(5)
    );
\spo[28]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300080800000C00"
    )
        port map (
      I0 => \spo[28]_INST_0_i_3_n_0\,
      I1 => a(2),
      I2 => a(1),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      I5 => a(3),
      O => \spo[28]_INST_0_i_1_n_0\
    );
\spo[28]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1040104022330000"
    )
        port map (
      I0 => a(2),
      I1 => a(3),
      I2 => \spo[29]_INST_0_i_6_n_0\,
      I3 => a(1),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(0),
      O => \spo[28]_INST_0_i_2_n_0\
    );
\spo[28]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000002"
    )
        port map (
      I0 => a(6),
      I1 => a(10),
      I2 => a(8),
      I3 => a(9),
      I4 => a(7),
      I5 => a(4),
      O => \spo[28]_INST_0_i_3_n_0\
    );
\spo[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[29]_INST_0_i_1_n_0\,
      I1 => \spo[29]_INST_0_i_2_n_0\,
      I2 => a(5),
      I3 => \spo[29]_INST_0_i_3_n_0\,
      I4 => a(2),
      I5 => \spo[29]_INST_0_i_4_n_0\,
      O => spo(25)
    );
\spo[29]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F002F2F0F002020"
    )
        port map (
      I0 => \spo[29]_INST_0_i_5_n_0\,
      I1 => a(1),
      I2 => a(3),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(0),
      I5 => \spo[29]_INST_0_i_6_n_0\,
      O => \spo[29]_INST_0_i_1_n_0\
    );
\spo[29]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AD08E848"
    )
        port map (
      I0 => a(3),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(1),
      I3 => \spo[29]_INST_0_i_5_n_0\,
      I4 => a(0),
      O => \spo[29]_INST_0_i_2_n_0\
    );
\spo[29]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000078BF0000"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => a(1),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[29]_INST_0_i_3_n_0\
    );
\spo[29]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C8000094ED0000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(4),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(6),
      O => \spo[29]_INST_0_i_4_n_0\
    );
\spo[29]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => a(10),
      I1 => a(8),
      I2 => a(9),
      I3 => a(7),
      I4 => a(6),
      O => \spo[29]_INST_0_i_5_n_0\
    );
\spo[29]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => a(4),
      I1 => a(7),
      I2 => a(9),
      I3 => a(8),
      I4 => a(10),
      I5 => a(6),
      O => \spo[29]_INST_0_i_6_n_0\
    );
\spo[29]_INST_0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => a(7),
      I1 => a(9),
      I2 => a(8),
      I3 => a(10),
      O => \spo[29]_INST_0_i_7_n_0\
    );
\spo[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \spo[2]_INST_0_i_1_n_0\,
      I1 => a(5),
      I2 => \spo[2]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => \spo[2]_INST_0_i_3_n_0\,
      O => spo(2)
    );
\spo[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E0804080"
    )
        port map (
      I0 => a(1),
      I1 => \spo[29]_INST_0_i_6_n_0\,
      I2 => a(0),
      I3 => a(3),
      I4 => \spo[27]_INST_0_i_4_n_0\,
      I5 => a(2),
      O => \spo[2]_INST_0_i_1_n_0\
    );
\spo[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010315100102040"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => \spo[27]_INST_0_i_3_n_0\,
      I3 => a(6),
      I4 => a(0),
      I5 => \spo[27]_INST_0_i_4_n_0\,
      O => \spo[2]_INST_0_i_2_n_0\
    );
\spo[2]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000020"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => \spo[27]_INST_0_i_3_n_0\,
      I3 => a(6),
      I4 => a(1),
      O => \spo[2]_INST_0_i_3_n_0\
    );
\spo[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => a(2),
      I1 => a(1),
      I2 => \spo[30]_INST_0_i_1_n_0\,
      I3 => a(0),
      I4 => a(3),
      I5 => a(5),
      O => spo(26)
    );
\spo[30]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => a(4),
      I1 => a(7),
      I2 => a(9),
      I3 => a(8),
      I4 => a(10),
      I5 => a(6),
      O => \spo[30]_INST_0_i_1_n_0\
    );
\spo[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \spo[3]_INST_0_i_1_n_0\,
      I1 => a(5),
      I2 => \spo[3]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => \spo[3]_INST_0_i_3_n_0\,
      O => spo(3)
    );
\spo[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088888A80"
    )
        port map (
      I0 => a(1),
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(0),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(3),
      I5 => a(2),
      O => \spo[3]_INST_0_i_1_n_0\
    );
\spo[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => \spo[28]_INST_0_i_3_n_0\,
      I1 => a(3),
      I2 => a(0),
      I3 => \spo[27]_INST_0_i_4_n_0\,
      I4 => a(1),
      O => \spo[3]_INST_0_i_2_n_0\
    );
\spo[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FA000A000C000C0"
    )
        port map (
      I0 => \spo[30]_INST_0_i_1_n_0\,
      I1 => \spo[27]_INST_0_i_4_n_0\,
      I2 => a(3),
      I3 => a(0),
      I4 => \spo[29]_INST_0_i_5_n_0\,
      I5 => a(1),
      O => \spo[3]_INST_0_i_3_n_0\
    );
\spo[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5405555E5400000"
    )
        port map (
      I0 => a(5),
      I1 => \spo[4]_INST_0_i_1_n_0\,
      I2 => a(3),
      I3 => \spo[10]_INST_0_i_1_n_0\,
      I4 => a(2),
      I5 => \spo[4]_INST_0_i_2_n_0\,
      O => spo(4)
    );
\spo[4]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => a(0),
      I1 => \spo[28]_INST_0_i_3_n_0\,
      I2 => a(1),
      O => \spo[4]_INST_0_i_1_n_0\
    );
\spo[4]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6000"
    )
        port map (
      I0 => a(3),
      I1 => a(0),
      I2 => \spo[30]_INST_0_i_1_n_0\,
      I3 => a(1),
      O => \spo[4]_INST_0_i_2_n_0\
    );
\spo[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[5]_INST_0_i_1_n_0\,
      I1 => \spo[13]_INST_0_i_2_n_0\,
      I2 => a(5),
      I3 => \spo[14]_INST_0_i_3_n_0\,
      I4 => a(2),
      I5 => \spo[5]_INST_0_i_2_n_0\,
      O => spo(5)
    );
\spo[5]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC08080"
    )
        port map (
      I0 => a(1),
      I1 => \spo[29]_INST_0_i_5_n_0\,
      I2 => a(3),
      I3 => \spo[29]_INST_0_i_6_n_0\,
      I4 => a(0),
      O => \spo[5]_INST_0_i_1_n_0\
    );
\spo[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004B000037000000"
    )
        port map (
      I0 => a(3),
      I1 => a(1),
      I2 => a(0),
      I3 => a(6),
      I4 => \spo[29]_INST_0_i_7_n_0\,
      I5 => a(4),
      O => \spo[5]_INST_0_i_2_n_0\
    );
\spo[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000300000000808"
    )
        port map (
      I0 => \spo[15]_INST_0_i_1_n_0\,
      I1 => a(5),
      I2 => a(3),
      I3 => \spo[6]_INST_0_i_1_n_0\,
      I4 => a(1),
      I5 => a(2),
      O => spo(6)
    );
\spo[6]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \spo[28]_INST_0_i_3_n_0\,
      I1 => a(0),
      O => \spo[6]_INST_0_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity imem_dist_mem_gen_v8_0_10_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 27 downto 0 );
    a : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of imem_dist_mem_gen_v8_0_10_synth : entity is "dist_mem_gen_v8_0_10_synth";
end imem_dist_mem_gen_v8_0_10_synth;

architecture STRUCTURE of imem_dist_mem_gen_v8_0_10_synth is
begin
\gen_rom.rom_inst\: entity work.imem_rom
     port map (
      a(10 downto 0) => a(10 downto 0),
      spo(27 downto 0) => spo(27 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity imem_dist_mem_gen_v8_0_10 is
  port (
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    d : in STD_LOGIC_VECTOR ( 31 downto 0 );
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
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of imem_dist_mem_gen_v8_0_10 : entity is 11;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of imem_dist_mem_gen_v8_0_10 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of imem_dist_mem_gen_v8_0_10 : entity is 2048;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of imem_dist_mem_gen_v8_0_10 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of imem_dist_mem_gen_v8_0_10 : entity is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of imem_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of imem_dist_mem_gen_v8_0_10 : entity is "imem.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of imem_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of imem_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of imem_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of imem_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of imem_dist_mem_gen_v8_0_10 : entity is 32;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of imem_dist_mem_gen_v8_0_10 : entity is "dist_mem_gen_v8_0_10";
end imem_dist_mem_gen_v8_0_10;

architecture STRUCTURE of imem_dist_mem_gen_v8_0_10 is
  signal \<const0>\ : STD_LOGIC;
  signal \^spo\ : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  dpo(31) <= \<const0>\;
  dpo(30) <= \<const0>\;
  dpo(29) <= \<const0>\;
  dpo(28) <= \<const0>\;
  dpo(27) <= \<const0>\;
  dpo(26) <= \<const0>\;
  dpo(25) <= \<const0>\;
  dpo(24) <= \<const0>\;
  dpo(23) <= \<const0>\;
  dpo(22) <= \<const0>\;
  dpo(21) <= \<const0>\;
  dpo(20) <= \<const0>\;
  dpo(19) <= \<const0>\;
  dpo(18) <= \<const0>\;
  dpo(17) <= \<const0>\;
  dpo(16) <= \<const0>\;
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(31) <= \<const0>\;
  qdpo(30) <= \<const0>\;
  qdpo(29) <= \<const0>\;
  qdpo(28) <= \<const0>\;
  qdpo(27) <= \<const0>\;
  qdpo(26) <= \<const0>\;
  qdpo(25) <= \<const0>\;
  qdpo(24) <= \<const0>\;
  qdpo(23) <= \<const0>\;
  qdpo(22) <= \<const0>\;
  qdpo(21) <= \<const0>\;
  qdpo(20) <= \<const0>\;
  qdpo(19) <= \<const0>\;
  qdpo(18) <= \<const0>\;
  qdpo(17) <= \<const0>\;
  qdpo(16) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(31) <= \<const0>\;
  qspo(30) <= \<const0>\;
  qspo(29) <= \<const0>\;
  qspo(28) <= \<const0>\;
  qspo(27) <= \<const0>\;
  qspo(26) <= \<const0>\;
  qspo(25) <= \<const0>\;
  qspo(24) <= \<const0>\;
  qspo(23) <= \<const0>\;
  qspo(22) <= \<const0>\;
  qspo(21) <= \<const0>\;
  qspo(20) <= \<const0>\;
  qspo(19) <= \<const0>\;
  qspo(18) <= \<const0>\;
  qspo(17) <= \<const0>\;
  qspo(16) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(31 downto 28) <= \^spo\(31 downto 28);
  spo(27) <= \^spo\(31);
  spo(26 downto 9) <= \^spo\(26 downto 9);
  spo(8) <= \^spo\(9);
  spo(7) <= \^spo\(9);
  spo(6) <= \^spo\(9);
  spo(5 downto 0) <= \^spo\(5 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.imem_dist_mem_gen_v8_0_10_synth
     port map (
      a(10 downto 0) => a(10 downto 0),
      spo(27 downto 24) => \^spo\(31 downto 28),
      spo(23 downto 6) => \^spo\(26 downto 9),
      spo(5 downto 0) => \^spo\(5 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity imem is
  port (
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of imem : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of imem : entity is "imem,dist_mem_gen_v8_0_10,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of imem : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of imem : entity is "dist_mem_gen_v8_0_10,Vivado 2016.2";
end imem;

architecture STRUCTURE of imem is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
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
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
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
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
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
  attribute c_mem_init_file of U0 : label is "imem.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 32;
begin
U0: entity work.imem_dist_mem_gen_v8_0_10
     port map (
      a(10 downto 0) => a(10 downto 0),
      clk => '0',
      d(31 downto 0) => B"00000000000000000000000000000000",
      dpo(31 downto 0) => NLW_U0_dpo_UNCONNECTED(31 downto 0),
      dpra(10 downto 0) => B"00000000000",
      i_ce => '1',
      qdpo(31 downto 0) => NLW_U0_qdpo_UNCONNECTED(31 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(31 downto 0) => NLW_U0_qspo_UNCONNECTED(31 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(31 downto 0) => spo(31 downto 0),
      we => '0'
    );
end STRUCTURE;
