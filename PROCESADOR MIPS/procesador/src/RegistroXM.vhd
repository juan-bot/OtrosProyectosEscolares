library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegistroXM is
	 port(
		 clk : in STD_LOGIC; 
		 AR_wr : in STD_LOGIC;
		 Mem_wr : in STD_LOGIC;
		 Mem_rd : in STD_LOGIC;
		 AR_data : in STD_LOGIC; 
		 BRQ_ctr : in STD_LOGIC; 
		 cero : in STD_LOGIC; 
		 R_ALU : in STD_LOGIC_VECTOR(31 downto 0);
		 data: in STD_LOGIC_VECTOR(31 downto 0);
		 Mux4: in STD_LOGIC_VECTOR(4 downto 0);
		 
		 AR_wr2 : out STD_LOGIC;
		 Mem_wr2 : out STD_LOGIC;
		 Mem_rd2 : out STD_LOGIC;
		 AR_data2 : out STD_LOGIC; 
		 BRQ_ctr2 : out STD_LOGIC; 
		 cero2 : out STD_LOGIC; 
		 R_ALU2 : out STD_LOGIC_VECTOR(31 downto 0);
		 data2: out STD_LOGIC_VECTOR(31 downto 0);
		 Mux42: out STD_LOGIC_VECTOR(4 downto 0)
	     );
end RegistroXM;

--}} End of automatically maintained section

architecture RegistroXM of RegistroXM is
begin
process(clk,AR_wr,Mem_wr,Mem_rd,AR_data,BRQ_ctr,data,cero,Mux4,R_ALU)
	begin
		if clk'event and clk='1' then  
		 AR_wr2 <= AR_wr;
		 Mem_wr2 <=	Mem_wr;
		 Mem_rd2 <=	Mem_rd;
		 AR_data2 <= AR_data;
		 BRQ_ctr2 <= BRQ_ctr;
		 cero2 <= cero;
		 R_ALU2 <= R_ALU;
		 data2 <= data;
		 Mux42 <= Mux4;
	   end if;	    
	end process;


end RegistroXM;
