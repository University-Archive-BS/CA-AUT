----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:35 03/05/2019 
-- Design Name: 
-- Module Name:    TFF_async - Behavioral 
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

entity TFF_async is
    Port ( t : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end TFF_async;

architecture Behavioral of TFF_async is

Signal temp : std_logic;

begin

	process(clk, rst)
	begin 
		if(rst='1') then temp <=  '0';
		elsif(clk'event and clk = '1') then temp <= t xor temp;
		end if;
	end process;
	
	q <= temp;

end Behavioral;

