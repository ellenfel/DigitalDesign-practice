-- Full Adder Test Bench

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
architecture test of Full_Adder_1 is
component Full_Adder_1
	port (
		S		: out std_logic;
		C_out	: out std_logic;
		x		: in std_logic;
		y		: in std_logic;
		C_in	: in std_logic);
end component;
	
--Signals
signal A_in					: std_logic;
signal B_in					: std_logic;
signal c_in					: std_logic;
signal s_out				: std_logic;
signal c_out				: std_logic;
signal s_expected			: std_logic;
signal c_out_expected		: std_logic;

signal inputs				: std_logic_vector(2 downto 0);
signal outputs				: std_logic_vector(2 downto 0);

begin
	dev_to_test : Full_Adder_1
		port map(s_out, c_out, A_in, B_in, c_in);
	
	-- create the test input and outputs
	inputs <= c_in & B_in & A_in;
	c_out_expected <= outputs(1);
	s_expected <= outputs(0);

	expected_proc : process(inputs)
		begin
			case inputs is
				when "000"  => outputs	<="00";
				when "001"  => outputs	<="01";
				when "010"  => outputs	<="01";
				when "011"  => outputs	<="10";
				when "100"  => outputs	<="01";
				when "101"  => outputs	<="10";
				when "110"  => outputs	<="10";
				when "111"  => outputs	<="11";
				when others => outputs  <= (others => 'X');
			end case;
	end process expected_proc;
				
	stimulus : process
			
	-- variable for test bench
	variable ErrCnt		: integer := 0;
	variable WriteBuf	: line ;

	begin
		for i in std_logic range '0' to '1' loop
			c_in <= i;
			for j in std_logic range '0' to '1' loop
				B_in <= j;
				for k in std_logic range '0' to '1' loop
					A_in <= k;
			
					wait for 10 ns;
					if (c_out_expected /= c_out) then
						write(WriteBuf, string'("ERROR FA test failed at c_out: x = "));
						write(WriteBuf, A_in); write(WriteBuf, string'(", B = ") );	   
						write(WriteBuf, B_in); write(WriteBuf, string'(", c_in = ") );	
						write(WriteBuf, c_in);
												 
						writeline(Output, WriteBuf); 
					end if;
				end loop; --k
			end loop; --j
		end loop; --i
					
		if(ErrCnt = 0) then
			report "Success! Full Adder Test Competed. ";
		else
			report "Full Adder is Broken. "severity warning; 
		end if;
	end process stimulus;
end test;
											
			
			
			
			
			
			
			
			
			
			
			