library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity master_ctrl is
    Port(clk : std_logic;
         i_master_sw : in  std_logic;
         i_master_bt : in  std_logic;
         o_master_en : out std_logic);
end entity;

architecture rtl of master_ctrl is
    component debouncer is
        Port(clk : std_logic;
             i_b : std_logic;
             o_b : std_logic);
    end component;
    signal s_master_bt : std_logic;
    signal s_master_bt_p : std_logic;
    signal s_counter_en : std_logic;
    signal s_master_en : std_logic;
begin
    u_debounce : debouncer Port Map(clk => clk, i_b => i_master_bt, o_b => s_master_bt);
    process(clk)
        variable v_counter : integer;
    begin
        if rising_edge(clk) then
            s_master_bt_p <= s_master_bt;
            if i_master_sw = '0' then
                s_master_en <= '1';
            elsif s_master_bt = '1' and s_master_bt_p = '0' then
                s_counter_en <= '1';
            end if;
            
            
        end if;
    end process;
end architecture;