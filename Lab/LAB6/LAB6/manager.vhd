----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:54 04/16/2019 
-- Design Name: 
-- Module Name:    manager - Behavioral 
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

entity manager is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR(3 downto 0);
           Load : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR(1 downto 0);
           Segement_Cell : out  STD_LOGIC_VECTOR(4 downto 0);
           Result : out  STD_LOGIC_VECTOR(7 downto 0));
end manager;

architecture Behavioral of manager is
	
	component freq is
    port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
	end component;
	
	component shift_register is
    Port ( Data : in  STD_LOGIC_VECTOR(3 downto 0);
           Load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR(1 downto 0);
           Result : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
		
	component seven_segment is
    Port ( Show : in  STD_LOGIC_VECTOR(3 downto 0);
           Result : out  STD_LOGIC_VECTOR(7 downto 0);
           Clock : in  STD_LOGIC;
           Selector : out  STD_LOGIC_VECTOR(4 downto 0));
	end component;

	Signal this_Clock: STD_LOGIC;
	Signal show: STD_LOGIC_VECTOR(3 downto 0);
	
begin

	freq_divider: freq port map (Clock, this_Clock, Reset);
	shift: shift_register port map (Data, Load, Reset, this_Clock, Selector, show);
	show_result: seven_segment port map (show, Result, Clock, Segement_Cell);
	
end Behavioral;

