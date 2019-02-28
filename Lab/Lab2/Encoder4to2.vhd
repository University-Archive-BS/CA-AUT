----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:53 02/26/2019 
-- Design Name: 
-- Module Name:    Encoder4to2 - Behavioral 
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

entity Encoder4to2 is
    Port ( m_0 : in  STD_LOGIC;
           m_1 : in  STD_LOGIC;
           m_2 : in  STD_LOGIC;
           m_3 : in  STD_LOGIC;
           a_0 : out  STD_LOGIC;
           a_1 : out  STD_LOGIC);
end Encoder4to2;

architecture Behavioral of Encoder4to2 is

begin

a_0 <= m_3 or ((not m_2) and m_1);
a_1 <= m_2 or m_3;

end Behavioral;

