--SHIFT REGISTER
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

entity sreg is 
  port( clear, clk, A, B, C, D, sl, sr: in std_logic;
    s1,s0 : in std_logic;
    QA,QB,QC, QD : out std_logic);
  end sreg;
  
  architecture behv of sreg is
    signal QAo, QBo, QCo, QDo: std_logic;

    begin 
  
      sreg_pro : process(clear, clk, A, B, C, D, sl, sr, s1,s0) is begin
      case std_logic(clear) is
        
    when '1'  => 
      if(clk'event and clk = '1') then
      if s1 = '1' and s0 = '1' then 
       QA <= A after 22 ns; QB <= B after 22 ns; QC <= C  after 22 ns; QD <= D after 22 ns;
       QAo <= A; QBo <= B; QCo <= C; QDo <= D;
       
      elsif s1 = '0' and s0 = '1' then 
       QA <= sr after 22 ns; QB <= QAo after 22 ns; QC <= QBo after 22 ns; QD <= QCo after 22 ns;
       QAo <= sr; QBo <= QAo; QCo <= QBo; QDo <= QCo;
       
      elsif s1 = '1' and s0 = '0' then 
       QA <= QBo after 22 ns; QB <= QCo after 22 ns; QC <= QDo after 22 ns; QD <= sl after 22 ns;
       QAo <= QBo; QBo <= QCo; QCo <= QDo; QDo <= sl;
       
     else
       QA <= QBo after 22 ns; QB <= QCo after 22 ns; QC <= QDo after 22 ns; QD <= QDo after 22 ns;
      
    end if;
  end if;
    when others => QA <= '0'; QB <= '0'; QC <= '0'; QD <= '0';QAo <= '0'; QBo <= '0'; QCo <= '0'; QDo <= '0';

    end case;
    end process;
  end behv;
    
    
      