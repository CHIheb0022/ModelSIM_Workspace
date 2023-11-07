library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_tb is
end Full_Adder_tb;

ARCHITECTURE arch of Full_Adder_tb is 
signal a,b,s : std_logic_vector(3 downto 0);
signal c : std_logic;

begin
add:entity work.adder_4 port map(a,b,s,c);

a<= "1011" after 0 ns ,"0011" after 100 ns,"1011" after 200 ns,"1101" after 300 ns;  
b<= "1010" after 0 ns ,"1100" after 100 ns,"0010" after 200 ns,"0011" after 300 ns;    
    

end arch;