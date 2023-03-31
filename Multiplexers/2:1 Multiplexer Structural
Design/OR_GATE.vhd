-- OR Gate

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity OR_GATE is
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end OR_GATE;

-- Architecture
architecture dataflow of OR_GATE is
begin
	C <= A or B;
	
end dataflow;