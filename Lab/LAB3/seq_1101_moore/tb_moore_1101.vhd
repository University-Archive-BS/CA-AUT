--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:40:04 03/05/2019
-- Design Name:   
-- Module Name:   D:/9631001-9631075/Akhgari-Nazari/3/lab3/tb_moore_1101.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seq_detector_1101_moore
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
 
ENTITY tb_moore_1101 IS
END tb_moore_1101;
 
ARCHITECTURE behavior OF tb_moore_1101 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq_detector_1101_moore
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         in_data : IN  std_logic;
         out_data : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal in_data : std_logic := '0';

 	--Outputs
   signal out_data : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq_detector_1101_moore PORT MAP (
          rst => rst,
          clk => clk,
          in_data => in_data,
          out_data => out_data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		rst <= '1';
		wait for 10 ns;
		
		rst <= '0';
		wait for 10 ns;
		
		in_data <= '1';
		wait for 10 ns;
		
		in_data <= '1';
		wait for 10 ns;

		in_data <= '0';
		wait for 10 ns;

		in_data <= '1';
		wait for 10 ns;

		in_data <= '1';
		wait for 10 ns;


      wait;
   end process;

END;
