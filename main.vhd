library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
	port(s1i, s2i, s3i, s4i, s5i, s6i, s7i, s8i, b1i, b2i, b3i, b4i, b5i, clock: in std_logic;
	afis: out std_logic_vector(27 downto 0);
	biletul, suma_insuficienta, nu_se_poate_da_rest, lipsa_bilete: out std_logic);
end entity main;

architecture arh_main of main is 

component intrari is
	port(s1, s2, s3, s4, s5, s6, s7, s8, b1, b2, b3, b4, b5: in std_logic;
	cif0, cif1, cif2, cif3, cif4, cif5, cif6, cif7, cif8, cif9, c, c50, c20, c10, c5, c2, c1, inc: out std_logic);
end component;

component afisaj is
    Port ( anod : in STD_LOGIC_VECTOR (3 downto 0);
	catod : in STD_LOGIC_VECTOR (6 downto 0);
	led: out std_logic_vector(27 downto 0));
end component;

component mux_4_la_1_cu_7_biti_date is
 port(
 
     A,B,C,D : in std_logic_vector(6 downto 0);
     S0,S1: in STD_LOGIC;
     Z: out std_logic_vector(6 downto 0)
  );
end component;

component demux_1_la_4_cu_1_bit_date is
 port(
 
 F : in STD_LOGIC;
 S0,S1: in STD_LOGIC;
 A,B,C,D: out STD_LOGIC
 );
end component;

component mux_8_la_1_7_biti_date is

port (sel : in std_logic_vector(2 downto 0);

A,B,C,D,E,F,G,H: in std_logic_vector(6 downto 0);

Y : out std_logic_vector(6 downto 0));
end component;

component D_FF is
PORT( D,CLOCK, RESET: in std_logic;
Q: out std_logic);
end component;

component bist_t is
port( T: in std_logic;
Clock, Reset: in std_logic;
Q: inout std_logic);
end component;

component sumator_pe_7_biti is
	port( an, bn: in std_logic_vector(6 downto 0);
	cinn: in std_logic;
	coutn: out std_logic;
	sn: out std_logic_vector(6 downto 0));
end component;

component comparator_4_biti is
	port(a, b: in std_logic_vector(3 downto 0);
	a_mai_mare_b, a_egal_b, a_mai_mic_b: out std_logic);
end component;

component memorie_rom is
	port(a: in std_logic_vector(3 downto 0);
	d: out std_logic_vector(6 downto 0));
end component;

component codificator_prioritar is
	port(i0, i1, i2, i3, i4,i5, i6, i7, i8, i9, i10, en: in std_logic;
	a3, a2, a1, a0, gs: out std_logic);
end component;

component registru_pe_4_biti is
	port(d: inout std_logic_vector(3 downto 0);
	clk, reset: in std_logic;
	q: out std_logic_vector(3 downto 0));
end component;

component registru_pe_7_biti is
	port(d: inout std_logic_vector(6 downto 0);
	clk, en, reset: in std_logic;
	q: out std_logic_vector(6 downto 0));
end component;

component counter_pe_2_biti is
	port(r, c: in std_logic;
	q1, q0: out std_logic);
end component;

component comparator_pe_7_biti is
	port(a, b: in std_logic_vector(6 downto 0);
	a_mai_mare_b, a_egal_b, a_mai_mic_b: out std_logic);
end component;

component counter_pe_7_biti is
	port(cl, r, count: std_logic;
	q: out std_logic_vector(6 downto 0));
end component;

component inmultitor_pe_7_biti is
	port(al, bl: in std_logic_vector(6 downto 0);
	f: out std_logic_vector(6 downto 0);
	ck, res: in std_logic);
end component; 

component impartitor_pe_7_biti is
	port(al, bl: in std_logic_vector(6 downto 0);
	cat, rest: out std_logic_vector(6 downto 0);
	ck, res: in std_logic);
end component; 

component scazator_pe_7_biti is
	port(a, b: in std_logic_vector(6 downto 0);
	dif: out std_logic_vector(6 downto 0);
	negativ: out std_logic);
