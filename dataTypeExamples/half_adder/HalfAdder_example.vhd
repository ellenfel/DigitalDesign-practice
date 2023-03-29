-- Half Adder

-- Library
library ieee:
use ieee.std_logic_1164.all;

-- Entity
entity half_adder is
	port (
		A	: in std_logic;
		B	: in std_logic;
		S	: out std_logic;
		C	: out std_logic);
end half_adder;
	
-- Architecture
architecture dataflow of half_adder is
begin
	
	S <= A XOR B;
	C <= A AND B;
end datalow;