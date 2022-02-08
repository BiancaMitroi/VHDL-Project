library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator_1_bit is
	port(a, b: in std_logic;
	a_mai_mare_ca_b, a_egal_cu_b, a_mai_mic_ca_b: out std_logic);
end entity comparator_1_bit;
architecture arh_comparator_1_bit of comparator_1_bit is
begin	
	a_mai_mare_ca_b <= a and (not b);
	a_egal_cu_b <= a xnor b;
	a_mai_mic_ca_b <= (not a) and b;
end arh_comparator_1_bit;
