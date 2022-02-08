library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  

entity impartitor_pe_7_biti is
	port(al, bl: in std_logic_vector(6 downto 0);
	cat, rest: out std_logic_vector(6 downto 0);
	ck, res: in std_logic);
end entity impartitor_pe_7_biti; 

architecture arh_impartitor_pe_7_biti of impartitor_pe_7_biti is 
signal as,bs,cs, rs: integer;
signal ti: std_logic;
begin	
	process(res)
	variable a, b: integer;
	begin
		if(res = '1') then
		as <= 0;
		bs <= 0;
		
		a := 0;
		b := 0;
		if(al(0) = '1') then a := a + 1;
		end if;
		if(al(1) = '1') then a := a + 2;
		end if;
		if(al(2) = '1') then a := a + 4;
		end if;
		if(al(3) = '1') then a := a + 8;
		end if;
		if(al(4) = '1') then a := a + 16;
		end if;
		if(al(5) = '1') then a := a + 32;
		end if;
		if(al(6) = '1') then a := a + 64;
		end if;	
		
		if(bl(0) = '1') then b := b + 1;
		end if;
		if(bl(1) = '1') then b := b + 2;
		end if;
		if(bl(2) = '1') then b := b + 4;
		end if;
		if(bl(3) = '1') then b := b + 8;
		end if;
		if(bl(4) = '1') then b := b + 16;
		end if;
		if(bl(5) = '1') then b := b + 32;
		end if;
		if(bl(6) = '1') then b := b + 64;
		end if;	
		end if;	
		as <= a;
		bs <= b;
	end process;
	
	
	process(ck)
	variable catul_partial, restul_partial: integer; 
	begin 
		ti <= '0';
		if(res = '0') then
			catul_partial := as / bs; 
			restul_partial := as mod bs;
			ti <= '1';
				end if;
		cs <= catul_partial;
		rs <= restul_partial;
	end process;
	
	
	
	process(ck)
	variable cf, rf: integer;
	begin	
		cf := cs;
		rf := rs;
		if(ti = '1') then
			if(cf > 64 or cf = 64) then 
				cat(6) <= '1';
				cf := cf - 64;
			else
				cat(6) <= '0';
			end if;
			if(cf > 32 or cf = 32) then 
				cat(5) <= '1';
				cf := cf - 32; 
			else
				cat(5) <= '0';
			end if;
			if(cf > 16 or cf = 16) then 
				cat(4) <= '1';
				cf := cf - 16;
			else
				cat(4) <= '0';
			end if;	
			if(cf > 8 or cf = 8) then 
				cat(3) <= '1';
				cf := cf - 8;
			else
				cat(3) <= '0';
			end if;
			if(cf > 4 or cf = 4) then 
				cat(2) <= '1';
				cf := cf - 4;
			else
				cat(2) <= '0';
			end if;
			if(cf > 2 or cf = 2) then 
				cat(1) <= '1';
				cf := cf - 2;
			else
				cat(1) <= '0';
			end if;
			if(cf > 1 or cf = 1) then 
				cat(0) <= '1';
				cf := cf - 1;
			else
				cat(0) <= '0';
			end if;
			
			
			if(rf > 64 or rf = 64) then 
				rest(6) <= '1';
				rf := rf - 64;
			else
				rest(6) <= '0';
			end if;
			if(rf > 32 or rf = 32) then 
				rest(5) <= '1';
				rf := rf - 32; 
			else
				rest(5) <= '0';
			end if;
			if(rf > 16 or rf = 16) then 
				rest(4) <= '1';
				rf := rf - 16;
			else
				rest(4) <= '0';
			end if;	
			if(rf > 8 or rf = 8) then 
				rest(3) <= '1';
				rf := rf - 8;
			else
				rest(3) <= '0';
			end if;
			if(rf > 4 or rf = 4) then 
				rest(2) <= '1';
				rf := rf - 4;
			else
				rest(2) <= '0';
			end if;
			if(rf > 2 or rf = 2) then 
				rest(1) <= '1';
				rf := rf - 2;
			else
				rest(1) <= '0';
			end if;
			if(rf > 1 or rf = 1) then 
				rest(0) <= '1';
				rf := rf - 1;
			else
				rest(0) <= '0';
			end if;
		end if;
		
	end process;
	
	
end arh_impartitor_pe_7_biti;