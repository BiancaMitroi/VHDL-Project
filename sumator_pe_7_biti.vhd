library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumator_pe_7_biti is
	port( an, bn: in std_logic_vector(6 downto 0);
	cinn: in std_logic;
	coutn: out std_logic;
	sn: out std_logic_vector(6 downto 0));	
end entity sumator_pe_7_biti;
architecture sumator_pe_7_biti of sumator_pe_7_biti is 

component sumator_1_bit is
	 port(a, b, cin: in std_logic;
	 s, cout: out std_logic); 
end component;

signal cin1, cin2, cin3, cin4, cin5, cin6: std_logic;

begin  
	b1:	sumator_1_bit port map (a => an(0), b => bn(0), cin => cinn, s => sn(0), cout => cin1);
	b2:	sumator_1_bit port map (a => an(1), b => bn(1), cin => cin1, s => sn(1), cout => cin2);
	b3:	sumator_1_bit port map (a => an(2), b => bn(2), cin => cin2, s => sn(2), cout => cin3);
	b4:	sumator_1_bit port map (a => an(3), b => bn(3), cin => cin3, s => sn(3), cout => cin4);
	b5:	sumator_1_bit port map (a => an(4), b => bn(4), cin => cin4, s => sn(4), cout => cin5);
	b6:	sumator_1_bit port map (a => an(5), b => bn(5), cin => cin5, s => sn(5), cout => cin6);
	b7:	sumator_1_bit port map (a => an(0), b => bn(0), cin => cinn, s => sn(0), cout => cin1);
end sumator_pe_7_biti;