end component; 

component codif_3 is
	port(int : in std_logic_vector(5 downto 0);
	y: out std_logic_vector(2 downto 0));
end component; 

component mem_monede is
	port(int : in std_logic_vector(3 downto 0);
	y: out std_logic_vector(6 downto 0));
end component; 

component mux_2_la_1_cu_7_biti_date is
 port(
 
     A,B : in std_logic_vector(6 downto 0);
     S0: in STD_LOGIC;
     Z: out std_logic_vector(6 downto 0)
  );
end component; 

component counter_case is
	port(cl, r, count: std_logic;
	q: out std_logic_vector(6 downto 0));
end component;

signal cif: std_logic_vector(10 downto 0); 
signal cm: std_logic_vector(5 downto 0);
signal cr: std_logic;

signal mux_afis_1_0, r50, r20, r10, r5, r2, r1: std_logic_vector(6 downto 0);	
signal mux_afis_1_1: std_logic_vector(6 downto 0); 
signal mux_afis_1_2: std_logic_vector(6 downto 0);
signal mux_afis_1_3: std_logic_vector(6 downto 0);

signal mux_afis_2_0: std_logic_vector(6 downto 0);	
signal mux_afis_2_1: std_logic_vector(6 downto 0); 
signal mux_afis_2_2: std_logic_vector(6 downto 0);
signal mux_afis_2_3: std_logic_vector(6 downto 0); 

signal mux_afis_3_0: std_logic_vector(6 downto 0);	
signal mux_afis_3_1: std_logic_vector(6 downto 0); 
signal mux_afis_3_2: std_logic_vector(6 downto 0);
signal mux_afis_3_3: std_logic_vector(6 downto 0); 

signal mux_afis_4_0: std_logic_vector(6 downto 0);	
signal mux_afis_4_1: std_logic_vector(6 downto 0); 
signal mux_afis_4_2: std_logic_vector(6 downto 0);
signal mux_afis_4_3: std_logic_vector(6 downto 0); 

signal an: std_logic_vector(3 downto 0);  

signal mux_option_afis_s_0: std_logic_vector(6 downto 0);
signal mux_option_afis_s_1, an50, an20, an10, an5, an2, an1, sn50, sn20, sn10, sn5, sn2, sn1, acts50, acts20, acts10, acts5, acts2, acts1, actd50, actd20, actd10, actd5, actd2, actd1: std_logic_vector(6 downto 0);
signal mux_option_afis_s_2, rest: std_logic_vector(6 downto 0);
signal mux_option_afis_s_3, dist_par_1, dist_par_2, dist_par_3, dist_f, casa50, casa20, casa10, casa5, casa2, casa1: std_logic_vector(6 downto 0);

signal cat, dd50, dd20, dd10, dd5, dd2, dd1: std_logic_vector(6 downto 0);

signal enter, quit, clkk, ress, cllk, rees, dd, s_0, qq: std_logic;

signal count_org: std_logic_vector(1 downto 0);	
signal count_afis: std_logic_vector(1 downto 0);

signal incorect, en_codif, a_mare_b_unitati, a_mare_b_zeci, a_b_zeci, a_mare_b_sute, a_b_sute, mm, eg, mmm, se500, se501, se200, se201, se100, se101, se50, se51, se20 ,se21, se10, se11: std_logic;
signal codif_cif:std_logic_vector(3 downto 0);

signal resss, clkkk, g, reset_dist, verif_dist, en_dist, enable, re, en_rest, c1, c2, c3, c4, c5, ff, rr, ne, m50, mm50, m20, mm20, m10, mm10, m5, mm5, m2, mm2, m1, mm1:std_logic;	
signal sem50, sem20, sem10, sem5, sem2, sem1, s50, s20, s10, s5, s2, s1, cll, clllk, reees: std_logic;
signal dist_sute, dist_zeci, dist_unitati, afis_dist_sute, dist, sum, s, c_rez, r_rez, c_fin, r_fin, y_af:std_logic_vector(6 downto 0);	
signal afis_dist_zeci, adaugare_suma, afis_suma_sute, afis_suma_zeci, afis_suma_unitati, aq, af, bil, coun:std_logic_vector(6 downto 0);
signal afis_dist_unitati, cod_suma_sute, cod_suma_zeci, cod_suma_unitati, r_p, rest_p, moned, qqq:std_logic_vector(6 downto 0);
signal afis_incarcare_dist, s_50, s_20, s_10, s_5, s_2, s_1, rest_f, d50, d20, d10, d5, d2, d1, yy, yyy:std_logic_vector(6 downto 0); 

