library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity color_sens is
    Port(clk             : in  std_logic;
         master_clk         : in  std_logic;
         i_color_sens    : in  std_logic;
         o_red           : out integer;
         o_green         : out integer;
         o_blue          : out integer;
         o_color_select  : out std_logic_vector(1 downto 0);
         o_color_scale   : out std_logic_vector(1 downto 0);
         o_color_sens_en : out std_logic);
end entity;

architecture rtl of color_sens is
    signal k_red_max          : integer := 67328;
    signal k_red_min          : integer := 8192;
    signal k_green_max        : integer := 64256;
    signal k_green_min        : integer := 5632;
    signal k_blue_max         : integer := 47872;
    signal k_blue_min         : integer := 7424;
    signal s_red              : integer;
    signal s_green            : integer;
    signal s_blue             : integer;
    signal s_color_sens       : std_logic;
    signal s_counter_en       : std_logic;
    signal s_red_counter      : integer;
    signal s_green_counter    : integer;
    signal s_blue_counter     : integer;
    signal s_red_set          : std_logic;
    signal s_green_set        : std_logic;
    signal s_blue_set         : std_logic;
    signal s_color_counter    : std_logic_vector(1 downto 0);
begin
    o_color_sens_en <= '1';
    o_color_scale   <= "11";
    o_red   <= 0 when (s_red < k_red_min) else 255 when (s_red > k_red_max) else (225*(k_red_max - s_red)/(k_red_max - k_red_min));
    o_green <= 0 when (s_green < k_green_min) else 255 when (s_green > k_green_max) else (225*(k_green_max - s_green)/(k_green_max - k_green_min));
    o_blue  <= 0 when (s_blue < k_blue_min) else 255 when (s_blue > k_blue_max) else (225*(k_blue_max - s_blue)/(k_blue_max - k_blue_min));
    process(master_clk)
    begin
        if rising_edge(master_clk) then
            if s_color_counter < "10" then
                s_color_counter <= s_color_counter + 1;
            else
                s_color_counter <= "00";
            end if;
        end if;
    end process;

    process(s_color_sens)
    begin
        if rising_edge(s_color_sens) then
            s_counter_en <= not s_counter_en;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            s_color_sens <= i_color_sens;
            if s_color_counter = "00" then
                o_color_select <= "00";
                s_green_counter <= 0;
                s_blue_counter <= 0;
                if s_counter_en = '1' then
                    s_red_counter <= s_red_counter + 1;
                    s_red_set <= '1';
                elsif s_red_set = '1' then
                    s_red_counter <= 0;
                    s_red <= s_red_counter;
                    s_red_set <= '0';
                end if;
            elsif s_color_counter = "01" then
                o_color_select <= "11";
                s_red_counter <= 0;
                s_blue_counter <= 0;
                if s_counter_en = '1' then
                    s_green_counter <= s_green_counter + 1;
                    s_green_set <= '1';
                elsif s_green_set = '1' then
                    s_green_counter <= 0;
                    s_green <= s_green_counter;
                    s_green_set <= '0';
                end if;
            else
                o_color_select <= "10";
                s_red_counter <= 0;
                s_green_counter <= 0;
                if s_counter_en = '1' then
                    s_blue_counter <= s_blue_counter + 1;
                    s_blue_set <= '1';
                elsif s_blue_set = '1' then
                    s_blue_counter <= 0;
                    s_blue <= s_blue_counter;
                    s_blue_set <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture;