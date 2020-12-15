library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity MUX3 is
	 port(
		 data1 : in STD_LOGIC_VECTOR(31 downto 0);
		 data0 : in STD_LOGIC_VECTOR(31 downto 0);
		 sel : in STD_LOGIC;
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MUX3;

architecture MUX3 of MUX3 is
begin
   process(sel)
	begin
		if sel = '1' then
			salida<=data1;
		else
			salida<=data0;
	end if;
	end process;

end MUX3;
