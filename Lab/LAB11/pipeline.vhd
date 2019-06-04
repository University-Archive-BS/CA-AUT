----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:14 05/21/2019 
-- Design Name: 
-- Module Name:    pipeline - Behavioral 
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

entity pipeline is
    Port ( A : in  STD_LOGIC_VECTOR(1 downto 0);
           B : in  STD_LOGIC_VECTOR(1 downto 0);
           C : in  STD_LOGIC_VECTOR(1 downto 0);
           D : in  STD_LOGIC_VECTOR(1 downto 0);
           result : out  STD_LOGIC_VECTOR(7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end pipeline;

architecture Behavioral of pipeline is

	component DFF is
    Port ( d : in  STD_LOGIC_VECTOR(1 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(1 downto 0));
	end component;

	component DFF_4 is
    Port ( d : in  STD_LOGIC_VECTOR(3 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mul_24 is
    Port ( A : in  STD_LOGIC_VECTOR(1 downto 0);
           B : in  STD_LOGIC_VECTOR(1 downto 0);
           result : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mul_48 is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           result : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component DFF_8 is
    Port ( d : in  STD_LOGIC_VECTOR(7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	signal A_d, B_d, C_d, D_d: STD_LOGIC_VECTOR(1 downto 0);
	signal AB, CD: STD_LOGIC_VECTOR(3 downto 0);
	signal AB_d, CD_d: STD_LOGIC_VECTOR(3 downto 0);
	signal ABCD_d: STD_LOGIC_VECTOR(7 downto 0);
	
	
begin

	dff_a: DFF port map (A, rst, clk, A_d);
	dff_b: DFF port map (B, rst, clk, B_d);
	dff_c: DFF port map (C, rst, clk, C_d);
	dff_d: DFF port map (D, rst, clk, D_d);
	
	mul_AB: mul_24 port map (A_d, B_d, AB);
	mul_CD: mul_24 port map (C_d, D_d, CD);
	
	dff_AB: DFF_4 port map (AB, rst, clk, AB_d);
	dff_CD: DFF_4 port map (CD, rst, clk, CD_d);
	
	mul_ABCD: mul_48 port map (AB_d, CD_d, ABCD_d);
	
	dff_ABCD: DFF_8 port map (ABCD_d, clk, rst, result);

end Behavioral;

