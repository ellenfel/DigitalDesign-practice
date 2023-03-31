-- SR Latch Structural

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity is SR_LATCH is
	port (
		S		: in std_logic;
		R		: in std_logic;
		Q		: out std_logic;
		Q_not	: out std_logic);
end SR_LATCH;
	
-- Architecture
architecture structure of SR_LATCH is
	
-- Signals
signal x,y : std_logic := '0';

-- NOR Gate component instantiation
component NOR_GATE
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end component
	
begin
	
	U1: NOR_GATE port map(R, x, y);
	U2: NOR_GATE port map(y, S, x);
	
	Q <= y;
	Q_not <= x;

end structure;
		
	