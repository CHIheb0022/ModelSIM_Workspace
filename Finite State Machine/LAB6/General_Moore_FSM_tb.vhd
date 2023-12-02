library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq_design_tb is
end seq_design_tb;

architecture tb_arch of seq_design_tb is
  signal a_tb, clock_tb, reset_tb: std_logic := '0';
  signal x_tb: std_logic;

  constant clock_period: time := 10 ns; -- Define the clock period

  begin
  
  test: entity work.seq_design port map(a_tb,clock_tb,reset_tb,x_tb);
  
  -- Generate clock signal
  process
  begin
    while now < 500 ns loop
      clock_tb <= '0';
      wait for clock_period / 2;
      clock_tb <= '1';
      wait for clock_period / 2;
    end loop;
    wait;
  end process;

  -- Stimulus process
  process
  begin
    wait for 20 ns; -- Initial wait
    reset_tb <= '1'; -- Activate reset
    wait for 10 ns;
    reset_tb <= '0'; -- Deactivate reset

    -- Test scenario
    a_tb <= '0';
    wait for 100 ns;
    a_tb <= '1';
    wait for 100 ns;
    a_tb <= '0';
    wait for 100 ns;
    a_tb <= '1';
    wait for 100 ns;
    a_tb <= '0';
    wait for 200 ns;

    wait;
  end process;

  
  end architecture tb_arch;
