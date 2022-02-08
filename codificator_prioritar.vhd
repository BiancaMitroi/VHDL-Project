library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity codificator_prioritar is
	port(i0, i1, i2, i3, i4,i5, i6, i7, i8, i9, i10, en: in std_logic;
	a3, a2, a1, a0, gs: out std_logic);	
end entity codificator_prioritar;
architecture arh_codificator_prioritar of codificator_prioritar is
begin	  
	gs <= en and (i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or i8 or i9 or i10);
	a3 <= en and ((not i0) and (not i1) and (not i2) and (not i3) and (not i4) and (not i5) and (not i6) and (not i7));
	a2 <= en and ((not i0) and (not i1) and (not i2) and (not i3) and (not i8) and (not i9) and (not i10));
	a1 <= en and ((not i0) and (not i1) and (not i4) and (not i5) and (not i8) and (not i9));
	a0 <= en and ((not i0) and (not i2) and (not i4) and (not i6) and (not i8) and (not i10));
end arh_codificator_prioritar;
