-- This model design is a template Implementation am using to start and configure a Mealy Finte State Machine --     

-- This FSM is intended to recognize the sequence string "101". Given the input from a variable a and the output as a x variable --


library ieee;
use ieee.std_logic_1164.all;

-----------------------------------------------------

entity seq_design_mealy is
  port (
    a: in std_logic;
    clock: in std_logic;
    reset: in std_logic;
    x: out std_logic
  );
end seq_design_mealy;

-----------------------------------------------------

architecture Mealy_FSM of seq_design_mealy is

  -- define the states of FSM model
  type state_type is (S0, S1, S2, S3);
  signal next_state, current_state: state_type;

  -- output signal
  signal y: std_logic;

begin
    
  -- concurrent process#1: state registers
  state_reg: process(clock, reset)
  begin
    if reset = '1' then
      current_state <= S0;
    elsif rising_edge(clock) then
      current_state <= next_state;
    end if;
  end process;						  

  -- concurrent process#2: combinational logic
  comb_logic: process(current_state, a)
  begin

    -- use case statement to show the state transition
    case current_state is

      when S0 =>
        y <= '0';
        if a = '0' then
          next_state <= S0;
        elsif a = '1' then
          next_state <= S1;
        end if;

      when S1 =>
        y <= '0';
        if a = '0' then 
          next_state <= S1;
        elsif a = '1' then 
          next_state <= S2;
        end if;

      when S2 =>
        y <= '0';
        if a = '0' then
          next_state <= S2;
        elsif a = '1' then
          next_state <= S3;
        end if;

      when S3 =>
        y <= a; -- Mealy output depends on the input
        if a = '0' then 
          next_state <= S3;
        elsif a = '1' then 
          next_state <= S0;
        end if;

      when others =>
        y <= '0';
        next_state <= S0;

    end case;

  end process;

  -- Output assignment
  x <= y;

end Mealy_FSM;




