library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity RegistroFD is
	 port(
		 pc : in STD_LOGIC_VECTOR(31 downto 0);	
		 data_memoria_codigo : in STD_LOGIC_VECTOR(31 downto 0); 
		 clk: in STD_LOGIC;
		 pc2 : out STD_LOGIC_VECTOR(31 downto 0);	
		 data_memoria_codigo2 : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end RegistroFD;

--}} End of automatically maintained section

architecture RegistroFD of RegistroFD is
begin
	process(clk,pc,data_memoria_codigo)
	begin
		if clk'event and clk='1'then  
			data_memoria_codigo2 <= data_memoria_codigo; 
			pc2<=pc;
	   end if;	    
	end process;

end RegistroFD;
