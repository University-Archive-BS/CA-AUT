----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:27 04/23/2019 
-- Design Name: 
-- Module Name:    ram - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
--use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram is
    Port ( WR : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR(4 downto 0);
           Data_out : out  STD_LOGIC_VECTOR(4 downto 0);
			  Data_in : in  STD_LOGIC_VECTOR(4 downto 0));
end ram;

architecture Behavioral of ram is

	Type Ram_Arr is array (31 downto 0) of STD_LOGIC_VECTOR(4 downto 0);
	
	Signal memory: Ram_Arr;

begin

	process(CLK, RST)
	begin
		if (RST = '0') then
			for i in 0 to 31 loop
				memory(i) <= std_logic_vector(to_unsigned(i,5));
			end loop;
		elsif (CLK'event and CLK = '1') then
			if (WR = '1' and RD = '0') then
				memory(to_integer(unsigned(Addr))) <= Data_in;
			elsif (RD = '1' and WR = '0') then
				Data_out <= memory(to_integer(unsigned(Addr)));
			end if;
		end if;
	end process;


end Behavioral;

