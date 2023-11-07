library IEEE;
use IEEE.STD_LOGIC_1164.All;

ENTITY testandab IS
END testandab ;


ARCHITECTURE behavior OF testandab IS

COMPONENT and_ab
PORT ( a: in std_logic ;
b: in std_logic ;
c: out std_logic );
END COMPONENT ;

COMPONENT or_ab
PORT ( a: in std_logic ;
b: in std_logic ;
c: out std_logic );
END COMPONENT ;

COMPONENT xor_ab
PORT ( a: in std_logic ;
b: in std_logic ;
c: out std_logic );
END COMPONENT ;

COMPONENT nand_ab
PORT ( a: in std_logic ;
b: in std_logic ;
c: out std_logic );
END COMPONENT ;

COMPONENT nor_ab
PORT ( a: in std_logic ;
b: in std_logic ;
c: out std_logic );
END COMPONENT ;

SIGNAL A, B: STD_LOGIC := '0';
SIGNAL C1,C2,C3,C4,C5: STD_LOGIC := '0';

BEGIN
AND_MAP : and_ab PORT MAP ( a => A,b => B, c => C1 );
OR_MAP : or_ab PORT MAP ( a => A,b => B, c => C2 );
XOR_MAP : xor_ab PORT MAP ( a => A,b => B, c => C3 );
NAND_MAP : nand_ab PORT MAP ( a => A,b => B, c => C4 );
NOR_MAP : nor_ab PORT MAP ( a => A,b => B, c => C5 );
  


PROCESS 
BEGIN
A<= NOT A; wait for 20 ns; 
B<= NOT B; wait for 10 ns;
END PROCESS ;

END behavior ;
-- In VHDL, you usually define multiple architectures for Each entity but you 
-- can have only one architecture active at a time during simulation.