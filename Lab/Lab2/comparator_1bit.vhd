----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:37 02/26/2019 
-- Design Name: 
-- Module Name:    comparator_1bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           li : in  STD_LOGIC;
           ei : in  STD_LOGIC;
           gi : in  STD_LOGIC;
           lo : out  STD_LOGIC;
           eo : out  STD_LOGIC;
           go : out  STD_LOGIC);
end comparator_1bit;

architecture Behavioral of comparator_1bit is
signal is_equal : STD_LOGIC;
signal is_greater : STD_LOGIC;
signal is_lower : STD_LOGIC;

begin

is_equal <= a xnor b;
is_greater <= a and (not b);
is_lower <= (not a) and b;

lo <= (is_equal and li) or is_lower;
go <= (is_equal and gi) or is_greater;
eo <= is_equal and ei;

end Behavioral;

