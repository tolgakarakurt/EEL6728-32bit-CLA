library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity reg_mux_tb4 is
  generic (tp: time := 10 ns);
end entity;

architecture tb of reg_mux_tb4 is
  component reg_mux1 is
    port (a,b,c,d: in std_logic_vector (3 downto 0);
    	      sel: in std_logic_vector(1 downto 0);
    	      clk: in std_logic;
    		x: out std_logic_vector(3 downto 0);
	        y: out std_logic_vector(3 downto 0));
  end component;

  signal a_tb: std_logic_vector (3 downto 0) := "0010";
  signal b_tb: std_logic_vector (3 downto 0) := "0100";
  signal c_tb: std_logic_vector (3 downto 0) := "0110";
  signal d_tb: std_logic_vector (3 downto 0) := "1000";
  signal sel_tb: std_logic_vector (1 downto 0) := "00";
  signal clk_tb: std_logic := '0';
  signal x_tb: std_logic_vector(3 downto 0);
  signal y_tb: std_logic_vector(3 downto 0);
  signal expected: std_logic_vector(3 downto 0) := "0000";
begin
  uut: reg_mux1 port map (a_tb, b_tb, c_tb, d_tb, sel_tb, clk_tb, x_tb, y_tb);
  
  clk_tb <= not clk_tb after 40 ns;
  a_tb <= "0011" after 80 ns, "0000" after 640 ns;
  b_tb <= "0101" after 240 ns;
  c_tb <= "0111" after 400 ns;
  d_tb <= "1001" after 560 ns;
  sel_tb <= "01" after 160 ns, "10" after 320 ns,"11" after 480 ns, "00" after 640 ns;

  expected <= "0010" after tp,
              "0011" after 120 ns + tp,
              "0100" after 200 ns + tp,
              "0101" after 280 ns + tp,
              "0110" after 360 ns + tp,
              "0111" after 440 ns + tp,
              "1000" after 520 ns + tp,
              "1001" after 600 ns + tp,
              "0000" after 680 ns + tp;
process begin
  wait for tp;
  if (now < 800 ns) then
    assert (y_tb = expected)
      report "Mismatch at t=" & time'image(now) & " y_tb=" & integer'image(conv_integer(y_tb)) & " y_exp=" & integer'image(conv_integer(expected)) 
    severity note;
  else
    assert false
      report "No error found (t=" & to_string(now) & ")"
      severity note;
  end if;
end process; 
stop: process
   begin 
     wait for 800 ns;
     assert false
     report "Simulation ended by TK at " & time'image(now)
     severity failure;
end process;
end architecture;



