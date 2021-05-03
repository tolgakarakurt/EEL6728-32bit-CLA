-----------------------------------------------------------
-----------------------------------------------------------
-------------------/AO31_tb/----------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------------
entity AO31_tb is
end;
-----------------------------------------------------------------------
architecture tb of AO31_tb is
	--signal clk : std_logic := '0';
	constant period : time := 10 ns;
-----------------------------------------------------------------------
component AO31
	port(A,B,C,D: in std_logic;
	           Z: out std_logic);
end component;
-----------------------------------------------------------------------
	signal A_tb,B_tb,C_tb,D_tb: std_logic := '0';
	signal                Z_tb: std_logic;
-----------------------------------------------------------------------
begin
	--clk <= not clk after period/2;
uut: AO31
	port map(A=>A_tb, B=>B_tb, C=>C_tb, D=>D_tb, Z=>Z_tb);
	--A_tb<= not A_tb after 2 ns;
	A_tb <= '-','-' AFTER 5 ns, '0' AFTER 11 ns, '1' AFTER 19 ns, '-' AFTER 25 ns;
	--B_tb<= not B_tb after 3 ns;
	B_tb<= '0','-' AFTER 5 ns, '-' AFTER 11 ns, '1' AFTER 19 ns, '-' AFTER 25 ns;
	--C_tb<= not C_tb after 4 ns;
	C_tb <= '-','0' AFTER 5 ns, '-' AFTER 11 ns, '1' AFTER 19 ns, '-' AFTER 25 ns;
	--D_tb<= not D_tb after 5 ns;
	D_tb<= '0','0' AFTER 5 ns, '0' AFTER 11 ns, '1' AFTER 19 ns, '1' AFTER 25 ns;
------------------------------------------------------------------------
stop: process
begin
	wait for 40 ns;
	assert false
		report "Simulation ended by TK at" & time'image(now)
	severity failure;
------------------------------------------------------------------------
end process;
end tb;
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/BF_tb/----------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity BF_tb is
	generic (delay: time := 31 ps);

end entity;

architecture tb of BF_tb is
COMPONENT BUF IS
	PORT( A: IN STD_LOGIC;
	      Z: OUT STD_LOGIC
		);
END COMPONENT;
	SIGNAL A_tb: STD_LOGIC:= '0';
	SIGNAL Z_tb: STD_LOGIC;
BEGIN
uut : BUF
	PORT MAP(A=>A_tb, Z=>Z_tb);
	A_tb <= NOT A_tb AFTER 2 ns;
 stop: PROCESS
 BEGIN
	WAIT FOR 40 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFPHQN_tb/----------------------------------
 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
 ---------------------------------------
 ENTITY DFPHQN_tb IS
 	
 END;
 ---------------------------------------
 ARCHITECTURE tb OF DFPHQN_tb IS

 COMPONENT DFPHQN
	PORT
	(         D, CP, E: IN STD_LOGIC;
 		 	 QN: OUT STD_LOGIC
	);
 END COMPONENT;

	SIGNAL D_tb    : STD_LOGIC := '0';
 	SIGNAL CP_tb   : STD_LOGIC := '0';
	SIGNAL E_tb    : STD_LOGIC := '1';
	SIGNAL QN_tb   : STD_LOGIC;
	CONSTANT period: time:= 6 ns;  --167MHz

 BEGIN 
  uut: DFPHQN 
	port map( D => D_tb,	
	  	 CP => CP_tb,
	  	  E => E_tb,
	  	 QN => QN_tb 
		);

	CP_tb <= NOT CP_tb AFTER period/2;
	
	 E_tb <= '1', '0' AFTER 7 ns, '1' AFTER 18 ns, '0' AFTER 20 ns, '1' AFTER 23 ns;
 	 
	 D_tb <= '0', '1' AFTER 5 ns, '0' AFTER 11 ns, '1' AFTER 19 ns, '0' AFTER 25 ns, '1' AFTER 34 ns;


 stop: PROCESS
 BEGIN
	WAIT FOR 40 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

 ---------------------------------------
