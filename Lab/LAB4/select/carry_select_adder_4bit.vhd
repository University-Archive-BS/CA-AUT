----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:41 03/12/2019 
-- Design Name: 
-- Module Name:    carry_select_adder_4bit - Behavioral 
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

entity carry_select_adder_4bit is
    Port ( C_select : in  STD_LOGIC;
           A_select : in  STD_LOGIC_VECTOR(3 downto 0);
           B_select : in  STD_LOGIC_VECTOR(3 downto 0);
           C_out_select : out  STD_LOGIC;
           Sum_select : out  STD_LOGIC_VECTOR(3 downto 0));
end carry_select_adder_4bit;

architecture Behavioral of carry_select_adder_4bit is

	component ripple_carry_adder_4bit
		Port ( C_in : in  STD_LOGIC;
           A_in : in  STD_LOGIC_VECTOR(3 downto 0);
           B_in : in  STD_LOGIC_VECTOR(3 downto 0);
           C_out : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(3 downto 0));
   end component;
	

	component mux_2to1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Out_put : out  STD_LOGIC);
	end component;
	
	signal C_out_0, C_out_1 : STD_LOGIC;
	signal S_0, S_1: STD_LOGIC_VECTOR(3 downto 0);
	
begin
	
	RCA0: ripple_carry_adder_4bit port map ('0', A_select, B_select, C_out_0, S_0);
	RCA1: ripple_carry_adder_4bit port map ('1', A_select, B_select, C_out_1, S_1);
	
	MX_sum0: mux_2to1 port map (S_0(0), S_1(0), C_select, Sum_select(0));
	MX_sum1: mux_2to1 port map (S_0(1), S_1(1), C_select, Sum_select(1));
	MX_sum2: mux_2to1 port map (S_0(2), S_1(2), C_select, Sum_select(2));
	MX_sum3: mux_2to1 port map (S_0(3), S_1(3), C_select, Sum_select(3));
	
	MX_carry: mux_2to1 port map (C_out_0, C_out_1, C_select, C_out_select);

end Behavioral;

