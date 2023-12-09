library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_ImprovedTheromstat is

end T_ImprovedTheromstat;

architecture Behavioral of T_ImprovedTheromstat is

component ImprovedThermostat 
    Port ( current_temp : in bit_vector(6 downto 0);
           desired_temp : in bit_vector(6 downto 0);
           display_select : in bit;
           cool : in bit;
           heat : in bit;
           temp_display : out bit_vector(6 downto 0);
           a_c_on : out bit;
           furnace_on : out bit );
end component;

signal current_temp,desired_temp, temp_display : bit_vector(6 downto 0);
signal display_select,cool,heat, a_c_on,furnace_on : bit;

begin

TB: ImprovedThermostat port map ( current_temp => current_temp,
                                  desired_temp => desired_temp,
                                  display_select => display_select,
                                  cool => cool,
                                  heat => heat,
                                  temp_display => temp_display, --display_out
                                  a_c_on => a_c_on,
                                  furnace_on => furnace_on);

process
begin

current_temp <= "0001010";
desired_temp <= "0000101";
cool <= '1';
heat <= '0';
display_select <= '0';
wait for 1 us;
--a_c_on must be on

display_select <= '1';
heat <= '1'; --have no impact
wait for 1 us;
--a_c_on still on

current_temp <= "0001010";
desired_temp <= "0010100";
cool <= '0';
heat <= '1';
display_select <= '0';
wait for 1 us;
--furnace_on must be on

display_select <= '1';
cool <= '1'; --have no impact
wait for 1 us;
--furnace_on still on

end process;

end Behavioral;