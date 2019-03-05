----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:01 03/05/2019 
-- Design Name: 
-- Module Name:    ripple_counter_4bit - Behavioral 
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

entity ripple_counter_4bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3 downto 0));
end ripple_counter_4bit;

architecture Behavioral of ripple_counter_4bit is

	component TFF_async is
		Port ( t : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
	end component;
	
	component freq is
		port    ( in_freq   : in   std_logic;
					  out_freq  : out  std_logic;
					  reset     : in  std_logic);
	end component;
	
	Signal final_clk : std_logic;
	
	Signal temp : std_logic_vector(3 downto 0);


begin
	
	FRQ : freq port map (CLK, final_clk, RST);
	t0 : TFF_async port map ('1', RST, final_clk, temp(0));
	t1 : TFF_async port map ('1', RST, not temp(0), temp(1));
	t2 : TFF_async port map ('1', RST, not temp(1), temp(2));
	t3 : TFF_async port map ('1', RST, not temp(2), temp(3));
	
	Q <= temp;

end Behavioral;

