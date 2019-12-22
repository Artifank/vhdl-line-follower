library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pid_calibrate is
    Port(clk         : in std_logic;
         i_en        : in std_logic;
         i_up        : in std_logic;
         i_do        : in std_logic;
         i_const_slct : in std_logic_vector(1 downto 0);
         o_Kp        : out integer;
         o_Ki        : out integer;
         o_Kd        : out integer);
end entity;

architecture rtl of pid_calibrate is
    component debouncer is
        Port(clk : in  std_logic;
             i_b : in  std_logic;
             o_b : out std_logic);
    end component;
    signal s_up : std_logic;
    signal s_do : std_logic;
    signal s_Kp : integer := 50;
    signal s_Ki : integer := 0;
    signal s_Kd : integer := 3000;
    signal s_temp_up : std_logic;
    signal s_temp_do : std_logic;
    signal s_up_p : std_logic;
    signal s_do_p : std_logic;
begin
    u_up_debounce : debouncer Port Map(clk => clk, i_b => i_up, o_b => s_temp_up);
    u_do_debounce : debouncer Port Map(clk => clk, i_b => i_do, o_b => s_temp_do);
    o_Kp <= s_Kp;
    o_Ki <= s_Ki;
    o_Kd <= s_Kd;
    process(s_up, s_do)
    begin
        if rising_edge(clk) then
            s_up <= s_temp_up;
            s_do <= s_temp_do;
            s_up_p <= s_up;
            s_do_p <= s_do;
            if i_const_slct = "01" and (s_up = '1' and s_up_p = '0') then
                s_Kp <= s_Kp + 10;
            elsif i_const_slct = "10" and (s_up = '1' and s_up_p = '0') then
                s_Ki <= s_Ki + 1;
            elsif i_const_slct = "11" and (s_up = '1' and s_up_p = '0') then
                s_Kd <= s_Kd + 100;
            elsif i_const_slct = "01" and (s_do = '1' and s_do_p = '0') then
                s_Kp <= s_Kp - 10;
            elsif i_const_slct = "10" and (s_do = '1' and s_do_p = '0') then
                s_Ki <= s_Ki - 1;
            elsif i_const_slct = "11" and (s_do = '1' and s_do_p = '0') then
                s_Kd <= s_Kd - 100;
            end if;
        end if;
    end process;
end architecture;