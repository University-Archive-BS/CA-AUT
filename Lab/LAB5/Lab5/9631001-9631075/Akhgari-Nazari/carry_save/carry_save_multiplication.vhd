----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:36 04/09/2019 
-- Design Name: 
-- Module Name:    carry_save_multiplication - Behavioral 
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

entity carry_save_multiplication is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end carry_save_multiplication;

architecture Behavioral of carry_save_multiplication is
	
	component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	component half_adder
		port( 
			i1, i2: in std_logic;
			sum, carry: out std_logic
		);
	end component;

	signal S: std_logic_vector(5 downto 0);	
	signal C: std_logic_vector(10 downto 0);	
	signal and_00: std_logic;
	signal and_01: std_logic;
	signal and_10: std_logic;
	signal and_02: std_logic;
	signal and_11: std_logic;
	signal and_03: std_logic;
	signal and_12: std_logic;
	signal and_13: std_logic;
	signal and_20: std_logic;
	signal and_21: std_logic;
	signal and_22: std_logic;
	signal and_23: std_logic;
	signal and_30: std_logic;
	signal and_31: std_logic;
	signal and_32: std_logic;
	signal and_33: std_logic;

begin
	
	and_00 <= A(0) and B(0);
	and_01 <= A(0) and B(1);
	and_10 <= A(1) and B(0);
	and_02 <= A(0) and B(2);
	and_11 <= A(1) and B(1);
	and_03 <= A(0) and B(3);
	and_12 <= A(1) and B(2);
	and_13 <= A(1) and B(3);
	and_20 <= A(2) and B(0);
	and_21 <= A(2) and B(1);
	and_22 <= A(2) and B(2);
	and_23 <= A(2) and B(3);
	and_30 <= A(3) and B(0);
	and_31 <= A(3) and B(1);
	and_32 <= A(3) and B(2);
	and_33 <= A(3) and B(3);
	
	P(0) <= and_00;

	HA43: half_adder port map (and_01, and_10, P(1), C(0));
	HA42: half_adder port map (and_02, and_11, S(0), C(1));
	HA41: half_adder port map (and_03, and_12, S(1), C(2));
	
	FA33: full_adder port map (and_20, S(0), C(0), P(2), C(3));
	FA32: full_adder port map (and_21, S(1), C(1), S(2), C(4));
	FA31: full_adder port map (and_22, and_13, C(2), S(3), C(5));
	
	FA23: full_adder port map (and_30, S(2), C(3), P(3), C(6));
	FA22: full_adder port map (and_31, S(3), C(4), S(4), C(7));
	FA21: full_adder port map (and_32, and_23, C(5), S(5), C(8));
	
	HA13: half_adder port map (C(6), S(4), P(4), C(9));
	FA12: full_adder port map (C(7), S(5), C(9), P(5), C(10));
	FA11: full_adder port map (and_33, C(8), C(10), P(6), P(7));

end Behavioral;

