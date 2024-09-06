-- 2:1 Multiplexer

-- Library
library ieee:
use ieee.std_logic_1164.all;

-- Entity
entity Multiplexer is
	port (
		A	: in std_logic_vector(3 downto 0);
		B	: in std_logic_vector(3 downto 0);
		sel	: in std_logic;
		C	: out std_logic_vector(3 downto 0));
end Multiplexer;
	
-- Architecture
architecture behave of Multiplexer is
begin
	max: process (A, B, sel)
	begin
		if (sel = '1') then
			C <= A;
		else
			C <= B;
		end if;
	end process;
end behave; 
	
	