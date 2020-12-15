-------------------------------------------------------------------------------
--
-- Title       : bloquees
-- Design      : procesador
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Procesador1.0\procesador\compile\bloquees.vhd
-- Generated   : Thu Sep 10 14:27:54 2020
-- From        : c:\My_Designs\Procesador1.0\procesador\src\bloquees.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity bloquees is 
end bloquees;

architecture bloquees of bloquees is

---- Component declarations -----

component Fub1
  port (
       data_w : in STD_LOGIC_VECTOR(32 downto 0);
       r1 : in STD_LOGIC_VECTOR(4 downto 0);
       r2 : in STD_LOGIC_VECTOR(4 downto 0);
       rw : in STD_LOGIC_VECTOR(5 downto 0);
       wr : in STD_LOGIC;
       dat1 : out STD_LOGIC_VECTOR(31 downto 0);
       dat2 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub10
  port (
       Addr : in STD_LOGIC_VECTOR(7 downto 0);
       WE : in STD_LOGIC;
       dato : in STD_LOGIC_VECTOR(31 downto 0);
       rd : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub12
  port (
       data0 : in STD_LOGIC_VECTOR(31 downto 0);
       data1 : in STD_LOGIC_VECTOR(31 downto 0);
       sel : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub13
  port (
       clk : in STD_LOGIC;
       inPC : in STD_LOGIC_VECTOR(31 downto 0);
       outPC : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub3
  port (
       s1 : in STD_LOGIC_VECTOR(7 downto 0);
       s2 : in STD_LOGIC_VECTOR(7 downto 0);
       r : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Fub4
  port (
       Addr : in STD_LOGIC_VECTOR(7 downto 0);
       Data : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Fub5
  port (
       d0 : in STD_LOGIC_VECTOR(7 downto 0);
       d1 : in STD_LOGIC_VECTOR(7 downto 0);
       sel : in STD_LOGIC;
       sal : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Fub6
  port (
       entrada : in STD_LOGIC_VECTOR(15 downto 0);
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub7
  port (
       dato1 : in STD_LOGIC_VECTOR(7 downto 0);
       dato2 : in STD_LOGIC_VECTOR(7 downto 0);
       salida : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Fub8
  port (
       dato : in STD_LOGIC_VECTOR(31 downto 0);
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Fub9
  port (
       data1 : in STD_LOGIC_VECTOR(31 downto 0);
       data2 : in STD_LOGIC_VECTOR(31 downto 0);
       res : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

ALU : Fub9
  port map(
       data1(0) => Dangling_Input_Signal,
       data1(1) => Dangling_Input_Signal,
       data1(2) => Dangling_Input_Signal,
       data1(3) => Dangling_Input_Signal,
       data1(4) => Dangling_Input_Signal,
       data1(5) => Dangling_Input_Signal,
       data1(6) => Dangling_Input_Signal,
       data1(7) => Dangling_Input_Signal,
       data1(8) => Dangling_Input_Signal,
       data1(9) => Dangling_Input_Signal,
       data1(10) => Dangling_Input_Signal,
       data1(11) => Dangling_Input_Signal,
       data1(12) => Dangling_Input_Signal,
       data1(13) => Dangling_Input_Signal,
       data1(14) => Dangling_Input_Signal,
       data1(15) => Dangling_Input_Signal,
       data1(16) => Dangling_Input_Signal,
       data1(17) => Dangling_Input_Signal,
       data1(18) => Dangling_Input_Signal,
       data1(19) => Dangling_Input_Signal,
       data1(20) => Dangling_Input_Signal,
       data1(21) => Dangling_Input_Signal,
       data1(22) => Dangling_Input_Signal,
       data1(23) => Dangling_Input_Signal,
       data1(24) => Dangling_Input_Signal,
       data1(25) => Dangling_Input_Signal,
       data1(26) => Dangling_Input_Signal,
       data1(27) => Dangling_Input_Signal,
       data1(28) => Dangling_Input_Signal,
       data1(29) => Dangling_Input_Signal,
       data1(30) => Dangling_Input_Signal,
       data1(31) => Dangling_Input_Signal,
       data2(0) => Dangling_Input_Signal,
       data2(1) => Dangling_Input_Signal,
       data2(2) => Dangling_Input_Signal,
       data2(3) => Dangling_Input_Signal,
       data2(4) => Dangling_Input_Signal,
       data2(5) => Dangling_Input_Signal,
       data2(6) => Dangling_Input_Signal,
       data2(7) => Dangling_Input_Signal,
       data2(8) => Dangling_Input_Signal,
       data2(9) => Dangling_Input_Signal,
       data2(10) => Dangling_Input_Signal,
       data2(11) => Dangling_Input_Signal,
       data2(12) => Dangling_Input_Signal,
       data2(13) => Dangling_Input_Signal,
       data2(14) => Dangling_Input_Signal,
       data2(15) => Dangling_Input_Signal,
       data2(16) => Dangling_Input_Signal,
       data2(17) => Dangling_Input_Signal,
       data2(18) => Dangling_Input_Signal,
       data2(19) => Dangling_Input_Signal,
       data2(20) => Dangling_Input_Signal,
       data2(21) => Dangling_Input_Signal,
       data2(22) => Dangling_Input_Signal,
       data2(23) => Dangling_Input_Signal,
       data2(24) => Dangling_Input_Signal,
       data2(25) => Dangling_Input_Signal,
       data2(26) => Dangling_Input_Signal,
       data2(27) => Dangling_Input_Signal,
       data2(28) => Dangling_Input_Signal,
       data2(29) => Dangling_Input_Signal,
       data2(30) => Dangling_Input_Signal,
       data2(31) => Dangling_Input_Signal
  );

MemoriaDeCodigo : Fub4
  port map(
       Addr(0) => Dangling_Input_Signal,
       Addr(1) => Dangling_Input_Signal,
       Addr(2) => Dangling_Input_Signal,
       Addr(3) => Dangling_Input_Signal,
       Addr(4) => Dangling_Input_Signal,
       Addr(5) => Dangling_Input_Signal,
       Addr(6) => Dangling_Input_Signal,
       Addr(7) => Dangling_Input_Signal
  );

MemoriaDeDatos : Fub10
  port map(
       Addr(0) => Dangling_Input_Signal,
       Addr(1) => Dangling_Input_Signal,
       Addr(2) => Dangling_Input_Signal,
       Addr(3) => Dangling_Input_Signal,
       Addr(4) => Dangling_Input_Signal,
       Addr(5) => Dangling_Input_Signal,
       Addr(6) => Dangling_Input_Signal,
       Addr(7) => Dangling_Input_Signal,
       dato(0) => Dangling_Input_Signal,
       dato(1) => Dangling_Input_Signal,
       dato(2) => Dangling_Input_Signal,
       dato(3) => Dangling_Input_Signal,
       dato(4) => Dangling_Input_Signal,
       dato(5) => Dangling_Input_Signal,
       dato(6) => Dangling_Input_Signal,
       dato(7) => Dangling_Input_Signal,
       dato(8) => Dangling_Input_Signal,
       dato(9) => Dangling_Input_Signal,
       dato(10) => Dangling_Input_Signal,
       dato(11) => Dangling_Input_Signal,
       dato(12) => Dangling_Input_Signal,
       dato(13) => Dangling_Input_Signal,
       dato(14) => Dangling_Input_Signal,
       dato(15) => Dangling_Input_Signal,
       dato(16) => Dangling_Input_Signal,
       dato(17) => Dangling_Input_Signal,
       dato(18) => Dangling_Input_Signal,
       dato(19) => Dangling_Input_Signal,
       dato(20) => Dangling_Input_Signal,
       dato(21) => Dangling_Input_Signal,
       dato(22) => Dangling_Input_Signal,
       dato(23) => Dangling_Input_Signal,
       dato(24) => Dangling_Input_Signal,
       dato(25) => Dangling_Input_Signal,
       dato(26) => Dangling_Input_Signal,
       dato(27) => Dangling_Input_Signal,
       dato(28) => Dangling_Input_Signal,
       dato(29) => Dangling_Input_Signal,
       dato(30) => Dangling_Input_Signal,
       dato(31) => Dangling_Input_Signal,
       WE => Dangling_Input_Signal,
       rd => Dangling_Input_Signal
  );

PC : Fub13
  port map(
       inPC(0) => Dangling_Input_Signal,
       inPC(1) => Dangling_Input_Signal,
       inPC(2) => Dangling_Input_Signal,
       inPC(3) => Dangling_Input_Signal,
       inPC(4) => Dangling_Input_Signal,
       inPC(5) => Dangling_Input_Signal,
       inPC(6) => Dangling_Input_Signal,
       inPC(7) => Dangling_Input_Signal,
       inPC(8) => Dangling_Input_Signal,
       inPC(9) => Dangling_Input_Signal,
       inPC(10) => Dangling_Input_Signal,
       inPC(11) => Dangling_Input_Signal,
       inPC(12) => Dangling_Input_Signal,
       inPC(13) => Dangling_Input_Signal,
       inPC(14) => Dangling_Input_Signal,
       inPC(15) => Dangling_Input_Signal,
       inPC(16) => Dangling_Input_Signal,
       inPC(17) => Dangling_Input_Signal,
       inPC(18) => Dangling_Input_Signal,
       inPC(19) => Dangling_Input_Signal,
       inPC(20) => Dangling_Input_Signal,
       inPC(21) => Dangling_Input_Signal,
       inPC(22) => Dangling_Input_Signal,
       inPC(23) => Dangling_Input_Signal,
       inPC(24) => Dangling_Input_Signal,
       inPC(25) => Dangling_Input_Signal,
       inPC(26) => Dangling_Input_Signal,
       inPC(27) => Dangling_Input_Signal,
       inPC(28) => Dangling_Input_Signal,
       inPC(29) => Dangling_Input_Signal,
       inPC(30) => Dangling_Input_Signal,
       inPC(31) => Dangling_Input_Signal,
       clk => Dangling_Input_Signal
  );

SUMADOR : Fub3
  port map(
       s1(0) => Dangling_Input_Signal,
       s1(1) => Dangling_Input_Signal,
       s1(2) => Dangling_Input_Signal,
       s1(3) => Dangling_Input_Signal,
       s1(4) => Dangling_Input_Signal,
       s1(5) => Dangling_Input_Signal,
       s1(6) => Dangling_Input_Signal,
       s1(7) => Dangling_Input_Signal,
       s2(0) => Dangling_Input_Signal,
       s2(1) => Dangling_Input_Signal,
       s2(2) => Dangling_Input_Signal,
       s2(3) => Dangling_Input_Signal,
       s2(4) => Dangling_Input_Signal,
       s2(5) => Dangling_Input_Signal,
       s2(6) => Dangling_Input_Signal,
       s2(7) => Dangling_Input_Signal
  );

archivodeRegistros : Fub1
  port map(
       data_w(0) => Dangling_Input_Signal,
       data_w(1) => Dangling_Input_Signal,
       data_w(2) => Dangling_Input_Signal,
       data_w(3) => Dangling_Input_Signal,
       data_w(4) => Dangling_Input_Signal,
       data_w(5) => Dangling_Input_Signal,
       data_w(6) => Dangling_Input_Signal,
       data_w(7) => Dangling_Input_Signal,
       data_w(8) => Dangling_Input_Signal,
       data_w(9) => Dangling_Input_Signal,
       data_w(10) => Dangling_Input_Signal,
       data_w(11) => Dangling_Input_Signal,
       data_w(12) => Dangling_Input_Signal,
       data_w(13) => Dangling_Input_Signal,
       data_w(14) => Dangling_Input_Signal,
       data_w(15) => Dangling_Input_Signal,
       data_w(16) => Dangling_Input_Signal,
       data_w(17) => Dangling_Input_Signal,
       data_w(18) => Dangling_Input_Signal,
       data_w(19) => Dangling_Input_Signal,
       data_w(20) => Dangling_Input_Signal,
       data_w(21) => Dangling_Input_Signal,
       data_w(22) => Dangling_Input_Signal,
       data_w(23) => Dangling_Input_Signal,
       data_w(24) => Dangling_Input_Signal,
       data_w(25) => Dangling_Input_Signal,
       data_w(26) => Dangling_Input_Signal,
       data_w(27) => Dangling_Input_Signal,
       data_w(28) => Dangling_Input_Signal,
       data_w(29) => Dangling_Input_Signal,
       data_w(30) => Dangling_Input_Signal,
       data_w(31) => Dangling_Input_Signal,
       data_w(32) => Dangling_Input_Signal,
       r1(0) => Dangling_Input_Signal,
       r1(1) => Dangling_Input_Signal,
       r1(2) => Dangling_Input_Signal,
       r1(3) => Dangling_Input_Signal,
       r1(4) => Dangling_Input_Signal,
       r2(0) => Dangling_Input_Signal,
       r2(1) => Dangling_Input_Signal,
       r2(2) => Dangling_Input_Signal,
       r2(3) => Dangling_Input_Signal,
       r2(4) => Dangling_Input_Signal,
       rw(0) => Dangling_Input_Signal,
       rw(1) => Dangling_Input_Signal,
       rw(2) => Dangling_Input_Signal,
       rw(3) => Dangling_Input_Signal,
       rw(4) => Dangling_Input_Signal,
       rw(5) => Dangling_Input_Signal,
       wr => Dangling_Input_Signal
  );

extensionDeSigno : Fub6
  port map(
       entrada(0) => Dangling_Input_Signal,
       entrada(1) => Dangling_Input_Signal,
       entrada(2) => Dangling_Input_Signal,
       entrada(3) => Dangling_Input_Signal,
       entrada(4) => Dangling_Input_Signal,
       entrada(5) => Dangling_Input_Signal,
       entrada(6) => Dangling_Input_Signal,
       entrada(7) => Dangling_Input_Signal,
       entrada(8) => Dangling_Input_Signal,
       entrada(9) => Dangling_Input_Signal,
       entrada(10) => Dangling_Input_Signal,
       entrada(11) => Dangling_Input_Signal,
       entrada(12) => Dangling_Input_Signal,
       entrada(13) => Dangling_Input_Signal,
       entrada(14) => Dangling_Input_Signal,
       entrada(15) => Dangling_Input_Signal
  );

multiplicador : Fub8
  port map(
       dato(0) => Dangling_Input_Signal,
       dato(1) => Dangling_Input_Signal,
       dato(2) => Dangling_Input_Signal,
       dato(3) => Dangling_Input_Signal,
       dato(4) => Dangling_Input_Signal,
       dato(5) => Dangling_Input_Signal,
       dato(6) => Dangling_Input_Signal,
       dato(7) => Dangling_Input_Signal,
       dato(8) => Dangling_Input_Signal,
       dato(9) => Dangling_Input_Signal,
       dato(10) => Dangling_Input_Signal,
       dato(11) => Dangling_Input_Signal,
       dato(12) => Dangling_Input_Signal,
       dato(13) => Dangling_Input_Signal,
       dato(14) => Dangling_Input_Signal,
       dato(15) => Dangling_Input_Signal,
       dato(16) => Dangling_Input_Signal,
       dato(17) => Dangling_Input_Signal,
       dato(18) => Dangling_Input_Signal,
       dato(19) => Dangling_Input_Signal,
       dato(20) => Dangling_Input_Signal,
       dato(21) => Dangling_Input_Signal,
       dato(22) => Dangling_Input_Signal,
       dato(23) => Dangling_Input_Signal,
       dato(24) => Dangling_Input_Signal,
       dato(25) => Dangling_Input_Signal,
       dato(26) => Dangling_Input_Signal,
       dato(27) => Dangling_Input_Signal,
       dato(28) => Dangling_Input_Signal,
       dato(29) => Dangling_Input_Signal,
       dato(30) => Dangling_Input_Signal,
       dato(31) => Dangling_Input_Signal
  );

mux : Fub5
  port map(
       d0(0) => Dangling_Input_Signal,
       d0(1) => Dangling_Input_Signal,
       d0(2) => Dangling_Input_Signal,
       d0(3) => Dangling_Input_Signal,
       d0(4) => Dangling_Input_Signal,
       d0(5) => Dangling_Input_Signal,
       d0(6) => Dangling_Input_Signal,
       d0(7) => Dangling_Input_Signal,
       d1(0) => Dangling_Input_Signal,
       d1(1) => Dangling_Input_Signal,
       d1(2) => Dangling_Input_Signal,
       d1(3) => Dangling_Input_Signal,
       d1(4) => Dangling_Input_Signal,
       d1(5) => Dangling_Input_Signal,
       d1(6) => Dangling_Input_Signal,
       d1(7) => Dangling_Input_Signal,
       sel => Dangling_Input_Signal
  );

mux2 : Fub7
  port map(
       dato1(0) => Dangling_Input_Signal,
       dato1(1) => Dangling_Input_Signal,
       dato1(2) => Dangling_Input_Signal,
       dato1(3) => Dangling_Input_Signal,
       dato1(4) => Dangling_Input_Signal,
       dato1(5) => Dangling_Input_Signal,
       dato1(6) => Dangling_Input_Signal,
       dato1(7) => Dangling_Input_Signal,
       dato2(0) => Dangling_Input_Signal,
       dato2(1) => Dangling_Input_Signal,
       dato2(2) => Dangling_Input_Signal,
       dato2(3) => Dangling_Input_Signal,
       dato2(4) => Dangling_Input_Signal,
       dato2(5) => Dangling_Input_Signal,
       dato2(6) => Dangling_Input_Signal,
       dato2(7) => Dangling_Input_Signal
  );

mux3 : Fub12
  port map(
       data0(0) => Dangling_Input_Signal,
       data0(1) => Dangling_Input_Signal,
       data0(2) => Dangling_Input_Signal,
       data0(3) => Dangling_Input_Signal,
       data0(4) => Dangling_Input_Signal,
       data0(5) => Dangling_Input_Signal,
       data0(6) => Dangling_Input_Signal,
       data0(7) => Dangling_Input_Signal,
       data0(8) => Dangling_Input_Signal,
       data0(9) => Dangling_Input_Signal,
       data0(10) => Dangling_Input_Signal,
       data0(11) => Dangling_Input_Signal,
       data0(12) => Dangling_Input_Signal,
       data0(13) => Dangling_Input_Signal,
       data0(14) => Dangling_Input_Signal,
       data0(15) => Dangling_Input_Signal,
       data0(16) => Dangling_Input_Signal,
       data0(17) => Dangling_Input_Signal,
       data0(18) => Dangling_Input_Signal,
       data0(19) => Dangling_Input_Signal,
       data0(20) => Dangling_Input_Signal,
       data0(21) => Dangling_Input_Signal,
       data0(22) => Dangling_Input_Signal,
       data0(23) => Dangling_Input_Signal,
       data0(24) => Dangling_Input_Signal,
       data0(25) => Dangling_Input_Signal,
       data0(26) => Dangling_Input_Signal,
       data0(27) => Dangling_Input_Signal,
       data0(28) => Dangling_Input_Signal,
       data0(29) => Dangling_Input_Signal,
       data0(30) => Dangling_Input_Signal,
       data0(31) => Dangling_Input_Signal,
       data1(0) => Dangling_Input_Signal,
       data1(1) => Dangling_Input_Signal,
       data1(2) => Dangling_Input_Signal,
       data1(3) => Dangling_Input_Signal,
       data1(4) => Dangling_Input_Signal,
       data1(5) => Dangling_Input_Signal,
       data1(6) => Dangling_Input_Signal,
       data1(7) => Dangling_Input_Signal,
       data1(8) => Dangling_Input_Signal,
       data1(9) => Dangling_Input_Signal,
       data1(10) => Dangling_Input_Signal,
       data1(11) => Dangling_Input_Signal,
       data1(12) => Dangling_Input_Signal,
       data1(13) => Dangling_Input_Signal,
       data1(14) => Dangling_Input_Signal,
       data1(15) => Dangling_Input_Signal,
       data1(16) => Dangling_Input_Signal,
       data1(17) => Dangling_Input_Signal,
       data1(18) => Dangling_Input_Signal,
       data1(19) => Dangling_Input_Signal,
       data1(20) => Dangling_Input_Signal,
       data1(21) => Dangling_Input_Signal,
       data1(22) => Dangling_Input_Signal,
       data1(23) => Dangling_Input_Signal,
       data1(24) => Dangling_Input_Signal,
       data1(25) => Dangling_Input_Signal,
       data1(26) => Dangling_Input_Signal,
       data1(27) => Dangling_Input_Signal,
       data1(28) => Dangling_Input_Signal,
       data1(29) => Dangling_Input_Signal,
       data1(30) => Dangling_Input_Signal,
       data1(31) => Dangling_Input_Signal,
       sel => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end bloquees;
