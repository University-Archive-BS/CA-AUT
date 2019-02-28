----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:09 02/26/2019 
-- Design Name: 
-- Module Name:    Decoder2to4 - Behavioral 
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

entity Decoder2to4 is
    Port ( a_0 : in  STD_LOGIC;
           a_1 : in  STD_LOGIC;
           m_0 : out  STD_LOGIC;
           m_1 : out  STD_LOGIC;
           m_2 : out  STD_LOGIC;
           m_3 : out  STD_LOGIC);
end Decoder2to4;

architecture Behavioral of Decoder2to4 is

begin

m_0 <= (not a_0) and (not a_1);
m_1 <= a_0 and (not a_1);
m_2 <= (not a_0) and a_1;
m_3 <= a_0 and a_1;

end Behavioral;

