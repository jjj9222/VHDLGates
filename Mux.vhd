
--Creation of a single mux
--used for the structual in dual mux
library ieee;
use ieee.std_logic_1164.all;

entity Mux4to1 is
  Port (G, A, B : in std_logic;
    C : in std_logic_vector(3 downto 0);
    Y : out std_logic);
  end Mux4to1;
  
  --the structual for the mux
  architecture struct of Mux4to1 is
  
  --making component for the 4 input and gate
  component and4_gate is 
    port(A, B, C, D : in std_logic;
      Y : out std_logic);
    end component;
  
  --component for the 4 input or gate
  component or4_gate is 
    port(A, B, C, D : in std_logic;
    Y : out std_logic);
    end component;
   
--component for the inverter   
  component invert1 is
     port ( signal A : in std_logic;
    signal Y : out std_logic);
    end component;
    
  signal tA, tB, tC, tD: std_logic;
      signal nA, nB, nG : std_logic;
    
	--declaring the variables for the use of the components
    for invert10 : invert1 use entity work.invert2(df);
    for invert11 : invert1 use entity work.invert2(df);
    for invert12 : invert1 use entity work.invert2(df);
    
    for and4_gate0 : and4_gate use entity work.and4(df);
    for and4_gate1 : and4_gate use entity work.and4(df);
    for and4_gate2 : and4_gate use entity work.and4(df);
    for and4_gate3 : and4_gate use entity work.and4(df);
    
    for or4_gate0 : or4_gate use entity work.or4(df);
    
    begin 
      
      --Porting all of the variables
      invert10 : invert1
        port map(A => A, Y => nA);
      
      invert11 : invert1
        port map(A => B, Y => nB);
          
      invert12 : invert1
      port map(A => G, Y => nG);
      
      and4_gate0 : and4_gate
        port map(A => nA, B => nB, C => C(0), D => nG, Y => tA);
      
      and4_gate1 : and4_gate
        port map(A => A, B => nB, C => C(2), D => nG, Y => tB);
          
      and4_gate2 : and4_gate
        port map(A => nA, B => B, C => C(1), D => nG, Y => tC);

      and4_gate3 : and4_gate
        port map(A => A, B => B, C => C(3), D => nG, Y => tD);
          
      or4_gate0 : or4_gate
        port map(A => tA, B => tB, C => tC, D => tD, Y => Y);
          
  end struct;