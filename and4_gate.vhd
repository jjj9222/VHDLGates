library ieee;
use ieee.std_logic_1164.all;

  -- Entity/architecture pair for 
  -- 4-input AND gate with 7 ns

entity and4 is 
  port(A, B, C, D : in std_logic;
    Y : out std_logic);
  end  and4;
  
  architecture df of and4 is 
  begin 
    Y <= A and B and C and D after 7 ns;
  end;
