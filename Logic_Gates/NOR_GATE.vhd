-- NOR Gate

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity NOR_GATE is
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end NOR_GATE;

-- Architecture
architecture dataflow of NOR_GATE is
begin
	C <= A nor B;
	
end dataflow;