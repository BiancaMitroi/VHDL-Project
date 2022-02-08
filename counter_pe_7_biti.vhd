library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_pe_7_biti is
	port(cl, r, count: std_logic;
	q: out std_logic_vector(6 downto 0));
end entity counter_pe_7_biti;

architecture arh_counter_pe_7_biti of counter_pe_7_biti is	

signal counter: integer;

begin  	

	process(cl)
	begin  
		if(r = '1') then
			counter <= 0;
		else
			if(cl = '1' and cl'event) then 
				if(counter = 127) then
					counter <= 0;
				else
					if(counter = 0) then counter <= 127;
					end if;
				end if;
				
				if(count = '0') then
					counter <= counter + 1;
					else
					counter <= counter - 1;	
				end if;
			end if;
		end if;
	end process;
	
	process(cl)	 
	variable count: integer;
	begin	
		count := counter;
		if(r = '0') then
			if(count > 64 or count = 64) then 
				q(6) <= '1';
				count := count - 64;
			else
				q(6) <= '0';
			end if;
			if(count > 32 or count = 32) then 
				q(5) <= '1';
				count := count - 32; 
			else
				q(5) <= '0';
			end if;
			if(count > 16 or count = 16) then 
				q(4) <= '1';
				count := count - 16;
			else
				q(4) <= '0';
			end if;	
			if(count > 8 or count = 8) then 
				q(3) <= '1';
				count := count - 8;
			else
				q(3) <= '0';
			end if;
			if(count > 4 or count = 4) then 
				q(2) <= '1';
				count := count - 4;
			else
				q(2) <= '0';
			end if;
			if(count > 2 or count = 2) then 
				q(1) <= '1';
				count := count - 2;
			else
				q(1) <= '0';
			end if;
			if(count > 1 or count = 1) then 
				q(0) <= '1';
				count := count - 1;
			else
				q(0) <= '0';
			end if;
		end if;
	end process;
end arh_counter_pe_7_biti;
