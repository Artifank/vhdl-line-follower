library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture arch of testbench is
    component pwm is
        Port(clk    : in  std_logic;
             i_duty : in  integer;
             o_pwm  : out std_logic);
    end component;
    signal clk : std_logic := '0';
    signal s_duty : integer := 500;
    signal s_pwm : std_logic;
begin
    UUT : pwm Port Map(clk => clk, i_duty => s_duty, o_pwm => s_pwm);
    clk <= not clk after 5ns;
end architecture;