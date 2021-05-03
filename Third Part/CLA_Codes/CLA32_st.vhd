--//32-bit CLA Structural Design//-------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity CLA32_st is
  port (A_32b: in std_logic_vector (31 downto 0);
        B_32b: in std_logic_vector (31 downto 0);
        C0_32b: in std_logic;
        S_32b: out std_logic_vector (31 downto 0);
	P_32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	G_32b: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        C32_32b: out STD_LOGIC
        );
end CLA32_st;

architecture CLA32_structural of CLA32_st is
component CLA16_st
  port (A_16b: in std_logic_vector (15 downto 0);
        B_16b: in std_logic_vector (15 downto 0);
        C0_16b: in std_logic; --Cin
	S_16b: out std_logic_vector (15 downto 0);
	P_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
	G_16b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        C16_16b: out std_logic  --Cout
        );
end component;

SIGNAL C16_32b: STD_LOGIC;
BEGIN
 CLA_1: CLA16_st port map( A_32b(15 downto 0), B_32b(15 downto 0), C0_32b, S_32b(15 downto 0), P_32b(15 downto 0), G_32b(15 downto 0), C16_32b );
 CLA_2: CLA16_st port map( A_32b(31 downto 16), B_32b(31 downto 16), C16_32b, S_32b(31 downto 16), P_32b(31 downto 16), G_32b(31 downto 16), C32_32b);
end CLA32_structural;

