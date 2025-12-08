library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myAND is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end myAND;

architecture Behavioral of myAND is

begin

Q <= A and B;
   
end Behavioral;
