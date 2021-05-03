library ieee;
use ieee.std_logic_1164.all;

entity reg_mux1 is
  port(  a, b, c, d: in std_logic_vector(3 downto 0);
        	sel: in std_logic_vector(1 downto 0);
        	clk: in std_logic;
          	  x: out std_logic_vector(3 downto 0);
	  	  y: out std_logic_vector(3 downto 0)
      );

 CONSTANT delay: time:= 180 ps; --this value is selected hypotetically!
 CONSTANT invDelay: time := 70 ps; --this value is selected hypotetically!
end entity reg_mux1;

architecture dataFlow_reg_mux1 of reg_mux1 is
  signal mux: std_logic_vector (3 downto 0);
begin
    mux <= a when sel="00" else
           b when sel="01" else
           c when sel="10" else
           d;
    x <= mux after delay;
    process(clk)
    begin
      if (clk 'event and clk = '1') then
         y <= mux after invDelay;
      end if;
    end process;
end architecture dataFlow_reg_mux1;
  


