----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:06 03/05/2019 
-- Design Name: 
-- Module Name:    seq_0101_0110 - Behavioral 
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

entity seq_0101_0110 is
    Port ( in_data : in  STD_LOGIC;
           out_data : out  STD_LOGIC_VECTOR(6 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end seq_0101_0110;

architecture Behavioral of seq_0101_0110 is

	Type state is (start, got0, got01, got010, got0101, got011, got0110);
	signal current_state, next_state : state := start; 
	
begin

	process(clk, rst)
	begin
		if(rst='1') then current_state <= start;
		elsif(clk'event and clk = '1') then current_state <= next_state;
		end if;
	end process;
	
	process(in_data, current_state)
	begin 
		case current_state is
			when start => 
				if (in_data = '0') then next_state <= got0;
				else next_state <= start;
				end if;
			
			when got0 => 
				if (in_data = '0') then next_state <= got0;
				else next_state <= got01;
				end if;
				
			when got01 => 
				if (in_data = '0') then next_state <= got010;
				else next_state <= got011;
				end if;
				
			when got010 => 
				if (in_data = '1') then next_state <= got0101;
				else next_state <= got0;
				end if;
			
			when got0101 => 
				if (in_data = '1') then next_state <= got011;
				else next_state <= got0;
				end if;
				
			when got011 => 
				if (in_data = '0') then next_state <= got0110;
				else next_state <= start;
				end if;
			
			when got0110 => 
				if (in_data = '1') then next_state <= got01;
				else next_state <= got0;
				end if;
		end case;
	end process;
	
	out_data <= "0000001" when current_state = start else 
					"0000010" when current_state = got0 else 
					"0000100" when current_state = got01 else 
					"0001000" when current_state = got010 else 
					"0010000" when current_state = got0101 else 
					"0100000" when current_state = got011 else 
					"1000000" when current_state = got0110;

end Behavioral;

