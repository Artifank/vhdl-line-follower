library IEEE;
use IEEE.std_logic_1164.ALL;

entity line_follower is
    Port(clk_100MHz       : in  std_logic;
         i_dutyL, i_dutyR : in  std_logic_vector(3 downto 0);
         i_enable         : in  std_logic;
         i_reverse        : in  std_logic;
         o_L1,o_L2        : out std_logic;
         o_pwmL           : out std_logic;
         o_R1, o_R2       : out std_logic;
         o_pwmR           : out std_logic;
         o_leds           : out std_logic_vector(15 downto 0) := (others => '0'));
end line_follower;

architecture line_follower_arch of line_follower is
    component pwm is
        Port(clk_100MHz : in  std_logic;
             i_duty     : in  std_logic_vector(3 downto 0);
             o_pwm      : out std_logic);
    end component;
begin
    pwmL : pwm Port Map(clk_100MHz => clk_100MHz, i_duty => i_dutyL, o_pwm => o_pwmL);
    pwmR : pwm Port Map(clk_100MHz => clk_100MHz, i_duty => i_dutyR, o_pwm => o_pwmR);
    o_L1 <= i_enable and not i_reverse;
    o_L2 <= i_enable and i_reverse;
    o_R1 <= i_enable and not i_reverse;
    o_R2 <= i_enable and i_reverse;
    process(clk_100MHz)
    begin
        if rising_edge(clk_100MHz) then
            o_leds(3 downto 0) <= i_dutyL;
            o_leds(7) <= i_enable;
            o_leds(8) <= i_reverse;
            o_leds(15 downto 12) <= i_dutyR;
        end if;
    end process;
end line_follower_arch;

-- grou project test by Batuhan Gumus