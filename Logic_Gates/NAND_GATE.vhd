-- NAND Gate

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity NAND_GATE is
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end NAND_GATE;

-- Architecture
architecture dataflow of NAND_GATE is
begin
	C <= A nand B;
	
end dataflow;