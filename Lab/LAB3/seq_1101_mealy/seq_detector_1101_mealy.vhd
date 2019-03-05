----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:09 03/05/2019 
-- Design Name: 
-- Module Name:    seq_detector_1101_mealy - Behavioral 
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

entity seq_detector_1101_mealy is
    Port ( in_data : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           out_data : out  STD_LOGIC_VECTOR(3 downto 0));
end seq_detector_1101_mealy;

architecture Behavioral of seq_detector_1101_mealy is

	Type state is (start, got1, got11, got110);
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
				if (in_data = '1') then 
					next_state <= got1;
					out_data <= "0010";
				else 
					next_state <= start;
					out_data <= "0001";
				end if;
			
			when got1 => 
				if (in_data = '1') then 
					next_state <= got11;
					out_data <= "0100";
				else 
					next_state <= start;
					out_data <= "0001";
				end if;
				
			when got11 => 
				if (in_data = '1') then 
					next_state <= got11;
					out_data <= "0100";
				else 
					next_state <= got110;
					out_data <= "1000";
				end if;
				
			when got110 => 
				if (in_data = '1') then 
					next_state <= got1;
					out_data <= "0010";
				else 
					next_state <= start;
					out_data <= "0001";
				end if;
			
		end case;
	end process;
	
end Behavioral;

