library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity RegistroDX is
	 port(
	 	 clk : in STD_LOGIC; 
		 AR_wr : in STD_LOGIC;
		 AR_data : in STD_LOGIC;
		 Mem_rd : in STD_LOGIC;
		 Mem_wr : in STD_LOGIC;
		 BRQ_ctr : in STD_LOGIC; 
		 op1_ALU : in STD_LOGIC;
		 op2_ALU : in STD_LOGIC_VECTOR(1 downto 0);	
		 sel_rd : in STD_LOGIC;
		 ALU_op : in STD_LOGIC_VECTOR(1 downto 0);
		 pc	:in STD_LOGIC_VECTOR(31 downto 0);
		 data1 : in STD_LOGIC_VECTOR(31 downto 0);
		 data2 : in STD_LOGIC_VECTOR(31 downto 0);
		 ext_signo : in STD_LOGIC_VECTOR(31 downto 0);
		 mult : in STD_LOGIC_VECTOR(31 downto 0);
		 rt: in STD_LOGIC_VECTOR(31 downto 0);
		 rd: in STD_LOGIC_VECTOR(31 downto 0);
		 
		 AR_wr2 : out STD_LOGIC;
		 AR_data2 : out STD_LOGIC;
		 Mem_rd2 : out STD_LOGIC;
		 Mem_wr2 : out STD_LOGIC;
		 BRQ_ctr2 : out STD_LOGIC; 
		 op1_ALU2 : out STD_LOGIC;
		 op2_ALU2 : out STD_LOGIC_VECTOR(1 downto 0);	
		 sel_rd2 : out STD_LOGIC;
		 ALU_op2 : out STD_LOGIC_VECTOR(1 downto 0);
		 pc2	:out STD_LOGIC_VECTOR(31 downto 0);
		 data12 : out STD_LOGIC_VECTOR(31 downto 0);
		 data22 : out STD_LOGIC_VECTOR(31 downto 0);
		 ext_signo2 : out STD_LOGIC_VECTOR(31 downto 0);
		 mult2 : out STD_LOGIC_VECTOR(31 downto 0);
		 rt2: out STD_LOGIC_VECTOR(4 downto 0);
		 rd2: out STD_LOGIC_VECTOR(4 downto 0);
		 funcion: out STD_LOGIC_VECTOR(5 downto 0)
	     );
end RegistroDX;

architecture RegistroDX of RegistroDX is
begin
process(clk,sel_rd,AR_wr,op1_ALU,op2_ALU,ALU_op,Mem_wr,Mem_rd,AR_data,BRQ_ctr,data1,data2,ext_signo,mult,rt,rd)
	begin
		if clk'event and clk='1' then 
	     pc2<=pc;
		 sel_rd2 <=	sel_rd	;
		 AR_wr2 <= AR_wr ;
		 op1_ALU2 <=op1_ALU;
		 op2_ALU2 <=op2_ALU;
		 ALU_op2 <=ALU_op;
		 Mem_wr2 <=	 Mem_wr;
		 Mem_rd2 <=Mem_rd;
		 AR_data2 <=AR_data;
		 BRQ_ctr2 <=BRQ_ctr;
		 data12 <= data1;
		 data22 <= data2;
		 ext_signo2 <= ext_signo;
		 mult2 <= mult;
		 rt2 <= rt(20 downto 16);
		 rd2 <= rd(15 downto 11);
		 funcion<=rd(5 downto 0);
	   end if;	    
	end process;

end RegistroDX;
