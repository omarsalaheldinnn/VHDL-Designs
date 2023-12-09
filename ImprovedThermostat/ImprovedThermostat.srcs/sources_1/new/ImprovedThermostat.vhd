library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity improvedthermostat is
    Port ( current_temp : in bit_vector(6 downto 0);
           desired_temp : in bit_vector(6 downto 0);
           display_select : in bit;
           cool : in bit;
           heat : in bit;
           temp_display : out bit_vector(6 downto 0);
           a_c_on : out bit;
           furnace_on : out bit );
end improvedthermostat;

architecture behav of improvedthermostat is
begin

MUX: process (current_temp,desired_temp,display_select)
begin

if display_select = '1' then
    temp_display <= current_temp;
else 
    temp_display <= desired_temp;
end if;

end process;

NEW_FEATURE: process (current_temp,desired_temp,display_select,cool,heat)
begin

if cool = '1' and desired_temp < current_temp then
    a_c_on <= '1';    
else 
    a_c_on <= '0';
end if; --Complete if

furnace_on <= '0'; --Default Assignment
if heat = '1' and desired_temp > current_temp then
    furnace_on <= '1';    
end if;

end process;

end behav;