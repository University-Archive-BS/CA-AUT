----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:26 03/12/2019 
-- Design Name: 
-- Module Name:    carry_look_ahead_adder_4bit - Behavioral 
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

entity carry_look_ahead_adder_4bit is
    Port ( C_in : in  STD_LOGIC;
           A_in : in  STD_LOGIC_VECTOR(3 downto 0);
           B_in : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0);
           C_out : out  STD_LOGIC);
end carry_look_ahead_adder_4bit;

architecture Behavioral of carry_look_ahead_adder_4bit is

	component full_adder
		Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	signal P, G, C_signal, C_in_signal : STD_LOGIC_VECTOR(2 downto 0);

begin

	P(0) <= A_in(0) XOR B_in(0);
	P(1) <= A_in(1) XOR B_in(1);
	P(2) <= A_in(2) XOR B_in(2);
	G(0) <= A_in(0) and B_in(0);
	G(1) <= A_in(1) and B_in(1);
	G(2) <= A_in(2) and B_in(2);
	C_in_signal(0) <= G(0) or (P(0) and C_in);
	C_in_signal(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_in);
	C_in_signal(2) <= G(2) or (P(2) and (G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_in)));
		
	FA0: full_adder port map (A_in(0), B_in(0), C_in, S(0), C_signal(0));
	FA1: full_adder port map (A_in(1), B_in(1), C_in_signal(0), S(1), C_signal(1));
	FA2: full_adder port map (A_in(2), B_in(2), C_in_signal(1), S(2), C_signal(2));
	FA3: full_adder port map (A_in(3), B_in(3), C_in_signal(2), S(3), C_out);


end Behavioral;

