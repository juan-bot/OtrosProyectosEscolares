library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX5 is
	 port(
		 sel : in STD_LOGIC_VECTOR(1 downto 0);
		 s0 : in STD_LOGIC_VECTOR(31 downto 0);
		 s2 : in STD_LOGIC_VECTOR(31 downto 0);
		 s3 : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MUX5;

--}} End of automatically maintained section

architecture MUX5 of MUX5 is
begin
	process(sel,s0,s2,s1)  
	begin
		case sel is
		  when "00" => salida<=s0; 
		  when "01" => salida<=X"00000004";  
		  when "10" => salida<=s2;  
		  when "11" => salida<=s3;  
		  when others => NUll;
		end case;
	end process;

end MUX5;
