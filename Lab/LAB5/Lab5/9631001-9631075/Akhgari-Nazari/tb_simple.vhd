--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:53 04/09/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/5/lab5/tb_simple.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: simple_multiplication
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
 
ENTITY tb_simple IS
END tb_simple;
 
ARCHITECTURE behavior OF tb_simple IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT booth_multiplication
    PORT(
         Q : IN  std_logic_vector(3 downto 0);
         M : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Q : std_logic_vector(3 downto 0) := (others => '0');
   signal M : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: booth_multiplication PORT MAP (
          Q => Q,
          M => M,
          P => P
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		Q <= "0000";
		M <= "0110";
		wait for 100 ns;	
		
		Q <= "0001";
		M <= "0110";
		wait for 100 ns;	

		Q <= "0110";
		M <= "0110";
		wait for 100 ns;	

      wait;
   end process;

END;
