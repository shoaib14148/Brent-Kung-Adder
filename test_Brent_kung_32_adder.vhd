--creating test bench
library ieee; use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


entity test_Brent_kung_32_adder is 
end entity ;

architecture stim of test_Brent_kung_32_adder is

component Brent_kung_32_adder is

	port (A,B : in std_logic_vector (31 downto 0); Sum : out std_logic_vector (31 downto 0); Cout : out std_logic);

end component;


signal t_A,t_B,t_Sum : std_logic_vector (31 downto 0);

signal t_cout :std_logic;

begin

	dut : Brent_kung_32_adder port map (t_A,t_B,t_Sum,t_cout);

A : process 
begin	
	
	t_A <= "00000000000000000000000000000001";               
	t_B <= "00000000000000000000000000000011";               
	
	wait for 10 ps;


	t_A <= "00000000000000000000000100000010";               
	t_B <= "00000000000000000000100001000011";               
	
	wait for 10 ps;

	t_A <= "00011100001010100110000100000010";               
	t_B <= "00010010100110100100100001000011";               
	
	wait for 10 ps;
	t_A <= "01110101110001111000001000000001";               
	t_B <= "00010101010000111000011011000110";               

	wait for 10 ps;

	t_A <= "11111111111111111111111111111111";               
	t_B <= "11111111111111111111111111111111";               
	
		
	wait;
	
end process;

end stim;

