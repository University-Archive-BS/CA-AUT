----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:18 04/09/2019 
-- Design Name: 
-- Module Name:    booth_multiplication - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_multiplication is
    Port ( Q : in  STD_LOGIC_VECTOR(3 downto 0);
           M : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end booth_multiplication;


architecture Behavioral of booth_multiplication is
	  
begin
	
	process(Q, M)
		variable q_sig : STD_LOGIC_VECTOR(3 downto 0):= Q;
		variable A: STD_LOGIC_VECTOR(3 downto 0) := "0000";
		variable Q_1: STD_LOGIC := '0';
	begin 
		for item in 1 to 4 loop 
			if (q_sig(0) ='1' and Q_1 = '0') then
				A := A + (not M) + '1';
			elsif (q_sig(0) = '0' and Q_1 = '1') then
				A := A + M;
			end if;
			Q_1 := q_sig(0);
			q_sig(0) :=q_sig(1);
			q_sig(1) :=q_sig(2);
			q_sig(2) :=q_sig(3);
			q_sig(3) :=A(0);
			A(0) := A(1);
			A(1) := A(2);
			A(2) := A(3);
--			q_sig := shift_right(signed(q_sig),1);
--			q_sig(3) := A(0);
--			A := shift_right(signed(A),1);
			
		end loop;	
		P <= A & q_sig;
	
	end process;
	
	


end Behavioral;

