----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2017 12:33:26 PM
-- Design Name: 
-- Module Name: var_example - example
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity var_example is
    Generic (use_vars : boolean := false);
    Port (
        value_in        : in std_logic_vector(3 downto 0);
        clk             : in std_logic;
        value_out       : out std_logic_vector(3 downto 0));
end var_example;

architecture example of var_example is

signal a,b : std_logic_vector(0 to 4) := "00000";
 
    begin
    
    value_out <= "0000";
    
    -- Using Variables
    use_var: if use_vars = true generate
        process (clk)
            variable var : std_logic_vector(0 to 4);
            begin 
                if (rising_edge(clk)) then
                    var := "11111";
                    a <= var;
                    b <= var;
                end if;
        end process;
    end generate;
    
    -- No variables
    no_vars: if use_vars = false generate
        process (clk)
            begin
                if (rising_edge(clk)) then
                    a <= "11111";
                    b <= a;
                end if;
        end process;
    end generate;

end example;
