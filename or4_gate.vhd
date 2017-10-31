 library ieee;
  use ieee.std_logic_1164.all;
  
  -- Entity/architecture pair for 
  -- 4-input OR gate with 7 ns
 
  entity or4 is
    port(A, B, C, D : in std_logic;
      Y : out std_logic);
    end or4;
    
    architecture df of or4 is 
    begin 
      Y <= A or B or C or D after 7 ns;
    end;
