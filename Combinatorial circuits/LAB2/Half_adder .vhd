library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Half_adder is 
port (
a: in std_logic;
b: in std_logic;
Rn_1: in std_logic;
Rn: out std_logic;
s: out std_logic  
);
end Half_adder;

architecture Half_adder_archi 
of Half_adder is 

begin 
process
  
  begin
    s<= (a xor b) xor Rn_1;
    Rn<= (a AND b) OR (Rn_1 AND (a XOR b));
  end process;
  
end Half_adder_archi; 
