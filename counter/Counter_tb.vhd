library IEEE;
use IEEE.std_logic_1164.all;

entity Counter_tb is
end Counter_tb;

architecture latihan_tb of Counter_tb is
constant CLOCK_PERIOD : time := 10ns;

signal clk : std_logic := '0';
signal rst: std_logic := '1';
signal count : std_logic_vector(31 downto 0);

begin

Counter_inst : entity work.Counter

 port map (
 clk => clk,
 rst => rst,
 count => count
 );
 
 process
 begin clk <= '0';
 wait for CLOCK_PERIOD/2;
 clk <= '1';
 wait for CLOCK_PERIOD/2;
 end process;
 
 process
 begin
 rst <= '1';
 wait for CLOCK_PERIOD*10;
 rst <= '0';
 wait;
 end process;
 
 end latihan_tb;