-- This implementation version is designed to avoid the delay on F flag */

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;


entity CountterRTL_Flag_V2 is
  port(CLK,REST : in std_logic ;
  Q :  out unsigned(2 downto 0);
  F :  out std_logic );
end CountterRTL_Flag_V2;

architecture CountterRTL_Flag_V2_arch of CountterRTL_Flag_V2 is
signal S :  unsigned(2 downto 0):="000" ;
signal F_signal: std_logic :='0';

begin
  process(CLK,REST)
  begin
  if REST = '1' then -- asyn reset
    S <="000" ;
  elsif rising_edge(CLK) then
    S <= S + 1;     
  end if  ;
  
  -- Set Flag to 1 if we comple a cycle count (0-->7) [Remove this Block]
  -- if S = "111" then
  --  F_signal<= '1'; -- We can't use this instruction on F directrely cause F is declared an output
  -- else
  --  F_signal<= '0';
  -- end if;
 
 end process ;

-- Set Flag to 1 if we comple a cycle count (0-->7)
  process(S)
   begin
     if S="111" then
      F_signal<='1';
     else
      F_signal<='0';
     end if;
   end process;
   
Q <= S;
F <= F_signal; -- It is permitted to assign a signal value to F 
 
 
end CountterRTL_Flag_V2_arch;

-- or u can use a process without passing S in the sensibility list
-- dont forget the wait keyword so the process can be activate or use wait on S

--  process
--   begin
--     if S="111" then
--      F_signal<='1';
--     else
--      F_signal<='0';
--     end if;
--     wait on S;
--   end process;

