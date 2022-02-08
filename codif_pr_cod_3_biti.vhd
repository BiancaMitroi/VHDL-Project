library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 

entity codif_3 is
	port(int : in std_logic_vector(5 downto 0);
	y: out std_logic_vector(2 downto 0));
end entity codif_3;

architecture arh_codif_3 of codif_3 is
begin	
	process(int)
	begin	
		y <= "000";
		if(int(0) = '1') then y <= "000";
		end if;
		if(int(1) = '1') then y <= "001";
		end if;
		if(int(2) = '1') then y <= "010";
		end if;
		if(int(3) = '1') then y <= "011";
		end if;
		if(int(4) = '1') then y <= "100";
		end if;
		if(int(5) = '1') then y <= "101";
		end if;
	end process;
end arh_codif_3;
