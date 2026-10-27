----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.07.2026 21:56:38
-- Design Name: 
-- Module Name: test_basicgates - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_basicgates is
    Port ( a,b : in STD_LOGIC;
           yand,yor,ynot : out STD_LOGIC);
end test_basicgates;

architecture Behavioral of test_basicgates is

begin
 yand <= a and b;
 yor <= a or b;
 ynot <= not a;

end Behavioral;
