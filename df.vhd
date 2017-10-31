library ieee;                                                                                                                                                                                                                                                                                                                                                                                                                         library ieee;
use ieee.std_logic_1164.all;

--Creates an entity for the double mux 
--this is used in the dataflow, behaveverior, and structual
entity dual4_1Mux is
	port( G1, G2, A, B : in std_logic;
	C1, C2 : in std_logic_vector(3 downto 0);
	Y1, Y2 : out std_logic);

end dual4_1Mux;


-- architecture df (dataflow)
architecture df of dual4_1Mux is
-- declare internal control signals for each of the multiplexers
signal sControl1, sControl2 : std_logic_vector(2 downto 0);


begin
	--model of the first multiplexer
	
	sControl1 <= G1&B&A;
	sControl2 <= G2&B&A;
	
	with sControl1 select
	
	   --Y1 will get the value of C1(x) depending on the certain case
	   Y1 <= C1(0) when "000",
	   C1(2) when "001",
	   C1(1) when "010",
	   C1(3) when "011",
	   '0' when others;
                                                                                                                                                                         

  with sControl2 select
		--Y2 will get the value of C2(x) depending on the certain case
	   Y2 <= C2(0) when "000",
	   C2(2) when "001",
	   C2(1) when "010",
	   C2(3) when "011",
	   '0' when others;
	   
end architecture df;

--behaveverior for the dual mux
architecture behv of dual4_1Mux is
  signal p1, p2 : std_logic_vector(2 downto 0);
  
begin 
  
  p1 <= G1&B&A;
  --process started for behaveverior
  Mux1 : process(p1, C1) is begin
  case p1 is
    when "000" => Y1 <= C1(0) after 22 ns;
    when "001" => Y1 <= C1(2) after 22 ns;
    when "010" => Y1 <= C1(1) after 22 ns;
    when "011" => Y1 <= C1(3) after 22 ns;
  when others => Y1 <= '0' after 22 ns;
end case;
end process Mux1;

p2 <= G2&B&A; 

Mux2 : process(p2, C2) is begin
case p2 is
    when "000" => Y2 <= C2(0) after 22 ns;
    when "001" => Y2 <= C2(2) after 22 ns;
    when "010" => Y2 <= C2(1) after 22 ns;
    when "011" => Y2 <= C2(3) after 22 ns;
  when others => Y2 <= '0' after 22 ns;
end case;
end process Mux2;
end behv;


--Structual for the dual mux
architecture struct of dual4_1Mux is
  component Mux is
    Port (G, A, B : in std_logic;
    C : in std_logic_vector(3 downto 0);
    Y : out std_logic);
  end component;
  
  for Mux1 : Mux use entity work.Mux4to1(Struct);
  for Mux2 : Mux use entity work.Mux4to1(Struct); 
  
  begin 
    Mux1 : Mux
      port map(G => G1, A => A, B => B, C => C1, Y => Y1);
        
    Mux2 : Mux
      port map(G => G2, A => A, B => B, C => C2, Y => Y2);
        
end struct;






















  