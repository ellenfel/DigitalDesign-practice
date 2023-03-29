-- Full Adder (Dataflow)

-- Libraries
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity Full_Adder_1 is
	port (
		S		: out std_logic;
		C_out	: out std_logic;
		A		: in std_logic;
		B		: in std_logic;
		C_in	: in std_logic);
end Full_Adder_1;

-- Architecture
architecture dataflow of Full_Adder_1 is
begin

C_out <= (A AND B) OR (C_in AND (A XOR B));
S <= (A XOR B) XOR C_in;

end dataflow;
