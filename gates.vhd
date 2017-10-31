library ieee;
use ieee.std_logic_1164.all;

entity xor3 is
  port( A, B, C : in std_logic;
    Y : out std_logic);
  end xor3;
  
  architecture df of xor3 is
    begin
      -- this model needs to account for 4 ns propagation deley
      
      Y <= A xor B xor C after 4 ns;
    end;
    -------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity and4 is 
  port(A, B, C, D : in std_logic;
    Y : out std_logic);
  end  and4;
  
  architecture df of and4 is 
  begin 
    Y <= A and B and C and D after 7 ns;
  end;
  -------------------------------
  library ieee;
  use ieee.std_logic_1164.all;
  
  -- Entity/architecture pair for 
  -- 3-input OR gate with 3 ns
  -- propogation delay shoould be here
  entity or4 is
    port(A, B, C, D : in std_logic;
      Y : out std_logic);
    end or4;
    
    architecture df of or4 is 
    begin 
      Y <= A or B or C or D after 7 ns;
    end;
    
    