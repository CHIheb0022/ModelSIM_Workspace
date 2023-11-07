library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Check_Parity is
port(
   A0,A1,A2,A3:in std_logic;
   P:out std_logic);
end Check_Parity;

architecture Check_Parity_archi of Check_Parity is 
signal S0,S1 : std_logic; --Used for inter_connexion
begin 
  xor1:entity work.XORport port map(A0,A1,S0);
  xor2:entity work.XORport port map(S0,A2,S1);
  xor3:entity work.XORport port map(S1,A3,P);
end Check_Parity_archi;
