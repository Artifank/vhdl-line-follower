library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity qtr_sens_time is
	Port(clk         : in    std_logic;
		 qtr_clk     : in    std_logic;
		 io_sens     : inout std_logic;
		 o_sens_time : out   integer;
		 o_sens_ctrl : out   std_logic);
end entity;

architecture rtl of qtr_sens_time is
    signal s_r_clk         : std_logic;
	signal s_count_en      : std_logic := '0';
	signal s_setup_counter : integer := 0;
	signal s_counter       : integer := 0;
	signal s_setup_en      : std_logic := '0';
begin
	process(clk)
	begin
		if rising_edge(clk) then
		    if s_r_clk = '1' then
                s_setup_en <= '1';
                s_r_clk <= '0';
            else
                s_r_clk <= qtr_clk;
            end if;
            
		    if s_setup_en = '0' and s_count_en = '0' then
		        o_sens_ctrl <= '0';
		    else
		        o_sens_ctrl <= '1';
		    end if;
		    
			if s_setup_en = '1' then
				if s_setup_counter < 1500 then
					s_setup_counter <= s_setup_counter + 1;
					io_sens <= '1';
				else
					s_setup_counter <= 0;
					io_sens <= 'Z';
					s_setup_en <= '0';
					s_count_en <= '1';
				end if;
			elsif s_count_en = '1' then
				if io_sens = '1' then
					s_counter <= s_counter + 1;
				else
				    s_counter <= 0;
                    o_sens_time <= s_counter;
					s_count_en <= '0';
				end if;
			end if;
		end if;
	end process;
end architecture;