library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity memorie_rom is
	port(a: in std_logic_vector(3 downto 0);
	d: out std_logic_vector(6 downto 0));
end entity memorie_rom;
architecture arh_memorie_rom of memorie_rom is
begin 
	d(0) <=	((not a(3)) and (not a(2)) and (not a(1)) and a(0)) or (a(2) and (not a(1)) and (not a(0))) or (a(3) and a(1));
	d(1) <=	(a(2) and (not a(1)) and a(0)) or (a(2) and a(1) and (not a(0))) or (a(3) and a(1));
	d(2) <=	(not a(2)) and a(1) and (not a(0));
	d(3) <=	((not a(3)) and (not a(2)) and (not a(1)) and a(0)) or (a(2) and (not a(1)) and (not a(0)))	or (a(2) and a(1) and a(0)) or (a(3) and a(1));
	d(4) <=	a(0) or (a(2) and (not a(1))) or (a(3) and a(1));
	d(5) <=	((not a(3)) and (not a(2)) and a(0)) or ((not a(2)) and a(1)) or (a(1) and a(0));
	d(6) <=	((not a(3)) and (not a(2)) and (not a(1))) or (a(2) and a(1) and a(0)) or (a(3) and a(1));
end arh_memorie_rom;
