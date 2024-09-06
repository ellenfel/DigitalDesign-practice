--Priority Encoder 1.0

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

entity test_Priority_Encoder_2 is
end;

architecture test of test_Priority_Encoder_2 is

component Priority_Encoder_2
Port (
	encode		: out std_logic_vector(2 downto 0);
	a_in		: in std_logic_vector(7 downto 0));
end component;

signal decode_in	: std_logic_vector(7 downto 0) := (others => '0');
signal encode_out	: std_logic_vector(2 downto 0) := (others => '0');
signal expected 	: unsigned(2 downto 0) := (others => '0');

begin

	dev_to_test : Priority_Encoder_2 port map(encode_out, decode_in);
	
	stimulus: process
	
	variable ErrCnt	: integer := 0;
	
	begin
	
		for i in 0 to 7 loop
			if i = 0 then
				decode_in <= "00000001";
				expected <= (others => '0');
			else
				decode_in(7 downto 1) <= decode_in(6 downto 0);
				decode_in(0) <= '0';
				
				expected <= expected + 1;
			end if;
			
			wait for 10 ns;
			
			if(encode_out /= std_logic_vector(expected)) then
				write(OUTPUT, "%%DONE decoder test failed at code " & integer'image(ErrCnt));
				report "The priority encoder is broken" severity warning;
				ErrCnt := ErrCnt + 1;
			end if;
		end loop;
		
		if(ErrCnt = 0) then
			report "SUCCESS!!!! Priority Encoder Test Completed";
		else
			report "The priority encoder failed";
		end if;
	end process stimulus;
end test;