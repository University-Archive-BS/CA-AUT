--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:39:32 02/26/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/2/Lab2/test_decoder2to4.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder2to4
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
 
ENTITY test_decoder2to4 IS
END test_decoder2to4;
 
ARCHITECTURE behavior OF test_decoder2to4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder2to4
    PORT(
         a_0 : IN  std_logic;
         a_1 : IN  std_logic;
         m_0 : OUT  std_logic;
         m_1 : OUT  std_logic;
         m_2 : OUT  std_logic;
         m_3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_0 : std_logic := '0';
   signal a_1 : std_logic := '0';

 	--Outputs
   signal m_0 : std_logic;
   signal m_1 : std_logic;
   signal m_2 : std_logic;
   signal m_3 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2to4 PORT MAP (
          a_0 => a_0,
          a_1 => a_1,
          m_0 => m_0,
          m_1 => m_1,
          m_2 => m_2,
          m_3 => m_3
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a_0 <= '0';
		a_1 <= '0';
		wait for 100 ns;
		
		a_0 <= '1';
		a_1 <= '0';
		wait for 100 ns;
		
		a_0 <= '0';
		a_1 <= '1';
		wait for 100 ns;
		
		a_0 <= '1';
		a_1 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
