library ieee;
use ieee.std_logic_1164.all;


entity gp_generator is 

	port (g_1,p_1,g_0,p_0 : in std_logic; g_out,p_out : out std_logic);
end entity;

architecture logic of gp_generator is

begin

	g_out <= g_1 or (g_0 and p_1); 
	p_out <= p_1 and p_0;

end architecture; 