LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CLA4_tb IS
END ENTITY;
 
ARCHITECTURE tb OF CLA4_tb IS
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT CLA4_st
PORT(
A_4b : IN std_logic_vector(3 downto 0);
B_4b : IN std_logic_vector(3 downto 0);
C0_4b : IN std_logic;
S_4b : OUT std_logic_vector(3 downto 0);
P_4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
G_4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
C4_4b : OUT std_logic
);
END COMPONENT;
 
--Inputs
signal A_4b_tb : std_logic_vector(3 downto 0) := (others => '0');
signal B_4b_tb : std_logic_vector(3 downto 0) := (others => '0');
signal C0_4b_tb : std_logic := '0';
 
--Outputs
signal S_4b_tb : std_logic_vector(3 downto 0);
SIGNAL P_4b_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL G_4b_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal C4_4b_tb : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: CLA4_st PORT MAP (
	A_4b => A_4b_tb,
	B_4b => B_4b_tb,
	C0_4b => C0_4b_tb,
	S_4b => S_4b_tb,
	P_4b => P_4b_tb,
	G_4b => G_4b_tb,
	C4_4b => C4_4b_tb
		);

	  	
		A_4b_tb <= "0000", "1111" AFTER 10 ns, "1010" AFTER 20 ns, "1000" AFTER 30 ns;
		
		B_4b_tb <= "0000", "1111" AFTER 10 ns, "0111" AFTER 20 ns, "1001" AFTER 30 ns;

		C0_4b_tb <= '0', '1' AFTER 10 ns, '0' AFTER 20 ns, '0' AFTER 30 ns;
		

 stop: PROCESS
 BEGIN
	WAIT FOR 40 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