---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/MUX41_tb/---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX41_tb IS
END ENTITY;

ARCHITECTURE tb of MUX41_tb IS
COMPONENT MUX41 IS
	PORT(D0, D1, D2, D3: IN STD_LOGIC;
		       S0, S1: IN STD_LOGIC;
		            Z: OUT STD_LOGIC	
		);
END COMPONENT;
	SIGNAL D0_tb : STD_LOGIC:='0';
	SIGNAL D1_tb : STD_LOGIC:='0';
	SIGNAL D2_tb : STD_LOGIC:='0';
	SIGNAL D3_tb : STD_LOGIC:='0';
	SIGNAL S0_tb : STD_LOGIC:='0';
	SIGNAL S1_tb : STD_LOGIC:='0';
	SIGNAL Z_tb: STD_LOGIC;
BEGIN

uut: MUX41
	port map( D0 => D0_tb,
		  D1 => D1_tb,
		  D2 => D2_tb,
		  D3 => D3_tb,
		  S0 => S0_tb,
		  S1 => S1_tb,
		  Z => Z_tb	
		);

	  	--D0_tb <= NOT D0_tb AFTER 2 ns;
		D0_tb <= '1', '1' AFTER 7 ns, '-' AFTER 8 ns, '-' AFTER 22 ns, '-' AFTER 23 ns;
		--D1_tb <= NOT D1_tb AFTER 4 ns;
		D1_tb <= '1', '-' AFTER 7 ns, '1' AFTER 8 ns, '-' AFTER 22 ns, '-' AFTER 23 ns;
		--D2_tb <= NOT D2_tb AFTER 8 ns;
		D2_tb <= '1', '-' AFTER 7 ns, '-' AFTER 8 ns, '1' AFTER 22 ns, '-' AFTER 23 ns;
		--D3_tb <= NOT D3_tb AFTER 16 ns;
		D3_tb <= '1', '-' AFTER 7 ns, '-' AFTER 8 ns, '-' AFTER 22 ns, '1' AFTER 23 ns;
		--S0_tb <= NOT S0_tb AFTER 3 ns;
		S0_tb <= '-', '0' AFTER 7 ns, '1' AFTER 8 ns, '0' AFTER 22 ns, '1' AFTER 23 ns;
		--S1_tb <= NOT S1_tb AFTER 6 ns;
		S1_tb <= '-', '0' AFTER 7 ns, '0' AFTER 8 ns, '1' AFTER 22 ns, '1' AFTER 23 ns;

 stop: PROCESS
 BEGIN
	WAIT FOR 40 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by TK at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;

END tb;
 ---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/NAND3A_tb/---------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------------
entity NAND3A_tb is
end;
-----------------------------------------------------------------------
architecture tb of NAND3A_tb is
	--signal clk : std_logic := '0';
	constant period : time := 10 ns;
-----------------------------------------------------------------------
component NAND3A
	port(A,B,C: in std_logic;
	         Z: out std_logic);
end component;
-----------------------------------------------------------------------
	signal A_tb,B_tb,C_tb: std_logic := '0';
	signal           Z_tb: std_logic;
-----------------------------------------------------------------------
begin
	--clk <= not clk after period/2;
uut: NAND3A
	port map(A=>A_tb, B=>B_tb, C=>C_tb, Z=>Z_tb);
	--C_tb<= not C_tb after 2 ns;
	C_tb <= '1','-' AFTER 8 ns, '-' AFTER 15 ns, '0' AFTER 28 ns;
	--B_tb<= not B_tb after 4 ns;
	B_tb <= '1','0' AFTER 8 ns, '-' AFTER 15 ns, '-' AFTER 28 ns;
	--A_tb<= not A_tb after 6 ns;
	A_tb <= '0','-' AFTER 8 ns, '1' AFTER 15 ns, '-' AFTER 28 ns;
------------------------------------------------------------------------
stop: process
begin
	wait for 40 ns;
	assert false
		report "Simulation ended by TK at" & time'image(now)
	severity failure;
------------------------------------------------------------------------
end process;
end tb;
