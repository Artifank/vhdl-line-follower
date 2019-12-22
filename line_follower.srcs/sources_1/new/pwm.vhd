library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm is
    Port(clk    : in  std_logic;
         i_duty : in  integer;
         o_pwm  : out std_logic);
end pwm;

architecture arch of pwm is
    signal slow_counter : integer := 0;
    signal pwm_counter  : integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if pwm_counter < 1000 then
                pwm_counter <= pwm_counter + 1;
            else
                pwm_counter <= 0;
            end if;
        end if;
    end process;
    o_pwm <= '1' when (pwm_counter < i_duty + 1) else '0';
end architecture;