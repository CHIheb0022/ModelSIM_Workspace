
Library ieee;
use ieee.std_logic_1164.all ;

entity Register_D is -- Registre a décalage
port(CLK,RESET,SI: in std_logic;
PO: OUT std_logic_vector(0 to 31));
end register_d;



architecture Register_D_arch of register_d is
signal TEMP: std_logic_vector(0 to 31);
signal TEMP_b: std_logic_vector(0 to 31);
signal R_Signal: std_logic; -- common Reset 

begin
First_D: entity work.basculeD_RST port map (SI,R_Signal, CLK, TEMP(0),TEMP_b(0));

Others_D: for I in 0 to 30 generate

Chaining_loop: entity work.basculeD_RST port map
(TEMP(I),R_Signal,CLK,TEMP(I+1),TEMP_b(I+1));
end generate;

PO <= TEMP;

end Register_D_arch;