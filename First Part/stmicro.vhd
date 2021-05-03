-----------------------------------------------------------
-----------------------------------------------------------
-------------------/AO31/----------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity AO31 is
	generic (delay: time := 51 ps);
	port(A,B,C,D: in std_logic;
	       	   Z: out std_logic);
end entity;

architecture dataFlow of AO31 is
	--signal clk : std_logic := '0';
	
begin

	Z <=(A AND B AND C) OR D after delay;
end dataFlow;
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/BF/----------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity BUF is
	generic (delay: time := 31 ps);
	port(	   A: in std_logic;
	       	   Z: out std_logic);
end entity;

architecture dataFlow of BUF is
	--signal clk : std_logic := '0';
	SIGNAL AA: STD_LOGIC;
	ATTRIBUTE keep: BOOLEAN;
	ATTRIBUTE keep of AA: SIGNAL IS TRUE;
begin
	AA <= NOT A AFTER delay;
	 Z <= NOT AA AFTER delay;
	
end dataFlow;

-----------------------------------------------------------
-----------------------------------------------------------
-------------------/DFPHQN/----------------------------------

 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ---------------------------------------
 ENTITY DFPHQN IS

 PORT ( D, CP, E: IN STD_LOGIC;
	       QN: OUT STD_LOGIC
       );

 CONSTANT delay: time:= 107 ps;

 --CONSTANT rstDelay: time := 258 ps;
 END DFPHQN;
 ---------------------------------------
 ARCHITECTURE behavior OF DFPHQN IS
 BEGIN
 	PROCESS (E,CP)
	VARIABLE IQ: STD_LOGIC:='0';
 	BEGIN
 		IF (E='0')THEN
			
			IQ := IQ;
			
 		ELSIF (CP'EVENT AND CP='1') THEN
			IQ := D;
		
	
			
 		END IF;
		QN <= NOT IQ AFTER delay;
 	END PROCESS;
 END behavior;
 ---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/MUX41/---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX41 IS
	GENERIC (delay: time := 97 ps);
	PORT ( D0, D1, D2, D3: IN STD_LOGIC;
		       S0, S1: IN STD_LOGIC;
		            Z: OUT STD_LOGIC	
		);
END ENTITY;

ARCHITECTURE dataFlow of MUX41 IS
	SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	S <= S0 & S1 AFTER delay;
	WITH S SELECT
		Z <= D0 WHEN "00",
		     D1 WHEN "10",
		     D2 WHEN "01",
		     D3 WHEN "11",
		     '1' WHEN OTHERS;
END dataFlow;
 ---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-------------------/NAND3A/---------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity NAND3A is
	generic (delay: time := 39 ps);
	port(A,B,C: in std_logic;
	       	 Z: out std_logic);
end entity;

architecture dataFlow of NAND3A is
	--signal clk : std_logic := '0';
	
begin

	Z <= NOT (NOT A AND B AND C) after delay;
end dataFlow;
---------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
 