signal sel_mon, sel_mon_mux: std_logic_vector(3 downto 0);  
signal  ss, sell, selll: std_logic_vector(2 downto 0);

begin 
	
	intrare: intrari port map (s1 =>s1i, s2 =>s2i, s3 =>s3i, s4 =>s4i, s5 =>s5i, s6 =>s6i, s7 =>s7i, s8 =>s8i, b1 =>b1i, b2 =>b2i, b3 =>b3i, b4 =>enter, b5 =>quit, cif0 =>cif(0), cif1 =>cif(1), cif2 =>cif(2), cif3 =>cif(3), cif4 =>cif(4), cif5 =>cif(5), cif6 =>cif(6), cif7 =>cif(7), cif8 =>cif(8), cif9 =>cif(9), c =>cif(10), c50 =>cm(0), c20 =>cm(1), c10 =>cm(2), c5 =>cm(3), c2 =>cm(4), c1 =>cm(5), inc =>cr);
	mux_afis_1:	mux_4_la_1_cu_7_biti_date port map (A =>mux_afis_1_0, B =>mux_afis_1_1, C =>mux_afis_1_2, D =>mux_afis_1_3, S0 =>count_org(0), S1 =>count_org(1), Z =>mux_option_afis_s_0);
	mux_afis_2:	mux_4_la_1_cu_7_biti_date port map (A =>mux_afis_2_0, B =>mux_afis_2_1, C =>mux_afis_2_2, D =>mux_afis_2_3, S0 =>count_org(0), S1 =>count_org(1), Z =>mux_option_afis_s_1);
	mux_afis_3:	mux_4_la_1_cu_7_biti_date port map (A =>mux_afis_3_0, B =>mux_afis_3_1, C =>mux_afis_3_2, D =>mux_afis_3_3, S0 =>count_org(0), S1 =>count_org(1), Z =>mux_option_afis_s_2);
	mux_afis_4:	mux_4_la_1_cu_7_biti_date port map (A =>mux_afis_4_0, B =>mux_afis_4_1, C =>mux_afis_4_2, D =>mux_afis_4_3, S0 =>count_org(0), S1 =>count_org(1), Z =>mux_option_afis_s_3);
	mux_afis_s:	mux_4_la_1_cu_7_biti_date port map (A =>mux_option_afis_s_0, B =>mux_option_afis_s_1, C =>mux_option_afis_s_2, D =>mux_option_afis_s_3, S0 =>count_afis(0), S1 =>count_afis(1), Z =>cat);
	demux_afis:	demux_1_la_4_cu_1_bit_date port map	(F => '1', S0 =>count_afis(0), S1 =>count_afis(1), A =>an(0), B =>an(1), C =>an(2), D =>an(3));
	counter_afis: counter_pe_2_biti	port map (r =>quit, c =>clock, q0 =>count_afis(0), q1 =>count_afis(1));
	codif_cifre: codificator_prioritar port map (i0 =>cif(0), i1 =>cif(1), i2 =>cif(2), i3 =>cif(3), i4 =>cif(4), i5 =>cif(5), i6 =>cif(6), i7 =>cif(7), i8 =>cif(8), i9 =>cif(9), i10 =>cif(10), en =>en_codif, a3 =>codif_cif(3), a2 =>codif_cif(2), a1 =>codif_cif(1), a0 =>codif_cif(0), gs =>g);
	uc:	counter_pe_2_biti port map (r =>quit, c =>enter, q1=>count_org(1), q0 =>count_org(0));
	mem_afis_dist: memorie_rom port map	(a =>codif_cif, d =>afis_incarcare_dist);
	afis_d_sute: registru_pe_7_biti port map	(d =>afis_dist_zeci, clk =>g, en =>'1', reset =>reset_dist, q =>afis_dist_sute);
	afis_d_zeci: registru_pe_7_biti port map	(d =>afis_dist_unitati, clk =>g, en =>'1', reset =>reset_dist, q =>afis_dist_zeci);
	afis_d_unitati: registru_pe_7_biti port map (d =>afis_incarcare_dist, clk =>g, en =>'1', reset =>reset_dist, q =>afis_dist_unitati);
	d_sute: registru_pe_4_biti port map (d =>dist_zeci(3 downto 0), clk =>g, reset =>reset_dist, q =>dist_sute(3 downto 0));
	d_zeci: registru_pe_4_biti port map (d =>dist_unitati(3 downto 0), clk =>g, reset =>reset_dist, q =>dist_zeci(3 downto 0));
	d_unitati: registru_pe_4_biti port map (d =>codif_cif, clk =>g, reset =>reset_dist, q =>dist_unitati(3 downto 0)); 
	incorect <= a_mare_b_sute or (a_b_sute and a_mare_b_zeci) or (a_b_sute and a_b_zeci and a_mare_b_unitati);
	comp_dist_sute:	comparator_4_biti port map (a =>dist_sute(3 downto 0), b =>"0001", a_mai_mare_b =>a_mare_b_sute, a_egal_b =>a_b_sute);
	comp_dist_zeci:	comparator_4_biti port map (a =>dist_zeci(3 downto 0), b =>"0000", a_mai_mare_b =>a_mare_b_zeci, a_egal_b =>a_b_zeci);
	comp_dist_unitati: comparator_4_biti port map (a =>dist_unitati(3 downto 0), b =>"0000", a_mai_mare_b =>a_mare_b_unitati);
	inmultitor_dist_sute: inmultitor_pe_7_biti port map	(al =>dist_sute, bl =>"1100100", ck =>clock, res =>quit, f =>dist_par_1);
	inmultitor_dist_zeci: inmultitor_pe_7_biti port map	(al =>dist_zeci, bl =>"0001010", ck =>clock, res =>quit, f =>dist_par_2);
	sumator_dist_zeci_unitati: sumator_pe_7_biti port map (an =>dist_par_2, bn =>dist_unitati, cinn => '0', sn =>dist_par_3);
	sumator_dist_sute_zeci:	sumator_pe_7_biti port map (an =>dist_sute, bn =>dist_par_3, cinn =>'0', sn =>dist);
	dist_num: registru_pe_7_biti port map (d =>dist, clk =>clock, en =>en_dist, reset =>quit, q =>dist_f);
	suma_50: counter_pe_7_biti port map	(cl =>cr, r =>quit, count =>'0', q =>s_50);
	suma_20: counter_pe_7_biti port map	(cl =>cr, r =>quit, count =>'0', q =>s_20);
	suma_10: counter_pe_7_biti port map	(cl =>cr, r =>quit, count =>'0', q =>s_10);
	suma_5:	counter_pe_7_biti port map (cl =>cr, r =>quit, count =>'0', q =>s_5);
	suma_2:	counter_pe_7_biti port map (cl =>cr, r =>quit, count =>'0', q =>s_2);
	suma_1:	counter_pe_7_biti port map (cl =>cr, r =>quit, count =>'0', q =>s_1);
	codif_alegere_moneda: codif_3 port map (int(0) =>cm(0), int(1) =>cm(1), int(2) =>cm(2), int(3)=>cm(3), int(4) =>cm(4), int(5) =>cm(5), y =>sel_mon(2 downto 0));
	registru_alegere_moneda: registru_pe_4_biti	port map (d => sel_mon, clk =>clock, reset =>quit, q =>sel_mon_mux);
	mux_alegere_moneda:	mux_8_la_1_7_biti_date port map	(A =>"0110010", B =>"0010100", C =>"0001010", D =>"0000101", E =>"0000010", F =>"0000001", G =>"0000000", H =>"0000000", sel =>sel_mon_mux(2 downto 0), y =>adaugare_suma);
	suma: registru_pe_7_biti port map (d =>s, clk =>cr, en =>enable, reset =>quit, q =>sum);
	sumator_suma: sumator_pe_7_biti	port map (an =>sum, bn =>adaugare_suma, cinn =>'0', sn =>s);
	impartire_suma_sute: impartitor_pe_7_biti port map (al =>sum, bl =>"1100100", ck =>clock, res =>re, cat =>c_rez, rest =>r_rez);
	impartire_suma_zeci: impartitor_pe_7_biti port map (al =>r_rez, bl =>"0001010", ck =>clock, res =>re, cat =>c_fin, rest =>r_fin);
	registru_afis_suma_sute: registru_pe_7_biti port map (d =>c_rez, clk =>clock, en =>'1', reset =>reset_dist, q =>afis_suma_sute);
	registru_afis_suma_zeci: registru_pe_7_biti port map (d =>c_fin, clk =>clock, en =>'1', reset =>reset_dist, q =>afis_suma_zeci);
	registru_afis_suma_unitati: registru_pe_7_biti port map (d =>r_fin, clk =>clock, en =>'1', reset =>reset_dist, q =>afis_suma_unitati);
	mem_afis_suma_sute:	memorie_rom	port map (a =>afis_suma_sute(3 downto 0), d =>cod_suma_sute);
	mem_afis_suma_zeci: memorie_rom	port map (a =>afis_suma_zeci(3 downto 0), d =>cod_suma_zeci);
	mem_afis_suma_unitati: memorie_rom port map	(a =>afis_suma_unitati(3 downto 0), d =>cod_suma_unitati);
	scazator_suma_dist:	scazator_pe_7_biti port map	(a =>sum, b =>dist, dif =>rest);
	registru_rest: registru_pe_7_biti port map (d =>rest, clk =>clock, en =>en_rest, reset =>quit, q =>rest_f);
	div_frecv_1: bist_t	port map (T =>'1', CLOCK =>clock, Reset =>quit, Q =>c1);
	div_frecv_2: bist_t	port map (T =>'1', CLOCK =>c1, Reset =>quit, Q =>c2);
	div_frecv_3: bist_t	port map (T =>'1', CLOCK =>c2, Reset =>quit, Q =>c3);
	div_frecv_4: bist_t	port map (T =>'1', CLOCK =>c3, Reset =>quit, Q =>c4);
	div_frecv_5: bist_t port map (T =>'1', CLOCK =>c4, Reset =>quit, Q =>c5);
	enable_rest_partial: D_FF port map (D =>dd, CLOCK =>clkk, RESET =>ress, Q =>qq);
	counter_monede:	counter_pe_7_biti port map (cl =>cllk, r =>rees, count => '0', q =>qqq);
	mem_moned:	mem_monede port map	(int =>qqq(3 downto 0), y =>moned);
	mux_rest_partial: mux_2_la_1_cu_7_biti_date	port map (A =>rest_f, B =>rest_p, S0 =>s_0, Z =>r_p);
	registru_rest_partial: registru_pe_7_biti port map (d =>r_p, clk =>clkk, en =>ff, reset =>rr, q =>aq);
	scazator_rest: scazator_pe_7_biti port map (a =>r_p, b =>moned, dif =>rest_p, negativ =>ne);
	comparator_rest_moneda:	comparator_pe_7_biti port map (a =>r_p, b =>moned, a_mai_mare_b =>mm, a_egal_b =>eg, a_mai_mic_b =>mmm);
	enable_50: D_FF	port map (D =>sem50, CLOCK =>cll, RESET =>quit, Q =>s50);
	enable_20: D_FF	port map (D =>sem20, CLOCK =>cll, RESET =>quit, Q =>s20);
	enable_10: D_FF	port map (D =>sem10, CLOCK =>cll, RESET =>quit, Q =>s10);
	enable_5: D_FF port map	(D =>sem5, CLOCK =>cll, RESET =>quit, Q =>s5);
	enable_2: D_FF port map	(D =>sem2, CLOCK =>cll, RESET =>quit, Q =>s2);
	enable_1: D_FF port map	(D =>sem1, CLOCK =>cll, RESET =>quit, Q =>s1);
	rest_50: counter_pe_7_biti port map	(cl =>clkk, r =>ress, count =>'0', q =>r50);
	rest_20: counter_pe_7_biti port map	(cl =>clkk, r =>ress, count =>'0', q =>r20);
	rest_10: counter_pe_7_biti port map	(cl =>clkk, r =>ress, count =>'0', q =>r10);
	rest_5:	counter_pe_7_biti port map (cl =>clkk, r =>ress, count =>'0', q =>r5);
	rest_2:	counter_pe_7_biti port map (cl =>clkk, r =>ress, count =>'0', q =>r2);
	rest_1:	counter_pe_7_biti port map (cl =>clkk, r =>ress, count =>'0', q =>r1);
	counter_afisare_rest: counter_pe_7_biti	port map (cl =>clkkk, r =>resss, count => '0', q =>coun);
	mem_afis_rest_50: memorie_rom port map (a =>r50(3 downto 0), d =>d50);
	mem_afis_rest_20: memorie_rom port map (a =>r20(3 downto 0), d =>d20);
	mem_afis_rest_10: memorie_rom port map (a =>r10(3 downto 0), d =>d10);
	mem_afis_rest_5: memorie_rom port map (a =>r5(3 downto 0), d =>d5);
	mem_afis_rest_2: memorie_rom port map (a =>r2(3 downto 0), d =>d2);
	mem_afis_rest_1: memorie_rom port map (a =>r1(3 downto 0), d =>d1);
	mux_afis_zeci_rest:	mux_8_la_1_7_biti_date port map	(A =>"0100100", B =>"0010010", C =>"1001111", D =>"0000001", E =>"0000001", F =>"0000001", G =>"0000001", H =>"0000001", sel =>sell, y =>yy);
	mux_afis_unitati_rest: mux_8_la_1_7_biti_date port map (A =>"0000001", B =>"0000001", C =>"0000001", D =>"0100100", E =>"0010010", F =>"1001111", G =>"0000001", H =>"0000001", sel =>selll, y =>yyy);
	mux_afis_nr_rest: mux_8_la_1_7_biti_date port map (A =>d50, B =>d20, C =>d10, D =>d5, E =>d2, F =>d1, G =>"0000000", H =>"0000000", sel =>ss, y =>y_af);
	casa_de_bilete: counter_pe_7_biti port map (cl =>clllk, r =>reees,count => '1', q =>bil);
	sumator_casa_50: sumator_pe_7_biti port map	(an =>an50, bn =>r50, cinn =>'0', sn =>acts50);
	scazator_casa_50: scazator_pe_7_biti port map (a =>sn50, b =>r50, dif =>actd50);
	sumator_casa_20: sumator_pe_7_biti port map	(an =>an20, bn =>r20, cinn =>'0', sn =>acts20);
	scazator_casa_20: scazator_pe_7_biti port map (a =>sn20, b =>r20, dif =>actd20);
	sumator_casa_10: sumator_pe_7_biti port map	(an =>an10, bn =>r10, cinn =>'0', sn =>acts10);
	scazator_casa_10: scazator_pe_7_biti port map (a =>sn10, b =>r10, dif =>actd10);
	sumator_casa_5:	sumator_pe_7_biti port map (an =>an5, bn =>r5, cinn =>'0', sn =>acts5);
	scazator_casa_5: scazator_pe_7_biti	port map (a =>sn5, b =>r5, dif =>actd5);
	sumator_casa_2:	sumator_pe_7_biti port map (an =>an2, bn =>r2, cinn =>'0', sn =>acts2);
	scazator_casa_2: scazator_pe_7_biti	port map (a =>sn2, b =>r2, dif =>actd2);
	sumator_casa_1: sumator_pe_7_biti port map (an =>an1, bn =>r1, cinn =>'0', sn =>acts1);
	scazator_casa_1: scazator_pe_7_biti	port map (a =>sn1, b =>r1, dif =>actd1);
	mux_casa_50: mux_4_la_1_cu_7_biti_date port map	(A =>casa50, B =>acts50, C =>actd50, D =>"0000000", S0 =>se500, S1 =>se501, Z =>dd50);
	mux_casa_20: mux_4_la_1_cu_7_biti_date port map	(A =>casa20, B =>acts20, C =>actd20, D =>"0000000", S0 =>se200, S1 =>se201, Z =>dd20);
	mux_casa_10: mux_4_la_1_cu_7_biti_date port map	(A =>casa10, B =>acts10, C =>actd10, D =>"0000000", S0 =>se100, S1 =>se101, Z =>dd10);
	mux_casa_5:	mux_4_la_1_cu_7_biti_date port map (A =>casa5, B =>acts5, C =>actd5, D =>"0000000", S0 =>se50, S1 =>se51, Z =>dd5);
	mux_casa_2:	mux_4_la_1_cu_7_biti_date port map (A =>casa2, B =>acts2, C =>actd2, D =>"0000000", S0 =>se20, S1 =>se21, Z =>dd2);
	mux_casa_1:	mux_4_la_1_cu_7_biti_date port map (A =>casa1, B =>acts1, C =>actd1, D =>"0000000", S0 =>se10, S1 =>se11, Z =>dd1); 
	
	comp_min_casa_50: comparator_pe_7_biti port map	(a =>casa50, b =>"0000101", a_mai_mic_b =>m50);
	comp_min_casa_20: comparator_pe_7_biti port map	(a =>casa20, b =>"0000101", a_mai_mic_b =>m20);
	comp_min_casa_10: comparator_pe_7_biti port map	(a =>casa10, b =>"0000101", a_mai_mic_b =>m10);
	comp_min_casa_5: comparator_pe_7_biti port map (a =>casa5, b =>"0000101", a_mai_mic_b =>m5);
	comp_min_casa_2: comparator_pe_7_biti port map (a =>casa2, b =>"0000101", a_mai_mic_b =>m2);
	comp_min_casa_1: comparator_pe_7_biti port map (a =>casa1, b =>"0000101", a_mai_mic_b =>m1);
	
	comp_max_casa_50: comparator_pe_7_biti port map	(a =>casa50, b =>"1111010", a_mai_mare_b =>mm50);
	comp_max_casa_20: comparator_pe_7_biti port map	(a =>casa20, b =>"1111010", a_mai_mare_b =>mm20);
	comp_max_casa_10: comparator_pe_7_biti port map	(a =>casa10, b =>"1111010", a_mai_mare_b =>mm10);
	comp_max_casa_5: comparator_pe_7_biti port map (a =>casa5, b =>"1111010", a_mai_mare_b =>mm5);
	comp_max_casa_2: comparator_pe_7_biti port map (a =>casa2, b =>"1111010", a_mai_mare_b =>mm2);
	comp_max_casa_1: comparator_pe_7_biti port map (a =>casa1, b =>"1111010", a_mai_mare_b =>mm1);
	
	casa_50: registru_pe_7_biti	port map (d =>dd50, clk =>b4i, en =>'1', reset =>'0', q =>casa50);
	casa_20: registru_pe_7_biti	port map (d =>dd20, clk =>b4i, en =>'1', reset =>'0', q =>casa20);
	casa_10: registru_pe_7_biti	port map (d =>dd10, clk =>b4i, en =>'1', reset =>'0', q =>casa10);
	casa_5: registru_pe_7_biti port map	(d =>dd5, clk =>b4i, en =>'1', reset =>'0', q =>casa5);
	casa_2:	registru_pe_7_biti port map	(d =>dd2, clk =>b4i, en =>'1', reset =>'0', q =>casa2);
	casa_1:	registru_pe_7_biti port map	(d =>dd1, clk =>b4i, en =>'1', reset =>'0', q =>casa1); 
	
	afisa: afisaj port map (anod =>an, catod =>cat, led =>afis);
end arh_main;
