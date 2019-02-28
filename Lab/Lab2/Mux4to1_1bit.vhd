----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:45 02/26/2019 
-- Design Name: 
-- Module Name:    Mux4to1_1bit - Behavioral 
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

entity Mux4to1_1bit is
    Port ( d_0 : in  STD_LOGIC;
           d_1 : in  STD_LOGIC;
           d_2 : in  STD_LOGIC;
           d_3 : in  STD_LOGIC;
           s_0 : in  STD_LOGIC;
           s_1 : in  STD_LOGIC;
           w : out  STD_LOGIC);
end Mux4to1_1bit;

architecture Behavioral of Mux4to1_1bit is

signal x_0 : STD_LOGIC;
signal x_1 : STD_LOGIC;
signal x_2 : STD_LOGIC;
signal x_3 : STD_LOGIC;

begin

x_0 <= d_0 and (not s_0) and (not s_1);
x_1 <= d_1 and s_0 and (not s_1);
x_2 <= d_2 and (not s_0) and s_1;
x_3 <= d_3 and s_0 and s_1;

w <= x_0 or x_1 or x_2 or x_3;

end Behavioral;

