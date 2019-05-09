----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:20 04/16/2019 
-- Design Name: 
-- Module Name:    shift_register - Behavioral 
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

entity shift_register is
    Port ( Data : in  STD_LOGIC_VECTOR(3 downto 0);
           Load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR(1 downto 0);
           Result : out  STD_LOGIC_VECTOR(3 downto 0));
end shift_register;

architecture Behavioral of shift_register is

	component DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component;
	
	Signal this_data : STD_LOGIC_VECTOR(3 downto 0);
begin

	DFF3: DFF port map (this_data(3), Clock, Reset, Result(3));
	DFF2: DFF port map (this_data(2), Clock, Reset, Result(2));
	DFF1: DFF port map (this_data(1), Clock, Reset, Result(1));
	DFF0: DFF port map (this_data(0), Clock, Reset, Result(0));

	Load_Selector: process (Clock)
	begin 
	if (Clock'event and Clock = '1') then
		case Load is
			when '0' =>
				case Selector is
					when "01" =>
						this_data(0) <= this_data(1);
						this_data(1) <= this_data(2);
						this_data(2) <= this_data(3);
						this_data(3) <= this_data(3);		
					when "10" =>
						this_data(0) <= this_data(1);
						this_data(1) <= this_data(2);
						this_data(2) <= this_data(3);
						this_data(3) <= '0';
					when "11" =>
						this_data(3) <= this_data(2);
						this_data(2) <= this_data(1);
						this_data(1) <= this_data(0);
						this_data(0) <= '0';		
					when others =>
						this_data(3) <= this_data(3);
						this_data(2) <= this_data(2);
						this_data(1) <= this_data(1);
						this_data(0) <= this_data(0);		
				end case;
			when others => 
					this_data(3) <= Data(3);
					this_data(2) <= Data(2);
					this_data(1) <= Data(1);
					this_data(0) <= Data(0);
		end case;
		else 
			this_data(3) <= this_data(3);
			this_data(2) <= this_data(2);
			this_data(1) <= this_data(1);
			this_data(0) <= this_data(0);		
		end if;
	end process;
	
end Behavioral;

