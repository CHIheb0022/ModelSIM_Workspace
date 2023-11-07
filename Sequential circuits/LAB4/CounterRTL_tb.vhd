library IEEE;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all ;

entity CounterRTL_tb is
end CounterRTL_tb;

architecture CounterRTL_tb_archi of counterRTL_tb is
signal S :  unsigned(2 downto 0):="000" ;
signal CLK,RST: std_logic:='0';
begin
  Counter: entity work.countterRTL port map(CLK,RST,S);
  
  process
  begin
     
    -- Simulate CLK for 1000 ns
    while now < 1000 ns loop -- "now" is a predefined keyword that tracks the simulation time from the start.
      CLK <= '0';
      wait for 5 ns;
      CLK <= '1';
      wait for 5 ns;
    end loop;
    wait;
    
  end process;
  
 -- In a concurent process manipulate the RST  
  process
  begin
    RST <= '0' after 0 ns, '1' after 50 ns, '0' after 70 ns;
    wait for 120 ns; -- Allow some time for RST to stabilize
    wait;
  end process;
 
 end CounterRTL_tb_archi;