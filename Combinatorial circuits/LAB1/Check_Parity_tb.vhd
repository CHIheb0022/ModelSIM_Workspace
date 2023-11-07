library IEEE;
use IEEE.STD_LOGIC_1164.All;


entity Check_Parity_tb is 
end Check_Parity_tb;

architecture Check_Parity_tb_archi of Check_Parity_tb is 
signal A0,A1,A2,A3:std_logic;
signal P:std_logic;
signal A0_Val :std_logic_vector(0 to 9):="0101100011";
signal A1_Val :std_logic_vector(0 to 9):="0011001011";
signal A2_Val :std_logic_vector(0 to 9):="0000111011";
signal A3_Val :std_logic_vector(0 to 9):="0000011101"; 

begin
Check1: entity work.Check_Parity port map(A0,A1,A2,A3,P);

process
    variable delay: time := 10 ns;
  begin
  boucle: while (True) loop
    for i in 0 to 9 loop -- to obtain 1 cycle
        A0 <= A0_Val(i);
        A1 <= A1_Val(i);
        A2 <= A2_Val(i);
        A3 <= A3_Val(i);
    wait for delay;
  end loop;
end loop boucle;

    wait;
end process;

end Check_Parity_tb_archi;


