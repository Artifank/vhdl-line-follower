library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

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
             i_sel      : in  std_logic;
		     i_disp_num : in  integer;
		     o_ssd_segs : out std_logic_vector(6 downto 0);
		     o_ssd_an   : out std_logic_vector(3 downto 0));
    end component;
    signal freq_counter : integer := 0;
    signal meas_en      : std_logic := '0';
    signal freq_count   : integer;
    signal s_freq       : std_logic;
    signal output_set   : std_logic;
begin
    io_JC(3) <= '1';
    io_JC(2 downto 1) <= i_sw(15 downto 14);
    io_JC(6 downto 5) <= i_sw(0)&i_sw(1);
    u_ssd_ctrl : ssd_ctrl Port Map(clk => clk, i_sel => i_sw(2), i_disp_num => freq_count, o_ssd_segs => o_ssd_seg, o_ssd_an => o_ssd_an);
    process(clk, io_JXADC)
    begin
        if rising_edge(s_freq) then
            meas_en <= not meas_en;
        end if;
        if rising_edge(clk) then
            s_freq <= io_JXADC(3);
            if meas_en = '1' then
                freq_counter <= freq_counter + 1;
                output_set <= '1';
            elsif output_set = '1' then
                freq_count <= freq_counter;
                output_set <= '0';
                freq_counter <= 0;
            end if;
        end if;
    end process;
end architecture;