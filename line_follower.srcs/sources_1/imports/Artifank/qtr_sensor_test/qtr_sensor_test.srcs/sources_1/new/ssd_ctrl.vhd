library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ssd_ctrl is
	Port(clk        : in  std_logic;
	     i_sel      : in  std_logic := '0';
		 i_disp_num : in  integer;
		 o_ssd_segs : out std_logic_vector(6 downto 0);
		 o_ssd_an   : out std_logic_vector(3 downto 0));
end entity;

architecture rtl of ssd_ctrl is
	signal s_slow_counter    : integer;
	signal s_refresh_counter : integer;
	signal s_BCD             : std_logic_vector(3 downto 0);
	signal s_disp_num        : std_logic_vector(15 downto 0);
	signal s_disp_num_t      : std_logic_vector(31 downto 0);
	signal s_slower_counter  : integer;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if s_slower_counter < 10000000 then
                s_slower_counter <= s_slower_counter + 1;
            else
                s_slower_counter <= 0;
                s_disp_num <= s_disp_num_t(31 downto 16) when i_sel = '1' else s_disp_num_t(15 downto 0);
            end if;
        end if;
    end process;
    s_disp_num_t <= std_logic_vector(to_signed(i_disp_num, 32));
	with s_BCD select 
		o_ssd_segs <= "1000000" when "0000",
					  "1111001" when "0001",
				      "0100100" when "0010",
				      "0110000" when "0011",
   				      "0011001" when "0100",
				      "0010010" when "0101",
				      "0000010" when "0110",
				      "1111000" when "0111",
				      "0000000" when "1000",
				      "0010000" when "1001",
				      "0100000" when "1010",
				      "0000011" when "1011",
				      "1000110" when "1100",
				      "0100001" when "1101",
				      "0000110" when "1110",
				      "0001110" when others;
	process(clk)
	begin
		if rising_Edge(clk) then
			if s_slow_counter < 250000 then
				s_slow_counter <= s_slow_counter + 1;
			else
				s_slow_counter <= 0;
				if s_refresh_counter < 3 then
				    s_refresh_counter <= s_refresh_counter + 1;
				else
				    s_refresh_counter <= 0;
				end if;
			end if;
		end if;
	end process;
	process(s_refresh_counter)
	begin
		case s_refresh_counter is
		when 0 =>
			s_BCD <= s_disp_num(3 downto 0);
			o_ssd_an <= "1110";
		when 1 =>
			s_BCD <= s_disp_num(7 downto 4);
			o_ssd_an <= "1101";
		when 2 =>
			s_BCD <= s_disp_num(11 downto 8);
			o_ssd_an <= "1011";
		when others =>
			s_BCD <= s_disp_num(15 downto 12);
			o_ssd_an <= "0111";
		end case;
	end process;
end architecture;