-- XNOR Gate

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity XNOR_GATE is
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end XNOR_GATE;

-- Architecture
architecture dataflow of XNOR_GATE is
begin
	C <= A xnor B;
	
end dataflow;