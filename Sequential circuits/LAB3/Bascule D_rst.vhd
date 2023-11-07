library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basculeD_rst is 
  
  port (
  CLK,D,Reset: in std_logic;
  Q,Qbar: out std_logic
  );

end basculeD_rst;


Architecture basculeD_rst_arch of basculeD_rst is 

Begin 
  
  Process(CLK)
    begin
      if Reset = '1' then
        Q <= '0'; --! asyn
      elsif rising_edge(CLK) then
        Q<=D;
        Qbar<=not D;
      end if;
    end process;

end basculeD_rst_arch;


