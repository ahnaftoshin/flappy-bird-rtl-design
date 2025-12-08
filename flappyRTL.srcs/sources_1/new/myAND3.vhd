library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myAND3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out STD_LOGIC);
end myAND3;

architecture Behavioral of myAND3 is
begin

    Q <= A and B and C;

end Behavioral;
