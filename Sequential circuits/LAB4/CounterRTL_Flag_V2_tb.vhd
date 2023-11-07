
library IEEE;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all ;

entity counterRTL_Flag_V2_tb is
end counterRTL_Flag_V2_tb;

architecture counterRTL_Flag_V2_tb_arch of counterRTL_Flag_V2_tb is
signal S :  unsigned(2 downto 0):="000" ;
signal CLK,RST,F: std_logic:='0';

begin
  Counter_F: entity work.countterRTL_Flag_V2 port map(CLK,RST,S,F);
  clk_gen_process: process
  begin
    -- Simulate for 1000 ns
    while now < 1000 ns loop 
      CLK <= '1';
      wait for 5 ns;
      CLK <= '0';
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
  
 end counterRTL_Flag_V2_tb_arch;

