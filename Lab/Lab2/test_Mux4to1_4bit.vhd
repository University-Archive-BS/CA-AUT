--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:53 02/26/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/2/Lab2/test_Mux4to1_4bit.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux4to1_4bit
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
 
ENTITY test_Mux4to1_4bit IS
END test_Mux4to1_4bit;
 
ARCHITECTURE behavior OF test_Mux4to1_4bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux4to1_4bit
    PORT(
         D_0 : IN  std_logic_vector(3 downto 0);
         D_1 : IN  std_logic_vector(3 downto 0);
         D_2 : IN  std_logic_vector(3 downto 0);
         D_3 : IN  std_logic_vector(3 downto 0);
         S_0 : IN  std_logic;
         S_1 : IN  std_logic;
         W : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal D_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal D_2 : std_logic_vector(3 downto 0) := (others => '0');
   signal D_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal S_0 : std_logic := '0';
   signal S_1 : std_logic := '0';

 	--Outputs
   signal W : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux4to1_4bit PORT MAP (
          D_0 => D_0,
          D_1 => D_1,
          D_2 => D_2,
          D_3 => D_3,
          S_0 => S_0,
          S_1 => S_1,
          W => W
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		D_0 <= "0001";
		D_1 <= "0010";
		D_2 <= "0100";
		D_3 <= "1000";

		S_0 <= '0';
		S_1 <= '0';
		wait for 100 ns;
		
		S_0 <= '1';
		S_1 <= '0';
		wait for 100 ns;
		
		S_0 <= '0';
		S_1 <= '1';
		wait for 100 ns;
		
		S_0 <= '1';
		S_1 <= '1';
		wait for 100 ns;
		
      wait;
   end process;

END;
