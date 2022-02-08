library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registru_pe_4_biti is
	port(d: inout std_logic_vector(3 downto 0);
	clk, reset: in std_logic;
	q: out std_logic_vector(3 downto 0));
end entity registru_pe_4_biti;
architecture arh_registru_pe_4_biti of registru_pe_4_biti is
begin
	process (clk,reset)
	begin 
		if(reset = '1') then
		d <= "0000";
		else
		if(clk = '1' and clk'event) then
			q <= d;
		end if;	
		end if;
	end process;
	
end arh_registru_pe_4_biti;

