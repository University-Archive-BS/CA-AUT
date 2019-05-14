----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:31 05/14/2019 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is
	Port ( IR : in  STD_LOGIC_VECTOR (14 downto 0);
			 CLK : in  STD_LOGIC;
			 controls : out  STD_LOGIC_VECTOR(21 downto 0)); 
end control_unit;

architecture Behavioral of control_unit is

	component decoder4_16 is 
	Port (input : in  STD_LOGIC_vector(3 downto 0);
         output : out  STD_LOGIC_vector(15 downto 0));
	end component decoder4_16;
	
	component decoder3_8 is 
	Port (input : in  STD_LOGIC_vector(2 downto 0);
         output : out  STD_LOGIC_vector(7 downto 0));
	end component decoder3_8;
	
	component sequence_counter is 
	Port (CLK : in  STD_LOGIC;
			CLR : in  STD_LOGIC;
         output : out  STD_LOGIC_VECTOR(3 downto 0));
	end component sequence_counter;
	
	
	signal D : STD_LOGIC_VECTOR (7 downto 0);
	signal T : STD_LOGIC_VECTOR (15 downto 0);
	signal SC : STD_LOGIC_VECTOR (3 downto 0);
	signal CLR: STD_LOGIC := '1';


begin

	seq_counter : sequence_counter port map (CLK, CLR, SC);
	decoder_big : decoder4_16 port map (SC, T);
	decoder_small : decoder3_8  port map (IR(14 downto 12), D);
	
	process (D , T)
	begin
		controls <= (others => '0');
		CLR <= '0';
		if ((D(0) and T(4)) = '1') then
			controls(21 downto 19) <= "111";
			controls(17) <= '1';
			controls(10) <= '1';
		elsif ((D(0) and T(5)) = '1') then 
			controls(7) <= '1';
			CLR <= '1';
		elsif ((D(1) and T(4)) = '1') then 
			controls(21 downto 19) <= "111";
			controls(17) <= '1';
			controls(10) <= '1';
		elsif ((D(1) and T(5)) = '1') then 
			controls(7) <= '1';
			CLR <= '1';
		elsif ((D(2) and T(4)) = '1') then 
			controls(21 downto 19) <= "111";
			controls(17) <= '1';
			controls(10) <= '1';
		elsif ((D(2) and T(5)) = '1') then 
			controls(21 downto 19) <= "011";
			controls(7) <= '1';
			CLR <= '1';
		elsif ((D(3) and T(4)) = '1') then 
			controls(21 downto 19) <= "100";
			controls(18) <= '1';
			CLR <= '1';
		elsif ((D(4) and T(4)) = '1') then 
			controls(21 downto 19) <= "001";
			controls(13) <= '1';
			CLR <= '1';
		elsif ((D(5) and T(4)) = '1') then 
			controls(21 downto 19) <= "010";
			controls(18) <= '1';
			controls(15) <= '1';
		elsif ((D(5) and T(5)) = '1') then 
			controls(21 downto 19) <= "001";
			controls(13) <= '1';
			CLR <= '1';
		elsif ((D(6) and T(4)) = '1') then 
			controls(21 downto 19) <= "111";
			controls(17) <= '1';
			controls(10) <= '1';
		elsif ((D(6) and T(5)) = '1') then 
			controls(9) <= '1';
		elsif ((D(6) and T(6)) = '1') then 
			controls(21 downto 19) <= "011";
			controls(18) <= '1';
		else null;
		end if;
	end process ;
end Behavioral;


