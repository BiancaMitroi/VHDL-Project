library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  

entity inmultitor_pe_7_biti is
	port(al, bl: in std_logic_vector(6 downto 0);
	f: out std_logic_vector(6 downto 0);
	ck, res: in std_logic);
end entity inmultitor_pe_7_biti; 

architecture arh_inmultitor_pe_7_biti of inmultitor_pe_7_biti is 
signal as,bs,ss: integer;
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
	variable suma_partiala: integer; 
	variable counter: integer;
	begin 
		ti <= '0';
		if(res = '0') then 
			suma_partiala := as * bs;
			ti <= '1';
		end if;
		ss <= suma_partiala;
	end process;
	
	
	process(ck)
	variable ff: integer;
	begin	
		ff := ss;
		if(ti = '1') then
			if(ff > 64 or ff = 64) then 
				f(6) <= '1';
				ff := ff - 64;
			else
				f(6) <= '0';
			end if;
			if(ff > 32 or ff = 32) then 
				f(5) <= '1';
				ff := ff - 32; 
			else
				f(5) <= '0';
			end if;
			if(ff > 16 or ff = 16) then 
				f(4) <= '1';
				ff := ff - 16;
			else
				f(4) <= '0';
			end if;	
			if(ff > 8 or ff = 8) then 
				f(3) <= '1';
				ff := ff - 8;
			else
				f(3) <= '0';
			end if;
			if(ff > 4 or ff = 4) then 
				f(2) <= '1';
				ff := ff - 4;
			else
				f(2) <= '0';
			end if;
			if(ff > 2 or ff = 2) then 
				f(1) <= '1';
				ff := ff - 2;
			else
				f(1) <= '0';
			end if;
			if(ff > 1 or ff = 1) then 
				f(0) <= '1';
				ff := ff - 1;
			else
				f(0) <= '0';
			end if;
		end if;
		
	end process;
	
	
end arh_inmultitor_pe_7_biti;
