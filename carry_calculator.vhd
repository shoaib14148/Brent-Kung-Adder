library ieee;
use ieee.std_logic_1164.all;


entity carry_calculator is port (g,p,c : in std_logic; cout : out std_logic);
end entity;


architecture logic of carry_calculator is

begin

	cout <= g or (p and c); 

end architecture;