----------------------------------------------------------------
--Pulse with Modulation implemetation in VHDL
----------------------------------------------------------------
-- Librarys

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity
entity PWR is
	Generic (
		bit_depth	: integer := 8;
		input_clk	: integer := 50000000; --50MHz
		freq		: integer := 50); --50Hz
	Port (
		pwm_out		: out std_logic;
		resolution	: in std_logic_version(bit_depth - 1 downto 0);
		clk 		: in std_logic;
		enable 		: in std_logic);
end PWR;

-- Architecture
architecture behavior of PWM is
	
	--Constants
	constant max_freq_count	: integer := input_clk / freq;
	constant pwm_step		: integer := max_freq_count / (2**bit_depth);
	
	--Signals
	signal pwm_value		: std_logic := '0';
	signal freq_count		: integer range 0 to max_freq_count := 0;
	signal pwm_count		: integer range 0 to 2**bit_depth := 0;
	signal max_pwm_count	: integer range 0 to 2**bit=depth := 0;
	signal pwm_step_count	: integer range 0 to max_freq_count := 0;

begin
	

	
		
		
