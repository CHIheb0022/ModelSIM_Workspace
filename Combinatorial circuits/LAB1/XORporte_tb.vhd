library IEEE;
use IEEE.STD_LOGIC_1164.All;


entity XORport_tb is 
end XORport_tb;

architecture XOR_tb_archi of XORport_tb is 
signal A,B,C:std_logic:='0'; 

begin
xor_instance1: entity work.XORport port map(a=>A,b=>B,c=>C);

process
begin

boucle: while (True) loop
wait for 10 ns;  
A <= not (A);
wait for 10 ns;
B <= not (B); 
end loop boucle;

--wait; -- To loop back (The process will be repeated each tile it reach the wait keyword)

end process;
end XOR_tb_archi;

