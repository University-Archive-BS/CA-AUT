----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:31 05/21/2019 
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity manager is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end manager;

architecture Behavioral of manager is

	type RAM is array (3 downto 0) of STD_LOGIC_VECTOR(1 downto 0);
	
	signal ram_A: RAM := ("11", "10", "01", "00");
	signal ram_B: RAM := ("11", "10", "01", "00");
	signal ram_C: RAM := ("11", "10", "01", "00");
	signal ram_D: RAM := ("11", "10", "01", "00");
	
	type RAM_out is array (3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal ram_result: RAM_out;
	
	signal counter: STD_LOGIC_VECTOR(1 downto 0) := "00";
	
	component pipeline is
    Port ( A : in  STD_LOGIC_VECTOR(1 downto 0);
           B : in  STD_LOGIC_VECTOR(1 downto 0);
           C : in  STD_LOGIC_VECTOR(1 downto 0);
           D : in  STD_LOGIC_VECTOR(1 downto 0);
           result : out  STD_LOGIC_VECTOR(7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
	end component;
	
	component DFF is
    Port ( d : in  STD_LOGIC_VECTOR(1 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
	signal cnt_1, cnt_2, cnt_3: STD_LOGIC_VECTOR(1 downto 0);
	
	signal temp_A, temp_B, temp_C, temp_D: STD_LOGIC_VECTOR(1 downto 0);
	signal temp_out: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	pip: pipeline port map (temp_A, temp_B, temp_C, temp_D, temp_out, clk, rst);
	
	temp_A <= ram_A(to_integer(unsigned(counter)));
	temp_B <= ram_B(to_integer(unsigned(counter)));
	temp_C <= ram_C(to_integer(unsigned(counter)));
	temp_D <= ram_D(to_integer(unsigned(counter)));
	ram_result(to_integer(unsigned(cnt_3))) <= temp_out;
	
	process(clk)
	begin
		if (rising_edge(clk)) then
			counter <= STD_LOGIC_VECTOR(UNSIGNED(counter) + 1);
		else null;
		end if;
	end process;
	
	dff_1: DFF port map (counter, rst, clk, cnt_1);
	dff_2: DFF port map (cnt_1, rst, clk, cnt_2);
	dff_3: DFF port map (cnt_2, rst, clk, cnt_3);	

end Behavioral;

