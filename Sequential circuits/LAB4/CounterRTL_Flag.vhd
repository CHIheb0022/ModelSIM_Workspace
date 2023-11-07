
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;


entity CountterRTL_Flag is
  port(CLK,REST : in std_logic ;
  Q : out unsigned(2 downto 0);
  F :  out std_logic );
end CountterRTL_Flag;

architecture CountterRTL_Flag_arch of CountterRTL_Flag is
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
  
  -- Set Flag to 1 if we comple a cycle count (0-->7)
  if S = "111" then
    F_signal<= '1'; -- We can't use this instruction on F directrely cause F is declared an output  
  else
    F_signal<= '0';
  end if;
 
 end process ;
 Q <= S;
 F <= F_signal; -- It is permitted to assign a signal value to F 
 
 end CountterRTL_Flag_arch;