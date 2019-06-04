----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:49 05/21/2019 
-- Design Name: 
-- Module Name:    DFF_4 - Behavioral 
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

entity DFF_4 is
    Port ( d : in  STD_LOGIC_VECTOR(3 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 downto 0));
end DFF_4;

architecture Behavioral of DFF_4 is

begin

	process(clk, rst)
	begin
		if (rst = '1') then
			q <= "0000";
		elsif (rising_edge(clk)) then
			q <= d;
		end if;
	end process;

end Behavioral;

