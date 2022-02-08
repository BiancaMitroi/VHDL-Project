
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity afisaj is
    Port ( anod : in STD_LOGIC_VECTOR (3 downto 0);
	catod : in STD_LOGIC_VECTOR (6 downto 0);
	led: out std_logic_vector(27 downto 0));
end afisaj;

architecture arh_afisaj of afisaj is
begin
	led(0) <= anod(0) and (not catod(0));
	led(1) <= anod(0) and (not catod(1));
	led(2) <= anod(0) and (not catod(2));
	led(3) <= anod(0) and (not catod(3)); 
	led(4) <= anod(0) and (not catod(4));
	led(5) <= anod(0) and (not catod(5));
	led(6) <= anod(0) and (not catod(6));
	
	led(7) <= anod(1) and (not catod(0));	
	led(8) <= anod(1) and (not catod(1));
	led(9) <= anod(1) and (not catod(2));
	led(10) <= anod(1) and (not catod(3));
	led(11) <= anod(1) and (not catod(4)); 
	led(12) <= anod(1) and (not catod(5));
	led(13) <= anod(1) and (not catod(6));
	
	led(14) <= anod(2) and (not catod(0));
	led(15) <= anod(2) and (not catod(1)); 
	led(16) <= anod(2) and (not catod(2));
	led(17) <= anod(2) and (not catod(3));
	led(18) <= anod(2) and (not catod(4));
	led(19) <= anod(2) and (not catod(5)); 
	led(20) <= anod(2) and (not catod(6));
	
	led(21) <= anod(3) and (not catod(0));
	led(22) <= anod(3) and (not catod(1));
	led(23) <= anod(3) and (not catod(2));	
	led(24) <= anod(3) and (not catod(3));
	led(25) <= anod(3) and (not catod(4));
	led(26) <= anod(3) and (not catod(5));
	led(27) <= anod(3) and (not catod(6)); 
	 
end arh_afisaj;