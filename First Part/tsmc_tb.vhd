-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFFN_tb/---------------------------------
 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
 ---------------------------------------
 ENTITY DFFN_tb IS
 	
 END;
 ---------------------------------------
 ARCHITECTURE tb OF DFFN_tb IS

 COMPONENT DFFN
	PORT
	(            D, CK: IN STD_LOGIC;
 		 	 Q: OUT STD_LOGIC;
			QN: OUT STD_LOGIC
	);
 END COMPONENT;

	SIGNAL D_tb    : STD_LOGIC := '0';
 	SIGNAL CK_tb   : STD_LOGIC := '0';
	SIGNAL Q_tb    : STD_LOGIC;
	SIGNAL QN_tb   : STD_LOGIC;
	CONSTANT period: time:= 6 ns;  --167MHz

 BEGIN 
  dut: DFFN 
	port map( D => D_tb,	
	  	 CK => CK_tb,
	  	 Q => Q_tb,
	  	 QN => QN_tb 
		);

	CK_tb <= NOT CK_tb AFTER period/2;
	
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
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFFR_tb/---------------------------------
 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
 ---------------------------------------
 ENTITY DFFR_tb IS
 	
 END;
 ---------------------------------------
 ARCHITECTURE tb OF DFFR_tb IS

 COMPONENT DFFR
	PORT
	(        D, CK, RN: IN STD_LOGIC;
 		 	 Q: OUT STD_LOGIC;
			QN: OUT STD_LOGIC
	);
 END COMPONENT;

	SIGNAL D_tb    : STD_LOGIC := '0';
 	SIGNAL CK_tb   : STD_LOGIC := '0';
	SIGNAL RN_tb   : STD_LOGIC := '1';
	SIGNAL Q_tb    : STD_LOGIC;
	SIGNAL QN_tb   : STD_LOGIC;
	CONSTANT period: time:= 6 ns;  --167MHz

 BEGIN 
  dut: DFFR 
	port map( D => D_tb,	
	  	 CK => CK_tb,
	  	 RN => RN_tb,
	  	  Q => Q_tb,
	  	 QN => QN_tb 
		);

	CK_tb <= NOT CK_tb AFTER period/2;
	
	RN_tb <= '1', '0' AFTER 7 ns, '1' AFTER 8 ns, '0' AFTER 22 ns, '1' AFTER 23 ns;
 	 
	 D_tb <= '0', '1' AFTER 5 ns, '0' AFTER 11 ns, '1' AFTER 19 ns, '0' AFTER 25 ns, '1' AFTER 34 ns;


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
-------------------/NOR2_tb/---------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------------
entity NOR2_tb is
end;
-----------------------------------------------------------------------
architecture tb of NOR2_tb is
	--signal clk : std_logic := '0';
	constant period : time := 6 ns;
-----------------------------------------------------------------------
component NOR2
	port(A, B: in std_logic;
	       Y: out std_logic);
end component;
-----------------------------------------------------------------------
	signal A_tb, B_tb: std_logic := '0';
	signal       Y_tb: std_logic;
-----------------------------------------------------------------------
begin
	
uut: NOR2
	port map(A=>A_tb, B=>B_tb, Y=>Y_tb);

	A_tb <= not A_tb after 2 ns;
	B_tb <= not B_tb after 4 ns;
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
-------------------/NAND2_tb/---------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------------
entity NAND2_tb is
end;
-----------------------------------------------------------------------
architecture tb of NAND2_tb is
	signal clk : std_logic := '0';
	constant period : time := 10 ns;
-----------------------------------------------------------------------
component NAND2
	port(A,B: in std_logic;
	       Y: out std_logic);
end component;
-----------------------------------------------------------------------
	signal A,B: std_logic := '0';
	signal   Y: std_logic;
-----------------------------------------------------------------------
begin
	clk <= not clk after period/2;
uut: NAND2
	port map(A=>A, B=>B, Y=>Y);
	A<= not A after 2 ns;
	B<= not B after 4 ns;
------------------------------------------------------------------------
stop: process
begin
	wait for 10 ns;
	assert false
		report "Simulation ended by TK at" & time'image(now)
	severity failure;
------------------------------------------------------------------------
end process;
end tb;
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/XOR2_tb/---------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------------
entity XOR2_tb is
end;
-----------------------------------------------------------------------
architecture tb of XOR2_tb is
	signal clk : std_logic := '0';
	constant period : time := 6 ns;
-----------------------------------------------------------------------
component XOR2
	port(A, B: in std_logic;
	       Y: out std_logic);
end component;
-----------------------------------------------------------------------
	signal A_tb, B_tb: std_logic := '0';
	signal       Y_tb: std_logic;
-----------------------------------------------------------------------
begin
	
uut: XOR2
	port map(A=>A_tb, B=>B_tb, Y=>Y_tb);

	clk <= not clk after period/2;

	A_tb <= not A_tb after 2 ns;
	B_tb <= not B_tb after 4 ns;
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

