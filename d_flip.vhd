--D FLIP_FLOP
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

entity d_flip is
  port(d, clk, en, rst :in std_logic;
    q :out std_logic);
  end d_flip;
  
  architecture behv of d_flip is
    begin
    d_flop_pro : process(d, clk, en,rst) is begin
      if (clk'event and clk = '1') then 
        if rst = '0' then 
          q <= '0';
        elsif en = '1' then
          q <= d after 6 ns;
      end if;
    end if;
    
    end process;
  end behv;
  
  
        
