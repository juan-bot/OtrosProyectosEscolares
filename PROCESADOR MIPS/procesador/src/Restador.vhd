library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity Restador is
	 port(
	 	 s1 : in STD_LOGIC_VECTOR(31 downto 0);
	 	 s2 : in STD_LOGIC_VECTOR(31 downto 0);
		 cero: out STD_LOGIC
	     );
end Restador;


architecture Restador of Restador is
begin
	process(s1,s2)
		begin 
			if s1 = s2 then
				cero <= '1';
			else
				cero <= '0';
			end if;
	end process;
end Restador;
