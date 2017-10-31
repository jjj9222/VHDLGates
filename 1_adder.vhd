--1 bit ADDER
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

entity one_bit_adder is
  port(a, b, cin : in std_logic;
    sum, carry : out std_logic);
  end one_bit_adder;
  
  architecture behv of one_bit_adder is 
  
  begin 
    sum_pro : process(a,b,cin) is begin 
      case std_logic_vector'(a&b&cin) is 
      when "100" | "010" | "111" | "001" => sum <= '1' after 8 ns;
      when others => sum <= '0' after 8 ns;
      end case;
    end process;
    carry_pro : process(a,b,cin) is begin
    case std_logic_vector'(a&b&cin) is
    when "000" | "010" | "100" | "001" => carry <= '0' after 8 ns;
    when others => carry <= '1' after 8 ns;
    end case;
  end process;
  end behv;
  
