library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity numerize_sensors is
	Port(clk        : in  std_logic;
		 i_senss    : in  std_logic_vector(15 downto 0);
		 o_sens_val : out integer);
end entity;

architecture rtl of numerize_sensors is
	signal s_sens_val   : integer;
	signal s_sens_val_p : integer;
begin
	process(clk)
		variable v_sens_sum   : integer;
		variable v_sens_count : integer;
	begin
		if rising_edge(clk) then
			v_sens_count := 0;
			v_sens_sum   := 0;
			for i in 0 to i_senss'length-1 loop
				v_sens_sum   := v_sens_sum + i * 1000 * to_integer(unsigned'('0' & i_senss(i)));
				v_sens_count := v_sens_count + to_integer(unsigned'('0' & i_senss(i)));
			end loop;
			s_sens_val <= s_sens_val_p when ((v_sens_sum / v_sens_count) > 15000) else (v_sens_sum / v_sens_count);
			s_sens_val_p <= s_sens_val;
		end if;
	end process;
	o_sens_val <= s_sens_val;
end architecture;