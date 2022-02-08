library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_2_la_1_cu_7_biti_date is
 port(
 
     A,B : in std_logic_vector(6 downto 0);
     S0: in STD_LOGIC;
     Z: out std_logic_vector(6 downto 0)
  );
end mux_2_la_1_cu_7_biti_date;
 
architecture arh_mux_2_la_1_cu_7_biti_date of mux_2_la_1_cu_7_biti_date is
begin
process (A,B,S0) is
begin
  if (S0 ='0') then
      Z <= A;
  else 
      Z <= B;
  end if;
end process;
end arh_mux_2_la_1_cu_7_biti_date;