----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:53 03/05/2019 
-- Design Name: 
-- Module Name:    freq - Behavioral 
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

entity freq is
	generic ( n : integer := 80000000; 
              m : integer := 1);            -- n must be the multiple of m
    port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
end freq;

architecture Behavioral of freq is

    signal step : std_logic;
    signal counter : integer range 0 to n/(m*2);

begin
	process (in_freq, reset) 
	begin
	   if reset = '1' then 
            step <= '0';
            counter <= 0;	   
	   elsif ( in_freq'event and in_freq = '1') then
			if (counter < n/(m*2)) then
				counter <= counter + 1;		
            else
				step <= not step;
				counter <= 1;
			end if;
		end if;
	end process;
    out_freq <= step;

end Behavioral;

