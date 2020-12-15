library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity MemCodigo is
	 port(
		 clk : in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 instruccion : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MemCodigo;

--}} End of automatically maintained section

architecture MemCodigo of MemCodigo is
type memoria is array(0 to 31) of std_logic_vector(31 downto 0);
signal memInstrucciones: memoria:=(  
	x"10040004",--}} BEQ $0,4$,4
	x"8C080024",--}} Lw $8, 6($4)
	x"AC881006",--}} sw $8, 6($3)
	x"00011020",--}} add $2,$0,$1
	x"d600001e",
	x"f84052c9",
	x"cb150288",
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
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000"
);
begin
  process(addr,clk)
  begin  
	  if clk'event and clk='1'then 
		instruccion<= memInstrucciones(conv_integer(addr(6 downto 2)));	  
	  end if;
	end process;
end MemCodigo;
