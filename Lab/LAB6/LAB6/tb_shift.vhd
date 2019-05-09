--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:44 04/16/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/6/lab6/tb_shift.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_register
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
 
ENTITY tb_shift IS
END tb_shift;
 
ARCHITECTURE behavior OF tb_shift IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_register
    PORT(
         Data : IN  std_logic_vector(3 downto 0);
         Load : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         Selector : IN  std_logic_vector(1 downto 0);
         Result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(3 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';
   signal Selector : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_register PORT MAP (
          Data => Data,
          Load => Load,
          Reset => Reset,
          Clock => Clock,
          Selector => Selector,
          Result => Result
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*10;

      -- insert stimulus here 
		Reset <= '1';
		wait for 100 ns;
		Reset <= '0';
		wait for 100 ns;	
		
		Data <= "1010";
		wait for 100 ns;
		Load <= '1';
		wait for 100 ns;	
		Load <= '0';
		
		wait for 100 ns;	
		Selector <= "01";
		wait for 100 ns;	
		Selector <= "10";
		wait for 100 ns;	
		Selector <= "11";
		wait;
   end process;

END;
