----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:32 05/08/2019 
-- Design Name: 
-- Module Name:    CPU8BIT2 - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU8BIT2 is
	port ( data: out std_logic_vector(7 downto 0);
		adress: out std_logic_vector(4 downto 0);
		rst: in std_logic;
		clk: in std_logic);
	end;
	
architecture CPU_ARCH of CPU8BIT2 is
	signal akku: std_logic_vector(7 downto 0);
	signal adreg: std_logic_vector(4 downto 0);
	signal pc: std_logic_vector(4 downto 0);
	signal states: std_logic_vector(2 downto 0);
	
	type ram is array (31 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal memory : ram;
	
begin	
	Process(clk,rst)
		variable indata : STD_LOGIC_VECTOR( 7 downto 0);
		begin
			If (rst = '0') then
				-- initall memory
				memory(0) <= "00000101";
				memory(1) <= "00011111";
				memory(2) <= "11000101";
				memory(3) <= "11000010";
				memory(4) <= "01000011";
				memory(5) <= "10011000";
				
				-- start execution at memory location 0
				indata := (others => '0');
				adreg <= (others => '0');
				states <= (others => '0');
				akku <= (others => '0');
				pc <= (others => '0');
			elsIf rising_edge(clk) then
				-- PC / Adress path
				If (states = "000") then
					pc <= STD_LOGIC_VECTOR(unsigned(adreg) + 1);
					indata := memory(to_integer(unsigned(pc)));
					-- adreg <= indata(4 downto 0);
				else
					indata := memory(to_integer(unsigned(adreg)));
					adreg <= pc;
				end If;
				-- ALU / Data Path
				Case states is
					when "001" => akku <= STD_LOGIC_VECTOR(unsigned(akku(7 downto 0)) + unsigned(indata)); -- add
					when "010" => akku(7 downto 0) <= STD_LOGIC_VECTOR(unsigned(akku(7 downto 0)) - unsigned(indata)); -- sub
					when "011" => akku(7 downto 0) <= akku(7 downto 0) or indata; -- or
					when "100" => akku(7 downto 0) <= akku(7 downto 0) nor indata; -- nor
					when "101" => akku(7 downto 0) <= akku(7 downto 0) and indata; -- and
					when "110" => akku(7) <= '0'; -- clear carry
					when "111" => akku <= not indata; -- not
					when others => null; -- instr. fetch, jcc taken (000), sta (001)
				end Case;
				-- State machine
				If (states /= "000") then states <= "000"; -- fetch next opcode
				else states <= not indata(7 downto 5); -- execute instruction
				end If;
			end If;
	end Process;
	-- output
	data <= akku(7 downto 0);
end CPU_ARCH;