library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pid_controller is
	Port(clk          : in  std_logic;
		 master_clk      : in  std_logic;
		 i_sens_val   : in  integer;
		 o_err        : out integer;
		 o_pid        : out integer);
end entity;

architecture rtl of pid_controller is
--    component pid_calibrate is
--        Port(clk        : in std_logic;
--            i_en        : in std_logic;
--            i_up        : in std_logic;
--            i_do        : in std_logic;
--            i_const_slct : in std_logic_vector(1 downto 0);
--            o_Kp        : out integer;
--            o_Ki        : out integer;
--            o_Kd        : out integer);
--    end component;
	signal s_ref         : integer := 7500;
	signal s_Kp          : integer := 50;
	signal s_Ki          : integer;
	signal s_Kd          : integer := 6000;
--	signal s_sens_int    : integer := 7500;
	signal s_out         : integer;
	signal s_err_old     : integer;
	signal s_out_old     : integer;
	signal s_err         : integer;
begin
--    u_pid_calib : pid_calibrate Port Map(clk => clk, i_en => i_calib_en, i_up => i_up, i_do => i_do, i_const_slct => i_const_slct, o_Kp => s_Kp, o_Ki => s_Ki, o_Kd => s_Kd);
	process(master_clk)
	    variable v_err      : integer := 0;
	    variable v_sum_errs : integer := 0;
		variable v_p        : integer;
		variable v_i        : integer;
		variable v_d        : integer;
	begin
		if rising_edge(master_clk) then
		    v_err := s_ref - i_sens_val;
		    v_sum_errs := v_sum_errs + v_err;
		    v_p   := s_Kp * v_err;
		    v_i   := s_Ki * (v_err + v_sum_errs);
		    v_d   := s_Kd * (v_err - s_err_old);
            
		    s_out <= (v_p + v_i + v_d)/1000;
		    
		    s_err_old <= v_err;
		    s_out_old <= s_out;
		    
		    o_err <= v_err;
		end if;
	end process;
	o_pid <= s_out;
end architecture;