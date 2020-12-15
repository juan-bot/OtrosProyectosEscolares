
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC is
	port(	
		rst : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 inPC : in STD_LOGIC_VECTOR(31 downto 0);
		 outPC : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end PC;


architecture PC of PC is	
	begin
	process(clk,rst)
	begin
		if rst='1' then
			outPC<= (others => '0');
		elsif clk'event and clk='1'then
			outPC <= inPC;
		end if;
	end process;

end PC;
