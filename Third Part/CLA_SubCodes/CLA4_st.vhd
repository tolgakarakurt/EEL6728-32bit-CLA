
library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------------------------------------------
entity CLA4_st is
  port ( A_4b: in std_logic_vector (3 downto 0); 
         B_4b: in std_logic_vector (3 downto 0);
        C0_4b: in std_logic;
         S_4b: out std_logic_vector (3 downto 0); 
	 P_4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	 G_4b: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	C4_4b: OUT STD_LOGIC
        
        );

end CLA4_st;
------------------------------------------------------------------------------------------------------------------------- 
architecture CLA4_structural of CLA4_st is

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
SIGNAL C1_4b,C2_4b,C3_4b: STD_LOGIC;
SIGNAL C123_4b: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL C_4b: STD_LOGIC_VECTOR (3 DOWNTO 0);
-------------------------------------------------------------------------------------------------------------------------
BEGIN


------------------------------------------------------------------------------------------------------------------------
  PFA0: PFA 		port map( A_4b(0), B_4b(0), C0_4b, S_4b(0), P_4b(0), G_4b(0));
  CC0 : CarryChain      PORT MAP(P_4b(0), G_4b(0), C0_4b, C123_4b(0)); --C123_4b(0) = C1_4b

inst: FOR i IN 1 TO 3 GENERATE

  PFAi: PFA 		port map( A_4b(i), B_4b(i), C123_4b(i-1), S_4b(i), P_4b(i), G_4b(i));
  CCi : CarryChain      PORT MAP(P_4b(i), G_4b(i), C123_4b(i-1), C123_4b(i));

END GENERATE inst;

C1_4b <= C123_4b(0);
C2_4b <= C123_4b(1);
C3_4b <= C123_4b(2);
C4_4b <= C123_4b(3);

end CLA4_structural;
