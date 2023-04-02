-- XOR Gate

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity XOR_GATE is
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end XOR_GATE;

-- Architecture
architecture dataflow of XOR_GATE is
begin
	C <= A xor B;
	
end dataflow;