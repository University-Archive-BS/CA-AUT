--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:55:49 04/30/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/8/Lab8/divide_tb.vhd
-- Project Name:  Lab8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Divider
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
 
ENTITY divide_tb IS
END divide_tb;
 
ARCHITECTURE behavior OF divide_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Divider
    PORT(
         A : IN  std_logic_vector(8 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         Result : OUT  std_logic_vector(8 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         OVF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(8 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(8 downto 0);
   signal OVF : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Divider PORT MAP (
          A => A,
          B => B,
          Result => Result,
          CLK => CLK,
          RST => RST,
          OVF => OVF
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
		RST <= '1';
		wait for 100 ns;	

		RST <= '0';
		
		A <= "010101011";
--		A <= "000101011";
		A <= "000100101";
--		B <= "00011";
--		B <= "00111";
		B <= "00111";
		wait for 100 ns;	
		
		
      wait;
   end process;

END;
