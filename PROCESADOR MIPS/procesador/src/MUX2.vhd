library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX2 is
	 port(
		  sel: in STD_LOGIC;
		 dato0 : in STD_LOGIC_VECTOR(31 downto 0);
		 dato1 : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MUX2;

--}} End of automatically maintained section

architecture MUX2 of MUX2 is
begin
   process(dato0,dato1,sel)
	begin
		if sel='0' then
			salida<=dato0;
		else
			salida<=dato1;
		end if;
	end process;

end MUX2;
