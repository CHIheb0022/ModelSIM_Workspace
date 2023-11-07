
library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity counterN_rst is
  port(
    
    CLK: in std_logic;
    
    R: in std_logic; -- asyn reset
    
    Q: inout std_logic_vector(2 downto 0); -- Q is configured as a inout varaible in order to match line 1,2,3 requierments 
                                           -- where Q is considered as input for Xor and anab ports.
    Qbar: inout std_logic_vector(2 downto 0) -- Qbar is configured as a inout varaible to avoid problem (compile error) in line 0
  );
  end counterN_rst;

architecture couterN_rst_arch of counterN_rst is
   signal D2,D3,A,Q0_b: std_logic;
   
begin
    Q0_b <= Qbar(0); -- 0
    
    Bascule0: entity work.BasculeD_rst port map (CLK,Q0_b,R,Q(0),Qbar(0));
      
    xor1: entity work.xorport port map (Q(0),Q(1),D2); -- D2<=Q(0) xor Q(1); -- 1
    
    Bascule1: entity work.BasculeD_rst port map (CLK,D2,R,Q(1),Qbar(1)); 
      
    and1: entity work.andab port map (Q(0),Q(1),A); -- A<=Q(0) and Q(1); -- 2
    
    xor2: entity work.xorport port map (A,Q(2),D3); -- D3<=A xor Q(2); -- 3  
    
    Bascule2: entity work.BasculeD_rst port map (CLK,D3,R,Q(2),Qbar(2));

  end couterN_rst_arch;
