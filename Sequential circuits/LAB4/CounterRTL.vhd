library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;  -- Library ensuring the add operation



entity countterRTL is
  port(CLK, RST : in std_logic ;
  Q : out unsigned(2 downto 0) );
end countterRTL;

architecture countterRTL_arch of countterRTL is

-- We can not operate  the addition on Q (increment each rising edge Q) 
-- So we are using a Signal S instead that will be assigned to Q in a parallel concurent procces (line27)
signal S :  unsigned(2 downto 0):="000" ;


begin
  process(CLK, RST) 
  --This process is sensitive to both the CLK and RST signals. It means that the process will execute whenever there is
  --a change (rising or falling edge) on either the CLK or RST signal.
  begin
    if RST = '1' then -- Considered as rising edge.
      S<="000" ;
    elsif rising_edge(CLK) then
      S <= S + 1;     

    end if;
  end process ;
  Q <= S;
 
 end countterRTL_arch;
