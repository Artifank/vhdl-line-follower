library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity motor_ctrl is
	Port(clk     : in  std_logic;
		 i_pid   : in  integer;
		 i_red   : in  integer;
		 i_green : in  integer;
		 i_blue  : in  integer;
		 o_pwmL  : out std_logic;
		 o_pwmR  : out std_logic);
end entity;

architecture rtl of motor_ctrl is
	component pwm is
		Port(clk : in  std_logic;
			i_duty     : in  integer;
			o_pwm      : out std_logic);
	end component;
	signal s_dutyL      : integer;
	signal s_dutyR      : integer;
	signal s_base_speed : integer := 600;
	signal s_max_speed  : integer := 1000;
	signal s_min_speed  : integer := 0;
begin
    s_base_speed <= 300 when (i_red > i_green + 20 and i_red > i_blue + 20) else 600;
	s_dutyL <= 0 when ((s_base_speed + i_pid) < 0) else s_max_speed when ((s_base_speed + i_pid) > s_max_speed) else (s_base_speed + i_pid);
	s_dutyR <= 0 when ((s_base_speed - i_pid) < 0) else s_max_speed when ((s_base_speed - i_pid) > s_max_speed) else (s_base_speed - i_pid);
	pwmL : pwm Port Map(clk => clk, i_duty => s_dutyL, o_pwm => o_pwmL);
	pwmR : pwm Port Map(clk => clk, i_duty => s_dutyR, o_pwm => o_pwmR);
end architecture;