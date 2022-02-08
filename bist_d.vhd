library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity D_FF is
PORT( D,CLOCK, RESET: in std_logic;
Q: out std_logic);
end D_FF;
 
architecture behavioral of D_FF is
begin
process(CLOCK, RESET)
begin 
	if(RESET = '1')	then
		Q <= '0';
		else
		if(CLOCK='1' and CLOCK'EVENT) then
			Q <= D;
		end if;	
	end if;
end process;
end behavioral;
