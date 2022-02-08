library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator_4_biti is
	port(a, b: in std_logic_vector(3 downto 0);
	a_mai_mare_b, a_egal_b, a_mai_mic_b: out std_logic);
end entity comparator_4_biti;
architecture arh_comparator_4_biti of comparator_4_biti is	
component comparator_1_bit is
	port(a, b: in std_logic;
	a_mai_mare_ca_b, a_egal_cu_b, a_mai_mic_ca_b: out std_logic);
end component;
signal cm_mai_mare, cm_egala, cm_mai_mica, cs_mai_mare, cs_egala, cs_mai_mica, cz_mai_mare, cz_egala, cz_mai_mica, cu_mai_mare, cu_egala, cu_mai_mica: std_logic;
begin	  
	m: comparator_1_bit port map (a => a(3), b => b(3), a_mai_mare_ca_b => cm_mai_mare, a_egal_cu_b => cm_egala, a_mai_mic_ca_b => cm_mai_mica);
	s: comparator_1_bit port map (a => a(2), b => b(2), a_mai_mare_ca_b => cs_mai_mare, a_egal_cu_b => cs_egala, a_mai_mic_ca_b => cs_mai_mica);  
	z: comparator_1_bit port map (a => a(1), b => b(1), a_mai_mare_ca_b => cz_mai_mare, a_egal_cu_b => cz_egala, a_mai_mic_ca_b => cz_mai_mica);
	u: comparator_1_bit port map (a => a(0), b => b(0), a_mai_mare_ca_b => cu_mai_mare, a_egal_cu_b => cu_egala, a_mai_mic_ca_b => cu_mai_mica);  
	a_mai_mare_b <= cm_mai_mare or (cm_egala and cs_mai_mare) or (cm_egala and cs_egala and cz_mai_mare) or	(cm_egala and cs_egala and cz_egala and cu_mai_mare);
	a_egal_b <= cm_egala and cs_egala and cz_egala and cu_egala; 
	a_mai_mic_b <= cm_mai_mica or (cm_egala and cs_mai_mica) or (cm_egala and cs_egala and cz_mai_mica) or	(cm_egala and cs_egala and cz_egala and cu_mai_mica);
end arh_comparator_4_biti;
