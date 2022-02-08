library IEEE;

use IEEE.std_logic_1164.all;

entity mux_8_la_1_7_biti_date is

port (sel : in std_logic_vector(2 downto 0);

A,B,C,D,E,F,G,H: in std_logic_vector(6 downto 0);

Y : out std_logic_vector(6 downto 0));

end mux_8_la_1_7_biti_date;

architecture arh_mux_8_la_1_7_biti_date of mux_8_la_1_7_biti_date is

begin
	process 
	begin

case sel is

when "000" => Y <=A;

when "001" => Y <=B;

when "010" => Y <=C;

when "011" => Y <=D;

when "100" => Y <=E;

when "101" => Y <=F;

when "110" => Y <=G;

when others => Y <=H;

end case;	
wait on sel;
end process;


end arh_mux_8_la_1_7_biti_date;