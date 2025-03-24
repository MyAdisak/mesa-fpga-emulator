library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_top is
  port (
    clk      : in  std_logic;
    reset    : in  std_logic;
    tx_data  : in  std_logic_vector(7 downto 0);
    tx_start : in  std_logic;
    tx_done  : out std_logic;
    tx_line  : out std_logic
  );
end entity;

architecture rtl of uart_top is
  signal state        : integer range 0 to 10 := 0;
  signal bit_counter  : integer range 0 to 9 := 0;
  signal shift_reg    : std_logic_vector(9 downto 0);
  signal sending      : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        tx_line   <= '1';
        tx_done   <= '0';
        sending   <= '0';
        bit_counter <= 0;
        state <= 0;
      else
        case state is
          when 0 =>
            tx_done <= '0';
            if tx_start = '1' then
              shift_reg <= '1' & tx_data & '0';
              sending <= '1';
              tx_line <= '0';
              bit_counter <= 0;
              state <= 1;
            end if;

          when 1 =>
            if bit_counter < 9 then
              bit_counter <= bit_counter + 1;
              tx_line <= shift_reg(bit_counter);
            else
              tx_line <= shift_reg(9);
              tx_done <= '1';
              sending <= '0';
              state <= 2;
            end if;

          when 2 =>
            tx_done <= '0';
            tx_line <= '1';
            state <= 0;

          when others =>
            state <= 0;
        end case;
      end if;
    end if;
  end process;
end architecture;
