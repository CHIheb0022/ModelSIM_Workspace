library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basculeD is 
  
  port (
  CLK,D: in std_logic;
  Q,Qbar: out std_logic
  );

end basculeD;


Architecture basculeD_arch of basculeD is 

Begin 
  
  Process(CLK)
    begin
      if rising_edge(CLK) then
        Q<=D;
        Qbar<=not D;
      end if;
    end process;

end basculeD_arch;

