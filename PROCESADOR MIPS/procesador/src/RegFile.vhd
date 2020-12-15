
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
entity RegFile is
	 port(
		 wr : in STD_LOGIC;	 
		 clk : in STD_LOGIC;
		 rs : in STD_LOGIC_VECTOR(31 downto 0);
		 rt : in STD_LOGIC_VECTOR(31 downto 0);
		 rw : in STD_LOGIC_VECTOR(4 downto 0);
		 data_w : in STD_LOGIC_VECTOR(31 downto 0);
		 dat1 : out STD_LOGIC_VECTOR(31 downto 0);
		 dat2 : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end RegFile;

--}} End of automatically maintained section

architecture RegFile of RegFile is
type memoria is array(0 to 31) of std_logic_vector(31 downto 0);
signal registros: memoria:=
	(  
	x"00000001",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000003",
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
	x"00000000",
	x"00000000",
	x"00000000"
	);
begin
	process(clk,wr,rs,rt,rw,data_w)	   
	begin 
		if clk'event and clk='0' and clk'last_value='1' and wr='1' then
		  registros(conv_integer(rw))<=data_w;	
		end if;
		 dat1<=registros(conv_integer(rs(25 downto 21)));	  
		 dat2<=registros(conv_integer(rt(20 downto 16)));	
	end process;
end RegFile;
