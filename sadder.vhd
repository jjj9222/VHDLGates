--SER_ADDER 
--JORDAN JOCK

library ieee;
use ieee.std_logic_1164.all;

entity ser_adder is
  Port(in_a, in_b : in std_logic_vector(3 downto 0);
    control : in std_logic_vector(1 downto 0);
    clk, clear_dp :in std_logic;
    sum : out std_logic_vector(3 downto 0);
    carry : out std_logic);
  end ser_adder;
  
  
architecture struct of ser_adder is
  
  --first declaring all of the components
  
  component one_bit_adder is
    Port(a, b, cin : in std_logic;
    sum, carry : out std_logic);
  end component;
  
  component d_flip is
    port(d, clk, en, rst :in std_logic;
    q :out std_logic);
  end component;
  
  component and_2 is 
     port(A, B: in std_logic;
    Y : out std_logic);
  end component;
  
  component invert is
    port ( signal A : in std_logic;
    signal Y : out std_logic);
  end component;
  
  component reg is
    port( clear, clk, A, B, C, D, sl, sr: in std_logic;
    s1,s0 : in std_logic;
    QA,QB,QC, QD : out std_logic);
  end component;
  
  
  
  for one_bit_adder0 : one_bit_adder use entity work.one_bit_adder(behv);
  for d_flip0 : d_flip use entity work.d_flip(behv);
  for and_20 : and_2 use entity work.and2(df);
  for invert0 : invert use entity work.invert2(df);
  for regA : reg use entity work.sreg(behv);
  for regB : reg use entity work.sreg(behv);
  
  --internal signals
  signal nb : std_logic;
  signal y : std_logic;
  signal x : std_logic;
  signal sumA : std_logic;
  signal addA : std_logic;
  signal addB : std_logic;
  signal cout : std_logic;
  signal temp_sum : std_logic_vector(3 downto 0);
  signal Q1, Q2, Q3 : std_logic;
  
  begin 
    --component instantiation

    
    invert0 : invert
    port map(A => control(1), Y => nb);
    
    and_20 : and_2
    port map(A => control(0), B => nb, Y => y);
   
    d_flip0 : d_flip
    port map(d => cout, clk => clk, en => y, rst => clear_dp, q => x); 
    
    one_bit_adder0 : one_bit_adder
    port map(a => temp_sum(0), b => addB, cin => x , sum => sumA, carry => cout); 
      
    regA : reg 
    port map(clear => clear_dp, clk => clk, A => in_a(3), B => in_a(2), C => in_a(1), D => in_a(0), sl => '0', sr => sumA, s1 => control(1), s0 => control(0), QA => temp_sum(3), QB => temp_sum(2), QC => temp_sum(1), QD => temp_sum(0));
      
    regB : reg 
    port map(clear => clear_dp, clk => clk, A => in_b(3), B => in_b(2), C => in_b(1), D => in_b(0), sl => '0',sr => '0', s1 => control(1), s0 => control(0), QA => open, QB => open, QC => open, QD => addB);  
  
  sum(0) <= temp_sum(0);
  sum(1) <= temp_sum(1);
  sum(2) <= temp_sum(2);
  sum(3) <= temp_sum(3);
  carry <= x;
  

  
end struct;