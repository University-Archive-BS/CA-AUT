----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:58 04/09/2019 
-- Design Name: 
-- Module Name:    array_multiplication - Behavioral 
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

entity array_multiplication is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end array_multiplication;

architecture Behavioral of array_multiplication is

	component ripple_carry_adder_4bit is
		 Port ( C_in : in  STD_LOGIC;
				  A_in : in  STD_LOGIC_VECTOR(3 downto 0);
				  B_in : in  STD_LOGIC_VECTOR(3 downto 0);
				  C_out : out  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	signal S: std_logic_vector(5 downto 0);	
	signal C: std_logic_vector(10 downto 0);	
	signal and_00: std_logic;
	signal and_10: std_logic;
	signal and_20: std_logic;
	signal and_30: std_logic;
	signal and_01: std_logic;
	signal and_11: std_logic;
	signal and_21: std_logic;
	signal and_31: std_logic;
	signal and_02: std_logic;
	signal and_12: std_logic;
	signal and_22: std_logic;
	signal and_32: std_logic;
	signal and_03: std_logic;
	signal and_13: std_logic;
	signal and_23: std_logic;
	signal and_33: std_logic;
	
	signal T0: std_logic_vector(3 downto 0);
	signal T1: std_logic_vector(3 downto 0);
	signal T2: std_logic_vector(3 downto 0);
	signal T3: std_logic_vector(3 downto 0);
	signal T4: std_logic_vector(3 downto 0);
	signal T5: std_logic_vector(3 downto 0);
	
	signal R0: std_logic_vector(3 downto 0);
	signal R1: std_logic_vector(3 downto 0);
	signal R2: std_logic_vector(3 downto 0);
	
	signal Couts: std_logic_vector(2 downto 0);
		
begin

	and_00 <= A(0) and B(0);
	and_10 <= A(1) and B(0);
	and_20 <= A(2) and B(0);
	and_30 <= A(3) and B(0);
	and_01 <= A(0) and B(1);
	and_11 <= A(1) and B(1);
	and_21 <= A(2) and B(1);
	and_31 <= A(3) and B(1);
	and_02 <= A(0) and B(2);
	and_12 <= A(1) and B(2);
	and_22 <= A(2) and B(2);
	and_32 <= A(3) and B(2);
	and_03 <= A(0) and B(3);
	and_13 <= A(1) and B(3);
	and_23 <= A(2) and B(3);
	and_33 <= A(3) and B(3);
	
	T0 <= '0' & and_30 & and_20 & and_10;
	T1 <= and_31 & and_21 & and_11 & and_01;
	T3 <= and_32 & and_22 & and_12 & and_02;
	T5 <= and_33 & and_23 & and_13 & and_03;
	
	RCA0: ripple_carry_adder_4bit port map ('0', T0, T1, Couts(0), R0);
	T2 <= Couts(0) & R0(3) & R0(2) & R0(1);
	RCA1: ripple_carry_adder_4bit port map ('0', T2, T3, Couts(1), R1);
	T4 <= Couts(1) & R1(3) & R1(2) & R1(1);
	RCA2: ripple_carry_adder_4bit port map ('0', T4, T5, Couts(2), R2);
	
	P(0) <= and_00;
	P(1) <= R0(0);
	P(2) <= R1(0);
	P(3) <= R2(0);
	P(4) <= R2(1);
	P(5) <= R2(2);
	P(6) <= R2(3);
	P(7) <= Couts(2);
	
end Behavioral;

