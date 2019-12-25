library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
    Port(clk        : in    std_logic;
         i_sw       : in    std_logic_vector(15 downto 0);
         i_btn      : in    std_logic_vector(4 downto 0);
         io_JXADC   : inout std_logic_vector(7 downto 0)  := "ZZZZZZZZ";
         io_JA      : inout std_logic_vector(7 downto 0)  := "ZZZZZZZZ";
         io_JB      : inout std_logic_vector(7 downto 0)  := "ZZZZZZZZ";
         io_JC      : inout std_logic_vector(7 downto 0)  := "ZZZZZZZZ";
         o_led      : out   std_logic_vector(15 downto 0) := "0000000000000000";
         o_ssd_seg  : out   std_logic_vector(6 downto 0)  := "1111111";
         o_ssd_an   : out   std_logic_vector(3 downto 0)  := "1111";
         o_ssd_dp   : out   std_logic                     := '1';
         o_vgaRed   : out   std_logic_vector(3 downto 0)  := "0000";
         o_vgaGreen : out   std_logic_vector(3 downto 0)  := "0000";
         o_vgaBlue  : out   std_logic_vector(3 downto 0)  := "0000";
         o_vgaHsync : out   std_logic                     := '0';
         o_vgaVsync : out   std_logic                     := '0');
end entity;

architecture rtl of top is
    component ssd_ctrl is
	   Port(clk        : in  std_logic;
		    i_disp_num : in  integer;
		    o_ssd_segs : out std_logic_vector(6 downto 0);
		    o_ssd_an   : out std_logic_vector(3 downto 0));
    end component;
    component qtr_senss is
        Port(clk          : in    std_logic;
             master_clk   : in    std_logic;
             io_qtr_senss : inout std_logic_vector(15 downto 0);
             o_sens_odd   : out   std_logic;
             o_sens_even  : out   std_logic;
             o_sens_val   : out   integer;
             o_senss      : out   std_logic_vector(15 downto 0));
    end component;
    component pid_controller is
	   Port(clk        : in  std_logic;
		    master_clk    : in  std_logic;
		    i_sens_val : in  integer;
		    o_err      : out integer;
		    o_pid      : out integer);
    end component;
    component motor_ctrl is
        Port(clk      : in  std_logic;
		     i_pid    : in  integer;
		     i_red    : in  integer;
		     i_green  : in  integer;
		     i_blue   : in  integer;
		     o_pwmL   : out std_logic;
		     o_pwmR   : out std_logic);
    end component;
    component color_sens is
            Port(clk             : in  std_logic;
                 master_clk      : in  std_logic;
                 i_color_sens    : in  std_logic;
                 o_red           : out integer;
                 o_green         : out integer;
                 o_blue          : out integer;
                 o_color_select  : out std_logic_vector(1 downto 0);
                 o_color_scale   : out std_logic_vector(1 downto 0);
                 o_color_sens_en : out std_logic);
    end component;
    signal master_clk : std_logic;
    signal s_sens_val : integer;
    signal s_disp_num : integer;
    signal s_pid      : integer;
    signal s_red      : integer;
    signal s_green    : integer;
    signal s_blue     : integer;
    signal s_err      : integer;
begin
    with i_sw(1 downto 0) select 
        s_disp_num <= s_err when "00",
                      s_red   when "01",
                      s_green when "10",
                      s_blue  when "11";
    io_JXADC(1) <= i_sw(15);
    io_JXADC(2) <= '0';
    io_JXADC(5) <= i_sw(15);
    io_JXADC(6) <= '0';
    io_JC(3) <= '1';
    u_qtr_senss  : qtr_senss      Port Map(clk          => clk, 
                                           master_clk   => master_clk, 
                                           io_qtr_senss(7 downto 0)  => io_JB,
                                           io_qtr_senss(15 downto 8) => io_JA, 
                                           o_sens_odd   => io_JC(0), 
                                           o_sens_even  => io_JC(4), 
                                           o_sens_val   => s_sens_val, 
                                           o_senss      => o_LED);
    u_ssd_ctrl   : ssd_ctrl       Port Map(clk        => clk, 
                                           i_disp_num => s_disp_num, 
                                           o_ssd_segs => o_ssd_seg, 
                                           o_ssd_an   => o_ssd_an);
    u_pid_ctrl   : pid_controller Port Map(clk        => clk, 
                                           master_clk    => master_clk,
                                           i_sens_val => s_sens_val, 
                                           o_err      => s_err, 
                                           o_pid      => s_pid);
    u_motor_ctrl : motor_ctrl     Port Map(clk     => clk, 
                                           i_pid   => s_pid,
                                           i_red   => s_red,
                                           i_green => s_green,
                                           i_blue  => s_blue, 
                                           o_pwmL  => io_JXADC(0), 
                                           o_pwmR  => io_JXADC(4));
    u_color_sens : color_sens     Port Map(clk            => clk, 
                                           master_clk     => master_clk, 
                                           i_color_sens   => io_JXADC(3), 
                                           o_red          => s_red, 
                                           o_green        => s_green, 
                                           o_blue         => s_blue, 
                                           o_color_select => io_JC(6 downto 5), 
                                           o_color_scale  => io_JC(2 downto 1));
    process(clk)
        variable v_counter : integer;
    begin
        if rising_edge(clk) then
            if v_counter < 300000 then
                v_counter := v_counter + 1;
            else
                v_counter := 0;
                master_clk <= not master_clk;
            end if;
        end if;
    end process;
end architecture;