--Full Adder Structural
library IEEE;
use IEEE.STD_LOGİC_1164.ALL;

entity Full_Adder_2 is
	port (
		S		: out std_logic;
		C_out	: out std_logic;
		x		: in std_logic;
		y		: in std_logic;
		C_in	: in std_logic);
end Full_Adder_1;
	
architecture structural of Full_Adder_2 is
	
	component Half_Adder
		port (
			C	: out std_logic;
			S	: out std_logic;
			A	: in std_logic;
			B	: in std_logic);

--Internal Signals
		signal half_sum, carry_1, carry_2	: std_logic := '0';

		begin
		--Instantiate the half adders
			half_adder_1: Half_Adder port map(carry_1, half_sum, x, y);
			half_adder_2: Half_Adder port map(carry_2, S, half_sum, C_in);
				
		--OR gate
			C_out <= carry_1 OR carry_2
			
end structural;
		