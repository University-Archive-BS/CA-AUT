----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:43 03/05/2019 
-- Design Name: 
-- Module Name:    both_handler - Behavioral 
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

entity both_handler is
    Port ( Data : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR(6 downto 0));
end both_handler;

architecture Behavioral of both_handler is
	
	component seq_0101_0110 is
		Port ( in_data : in  STD_LOGIC;
           out_data : out  STD_LOGIC_VECTOR(6 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
	end component;
	
	component freq is
		port    ( in_freq   : in   std_logic;
					  out_freq  : out  std_logic;
					  reset     : in  std_logic);
	end component;
	
	Signal final_clk : std_logic;
	
begin

	FRQ : freq port map (CLK, final_clk, RST);
	booth: seq_0101_0110 port map (Data, Result, RST, final_clk);


end Behavioral;

