--1 INPUT INVERTER
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

  -- Entity/architecture pair for 
  -- 1-input Inverter gate with 2 ns
 
entity invert2 is
  port ( signal A : in std_logic;
    signal Y : out std_logic);
    
  end invert2;
  
  architecture df of invert2 is
    begin
    Y <= not A after 2 ns;
end df;

