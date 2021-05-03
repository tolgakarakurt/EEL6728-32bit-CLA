LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity XOR2 is
	--generic (delay: time := 135 ps);
	port(A,B: in std_logic;
	       Y: out std_logic);
end entity;

architecture dataFlow of XOR2 is
	signal clk : std_logic := '0';
	constant period : time := 10 ns;
begin
	y <= A XOR B; --after delay;
end dataFlow;
