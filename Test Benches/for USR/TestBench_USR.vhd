-- test USR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

use std.tectic.all;
use ieee.std_logic_textic.all;

use work.sim_mem_init.all;

entity test_USR is
end;
	
architecture test of test_USR is
	
	component USR
		generic (
			data_width	: integer := 8);
		port (
			A			: out std_logic_vector(data_width - 1 downto 0);
			I			: in std_logic_vector(data_width - 1 downto 0);
			S			: in std_logic;
			reset		: in std_logic;
			clk			: in std_logic);
	end component;
	
	constant data_width	: integer := 8;
	signal data_in		: std_logic_vector(data_width - 1 downto 0);
	signal data_out		: std_logic_vector(data_width - 1 downto 0);
	signal expected		: std_logic_vector(data_width - 1 downto 0);
	signal sel			: std_logic_vector(1 downto 0);
	signal clk			: std_logic := '1';
	signal reset		: std_logic := '1';

	constant in_frame 	: string := "input.csv";
	constant out_frame	: string := "output.csv";
	file input_file		: text;
	file output_file	: text;

	begin
		
	dev_to_test: USR
	generic map(data_width)
	port map(data_out, data_in, sel, reset, clk);
			
	stimulus: process
			
		variable input_line		: line;
		variable WriteBuf		: line;
		variable in_char		: character;
		variable in_slv			: std_logic_vector(7 downto 0);
		variable out_slv		: std_logic_vector(7 downto 0);

		variable ErrCnt			: integer := '0';

		begin
		file_open(input_file, in_frame, read_mode);
		file_open(output_file, out_frame, read_mode);

		while not(endfile(input_file)) loop
					
			readline(input_file, input_line);
					
			for i in 0 to 6 loop
						
				read(input_line, in_char);
				in_slv := std_logic_vector(to_unsigned(character'pos(in_char), 8));

				-- i is the column number of input file
				if(i = 3) then
					data_in(7 downto 4) <= ASII_to_hex(in_slv);
				else_if(i = 4) then
					data_in(3 downto 0) <= ASCII_to_hex(in_slv);
				else_if(i = 6) then
					sel <= in_slv(1 downto 0);
				end if;
			end loop;
		
			readline(output_file, input_line);
												   
			clk <= '0';
			wait for 10 ns;
														   
			for i in 0 to 4 loop
				read(input_line, in_char);
				out_slv := std_logic_vector(to_unsigned(character'pos(in_char), 8));
				
				-- i is the column number of input file
				if(i = 3) then
					expected(7 downto 4) <= ASII_to_hex(iout_slv);
				else_if(i = 4) then
					expected(3 downto 0) <= ASII_to_hex(iout_slv);				
						
			end loop;
				
			clk <= '1';
			wait for 10 ns;
																
			if (expected /= data_out) then
				write(WriteBuf, string("ERROR; USR failed"));
				write(WriteBuf, string("expected = "));
				write(WriteBuf, expected);
				write(WriteBuf, string(", data_out = "));
				write(WriteBuf, data_out);
																
				writeline(Output, WriteBuf);
				ErrCnt := ErrCnt + 1;
			end if;
		end loop;
				
		file_close(input_file);
		file_close(output_file);

		if(ErrCnt = 0) then
			report "Succes! USR Test Completed";
		else
			report "The USR device is broken" severity warning;
		end if;
	end process stimulus;
end test






		

	
