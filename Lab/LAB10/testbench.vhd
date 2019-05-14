--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:22:28 05/14/2019
-- Design Name:   
-- Module Name:   D:/nazari-akhi/10/lab10/testbench.vhd
-- Project Name:  lab10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         IR : IN  std_logic_vector(14 downto 0);
         CLK : IN  std_logic;
         controls : OUT  std_logic_vector(21 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(14 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal controls : std_logic_vector(21 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          IR => IR,
          CLK => CLK,
          controls => controls
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
		IR <= "000101010101010";
      wait for 100 ns;	
		
		IR <= "001101010101010";
		wait for 100 ns;	
		
		IR <= "010101010101010";
		wait for 100 ns;	
		
		IR <= "011101010101010";

      wait;
   end process;

END;
