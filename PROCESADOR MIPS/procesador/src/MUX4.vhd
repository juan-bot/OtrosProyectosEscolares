library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX4 is
	 port(
		 d0 : in STD_LOGIC_VECTOR(31 downto 0);
		 d1 : in STD_LOGIC_VECTOR(31 downto 0);
		 sel : in STD_LOGIC;
		 sal : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end MUX4;

architecture MUX4 of MUX4 is
begin
	process(sel)
	begin
		if sel = '0' then
			sal<=d1(20 downto 16);
		else
			sal<=d0(15 downto 11);
	end if;
	end process;
end MUX4;
