library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity qtr_senss is
    Port(clk          : in    std_logic;
         master_clk   : in    std_logic;
         io_qtr_senss : inout std_logic_vector(15 downto 0);
         o_sens_odd   : out   std_logic;
         o_sens_even  : out   std_logic;
         o_sens_val   : out   integer;
         o_senss      : out   std_logic_vector(15 downto 0));
end entity;

architecture rtl of qtr_senss is
    component qtr_sens is
        Port(clk : in std_logic;
             master_clk : in std_logic;
             io_sens : inout std_logic;
             o_sens_ctrl : out std_logic;
             o_sens : out std_logic);
    end component;
    component numerize_sensors is
	   Port(clk        : in  std_logic;
		    i_senss    : in  std_logic_vector(15 downto 0);
		    o_sens_val : out integer);
    end component;
    signal s_senss     : std_logic_vector(15 downto 0);
    signal s_sens_odd  : std_logic_vector(15 downto 0);
    signal s_sens_even : std_logic_vector(7 downto 0);
begin
    qtr_sens_01 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(00), o_sens_ctrl => s_sens_odd(0), o_sens => s_senss(00));
    qtr_sens_02 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(01), o_sens_ctrl => s_sens_even(0), o_sens => s_senss(01));
    qtr_sens_03 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(02), o_sens_ctrl => s_sens_odd(1), o_sens => s_senss(02));
    qtr_sens_04 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(03), o_sens_ctrl => s_sens_even(1), o_sens => s_senss(03));
    qtr_sens_05 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(04), o_sens_ctrl => s_sens_odd(2), o_sens => s_senss(04));
    qtr_sens_06 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(05), o_sens_ctrl => s_sens_even(2), o_sens => s_senss(05));
    qtr_sens_07 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(06), o_sens_ctrl => s_sens_odd(3), o_sens => s_senss(06));
    qtr_sens_08 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(07), o_sens_ctrl => s_sens_even(3), o_sens => s_senss(07));
    qtr_sens_09 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(08), o_sens_ctrl => s_sens_odd(4), o_sens => s_senss(08));
    qtr_sens_10 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(09), o_sens_ctrl => s_sens_even(4), o_sens => s_senss(09));
    qtr_sens_11 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(10), o_sens_ctrl => s_sens_odd(5), o_sens => s_senss(10));
    qtr_sens_12 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(11), o_sens_ctrl => s_sens_even(5), o_sens => s_senss(11));
    qtr_sens_13 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(12), o_sens_ctrl => s_sens_odd(6), o_sens => s_senss(12));
    qtr_sens_14 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(13), o_sens_ctrl => s_sens_even(6), o_sens => s_senss(13));
    qtr_sens_15 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(14), o_sens_ctrl => s_sens_odd(7), o_sens => s_senss(14));
    qtr_sens_16 : qtr_sens Port Map(clk => clk, master_clk => master_clk, io_sens => io_qtr_senss(15), o_sens_ctrl => s_sens_even(7), o_sens => s_senss(15));
    u_numerize  : numerize_sensors Port Map(clk => clk, i_senss => s_senss, o_sens_val => o_sens_val);
    o_senss <= s_senss;
    process(s_sens_odd)
        variable v_odd  : std_logic;
        variable v_even : std_logic;
    begin
        v_odd  := '0';
        v_even := '0';
        for i in 0 to (s_sens_odd'length - 1) loop
            v_odd := v_odd or s_sens_odd(i);
        end loop;
        for i in 0 to (s_sens_even'length - 1) loop
            v_even := v_even or s_sens_even(i);
        end loop;
        o_sens_odd <= v_odd;
        o_sens_even <= v_even;
    end process;
end architecture;