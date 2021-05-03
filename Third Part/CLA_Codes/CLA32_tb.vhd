--U76553044----------------------------------------------------------------------------------------------------------------------
--KARAKURT-----------------------------------------------------------------------------------------------------------------------

--//32-bit CLA Structural Design Test Bench//-------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity CLA32_tb is
end entity;
 
architecture tb of CLA32_tb is

component CLA32_st
  port (A_32b: in std_logic_vector (31 downto 0);
        B_32b: in std_logic_vector (31 downto 0);
        C0_32b: in std_logic;
        S_32b: out std_logic_vector (31 downto 0);
	P_32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	G_32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        C32_32b: out STD_LOGIC
        );
end component;

--Inputs
signal A_32b_tb : std_logic_vector(31 downto 0) := (others => '0');
signal B_32b_tb : std_logic_vector(31 downto 0) := (others => '0');
signal C0_32b_tb : std_logic := '0';
 
--Outputs
signal S_32b_tb : std_logic_vector(31 downto 0);
SIGNAL P_32b_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL G_32b_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal C32_32b_tb : std_logic;

BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: CLA32_st PORT MAP (
	A_32b => A_32b_tb,
	B_32b => B_32b_tb,
	C0_32b => C0_32b_tb,
	S_32b => S_32b_tb,
	P_32b => P_32b_tb,
	G_32b => G_32b_tb,
	C32_32b => C32_32b_tb
		);

A_32b_tb <= x"0000_0000", x"FFFF_FFFF" AFTER 5 ns, x"AAAA_AAAA" AFTER 8 ns, x"8888_8888" AFTER 12 ns, x"9999_9999" AFTER 14 ns,x"EEEE_EEEE" AFTER 16 ns,x"BABA_BABA" AFTER 22 ns,x"DEF7_DEF7" AFTER 27 ns,x"CCCC_CCCC" AFTER 35 ns,x"DCBA_DCBA" AFTER 40 ns,x"2345_2345" AFTER 50 ns;
		
B_32b_tb <= x"0000_0000", x"AAAA_AAAA" AFTER 5 ns, x"FFFF_FFFF" AFTER 8 ns, x"7777_7777" AFTER 12 ns, x"ACAC_ACAC" AFTER 14 ns,x"EEBB_EEBB" AFTER 16 ns,x"BAFF_BAFF" AFTER 22 ns,x"EEEE_EEEE" AFTER 27 ns,x"CCCC_CCCC" AFTER 35 ns,x"ABCD_ABCD" AFTER 40 ns,x"5555_5555" AFTER 50 ns;

C0_32b_tb <= '0', '1' AFTER 10 ns, '0' AFTER 20 ns, '1' AFTER 30 ns, '0' AFTER 40 ns, '1' AFTER 50 ns;
		

 stop: PROCESS
 BEGIN
	WAIT FOR 60 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;


