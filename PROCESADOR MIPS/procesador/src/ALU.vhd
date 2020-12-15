library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity ALU is
	 port(
		 codigo: in STD_LOGIC_VECTOR(2 downto 0);
		 op1 : in STD_LOGIC_VECTOR(31 downto 0);
		 op2 : in STD_LOGIC_VECTOR(31 downto 0);  
		 res : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end ALU;


architecture ALU of ALU is
SIGNAL aux : std_logic_Vector(31 downto 0);
begin
	process(codigo,op1,op2)
	begin
		case codigo is
		  when "000" =>   res <= op1 + op2;
		  when "001" => res <= op1 - op2;  
		  when "010" =>   res <= op1 and op2;
		  when "011" =>   res <= op1 or op2;	 
		  when "100" =>   res <= op1 or op2;
		  when others => res <= op1;
		end case; 
	end process;
end ALU;
