library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity scazator_pe_7_biti is
	port(a, b: in std_logic_vector(6 downto 0);
	dif: out std_logic_vector(6 downto 0);
	negativ: out std_logic);
end entity scazator_pe_7_biti;
architecture arh_scazator_pe_7_biti of scazator_pe_7_biti is 
signal n, m, r: integer;
begin	  
	process(a,b)
	variable x,y: integer;
	begin  
		x := 0;
		y := 0;
		if(a(0) = '1') then x := x + 1;
		end if;
		if(a(1) = '1') then x := x + 2;
		end if;
		if(a(2) = '1') then x := x + 4;
		end if;
		if(a(3) = '1') then x := x + 8;
		end if;
		if(a(4) = '1') then x := x + 16;
		end if;
		if(a(5) = '1') then x := x + 32;
		end if;
		if(a(6) = '1') then x := x + 64;
		end if;	
		
		if(b(0) = '1') then y := y + 1;
		end if;
		if(b(1) = '1') then y := y + 2;
		end if;
		if(b(2) = '1') then y := y + 4;
		end if;
		if(b(3) = '1') then y := y + 8;
		end if;
		if(b(4) = '1') then y := y + 16;
		end if;
		if(b(5) = '1') then y := y + 32;
		end if;
		if(b(6) = '1') then y := y + 64;
		end if;	
	
		m <= x;
		n <= y;
end process;

	process(m,n)
	begin 
		negativ <= '0';
		r <= m - n;
		if(r < 0) then negativ <= '1'; 
			r <= n - m;
			end if;
	end process;  
	
	process(r) 
	variable p: integer;
	begin 
		 p := r;
		if(p > 64 or p = 64) then 
				dif(6) <= '1';
				p := p - 64;
			else
				dif(6) <= '0';
			end if;
			if(p > 32 or p = 32) then 
				dif(5) <= '1';
				p := p - 32; 
			else
				dif(5) <= '0';
			end if;
			if(p > 16 or p = 16) then 
				dif(4) <= '1';
				p := p - 16;
			else
				dif(4) <= '0';
			end if;	
			if(p > 8 or p = 8) then 
				dif(3) <= '1';
				p := p - 8;
			else
				dif(3) <= '0';
			end if;
			if(p > 4 or p = 4) then 
				dif(2) <= '1';
				p := p - 4;
			else
				dif(2) <= '0';
			end if;
			if(p > 2 or p = 2) then 
				dif(1) <= '1';
				p := p - 2;
			else
				dif(1) <= '0';
			end if;
			if(p > 1 or p = 1) then 
				dif(0) <= '1';
				p := p - 1;
			else
				dif(0) <= '0';
			end if;	 
		end process;
end arh_scazator_pe_7_biti;