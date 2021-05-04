library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------------------------------------------
entity CLA16_st is
  port (A_16b: in std_logic_vector (15 downto 0);
        B_16b: in std_logic_vector (15 downto 0);
        C0_16b: in std_logic;
        S_16b: out std_logic_vector (15 downto 0);
	P_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
	G_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        C16_16b: out STD_LOGIC
        );
end CLA16_st;
------------------------------------------------------------------------------------------------------------------------- 
architecture CLA16_structural of CLA16_st is


component PFA
  	port (  A: in std_logic;
         	B: in std_logic;
         	Cin: in std_logic;
         	S: out std_logic;
         	P: out std_logic;
         	G: out std_logic
       		);
end component;

COMPONENT CarryChain
	PORT (
		Pi  : IN STD_LOGIC;
		Gi  : IN STD_LOGIC;
		Cin : IN STD_LOGIC; 
		Co  :OUT STD_LOGIC
		);
END COMPONENT;

-------------------------------------------------------------------------------------------------------------------------
SIGNAL C1_16b,C2_16b,C3_16b,C4_16b,C8_16b,C12_16b,C15_16b: STD_LOGIC;
SIGNAL C123_16b: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
-------------------------------------------------------------------------------------------------------------------------
--PROCESS (G_16b,P_16b,C0_16b,C123_16b)
--    BEGIN
--    C123_16b(1) <= G_16b(0) OR (P_16b(0) AND C0_16b);    --C123_16b(1)=C1_16b
--        inst: FOR i IN 1 TO 14 LOOP
--              C123_16b(i+1) <= G_16b(i) OR (P_16b(i) AND C123_16b(i));  --C123_16b(2)=C2_16b; C123_16b(3)=C3_16b;
--              END LOOP;
--	C16_16b <= G_16b(15) OR (P_16b(15) AND C123_16b(15));    --C123_16b(15)=C4_16b;
----C0_16b has already been declared
-------------------------------------------------------------------------------------------------------------------------
  PFA0: PFA 		port map( A_16b(0), B_16b(0), C0_16b, S_16b(0), P_16b(0), G_16b(0));
  CC0 : CarryChain      PORT MAP(P_16b(0), G_16b(0), C0_16b, C123_16b(0)); --C123_4b(0) = C1_4b

inst: FOR i IN 1 TO 15 GENERATE

  PFAi: PFA 		port map( A_16b(i), B_16b(i), C123_16b(i-1), S_16b(i), P_16b(i), G_16b(i));
  CCi : CarryChain      PORT MAP(P_16b(i), G_16b(i), C123_16b(i-1), C123_16b(i));

END GENERATE inst;
-------------------------------------------------------------------------------------------------------------------------

C4_16b <= C123_16b(4);
---
C8_16b <= C123_16b(8);
---
C12_16b <= C123_16b(12);
---
C16_16b <= C123_16b(15);

 --   END PROCESS;
------------------------------------------------------------------------------------------------

--CLA_1: CLA4 port map( A_16b(3 downto 0), B_16b(3 downto 0), C0_16b, S_16b(3 downto 0), P_16b(3 downto 0), G_16b(3 downto 0), C4_16b );
--CLA_2: CLA4 port map( A_16b(7 downto 4), B_16b(7 downto 4), C4_16b, S_16b(7 downto 4), P_16b(7 downto 4), G_16b(7 downto 4), C8_16b);
--CLA_3: CLA4 port map( A_16b(11 downto 8), B_16b(11 downto 8), C8_16b, S_16b(11 downto 8), P_16b(11 downto 8), G_16b(11 downto 8), C12_16b);
--CLA_4: CLA4 port map( A_16b(15 downto 12), B_16b(15 downto 12), C12_16b, S_16b(15 downto 12), P_16b(15 downto 12), G_16b(15 downto 12), C16_16b);

---------------------------------------------------------------------------------------------------------
end CLA16_structural;
