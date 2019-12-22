-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
-- Date        : Sun Dec  1 13:45:12 2019
-- Host        : Artifank-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Artifank/line_follower/line_follower.sim/sim_1/synth/func/xsim/testbench_func_synth.vhd
-- Design      : line_follower
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm is
  port (
    o_pwmL_OBUF : out STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC
  );
end pwm;

architecture STRUCTURE of pwm is
  signal o_pwmL_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \pwm_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal pwm_counter_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sel : STD_LOGIC;
  signal \slow_counter[6]_i_3_n_0\ : STD_LOGIC;
  signal slow_counter_reg : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \slow_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \slow_counter_reg_n_0_[1]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \pwm_counter[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_counter[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_counter[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \pwm_counter[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slow_counter[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slow_counter[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slow_counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slow_counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slow_counter[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \slow_counter[6]_i_3\ : label is "soft_lutpair0";
begin
o_pwmL_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => o_pwmL_OBUF_inst_i_2_n_0,
      I1 => pwm_counter_reg(3),
      I2 => D(3),
      O => o_pwmL_OBUF
    );
o_pwmL_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => D(0),
      I1 => pwm_counter_reg(0),
      I2 => pwm_counter_reg(1),
      I3 => D(1),
      I4 => pwm_counter_reg(2),
      I5 => D(2),
      O => o_pwmL_OBUF_inst_i_2_n_0
    );
\pwm_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_counter_reg(0),
      O => \pwm_counter[0]_i_1_n_0\
    );
\pwm_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pwm_counter_reg(0),
      I1 => pwm_counter_reg(1),
      O => \plusOp__0\(1)
    );
\pwm_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pwm_counter_reg(0),
      I1 => pwm_counter_reg(1),
      I2 => pwm_counter_reg(2),
      O => \plusOp__0\(2)
    );
\pwm_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pwm_counter_reg(1),
      I1 => pwm_counter_reg(0),
      I2 => pwm_counter_reg(2),
      I3 => pwm_counter_reg(3),
      O => \plusOp__0\(3)
    );
\pwm_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sel,
      D => \pwm_counter[0]_i_1_n_0\,
      Q => pwm_counter_reg(0),
      R => '0'
    );
\pwm_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sel,
      D => \plusOp__0\(1),
      Q => pwm_counter_reg(1),
      R => '0'
    );
\pwm_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sel,
      D => \plusOp__0\(2),
      Q => pwm_counter_reg(2),
      R => '0'
    );
\pwm_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => sel,
      D => \plusOp__0\(3),
      Q => pwm_counter_reg(3),
      R => '0'
    );
\slow_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      O => plusOp(0)
    );
\slow_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      I1 => \slow_counter_reg_n_0_[1]\,
      O => plusOp(1)
    );
\slow_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      I1 => \slow_counter_reg_n_0_[1]\,
      I2 => slow_counter_reg(2),
      O => plusOp(2)
    );
\slow_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[1]\,
      I1 => \slow_counter_reg_n_0_[0]\,
      I2 => slow_counter_reg(2),
      I3 => slow_counter_reg(3),
      O => plusOp(3)
    );
\slow_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => slow_counter_reg(2),
      I1 => \slow_counter_reg_n_0_[0]\,
      I2 => \slow_counter_reg_n_0_[1]\,
      I3 => slow_counter_reg(3),
      I4 => slow_counter_reg(4),
      O => plusOp(4)
    );
\slow_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => slow_counter_reg(3),
      I1 => \slow_counter_reg_n_0_[1]\,
      I2 => \slow_counter_reg_n_0_[0]\,
      I3 => slow_counter_reg(2),
      I4 => slow_counter_reg(4),
      I5 => slow_counter_reg(5),
      O => plusOp(5)
    );
\slow_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => slow_counter_reg(6),
      I1 => slow_counter_reg(5),
      I2 => slow_counter_reg(2),
      I3 => slow_counter_reg(3),
      I4 => slow_counter_reg(4),
      O => sel
    );
