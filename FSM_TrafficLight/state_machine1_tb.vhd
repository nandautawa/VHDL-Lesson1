library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine_tb is
end state_machine_tb;

architecture bikin of state_machine_tb is

constant CLOCK_PERIOD: time := 10 ns;

signal clk: std_logic := '0';
signal rst: std_logic := '1';
signal sIDLE, state_Lampuhijau, state_Lampukuning, state_Lampumerah : std_logic;

begin

--Instiate status mesin frame modul
status_mesin_inst : entity work.state_machine
 port map (
  clk => clk,
  rst => rst,
  sIDLE => sIDLE,
  Lampuhijau => state_Lampuhijau,
  Lampukuning => state_Lampukuning,
  Lampumerah => state_Lampumerah
  );
 
 --Pulse clock signal
 process
 begin
    clk <= '0';
    wait for CLOCK_PERIOD/2;
    clk <= '1';
    wait for CLOCK_PERIOD/2;
 end process;
 
 --Drive reset signal
 process
 begin
    rst <= '1';
    wait for CLOCK_PERIOD*10;
    rst <= '0';
    wait;
 end process;
 
 end bikin;