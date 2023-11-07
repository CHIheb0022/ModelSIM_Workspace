library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Half_adder_tb is 
end Half_adder_tb;

architecture Half_adder_tb_archi 
of Half_adder_tb is
signal A,B,RN_1,RN,S:std_logic;

signal S1:std_logic_vector(0 to 9):="0101100011";
signal S2:std_logic_vector(0 to 9):="0011001011";
signal S3:std_logic_vector(0 to 9):="0000111011";

begin 
  H: entity work.Half_adder port map(A,B,RN_1,RN,S);
  process
      variable delay: time := 10 ns;
  begin
  boucle: while (True) loop
    for i in 0 to 9 loop -- to obtain 1 cycle
        A <= S1(i);
        B <= S2(i);
        RN_1 <= S3(i);
        wait for delay;
        end loop;
    end loop boucle;
    wait;      
  end process;
end Half_adder_tb_archi;