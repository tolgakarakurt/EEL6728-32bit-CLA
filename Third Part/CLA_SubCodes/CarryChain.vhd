-------------------------------------------------------------------------------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------------------------------------------
ENTITY CarryChain IS 
	PORT(  
		Pi: IN STD_LOGIC;
		Gi: IN STD_LOGIC;
		Cin : IN STD_LOGIC; 
		Co:OUT STD_LOGIC
		);
END ENTITY;
--------------//4-BIT Carry Lookahead Chain Block//---(Optimized with NAND Gates)----*FOR-GENERATE STATEMENT*-------------

ARCHITECTURE structural OF CarryChain IS

	COMPONENT NAND2 IS 
 		PORT( A, B: IN STD_LOGIC;
           	  	 Y: OUT STD_LOGIC);
       	END COMPONENT;
	
SIGNAL m: STD_LOGIC;	
BEGIN 

	NAND2_1: NAND2 PORT MAP(Pi, Cin, m);
	NAND2_2: NAND2 PORT MAP(NOT Gi, m, Co);
	
END ARCHITECTURE;






