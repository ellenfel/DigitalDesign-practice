-- D Flip-Flop test

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

-- Entity
entity test_Full_Adder_1 is
end;
	
-- Architecture
architecture test of DFF_Test is

component DFlip_Flop
	generic (
		synch_reset		: boolean := true);
	port (
		D				: in std_logic;
		Clk				: in std_logic;
		reset			: in std_logic;
		Q				: out std_logic);
end component;
	
constant sync			: boolean := false;
signal D_in 			: std_logic := '0';
signal clk 	 			: std_logic := '0';
signal Q_out 			: std_logic := '0';
signal expected			: std_logic := '0';
signal reset 			: std_logic := '0';

begin
	
	dev_to_test : DFlip_Flop
		generic map (sync)
		port map(Q_out, D_in, clk, reset);
		
	expected_output : process(clk reset)
		if(reset = '0') then
			expected <= '0';
		elsif(rising_edge(clk)) then
			expected <= D_in;
		end if;
	end process expected_output
		
	clk_proc : process
	begin
		wait for 10 ns
		clk <= NOT clk;
	end process;
		
	stimulus : process
			
	-- Variables
	variable WriteBuf : line;
	variable ErrCnt	: integer := 0;

	begin
		reset <= '0';
		wait for 10 ns;
		reset <= '1';

		for k in 0 to 5 loop
			for i in std_logic range '0' to '1' loop
				D_in <= i;
			
				wait fo 13 ns ;
				if(expected /= Q_out) then
					write(WriteBuf, string("Error, D_tpe FF Failed"));
					write(WriteBuf, string("at D_in = "));
					write(WriteBuf, i);
					ErrCnt := ErrCnt + 1;
					writeline(Output, WriteBuf);
				end if;
			end loop;
		end loop;
		
		if(ErrCnt = 0) then
			report "D_type FF Passed. ";
		else
			report "D_type FF Failed. "severity warning; 
		end if;
	end process stimulus;
end test;			
					