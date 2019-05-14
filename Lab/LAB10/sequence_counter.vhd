----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:36 05/14/2019 
-- Design Name: 
-- Module Name:    sequence_counter - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequence_counter is
	Port (CLK : in  STD_LOGIC;
			CLR : in  STD_LOGIC;
         output : out  STD_LOGIC_VECTOR(3 downto 0));
end sequence_counter;

architecture Behavioral of sequence_counter is
	signal tmp: STD_LOGIC_VECTOR(3 downto 0);
begin

	process(CLK) 
	begin
		if (CLR = '1') then
			tmp <= "0000";
		else
			tmp <= tmp + "0001";
		end if;
	end process;
	
	output <= tmp;
	
end Behavioral;

