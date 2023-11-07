

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CounterN_rst_tb is 
end CounterN_rst_tb ;


Architecture CounterN_tb_rst_arch of CounterN_rst_tb is 

  -- Signal H representing the clock sourcing the Counter  
  signal CLK_src: std_logic_vector (7 downto 0) := "01010101";
  signal R_src: std_logic_vector (7 downto 0) := "00010001";
  -- signal to be mapped to Counter i/o Pins
  signal CLK,R: std_logic := '0' ;
  signal Q,Qbar: std_logic_vector(2 downto 0);


  begin
  Counter : entity work.CounterN_rst port map (CLK,R,Q,Qbar);
  
  process
    variable delay: time := 10 ns;
    begin
    boucle: while (True) loop --Or use while now < 1000ns --
      for i in 0 to 7 loop -- to obtain 1 cycle
        CLK <= CLK_src(i);
        R <= R_src(i);
        wait for delay;
      end loop;
    
    end loop boucle;

    wait; --Lunch the Process  
  end process;
  
  end CounterN_tb_rst_arch;






