library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity Multiplicador is
	 port(
		 dato : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Multiplicador;

--}} End of automatically maintained section

architecture Multiplicador of Multiplicador is
begin
	process(dato)
		begin 
			salida<=dato(29 downto 0) & "00";
		end process;

end Multiplicador;
