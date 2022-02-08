library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity counter_pe_2_biti is
	port(r, c: in std_logic;
	q1, q0: out std_logic);
end entity counter_pe_2_biti;
architecture arh_counter_pe_2_biti of counter_pe_2_biti is 

signal d0: integer;
begin 
	process(c)
	variable d: integer;
	begin 
		d := 0;
		if(r = '1') then 
			d := 0;
		else
			d := d + 1;
		end if;	
		d0 <= d;
	end process;
	
	process(c)
	begin 
		if(d0 = 3) then 
			q1 <= '1';
			q0 <= '1';
		end if;
		if(d0 = 2) then 
			q1 <= '1';
			q0 <= '0';
		end if;
		if(d0 = 1) then 
			q1 <= '0';
			q0 <= '1';
		end if;
		if(d0 = 0) then 
			q1 <= '0';
			q0 <= '0';
		end if;
	end process;
	
end arh_counter_pe_2_biti;
