library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumator_1_bit is
	port(a, b, cin: in std_logic;
	s, cout: out std_logic);
end entity sumator_1_bit;
architecture arh_sumator_1_bit of sumator_1_bit is
begin	  
	s <= (a xor b) xor cin;
	cout <= (a and cin) or (b and cin) or (a and b);
end arh_sumator_1_bit;
