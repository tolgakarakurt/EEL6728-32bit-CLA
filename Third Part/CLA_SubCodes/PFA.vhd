---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

-----------------------------------------
ENTITY PFA IS 
	PORT(   A   : IN STD_LOGIC;
	  	B   : IN STD_LOGIC;
		Cin : IN STD_LOGIC; --C0=Cin for  1 bit PFA
		S   : OUT STD_LOGIC;
		P   : OUT STD_LOGIC;
		G   : OUT STD_LOGIC
		);
END ENTITY;

ARCHITECTURE structural OF PFA IS
	COMPONENT AND2 IS 
 		PORT( A, B: IN STD_LOGIC;
           	  	 Y: OUT STD_LOGIC);
       	END COMPONENT;
	
	COMPONENT XOR2 IS
		PORT( A, B: IN STD_LOGIC;
	       		 Y: OUT STD_LOGIC);
	END COMPONENT;

BEGIN 
	XOR2_1: XOR2 PORT MAP(A, B, P);
	XOR2_2: XOR2 PORT MAP(P, Cin, S);
	AND2_1: AND2 PORT MAP(A, B, G);

END ARCHITECTURE;






