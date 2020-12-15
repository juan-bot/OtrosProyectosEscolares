
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Registros is
	 port(
		 clk : in STD_LOGIC;
		 CE : in STD_LOGIC;
		 D : in STD_LOGIC_VECTOR(31 downto 0);
		 Q : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Registros;

--}} End of automatically maintained section

architecture Registros of Registros is	   
begin
  process(clk,CE)
	begin
		if clk'event and clk='1' and CE='1'then  
			Q <= D;
	   end if;	    
	end process;

end Registros;
