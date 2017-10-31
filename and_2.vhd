--2 INPUT AND GATE
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

entity and2 is 
  port(A, B: in std_logic;
    Y : out std_logic);
  end  and2;
  
  architecture df of and2 is 
  begin 
    Y <= A and B after 4 ns;
  end;