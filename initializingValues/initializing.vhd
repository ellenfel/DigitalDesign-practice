-- This is a comment in VHDL

-- Define signal "A" as type unsigned with initial value of 4
signal A : integer := 4;

-- Define signal "B" as type usgigned with iinitial value of 0000
signal B : unsigned(3 downto 0) := "0000";

-- Define sigbal B1 as type unsigned with initial value of 0000
signal B1 : unsigned(3 downto 0) := (others => '0');

-------------------------------------------------------------------
-- Note;
-- Signals B and B1 are the same
-------------------------------------------------------------------

-- Define signal C as type signed with initial value of 1111
signal C : signed(3 downto 0) := "1111";

-- Define signal C1 as type signed with initial value of 1111
signal C1 unsigned (3 downto 0) := (others => 0) := (others => '1');

-------------------------------------------------------------------
-- Note;
-- Signals C and C1 are the same
-------------------------------------------------------------------

-- Assigned values to std_logic_vector

-- Define signal A as a std_logic_vector data type with an initial value of 11111111
signal A : std_logic_vector(7 downto 0) := (others => '1');

-- Define signal A_reg as a std_logic_vector data type with an initial value of 00000000
signal A_reg : std_logic_vector(7 downto 0) := (others => '0');

-------------------------------------------------------------------
-- Note;
-- Right now signal A = 11111111 and A_reg = 00000000
-------------------------------------------------------------------

-- Set signal A equal to A_reg
A <= A_reg;

-------------------------------------------------------------------
-- Note;
-- Right now signal A = 00000000 and A_reg = 00000000
-------------------------------------------------------------------
