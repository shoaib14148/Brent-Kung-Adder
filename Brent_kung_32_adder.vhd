library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Brent_kung_32_adder is

	port (A,B : in std_logic_vector (31 downto 0); Sum : out std_logic_vector (31 downto 0); Cout : out std_logic);

end entity;


architecture logic of Brent_kung_32_adder is

	
	signal g1,p1 : std_logic_vector (31 downto 0) := (others => '0');
	signal g2,p2 : std_logic_vector (15 downto 0) := (others => '0');
	signal g3,p3 : std_logic_vector (7 downto 0) := (others => '0');
	signal g4,p4 : std_logic_vector (3 downto 0) := (others => '0');
	signal g5,p5 : std_logic_vector (1 downto 0) := (others => '0');
	signal g6,p6 : std_logic :=  '0';
	
	
	component gp_generator is 

		port (g_1,p_1,g_0,p_0 : in std_logic; g_out,p_out : out std_logic);
	end component;
	
	component carry_calculator is port (g,p,c : in std_logic; cout : out std_logic);
	end component;
	
	signal l : integer := 0;
	
	signal c0 : std_logic := '0';
	signal carry : std_logic_vector(32 downto 0) := (others => '0');
	signal carry_temp : std_logic_vector(31 downto 0) := (others => '0');

	
begin

	g1 <= A and B;
	p1 <= A or B;
	
	l2 : for i in 0 to 15 generate
	
		dut2 : gp_generator port map (g1(2*i+1),p1(2*i+1),g1(2*i),p1(2*i),g2(i),p2(i));
	
	end generate;

	l3 : for i in 0 to 7 generate
	
		dut3 : gp_generator port map (g2(2*i+1),p2(2*i+1),g2(2*i),p2(2*i),g3(i),p3(i));
	
	end generate;
	
	l4 : for i in 0 to 3 generate
	
		dut4 : gp_generator port map (g3(2*i+1),p3(2*i+1),g3(2*i),p3(2*i),g4(i),p4(i));
	
	end generate;
	
	l5 : for i in 0 to 1 generate
	
		dut5 : gp_generator port map (g4(2*i+1),p4(2*i+1),g4(2*i),p4(2*i),g5(i),p5(i));
	
	end generate;
	
		dut6 : gp_generator port map (g5(1),p5(1),g5(0),p5(0),g6,p6);
	

	c1 : carry_calculator port map (g1(0),p1(0),c0,carry(1));
	c2 : carry_calculator port map (g2(0),p2(0),c0,carry(2));
	c4 : carry_calculator port map (g3(0),p3(0),c0,carry(4));
	c8 : carry_calculator port map (g4(0),p4(0),c0,carry(8));
	c16 : carry_calculator port map (g5(0),p5(0),c0,carry(16));
	c32 : carry_calculator port map (g6,p6,c0,carry(32));
	
	c3 : carry_calculator port map (g1(2),p1(2),carry(2),carry(3));
	c5 : carry_calculator port map (g1(4),p1(4),carry(4),carry(5));
	c9 : carry_calculator port map (g1(8),p1(8),carry(8),carry(9));
	c17 : carry_calculator port map (g1(16),p1(16),carry(16),carry(17));
	c31 : carry_calculator port map (g1(30),p1(30),carry(30),carry(31));
	c7 : carry_calculator port map (g1(6),p1(6),carry(6),carry(7));
	c11 : carry_calculator port map (g1(10),p1(10),carry(10),carry(11));
	c13 : carry_calculator port map (g1(12),p1(12),carry(12),carry(13));
	c15 : carry_calculator port map (g1(14),p1(14),carry(14),carry(15));
	c19 : carry_calculator port map (g1(18),p1(18),carry(18),carry(19));
	c21 : carry_calculator port map (g1(20),p1(20),carry(20),carry(21));
	c23 : carry_calculator port map (g1(22),p1(22),carry(22),carry(23));
	c25 : carry_calculator port map (g1(24),p1(24),carry(24),carry(25));
	c27 : carry_calculator port map (g1(26),p1(26),carry(26),carry(27));
	c29 : carry_calculator port map (g1(28),p1(28),carry(28),carry(29));
	
	
	
	c6 : carry_calculator port map (g2(2),p2(2),carry(4),carry(6));
	c10 : carry_calculator port map (g2(4),p2(4),carry(8),carry(10));
	c18 : carry_calculator port map (g2(8),p2(8),carry(16),carry(18));
	c14 : carry_calculator port map (g2(6),p2(6),carry(12),carry(14));
	c22 : carry_calculator port map (g2(10),p2(10),carry(20),carry(22));
	c26 : carry_calculator port map (g2(12),p2(12),carry(24),carry(26));	
	c30 : carry_calculator port map (g2(14),p2(14),carry(28),carry(30));
	
	c12 : carry_calculator port map (g3(2),p3(2),carry(8),carry(12));
	c20 : carry_calculator port map (g3(4),p3(4),carry(16),carry(20));	
	c28 : carry_calculator port map (g3(6),p3(6),carry(24),carry(28));
	
	c24 : carry_calculator port map (g4(2),p4(2),carry(16),carry(24));
	
	carry_temp(31 downto 1) <= carry(31 downto 1);
	Cout <= carry(32);

	Sum <= A xor B xor carry_temp;
			

end architecture;