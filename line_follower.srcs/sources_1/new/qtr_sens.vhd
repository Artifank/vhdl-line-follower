library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity qtr_sens is
	Port(clk         : in     std_logic;
		 master_clk     : in     std_logic;
		 io_sens     : inout  std_logic;
		 o_sens      : out    std_logic;
		 o_sens_ctrl : out    std_logic);
end entity;

architecture rtl of qtr_sens is
    signal s_r_clk         : std_logic;
    signal s_senss         : std_logic_vector(6 downto 0);
    signal s_sens          : std_logic := '0';
	signal s_count_en      : std_logic := '0';
	signal s_setup_counter : integer := 0;
	signal s_counter       : std_logic_vector(19 downto 0) := (others => '0');
	signal s_time          : std_logic_vector(19 downto 0) := (others => '0');
	signal s_setup_en      : std_logic := '0';
begin
	process(clk)
	begin
		if rising_edge(clk) then
		    if s_r_clk = '1' then
                s_setup_en <= '1';
                s_r_clk <= '0';
            else
                s_r_clk <= master_clk;
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
				    s_counter <= (others => '0');
					s_senss(0) <= '0' when s_counter < x"8000" else '1';
                    for i in 1 to (s_senss'length - 1) loop
                        s_senss(i) <= s_senss(i-1);
                    end loop;
					s_count_en <= '0';
				end if;
			end if;
		end if;
	end process;
    process(s_senss)
        variable v_and : std_logic;
        variable v_nand : std_logic;
    begin
        v_and := '1';
        v_nand := '1';
        for i in 0 to (s_senss'length - 1) loop
            v_and := v_and and s_senss(i);
            v_nand := v_nand and not s_senss(i);
        end loop;
    s_sens <= '1' when v_and = '1' else
              '0' when v_nand = '1' else
              s_sens;
    end process;
    o_sens <= s_sens;
end architecture;