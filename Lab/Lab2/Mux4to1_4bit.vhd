----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:39 02/26/2019 
-- Design Name: 
-- Module Name:    Mux4to1_4bit - Behavioral 
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

entity Mux4to1_4bit is
    Port ( D_0 : in  STD_LOGIC_VECTOR(3 downto 0);
           D_1 : in  STD_LOGIC_VECTOR(3 downto 0);
           D_2 : in  STD_LOGIC_VECTOR(3 downto 0);
           D_3 : in  STD_LOGIC_VECTOR(3 downto 0);
           S_0 : in  STD_LOGIC;
           S_1 : in  STD_LOGIC;
           W : out  STD_LOGIC_VECTOR(3 downto 0));
end Mux4to1_4bit;

architecture Behavioral of Mux4to1_4bit is

component Mux4to1_1bit is
    Port ( d_0 : in  STD_LOGIC;
           d_1 : in  STD_LOGIC;
           d_2 : in  STD_LOGIC;
           d_3 : in  STD_LOGIC;
           s_0 : in  STD_LOGIC;
           s_1 : in  STD_LOGIC;
           w   : out  STD_LOGIC);
end component Mux4to1_1bit;

signal X_0 : STD_LOGIC_VECTOR(3 downto 0);
signal X_1 : STD_LOGIC_VECTOR(3 downto 0);
signal X_2 : STD_LOGIC_VECTOR(3 downto 0);
signal X_3 : STD_LOGIC_VECTOR(3 downto 0);

begin

MUX0: Mux4to1_1bit port map (D_0(0), D_1(0), D_2(0), D_3(0), S_0, S_1, W(0));
MUX1: Mux4to1_1bit port map (D_0(1), D_1(1), D_2(1), D_3(1), S_0, S_1, W(1));
MUX2: Mux4to1_1bit port map (D_0(2), D_1(2), D_2(2), D_3(2), S_0, S_1, W(2));
MUX3: Mux4to1_1bit port map (D_0(3), D_1(3), D_2(3), D_3(3), S_0, S_1, W(3));

end Behavioral;

