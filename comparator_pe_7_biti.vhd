library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator_pe_7_biti is
	port(a, b: in std_logic_vector(6 downto 0);
	a_mai_mare_b, a_egal_b, a_mai_mic_b: out std_logic);
end entity comparator_pe_7_biti;
architecture arh_comparator_pe_7_biti of comparator_pe_7_biti is	
component comparator_1_bit is
	port(a, b: in std_logic;
	a_mai_mare_ca_b, a_egal_cu_b, a_mai_mic_ca_b: out std_logic);
end component; 

signal cmm_mai_mare, cmm_egala, cmm_mai_mica: std_logic;
signal csm_mai_mare, csm_egala, csm_mai_mica: std_logic;
signal czm_mai_mare, czm_egala, czm_mai_mica: std_logic;

signal cum_mai_mare, cum_egala, cum_mai_mica: std_logic; 
signal cs_mai_mare, cs_egala, cs_mai_mica: std_logic;
signal cz_mai_mare, cz_egala, cz_mai_mica: std_logic;
signal cu_mai_mare, cu_egala, cu_mai_mica: std_logic;

begin	
	mm: comparator_1_bit port map (a => a(6), b => b(6), a_mai_mare_ca_b => cmm_mai_mare, a_egal_cu_b => cmm_egala, a_mai_mic_ca_b => cmm_mai_mica);  
	sm: comparator_1_bit port map (a => a(5), b => b(5), a_mai_mare_ca_b => csm_mai_mare, a_egal_cu_b => csm_egala, a_mai_mic_ca_b => csm_mai_mica);
	zm: comparator_1_bit port map (a => a(4), b => b(4), a_mai_mare_ca_b => czm_mai_mare, a_egal_cu_b => czm_egala, a_mai_mic_ca_b => czm_mai_mica);  
	
	mu: comparator_1_bit port map (a => a(3), b => b(3), a_mai_mare_ca_b => cum_mai_mare, a_egal_cu_b => cum_egala, a_mai_mic_ca_b => cum_mai_mica);
	s: comparator_1_bit port map (a => a(2), b => b(2), a_mai_mare_ca_b => cs_mai_mare, a_egal_cu_b => cs_egala, a_mai_mic_ca_b => cs_mai_mica);  
	z: comparator_1_bit port map (a => a(1), b => b(1), a_mai_mare_ca_b => cz_mai_mare, a_egal_cu_b => cz_egala, a_mai_mic_ca_b => cz_mai_mica);
	u: comparator_1_bit port map (a => a(0), b => b(0), a_mai_mare_ca_b => cu_mai_mare, a_egal_cu_b => cu_egala, a_mai_mic_ca_b => cu_mai_mica);  
	a_mai_mare_b <= cmm_mai_mare or (cmm_egala and csm_mai_mare) or (cmm_egala and csm_egala and czm_mai_mare) or (cmm_egala and csm_egala and czm_egala and cum_mai_mare) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_mai_mare) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_egala and cz_mai_mare) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_egala and cz_egala and cu_mai_mare);
	a_egal_b <= cmm_egala and csm_egala and czm_egala and cum_egala and cs_egala and cz_egala and cu_egala; 
	a_mai_mic_b <= cmm_mai_mica or (cmm_egala and csm_mai_mica) or (cmm_egala and csm_egala and czm_mai_mica) or (cmm_egala and csm_egala and czm_egala and cum_mai_mica) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_mai_mica) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_egala and cz_mai_mica) or (cmm_egala and csm_egala and czm_egala and cum_egala and cs_egala and cz_egala and cu_mai_mica);
end arh_comparator_pe_7_biti;