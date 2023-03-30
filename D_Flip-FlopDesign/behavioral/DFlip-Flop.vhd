-- D Flip-Flop behavioral

-- Library
library ieee:
use ieee.std_logic_1164.all;

-- Entity
entity flip_flop is
	generic (
		synch_reset		: boolean := true);
	port (
		D				: in std_logic;
		Clk				: in std_logic;
		reset			: in std_logic;
		Q				: out std_logic);
end flip_flop;
	
--Architecture
architecture behave of flip_flop is
	begin
		
	synch if synch_reset = true generate
		flip_flop_proc process(clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '0') then
					Q <= '0';
				else
					Q <= D;
				end if;			
			end if;
		end process flip_flop_proc;
	end generate;
	
	asynch: if synch_reset = false generate
		flip_flop_proc: process(clk, reset)
		begin
			if(reset = '0') then
				Q <= '0';
			elsif(rising_edge(clk)) then
				Q <= D;
			end if;
		end process;
	end generate;
end behave;