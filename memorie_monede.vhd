library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
entity mem_monede is
	port(int : in std_logic_vector(3 downto 0);
	y: out std_logic_vector(6 downto 0));
end entity mem_monede;

architecture arh_mem_monede of mem_monede is
begin	
	process(int)
	begin	
		y <= "0000000";
		if(int = "0000") then y <= "0110010";
		end if;
		if(int = "0001") then y <= "0010100";
		end if;
		if(int = "0010") then y <= "0001010";
		end if;
		if(int = "0011") then y <= "0000101";
		end if;
		if(int = "0100") then y <= "0000010";
		end if;
		if(int = "0101") then y <= "0000001";
		end if;
	end process;
end arh_mem_monede;