\slow_counter[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \slow_counter[6]_i_3_n_0\,
      I1 => slow_counter_reg(5),
      I2 => slow_counter_reg(6),
      O => plusOp(6)
    );
\slow_counter[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => slow_counter_reg(4),
      I1 => slow_counter_reg(2),
      I2 => \slow_counter_reg_n_0_[0]\,
      I3 => \slow_counter_reg_n_0_[1]\,
      I4 => slow_counter_reg(3),
      O => \slow_counter[6]_i_3_n_0\
    );
\slow_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(0),
      Q => \slow_counter_reg_n_0_[0]\,
      R => sel
    );
\slow_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(1),
      Q => \slow_counter_reg_n_0_[1]\,
      R => sel
    );
\slow_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(2),
      Q => slow_counter_reg(2),
      R => sel
    );
\slow_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(3),
      Q => slow_counter_reg(3),
      R => sel
    );
\slow_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(4),
      Q => slow_counter_reg(4),
      R => sel
    );
\slow_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(5),
      Q => slow_counter_reg(5),
      R => sel
    );
\slow_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(6),
      Q => slow_counter_reg(6),
      R => sel
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_0 is
  port (
    o_pwmR_OBUF : out STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_0 : entity is "pwm";
end pwm_0;

architecture STRUCTURE of pwm_0 is
  signal o_pwmR_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \plusOp__2\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \pwm_counter[0]_i_1__0_n_0\ : STD_LOGIC;
  signal pwm_counter_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \slow_counter[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \slow_counter[6]_i_3__0_n_0\ : STD_LOGIC;
  signal slow_counter_reg : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \slow_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \slow_counter_reg_n_0_[1]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \pwm_counter[0]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \pwm_counter[1]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \pwm_counter[2]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pwm_counter[3]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slow_counter[0]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slow_counter[1]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slow_counter[2]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slow_counter[3]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slow_counter[4]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slow_counter[6]_i_3__0\ : label is "soft_lutpair5";
begin
o_pwmR_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => o_pwmR_OBUF_inst_i_2_n_0,
      I1 => pwm_counter_reg(3),
      I2 => D(3),
      O => o_pwmR_OBUF
    );
o_pwmR_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => D(0),
      I1 => pwm_counter_reg(0),
      I2 => pwm_counter_reg(1),
      I3 => D(1),
      I4 => pwm_counter_reg(2),
      I5 => D(2),
      O => o_pwmR_OBUF_inst_i_2_n_0
    );
\pwm_counter[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_counter_reg(0),
      O => \pwm_counter[0]_i_1__0_n_0\
    );
\pwm_counter[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pwm_counter_reg(0),
      I1 => pwm_counter_reg(1),
      O => \plusOp__2\(1)
    );
\pwm_counter[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pwm_counter_reg(0),
      I1 => pwm_counter_reg(1),
      I2 => pwm_counter_reg(2),
      O => \plusOp__2\(2)
    );
\pwm_counter[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pwm_counter_reg(1),
      I1 => pwm_counter_reg(0),
      I2 => pwm_counter_reg(2),
      I3 => pwm_counter_reg(3),
      O => \plusOp__2\(3)
    );
\pwm_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \slow_counter[6]_i_1__0_n_0\,
      D => \pwm_counter[0]_i_1__0_n_0\,
      Q => pwm_counter_reg(0),
      R => '0'
    );
\pwm_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \slow_counter[6]_i_1__0_n_0\,
      D => \plusOp__2\(1),
      Q => pwm_counter_reg(1),
      R => '0'
    );
\pwm_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \slow_counter[6]_i_1__0_n_0\,
      D => \plusOp__2\(2),
      Q => pwm_counter_reg(2),
      R => '0'
    );
\pwm_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \slow_counter[6]_i_1__0_n_0\,
      D => \plusOp__2\(3),
      Q => pwm_counter_reg(3),
      R => '0'
    );
\slow_counter[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      O => \plusOp__1\(0)
    );
\slow_counter[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      I1 => \slow_counter_reg_n_0_[1]\,
      O => \plusOp__1\(1)
    );
