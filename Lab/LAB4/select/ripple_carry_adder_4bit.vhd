----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:18 03/12/2019 
-- Design Name: 
-- Module Name:    ripple_carry_adder_4bit - Behavioral 
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

entity ripple_carry_adder_4bit is
    Port ( C_in : in  STD_LOGIC;
           A_in : in  STD_LOGIC_VECTOR(3 downto 0);
           B_in : in  STD_LOGIC_VECTOR(3 downto 0);
           C_out : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end ripple_carry_adder_4bit;

architecture Behavioral of ripple_carry_adder_4bit is

	component full_adder
		Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	signal C_signal : std_logic_VECTOR(2 downto 0);
		
begin
	
	FA0: full_adder port map (A_in(0), B_in(0), C_in, S(0), C_signal(0));
	FA1: full_adder port map (A_in(1), B_in(1), C_signal(0), S(1), C_signal(1));
	FA2: full_adder port map (A_in(2), B_in(2), C_signal(1), S(2), C_signal(2));
	FA3: full_adder port map (A_in(3), B_in(3), C_signal(2), S(3), C_out);

end Behavioral;

