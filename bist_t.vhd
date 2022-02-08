library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bist_t is
port( T: in std_logic;
Clock, Reset: in std_logic;
Q: inout std_logic);
end bist_t;
 
architecture arh_bist_t of bist_t is
signal tmp: std_logic;
begin
process (Clock, Reset)
begin  
if Reset = '1' then tmp <= '0';
elsif Clock'event and Clock='1' then
 
if T='0' then
tmp <= Q;
elsif T='1' then
tmp <= not (tmp);
end if;
end if;
end process;
Q <= tmp;
end arh_bist_t;
