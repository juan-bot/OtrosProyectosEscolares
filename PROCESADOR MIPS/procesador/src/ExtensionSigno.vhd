library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity ExtensionSigno is
	 port(
		 entrada : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end ExtensionSigno;

--}} End of automatically maintained section

architecture ExtensionSigno of ExtensionSigno is
begin
	process(entrada)
	begin
		if entrada(15)= '1' then
			salida<="1111111111111111"&entrada(15 downto 0);
		else
			salida<="0000000000000000"&entrada(15 downto 0);
		end if;
	end process;

end ExtensionSigno;
