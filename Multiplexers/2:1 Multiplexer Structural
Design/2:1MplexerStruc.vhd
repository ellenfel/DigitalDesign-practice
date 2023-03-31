-- 2:1 Multiplexer Structural Design 

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity Max_2_1 is
	port (
		A	: in std_logic;
		B	: in std_logic;
		X	: in std_logic;
		y	: out std_logic;)
end Max_2_1;

-- Architecture		
architecture structure of Max_2_1 is

-- Signals
signal d,e 	: std_logic := '0';

-- AND gate
component AND_GATE
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end component;
	
-- OR gate
component OR_GATE
	port (
		A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end component;
	
begin
	
	AND_1 : AND_GATE port map(A, NOT X, d);
	AND_2 : AND_GATE port map(X, B, e);
		
	OR_1 : OR_GATE port map(d, e, y);

end structure; 