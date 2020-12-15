library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity UC_ALU is
	port( 
	     funcion : in STD_LOGIC_VECTOR(5 downto 0);
		 ALU_op : in STD_LOGIC_VECTOR(1 downto 0);
		 Ctr_ALU : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end UC_ALU;

--}} End of automatically maintained section

architecture UC_ALU of UC_ALU is
begin
	process(funcion,ALU_op) 
	begin
	 case ALU_op is
			when "10"=>	Ctr_ALU <="000";
			when "01"=> Ctr_ALU <="001";
			when "00"=>	 
				case funcion is    
					when "100000" => Ctr_ALU <="000";
					when "100010" => Ctr_ALU <="001";
					when "100100" => Ctr_ALU <="010";
					when "100101" => Ctr_ALU <="100";
					when "101010" => Ctr_ALU <="011";
				    when others => NULL;
				end case;
			when others => NULL;
		end case;
	 end process;
end UC_ALU;
