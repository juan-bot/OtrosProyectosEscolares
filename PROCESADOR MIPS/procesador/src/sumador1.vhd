library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity sumador1 is
	 port(
		 s1 : in STD_LOGIC_VECTOR(31 downto 0);
		 r : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end sumador1;

--}} End of automatically maintained section

architecture sumador1 of sumador1 is
begin
	process(s1)
	begin
		r<=s1+4; 
	end process;
end sumador1;
