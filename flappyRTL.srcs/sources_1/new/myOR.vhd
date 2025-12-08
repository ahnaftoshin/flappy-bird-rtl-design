library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myOR is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end myOR;

architecture Behavioral of myOR is

begin

Q <= A or B;
   
end Behavioral;
