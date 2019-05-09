----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:34 04/23/2019 
-- Design Name: 
-- Module Name:    cam - Behavioral 
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

entity cam is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR(4 downto 0);
           match : out  STD_LOGIC;
           WR : in  STD_LOGIC;
           RD : in  STD_LOGIC);
end cam;

architecture Behavioral of cam is

	Type Ram_Arr is array (31 downto 0) of STD_LOGIC_VECTOR(4 downto 0);
	
	Signal memory: Ram_Arr;
	
	Signal dirty: STD_LOGIC_VECTOR(31 downto 0);
	
	Signal temp: STD_LOGIC;
	
begin

	process(CLK, RST)
	begin 
		if (RST = '0') then
			for k in 0 to 31 loop
				dirty(k) <= '0';
				match <= '0';
			end loop;
		else
			if (WR = '1' and RD = '0') then
				match <= '0';
				temp <= '0';
				for j in 0 to 31 loop
					if (Data_in = memory(j) and dirty(j) = '1') then
						temp <= '1';
					end if;
				end loop;
				if ( temp = '0') then
				loop_1:	for g in 0 to 31 loop
								if (dirty(g) = '0') then
									dirty(g) <= '1';
									memory(g) <= Data_in;
									exit loop_1;
								end if;
							end loop;
				end if;
											
			elsif (RD = '1' and WR = '0') then
				for i in 0 to 31 loop
					if (Data_in = memory(i) and dirty(i) = '1') then
						match <= '1';
					end if;
				end loop;
			end if;
		end if;
	end process;
		
end Behavioral;

