library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myHalfAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end myHalfAdder;

architecture Structural of myHalfAdder is

component myAND is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component myXOR is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin
    sum: myXOR port map (A, B, S);
    carry: myAND port map (A, B, C);
    
end Structural;
