-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFFN/---------------------------------

 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ---------------------------------------
 ENTITY DFFN IS

 PORT ( D, CK: IN STD_LOGIC;
 	    Q: OUT STD_LOGIC;
	   QN: OUT STD_LOGIC
       );

 CONSTANT delay: time:= 221 ps;
 CONSTANT invDelay: time := 76 ps;

 END DFFN;
 ---------------------------------------
 ARCHITECTURE behavior OF DFFN IS
 BEGIN
 	PROCESS (CK)
	BEGIN		
 		IF (CK'EVENT AND CK='0') THEN
			Q <= D after delay;
			
 		END IF;
 	END PROCESS;
	QN <= NOT Q AFTER invDelay;
 END behavior;
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFFR/---------------------------------
 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ---------------------------------------
 ENTITY DFFR IS

 PORT ( D, CK, RN: IN STD_LOGIC;
 		Q: OUT STD_LOGIC;
	       QN: OUT STD_LOGIC
       );

 CONSTANT delay: time:= 368 ps;
 CONSTANT invDelay: time := 111 ps;
 CONSTANT rstDelay: time := 258 ps;
 END DFFR;
 ---------------------------------------
 ARCHITECTURE behavior OF DFFR IS
 BEGIN
 	PROCESS (RN, CK)
 	BEGIN
 		IF (RN='0') THEN
			Q <= '0' AFTER rstDelay;
			
 		ELSIF (CK'EVENT AND CK='1') THEN
			Q <= D after delay;
			
 		END IF;
 	END PROCESS;
	QN <= NOT Q AFTER invDelay;
 END behavior;
 ---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/NOR2/---------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity NOR2 is
	generic (delay: time := 34 ps);
	port(A,B: in std_logic;
	       Y: out std_logic);
end entity;

architecture dataFlow of NOR2 is
	--signal clk : std_logic := '0';
	constant period : time := 10 ns;
begin
	y <= A NOR B after delay;
end dataFlow;
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/NAND2/----------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity NAND2 is
	generic (delay: time := 29 ps);
	port(A,B: in std_logic;
	       Y: out std_logic);
end entity;

architecture dataFlow of NAND2 is
	--signal clk : std_logic := '0';
	constant period : time := 10 ns;
begin
	y <= not (A and B) after delay;
end dataFlow;
--------------------------------------------------------
--------------------------------------------------------
-----------------------------------------------------------
-------------------/XOR2/----------------------------------

 LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity XOR2 is
--	generic (delay: time := 135 ps);
	port(A,B: in std_logic;
	       Y: out std_logic);
end entity;

architecture dataFlow of XOR2 is
--	signal clk : std_logic := '0';
--	constant period : time := 10 ns;
begin
	y <= A XOR B after delay;
end dataFlow;

--------------------------------------------------------
--------------------------------------------------------
-----------------------------------------------------------