\slow_counter[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[0]\,
      I1 => \slow_counter_reg_n_0_[1]\,
      I2 => slow_counter_reg(2),
      O => \plusOp__1\(2)
    );
\slow_counter[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \slow_counter_reg_n_0_[1]\,
      I1 => \slow_counter_reg_n_0_[0]\,
      I2 => slow_counter_reg(2),
      I3 => slow_counter_reg(3),
      O => \plusOp__1\(3)
    );
\slow_counter[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => slow_counter_reg(2),
      I1 => \slow_counter_reg_n_0_[0]\,
      I2 => \slow_counter_reg_n_0_[1]\,
      I3 => slow_counter_reg(3),
      I4 => slow_counter_reg(4),
      O => \plusOp__1\(4)
    );
\slow_counter[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => slow_counter_reg(3),
      I1 => \slow_counter_reg_n_0_[1]\,
      I2 => \slow_counter_reg_n_0_[0]\,
      I3 => slow_counter_reg(2),
      I4 => slow_counter_reg(4),
      I5 => slow_counter_reg(5),
      O => \plusOp__1\(5)
    );
\slow_counter[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => slow_counter_reg(6),
      I1 => slow_counter_reg(5),
      I2 => slow_counter_reg(2),
      I3 => slow_counter_reg(3),
      I4 => slow_counter_reg(4),
      O => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter[6]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \slow_counter[6]_i_3__0_n_0\,
      I1 => slow_counter_reg(5),
      I2 => slow_counter_reg(6),
      O => \plusOp__1\(6)
    );
\slow_counter[6]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => slow_counter_reg(4),
      I1 => slow_counter_reg(2),
      I2 => \slow_counter_reg_n_0_[0]\,
      I3 => \slow_counter_reg_n_0_[1]\,
      I4 => slow_counter_reg(3),
      O => \slow_counter[6]_i_3__0_n_0\
    );
\slow_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(0),
      Q => \slow_counter_reg_n_0_[0]\,
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(1),
      Q => \slow_counter_reg_n_0_[1]\,
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(2),
      Q => slow_counter_reg(2),
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(3),
      Q => slow_counter_reg(3),
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(4),
      Q => slow_counter_reg(4),
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(5),
      Q => slow_counter_reg(5),
      R => \slow_counter[6]_i_1__0_n_0\
    );
\slow_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \plusOp__1\(6),
      Q => slow_counter_reg(6),
      R => \slow_counter[6]_i_1__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity line_follower is
  port (
    clk_100MHz : in STD_LOGIC;
    i_dutyL : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_dutyR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_enable : in STD_LOGIC;
    i_reverse : in STD_LOGIC;
    o_L1 : out STD_LOGIC;
    o_L2 : out STD_LOGIC;
    o_pwmL : out STD_LOGIC;
    o_R1 : out STD_LOGIC;
    o_R2 : out STD_LOGIC;
    o_pwmR : out STD_LOGIC;
    o_leds : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of line_follower : entity is true;
end line_follower;

architecture STRUCTURE of line_follower is
  signal clk_100MHz_IBUF : STD_LOGIC;
  signal clk_100MHz_IBUF_BUFG : STD_LOGIC;
  signal i_dutyL_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i_dutyR_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i_enable_IBUF : STD_LOGIC;
  signal i_reverse_IBUF : STD_LOGIC;
  signal o_R1_OBUF : STD_LOGIC;
  signal o_R2_OBUF : STD_LOGIC;
  signal o_leds_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_pwmL_OBUF : STD_LOGIC;
  signal o_pwmR_OBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of o_L1_OBUF_inst_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of o_L2_OBUF_inst_i_1 : label is "soft_lutpair10";
begin
clk_100MHz_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_100MHz_IBUF,
      O => clk_100MHz_IBUF_BUFG
    );
clk_100MHz_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_100MHz,
      O => clk_100MHz_IBUF
    );
\i_dutyL_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyL(0),
      O => i_dutyL_IBUF(0)
    );
