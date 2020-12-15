library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity CONTROL is
	port(
		 opcode : in STD_LOGIC_VECTOR(31 downto 0);	  
		 BRQ_ctr: out STD_LOGIC;
		 sel_rd : out STD_LOGIC;
		 AR_wr : out STD_LOGIC;	
		 op1_ALU : out STD_LOGIC;
		 op2_ALU : out STD_LOGIC_VECTOR(1 downto 0); 
		 ALU_op2 : out STD_LOGIC_VECTOR(1 downto 0); 
		 Mem_wr : out STD_LOGIC;
		 Mem_rd : out STD_LOGIC;
		 AR_data : out STD_LOGIC;
		 zero: in STD_LOGIC
	     );
end CONTROL;

architecture CONTROL of CONTROL is 
begin						   
	process(opcode)
	begin		
		case opcode(31 downto 26) is
		  when "000000" =>  --}} logico aritmeticas
			  sel_rd <= '1';
			  AR_wr <= '1' ;
			  op1_ALU <= '0'	;       
			  Mem_wr <= '0' ;	 
			  Mem_rd <= '0'	;
			  AR_data <= '0'; 
			  BRQ_ctr <= '0';
			  ALU_op2 <= "00";
			  op2_ALU<="10";
		  when "100011" => --}} carga 
			  sel_rd <= '0';
			  AR_wr <= '1' ;
			  op1_ALU <= '1';       
			  Mem_wr <= '0';	 
			  Mem_rd <= '1';
			  AR_data <= '1'; 
			  BRQ_ctr <= '0'; 
			  ALU_op2 <= "10";
			  op2_ALU<="01";
		   when "101011" =>  --}} almacenamiento
			  sel_rd <= 'X';
			  AR_wr <= '0' ;
			  op1_ALU <= '1';       
			  Mem_wr <= '0';	 
			  Mem_rd <= '0';
			  AR_data <= 'X'; 
			  BRQ_ctr <= '0'; 
			  ALU_op2 <= "10";
			  op2_ALU<="01";
		   when "000100" => --}} BRQ
			  sel_rd <= 'X';
			  AR_wr <= '0' ;
			  op1_ALU <= '0';       
			  Mem_wr <= '0';	 
			  Mem_rd <= '0';
			  AR_data <= 'X'; 
			  BRQ_ctr <= '1';
			  ALU_op2 <= "01";
			  op2_ALU<="00";
		  when others => NULL;
		end case; 
	end process;  
end CONTROL;
