library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity qtr_calibrate is
    Port(clk           : in    std_logic;
         i_sens_slct   : in    std_logic_vector(3 downto 0);
         i_minmax_slct : in    std_logic;
         io_senss      : inout std_logic_vector(15 downto 0);
         o_sens_odd    : out   std_logic;
         o_sens_even   : out   std_logic;
         o_ssd_segs    : out   std_logic_vector(7 downto 0);
         o_ssd_an      : out   std_logic_vector(3 downto 0));
end entity;

architecture rtl of qtr_calibrate is
    component qtr_sens_time is
        Port(clk : in std_logic;
             qtr_clk     : in    std_logic;
             io_sens     : inout std_logic;
             o_sens_time : out   integer;
             o_sens_ctrl : out   std_logic;
    end component;
    component ssd_ctrl is
        Port(clk : in std_logic;
             i_disp_num : in std_logic_vector(15 downto 0);
             o_ssd_segs : out std_logic_vector(7 downto 0);
             o_ssd_an   : out std_logic_vector(3 downto 0));
    end component;
    type vals is array(15 downto 0) of integer;
    signal s_temp_times : vals := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    signal s_max_times  : vals := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    signal s_min_times  : vals := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    signal s_qtr_clk    : std_logic;
    signal s_qtr_cntr   : integer;
    signal s_sens_odd   : std_logic_vector(7 downto 0);
    signal s_sens_even  : std_logic_vector(7 downto 0);
    signal s_disp_num   : std_logic_vector(15 downto 0);
begin
    process(clk)
    begin
        if s_qtr_cntr < 499999 then
            s_qtr_cntr <= s_qtr_cntr + 1;
        else
            s_qtr_cntr <= 0;
            s_qtr_clk <= not s_qtr_clk;
        end if;
    end process;

    u_qtr_01 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(00), o_sens_time => s_temp_times(00), o_sens_ctrl => s_sens_odd(0));
    u_qtr_02 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(01), o_sens_time => s_temp_times(01), o_sens_ctrl => s_sens_even(0));
    u_qtr_03 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(02), o_sens_time => s_temp_times(02), o_sens_ctrl => s_sens_odd(1));
    u_qtr_04 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(03), o_sens_time => s_temp_times(03), o_sens_ctrl => s_sens_even(1));
    u_qtr_05 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(04), o_sens_time => s_temp_times(04), o_sens_ctrl => s_sens_odd(2));
    u_qtr_06 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(05), o_sens_time => s_temp_times(05), o_sens_ctrl => s_sens_even(2));
    u_qtr_07 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(06), o_sens_time => s_temp_times(06), o_sens_ctrl => s_sens_odd(3));
    u_qtr_08 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(07), o_sens_time => s_temp_times(07), o_sens_ctrl => s_sens_even(3));
    u_qtr_09 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(08), o_sens_time => s_temp_times(08), o_sens_ctrl => s_sens_odd(4));
    u_qtr_10 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(09), o_sens_time => s_temp_times(09), o_sens_ctrl => s_sens_even(4));
    u_qtr_11 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(10), o_sens_time => s_temp_times(10), o_sens_ctrl => s_sens_odd(5));
    u_qtr_12 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(11), o_sens_time => s_temp_times(11), o_sens_ctrl => s_sens_even(5));
    u_qtr_13 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(12), o_sens_time => s_temp_times(12), o_sens_ctrl => s_sens_odd(6));
    u_qtr_14 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(13), o_sens_time => s_temp_times(13), o_sens_ctrl => s_sens_even(6));
    u_qtr_15 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(14), o_sens_time => s_temp_times(14), o_sens_ctrl => s_sens_odd(7));
    u_qtr_16 : qtr_sens_time Port Map(clk => clk, qtr_clk => qtr_clk, io_sens => io_senss(15), o_sens_time => s_temp_times(15), o_sens_ctrl => s_sens_even(7));

    process(qtr_clk)
    begin
        if rising_edge(qtr_clk) then
            for i in 0 to (s_temp_time'length - 1) loop
                s_max_times(i) <= s_temp_times(i) when (s_temp_times(i) > s_max_times(i)) else s_max_times(i);
                s_min_times(i) <= s_temp_times(i) when (s_temp_times(i) < s_min_times(i)) else s_min_times(i);
            end loop;
        end if;
    end process;

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
    
    u_ssd_ctrl : ssd_ctrl Port Map(clk => clk, i_disp_num => s_disp_num, o_ssd_segs => o_ssd_segs, o_ssd_an => o_ssd_an);
    process(i_sens_slct, i_minmax_slct);
    begin
        case i_minmax_slct is
            when '0' =>
                s_disp_num <= s_min_times(to_integer(unsigned(i_sens_slct)));
            when others =>
                s_disp_num <= s_max_times(to_integer(unsigned(i_sens_slct)));
        end case;
    end process;
    
end architecture;