\i_dutyL_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyL(1),
      O => i_dutyL_IBUF(1)
    );
\i_dutyL_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyL(2),
      O => i_dutyL_IBUF(2)
    );
\i_dutyL_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyL(3),
      O => i_dutyL_IBUF(3)
    );
\i_dutyR_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyR(0),
      O => i_dutyR_IBUF(0)
    );
\i_dutyR_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyR(1),
      O => i_dutyR_IBUF(1)
    );
\i_dutyR_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyR(2),
      O => i_dutyR_IBUF(2)
    );
\i_dutyR_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_dutyR(3),
      O => i_dutyR_IBUF(3)
    );
i_enable_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_enable,
      O => i_enable_IBUF
    );
i_reverse_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_reverse,
      O => i_reverse_IBUF
    );
o_L1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_R1_OBUF,
      O => o_L1
    );
o_L1_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => i_enable_IBUF,
      I1 => i_reverse_IBUF,
      O => o_R1_OBUF
    );
o_L2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_R2_OBUF,
      O => o_L2
    );
o_L2_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => i_enable_IBUF,
      I1 => i_reverse_IBUF,
      O => o_R2_OBUF
    );
o_R1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_R1_OBUF,
      O => o_R1
    );
o_R2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_R2_OBUF,
      O => o_R2
    );
\o_leds_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(0),
      O => o_leds(0)
    );
\o_leds_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(10)
    );
\o_leds_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(11)
    );
\o_leds_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(12),
      O => o_leds(12)
    );
\o_leds_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(13),
      O => o_leds(13)
    );
\o_leds_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(14),
      O => o_leds(14)
    );
\o_leds_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(15),
      O => o_leds(15)
    );
\o_leds_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(1),
      O => o_leds(1)
    );
\o_leds_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(2),
      O => o_leds(2)
    );
\o_leds_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(3),
      O => o_leds(3)
    );
\o_leds_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(4)
    );
\o_leds_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(5)
    );
\o_leds_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(6)
    );
\o_leds_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(7),
      O => o_leds(7)
    );
\o_leds_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_leds_OBUF(8),
      O => o_leds(8)
    );
\o_leds_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_leds(9)
    );
\o_leds_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyL_IBUF(0),
      Q => o_leds_OBUF(0),
      R => '0'
    );
\o_leds_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyR_IBUF(0),
      Q => o_leds_OBUF(12),
      R => '0'
    );
\o_leds_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyR_IBUF(1),
      Q => o_leds_OBUF(13),
      R => '0'
    );
\o_leds_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyR_IBUF(2),
      Q => o_leds_OBUF(14),
      R => '0'
    );
\o_leds_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyR_IBUF(3),
      Q => o_leds_OBUF(15),
      R => '0'
    );
\o_leds_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyL_IBUF(1),
      Q => o_leds_OBUF(1),
      R => '0'
    );
\o_leds_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyL_IBUF(2),
      Q => o_leds_OBUF(2),
      R => '0'
    );
\o_leds_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_dutyL_IBUF(3),
      Q => o_leds_OBUF(3),
      R => '0'
    );
\o_leds_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_enable_IBUF,
      Q => o_leds_OBUF(7),
      R => '0'
    );
\o_leds_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz_IBUF_BUFG,
      CE => '1',
      D => i_reverse_IBUF,
      Q => o_leds_OBUF(8),
      R => '0'
    );
o_pwmL_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_pwmL_OBUF,
      O => o_pwmL
    );
o_pwmR_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_pwmR_OBUF,
      O => o_pwmR
    );
pwmL: entity work.pwm
     port map (
      CLK => clk_100MHz_IBUF_BUFG,
      D(3 downto 0) => i_dutyL_IBUF(3 downto 0),
      o_pwmL_OBUF => o_pwmL_OBUF
    );
pwmR: entity work.pwm_0
     port map (
      CLK => clk_100MHz_IBUF_BUFG,
      D(3 downto 0) => i_dutyR_IBUF(3 downto 0),
      o_pwmR_OBUF => o_pwmR_OBUF
    );
end STRUCTURE;
