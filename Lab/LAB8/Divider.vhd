----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:52 04/30/2019 
-- Design Name: 
-- Module Name:    Divider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
    Port ( A : in  STD_LOGIC_VECTOR(8 downto 0);
           B : in  STD_LOGIC_VECTOR(4 downto 0);
           Result : out  STD_LOGIC_VECTOR(8 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           OVF : out  STD_LOGIC);
end Divider;

architecture Behavioral of Divider is

	Type state is (set_signal, check_ovf, check_e_ovf, check_e_above, shift_l, check_e_below, check_cnt);
	signal current_state, next_state: state := set_signal; 
	
	signal cnt: unsigned(3 downto 0) := "0000";
	signal temp: std_logic_vector (4 downto 0);
	
begin

	process(CLK, RST)
	begin
		if(RST = '1') then current_state <= set_signal;
		elsif(CLK'event and CLK = '1') then current_state <= next_state;
		end if;
	end process; 
	
	process(current_state, A, B)
		variable EAQ: STD_LOGIC_VECTOR(8 downto 0);
	begin
		case current_state is
			when set_signal => 
				cnt <= "0000";
				EAQ(7 downto 0) := A(7 downto 0);
				EAQ(8) := '0';
				next_state <= check_ovf;
				
			when check_ovf =>
				Result(8) <= A(8) xor B(4);
				EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not( B(3 downto 0))) + 1);
				temp <= std_logic_vector(unsigned('0' & not( B(3 downto 0)))+ 1 );
				next_state <= check_e_ovf;
				
			when check_e_ovf =>
				if (EAQ(8) = '1') then
					OVF <= '1';
					next_state <= set_signal;
				else
					OVF <= '0';
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & B(3 downto 0)));
					next_state <= shift_l;
				end if;
			
			when shift_l =>
				EAQ := STD_LOGIC_VECTOR(shift_left(unsigned(EAQ), 1));
				next_state <= check_e_above;
				
			when check_e_above =>
				if (EAQ(8) = '1') then
					EAQ(7 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
					EAQ(0) := '1';
					cnt <= cnt + 1;
					next_state <= check_cnt;
				else 
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
					next_state <= check_e_below;
				end if;
				
			when check_e_below =>
				if (EAQ(8) = '1') then
					EAQ(0) := '1';
				else 
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & B(3 downto 0)));
				end if;
				cnt <= cnt + 1;
				next_state <= check_cnt;
				
			when check_cnt =>
				if (cnt = "0100") then
					Result(7 downto 0) <= EAQ(7 downto 0);
					next_state <= set_signal;
				else
					next_state <= shift_l;					
				end if;
		end case;
	end process;

end Behavioral;

