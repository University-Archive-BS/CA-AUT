----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:21 05/14/2019 
-- Design Name: 
-- Module Name:    decoder4_16 - Behavioral 
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

entity decoder4_16 is
	Port (input : in  STD_LOGIC_vector(3 downto 0);
			output : out  STD_LOGIC_vector(15 downto 0));
end decoder4_16;

architecture Behavioral of decoder4_16 is

begin
	
	process (input)
	begin
		case input is 
			when "0000" => output <= "0000000000000001";
			when "0001" => output <= "0000000000000010";
			when "0010" => output <= "0000000000000100";
			when "0011" => output <= "0000000000001000";
			when "0100" => output <= "0000000000010000";
			when "0101" => output <= "0000000000100000";
			when "0110" => output <= "0000000001000000";
			when "0111" => output <= "0000000010000000";
			when "1000" => output <= "0000000100000000";
			when "1001" => output <= "0000001000000000";
			when "1010" => output <= "0000010000000000";
			when "1011" => output <= "0000100000000000";
			when "1100" => output <= "0001000000000000";
			when "1101" => output <= "0010000000000000";
			when "1110" => output <= "0100000000000000";
			when "1111" => output <= "1000000000000000";
			when others => output <= "0000000000000000";
		end case;		
	end process;

end Behavioral;





