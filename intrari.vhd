library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity intrari is
	port(s1, s2, s3, s4, s5, s6, s7, s8, b1, b2, b3, b4, b5: in std_logic;
	cif0, cif1, cif2, cif3, cif4, cif5, cif6, cif7, cif8, cif9, c, c50, c20, c10, c5, c2, c1, inc: out std_logic);
end entity intrari;
architecture arh_intrari of intrari is
begin
	cif0 <= (not s1) and (not s2) and (not s3) and b1;
	cif1 <= (not s1) and (not s2) and (not s3) and b2;
	cif2 <= (not s1) and (not s2) and (not s3) and b3;
	cif3 <= (not s1) and (not s2) and s3 and b1;
	cif4 <= (not s1) and (not s2) and s3 and b2;
	cif5 <= (not s1) and (not s2) and s3 and b3;
	cif6 <= (not s1) and s2 and (not s3) and b1;
	cif7 <= (not s1) and s2 and (not s3) and b2;
	cif8 <= (not s1) and s2 and (not s3) and b3;
	cif9 <= (not s1) and s2 and s3 and b1;
	c <= (not s1) and s2 and s3 and b2;
	c50 <= s1 and (not s2) and s3;
	c20 <= s1 and (not s2) and s4;
	c10 <= s1 and (not s2) and s5;
	c5 <= s1 and (not s2) and s6;
	c2 <= s1 and (not s2) and s7;
	c1 <= s1 and (not s2) and s8;
	inc <= s1 and (not s2) and b3;
end arh_intrari;
