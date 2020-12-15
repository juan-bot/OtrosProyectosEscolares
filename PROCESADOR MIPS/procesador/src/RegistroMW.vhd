library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegistroMW is
	 port(
		 clk : in STD_LOGIC; 
		 AR_wr : in STD_LOGIC;
		 AR_data : in STD_LOGIC;
		 data_o : in STD_LOGIC_VECTOR(31 downto 0);	
		 Res_ALU : in STD_LOGIC_VECTOR(31 downto 0);
		 Mux4 : in STD_LOGIC_VECTOR(4 downto 0);	
		 
		 AR_wr2 : out STD_LOGIC;
		 AR_data2 : out STD_LOGIC;
		 data_o2 : out STD_LOGIC_VECTOR(31 downto 0);	
		 Res_ALU2 : out STD_LOGIC_VECTOR(31 downto 0);
		 Mux42 : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end RegistroMW;

architecture RegistroMW of RegistroMW is
begin
 process(clk,AR_wr,AR_data,data_o,Res_ALU,Mux4)
	begin
		if clk'event and clk='1' then  
		 AR_wr2 <= AR_wr;
		 AR_data2 <=AR_data;
		 data_o2 <=	data_o;
		 Res_ALU2 <= Res_ALU;
		 Mux42 <= Mux4;
	   end if;	    
	end process;

end RegistroMW;
