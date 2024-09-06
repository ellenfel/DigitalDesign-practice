-- Digital Logic Circuit

-- Libraries
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity Digital_LC is
	port (
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : out std_logic);
end Digital_LC;
	
-- Architecture
architecture dataflow of arch
begin

D <= (A AND B) XOR ((A AND B) OR (NOT C));

end dataflow