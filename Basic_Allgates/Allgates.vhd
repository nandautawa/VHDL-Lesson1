----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2026 08:12:12
-- Design Name: 
-- Module Name: Allgates - Behavioral
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

entity Allgates is
    Port ( anum : in STD_LOGIC;
           hanin : in STD_LOGIC;
           and_gate : out STD_LOGIC;
           or_gate : out STD_LOGIC;
           not_gate : out STD_LOGIC;
           nand_gate : out STD_LOGIC;
           nor_gate : out STD_LOGIC;
           xor_gate : out STD_LOGIC;
           xnor_gate : out STD_LOGIC);
end Allgates;

architecture Behavioral of Allgates is

begin
and_gate <= anum and hanin;
or_gate <= anum or hanin;
not_gate <= not hanin;
nand_gate <= anum nand hanin;
nor_gate <= anum nor hanin;
xor_gate <= anum xor hanin;
xnor_gate <= anum xnor hanin;


end Behavioral;
