
Library ieee;
use ieee.std_logic_1164.all ;

entity Register_D_tb is
end Register_D_tb;

ARCHITECTURE Register_D_tb_arch OF Register_D_tb IS
  
Signal  RST : std_logic:='0' ;
Signal  CLK : std_logic :='1';
Signal  SI : std_logic :='1';
Signal  PO : std_logic_vector(0 to 31);

--signal to src values of SI bit by bit
Signal  SI_src: std_logic_vector(31 downto 0):="00000111011111011101110111110011";

begin 
  RegD: entity work.Register_D port map(CLK,RST,SI,PO);
  


CLK <= not CLK after 5 ns;  
process
  variable delay: time := 10 ns;

  begin
    boucle: while now < 1000 ns loop
      for i in 0 to 31 loop 
        SI <= SI_src(i); -- feed SI using SI_src vector
      wait for delay;
      end loop;

    end loop boucle;
    wait;
end process;
  
end Register_D_tb_arch; 