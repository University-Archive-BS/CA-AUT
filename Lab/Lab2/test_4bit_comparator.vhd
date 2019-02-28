--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:11 02/26/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/2/Lab2/test_4bit_comparator.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator_4bit
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
 
ENTITY test_4bit_comparator IS
END test_4bit_comparator;
 
ARCHITECTURE behavior OF test_4bit_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         LI : IN  std_logic;
         EI : IN  std_logic;
         GI : IN  std_logic;
         LO : OUT  std_logic;
         EO : OUT  std_logic;
         GO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal LI : std_logic := '0';
   signal EI : std_logic := '0';
   signal GI : std_logic := '0';

 	--Outputs
   signal LO : std_logic;
   signal EO : std_logic;
   signal GO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator_4bit PORT MAP (
          A => A,
          B => B,
          LI => LI,
          EI => EI,
          GI => GI,
          LO => LO,
          EO => EO,
          GO => GO
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		A <= "0000";
		B <= "0101";
		wait for 100 ns;	
		
		A <= "1100";
		B <= "0101";
		wait for 100 ns;	
		
		A <= "0000";
		B <= "0000";
		wait for 100 ns;	
		
      wait;
   end process;

END;
