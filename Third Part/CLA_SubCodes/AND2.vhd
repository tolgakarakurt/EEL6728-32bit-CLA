 ---------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ---------------------------------------
 ENTITY AND2 IS
	--GENERIC(delay: time :=111 ps);
 PORT ( A, B: IN STD_LOGIC;
           Y: OUT STD_LOGIC
       );

 END AND2;
 ---------------------------------------
 ARCHITECTURE behavior OF AND2 IS
 BEGIN
	Y <= A AND B; --AFTER delay;
 END behavior;
 ---------------------------------------
