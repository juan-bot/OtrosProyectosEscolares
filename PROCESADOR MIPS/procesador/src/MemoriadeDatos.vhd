library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity MemoriadeDatos is
	 port(
		 clk:  in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 dato : in STD_LOGIC_VECTOR(31 downto 0);
		 we : in STD_LOGIC;
		 rd : in STD_LOGIC;
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MemoriadeDatos;

--}} End of automatically maintained section

architecture MemoriadeDatos of MemoriadeDatos is
type memoria is array(0 to 31) of std_logic_vector(31 downto 0);
signal datos: memoria:=
	(  
	x"00000020",
	x"00000000",
	x"00000080",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"0000000F",
	x"00000007",
	x"00000003",
	x"00000008",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000"
	);
begin
	process(clk,we,rd,addr,dato)
	begin 
		if we='1' and clk'event and clk='1' then
			datos(conv_integer(addr(6 downto 2)))<=dato;
			salida<= (others => '0');
		end if;									
		
		if rd='1' then
			salida<=datos(conv_integer(addr(6 downto 2)));   
		else   
			salida<= (others => '0');
		end if;
	
		end process;

end MemoriadeDatos;
