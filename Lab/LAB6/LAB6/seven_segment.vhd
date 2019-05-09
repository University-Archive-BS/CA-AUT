----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:09 04/16/2019 
-- Design Name: 
-- Module Name:    seven_segment - Behavioral 
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

entity seven_segment is
    Port ( Show : in  STD_LOGIC_VECTOR(3 downto 0);
           Result : out  STD_LOGIC_VECTOR(7 downto 0);
           Clock : in  STD_LOGIC;
           Selector : out  STD_LOGIC_VECTOR(4 downto 0));
end seven_segment;

architecture Behavioral of seven_segment is
	
	Signal counter: integer range 0 to 40000;

begin

	process (Clock)
	begin
		if (Clock'event and Clock = '1') then
				if (counter < 4000) then
					counter <= counter + 1;	
					Selector <= "00001" ;
					case Show(0) is
						when '0' =>
							Result <= "00111111" ;
						when others =>
							Result <= "00000110" ;
					end case;
				elsif (counter < 8000) then
					counter <= counter + 1;	
					Selector <= "00010" ;
					case Show(1) is
						when '0' =>
							Result <= "00111111" ;
						when others =>
							Result <= "00000110" ;
					end case;
				elsif (counter < 12000) then
					counter <= counter + 1;	
					Selector <= "00100" ;
					case Show(2) is
						when '0' =>
							Result <= "00111111" ;
						when others =>
							Result <= "00000110" ;
					end case ;
				elsif (counter < 16000) then
					counter <= counter + 1;	
					Selector <= "01000" ;
					case Show(3) is
						when '0' =>
							Result <= "00111111" ;
						when others =>
							Result <= "00000110" ;
					end case ;
				else
					counter <= 1 ;
				end if;
		end if;
	end process;

end Behavioral;

