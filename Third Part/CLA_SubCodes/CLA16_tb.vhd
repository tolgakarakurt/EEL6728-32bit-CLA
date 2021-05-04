--KARAKURT-----------------------------------------------------------------------------------------------------------------------
--//16-bit CLA Structural Design Test Bench-------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity CLA16_tb is
end entity;
 
architecture tb of CLA16_tb is

component CLA16_st
  port (A_16b: in std_logic_vector (15 downto 0);
        B_16b: in std_logic_vector (15 downto 0);
        C0_16b: in std_logic;
	S_16b: out std_logic_vector (15 downto 0);
	P_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
	G_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        C16_16b: out std_logic
        );
end component;

--Inputs
signal A_16b_tb : std_logic_vector(15 downto 0) := (others => '0');
signal B_16b_tb : std_logic_vector(15 downto 0) := (others => '0');
signal C0_16b_tb : std_logic := '0';
 
--Outputs
signal S_16b_tb : std_logic_vector(15 downto 0);
SIGNAL P_16b_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL G_16b_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal C16_16b_tb : std_logic;

BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: CLA16_st PORT MAP (
	A_16b => A_16b_tb,
	B_16b => B_16b_tb,
	C0_16b => C0_16b_tb,
	S_16b => S_16b_tb,
	P_16b => P_16b_tb,
	G_16b => G_16b_tb,
	C16_16b => C16_16b_tb
		);

	  	
A_16b_tb <= x"0000", x"FFFF" AFTER 5 ns, x"AAAA" AFTER 8 ns, x"8888" AFTER 12 ns, x"9999" AFTER 14 ns,x"EEEE" AFTER 16 ns,x"BABA" AFTER 22 ns,x"DEF7" AFTER 27 ns,x"CCCC" AFTER 35 ns,x"DCBA" AFTER 40 ns,x"2345" AFTER 50 ns;
		
B_16b_tb <= x"0000", x"AAAA" AFTER 5 ns, x"FFFF" AFTER 8 ns, x"7777" AFTER 12 ns, x"ACAC" AFTER 14 ns,x"EEBB" AFTER 16 ns,x"BAFF" AFTER 22 ns,x"EEEE" AFTER 27 ns,x"CCCC" AFTER 35 ns,x"ABCD" AFTER 40 ns,x"5555" AFTER 50 ns;

C0_16b_tb <= '0', '1' AFTER 10 ns, '0' AFTER 20 ns, '1' AFTER 30 ns, '0' AFTER 40 ns, '1' AFTER 50 ns;
		

 stop: PROCESS
 BEGIN
	WAIT FOR 60 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;


