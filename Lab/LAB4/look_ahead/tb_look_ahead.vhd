--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:53 03/12/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/4/lab4/tb_look_ahead.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carry_look_ahead_adder_4bit
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
 
ENTITY tb_look_ahead IS
END tb_look_ahead;
 
ARCHITECTURE behavior OF tb_look_ahead IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carry_look_ahead_adder_4bit
    PORT(
         C_in : IN  std_logic;
         A_in : IN  std_logic_vector(3 downto 0);
         B_in : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C_in : std_logic := '0';
   signal A_in : std_logic_vector(3 downto 0) := (others => '0');
   signal B_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carry_look_ahead_adder_4bit PORT MAP (
          C_in => C_in,
          A_in => A_in,
          B_in => B_in,
          S => S,
          C_out => C_out
        );

    -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		C_in <= '0';
		A_in <= "0000";
		B_in <= "0000";
		wait for 100 ns;	
		
		C_in <= '1';
		A_in <= "0011";
		B_in <= "0000";
		wait for 100 ns;	
		
		C_in <= '0';
		A_in <= "0000";
		B_in <= "0110";
		wait for 100 ns;	
		
		C_in <= '1';
		A_in <= "0100";
		B_in <= "0001";
		wait for 100 ns;	

      wait;
   end process;

END;
