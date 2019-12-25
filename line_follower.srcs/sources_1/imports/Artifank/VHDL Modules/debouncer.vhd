library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debouncer is
	Port(clk : in  std_logic;
		 i_b : in  std_logic;
		 o_b : out std_logic);
end entity;

architecture rtl of debouncer is
	signal s_counter    : integer := 0;
	signal s_ff1, s_ff2 : std_logic;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			s_ff1 <= i_b;
			s_ff2 <= s_ff1;
			if (s_ff1 xor s_ff2) = '1' then
				s_counter <= 0;
			else
			if (s_counter < 1000000) then
				s_counter <= s_counter + 1;
			else
				s_counter <= 0;
				o_b <= s_ff2;
			end if;
			end if;
		end if;
	end process;
end architecture;