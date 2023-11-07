library IEEE;
use IEEE.STD_LOGIC_1164.All;


entity XORport is 
port(
a: in  std_logic;
b: in  std_logic;
c: out  std_logic
);
end XORport;

architecture XOR_archi of XORport is 
begin
c <= a xor b;
end XOR_archi;
