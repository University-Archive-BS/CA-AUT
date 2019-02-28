----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:44 02/26/2019 
-- Design Name: 
-- Module Name:    Comparator_4bit - Behavioral 
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

entity Comparator_4bit is
    Port ( A : in  STD_LOGIC_VECTOR( 3 downto 0);
           B : in  STD_LOGIC_VECTOR( 3 downto 0);
           LI : in  STD_LOGIC;
           EI : in  STD_LOGIC;
           GI : in  STD_LOGIC;
           LO : out  STD_LOGIC;
           EO : out  STD_LOGIC;
           GO : out  STD_LOGIC);
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is

component comparator_1bit is 
	Port (  a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           li : in  STD_LOGIC;
           ei : in  STD_LOGIC;
           gi : in  STD_LOGIC;
           lo : out  STD_LOGIC;
           eo : out  STD_LOGIC;
           go : out  STD_LOGIC
			 );	
end component comparator_1bit;

signal lm : STD_LOGIC_VECTOR(2 downto 0);
signal em : STD_LOGIC_VECTOR(2 downto 0);
signal gm : STD_LOGIC_VECTOR(2 downto 0);

begin

CM_0: comparator_1bit port map (A(0),B(0),'0','1','0',lm(0),em(0),gm(0));
CM_1: comparator_1bit port map (A(1),B(1),lm(0),em(0),gm(0),lm(1),em(1),gm(1));
CM_2: comparator_1bit port map (A(2),B(2),lm(1),em(1),gm(1),lm(2),em(2),gm(2));
CM_3: comparator_1bit port map (A(3),B(3),lm(2),em(2),gm(2),LO,EO,GO);

end Behavioral;

