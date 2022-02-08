library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity demux_1_la_4_cu_1_bit_date is
 port(
 
 F : in STD_LOGIC;
 S0,S1: in STD_LOGIC;
 A,B,C,D: out STD_LOGIC
 );
end demux_1_la_4_cu_1_bit_date;
 
architecture arh_demux_1_la_4_cu_1_bit_date of demux_1_la_4_cu_1_bit_date is
begin
process (F,S0,S1) is
begin
 if (S0 ='0' and S1 = '0') then
 A <= F;
 elsif (S0 ='1' and S1 = '0') then
 B <= F;
 elsif (S0 ='0' and S1 = '1') then
 C <= F;
 else
 D <= F;
 end if;
 
end process;
end arh_demux_1_la_4_cu_1_bit_date;
