library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registru_pe_7_biti is
	port(d: inout std_logic_vector(6 downto 0);
	clk, en, reset: in std_logic;
	q: out std_logic_vector(6 downto 0));
end entity registru_pe_7_biti;
architecture arh_registru_pe_7_biti of registru_pe_7_biti is
begin	
	process (clk, en, reset)
	begin 
		if(en = '1' and reset = '1') then 
			d <= "0000000";
			else
		if(clk = '1' and clk'event and en = '1') then
			q <= d;
		end if;
		end if;
	end process;
	
end arh_registru_pe_7_biti;