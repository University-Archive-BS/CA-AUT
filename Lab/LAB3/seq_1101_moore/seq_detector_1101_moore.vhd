----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:32 03/05/2019 
-- Design Name: 
-- Module Name:    seq_detector_1101_moore - Behavioral 
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

entity seq_detector_1101_moore is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           in_data : in  STD_LOGIC;
           out_data : out  STD_LOGIC_VECTOR(4 downto 0));
end seq_detector_1101_moore;

architecture Behavioral of seq_detector_1101_moore is
	
	Type state is (start, got1, got11, got110, got1101);
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
				if (in_data = '1') then next_state <= got1;
				else next_state <= start;
				end if;
			
			when got1 => 
				if (in_data = '1') then next_state <= got11;
				else next_state <= start;
				end if;
				
			when got11 => 
				if (in_data = '1') then next_state <= got11;
				else next_state <= got110;
				end if;
				
			when got110 => 
				if (in_data = '1') then next_state <= got1101;
				else next_state <= start;
				end if;
			
			when got1101 => 
				if (in_data = '1') then next_state <= got11;
				else next_state <= start;
				end if;
		end case;
	end process;
	
	out_data <= "00001" when current_state = start else 
					"00010" when current_state = got1 else 
					"00100" when current_state = got11 else 
					"01000" when current_state = got110 else 
					"10000" when current_state = got1101;
	
end Behavioral;

