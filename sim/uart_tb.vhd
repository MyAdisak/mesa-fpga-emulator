-- uart_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tb is
end entity;

architecture sim of uart_tb is
  signal clk       : std_logic := '0';
  signal reset     : std_logic := '1';
  signal tx_data   : std_logic_vector(7 downto 0) := x"41";  -- ตัวอย่าง A
  signal tx_start  : std_logic := '0';
  signal tx_done   : std_logic;
  signal tx_line   : std_logic;

  constant clk_period : time := 10 ns;

begin
  -- Instantiate DUT
  uut: entity work.uart_top
    port map (
      clk      => clk,
      reset    => reset,
      tx_data  => tx_data,
      tx_start => tx_start,
      tx_done  => tx_done,
      tx_line  => tx_line
    );

  -- Clock process
  clk_process : process
  begin
    while true loop
      clk <= not clk;
      wait for clk_period / 2;
    end loop;
  end process;

  -- Stimulus
  stim_proc: process
  begin
    wait for 20 ns;
    reset <= '0';
    wait for 20 ns;

    tx_start <= '1';
    wait for clk_period;
    tx_start <= '0';

    wait for 500 ns;
    assert false report "Simulation finished" severity failure;
  end process;

end architecture;
