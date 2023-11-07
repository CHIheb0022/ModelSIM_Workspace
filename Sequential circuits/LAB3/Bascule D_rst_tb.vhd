
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basculeD_tb is 
end basculeD_tb;


Architecture basculeD_tb_arch of basculeD_tb is 

  -- Signals sourcing the D flip flop inputs  
  signal H_src: std_logic_vector (7 downto 0) := "01010101";
  signal S_src: std_logic_vector (7 downto 0) := "11101010";
  signal R_src: std_logic_vector (7 downto 0) := "00001001";
  -- signal to be mapped to D flip flop i/o Pins
  signal S,R,H,Q,Qbar : std_logic := '0' ;


  begin
  basculeD : entity work.basculeD port map (H,S,R,Q,Qbar);
  
  process
    variable delay: time := 10 ns;
    
    begin
    boucle: while (True) loop
      for i in 0 to 7 loop -- to obtain 1 cycle
        H <= H_src(i);
        S <= S_src(i);
        R <= R_src(i);
        wait for delay;
      end loop;
    
    end loop boucle;

    wait; --Lunch the Process  
    end process;
  
  end basculeD_tb_arch;




