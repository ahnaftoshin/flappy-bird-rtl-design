library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myXOR is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end myXOR;

architecture Behavioral of myXOR is

begin

Q <= A xor B;
   
end Behavioral;
