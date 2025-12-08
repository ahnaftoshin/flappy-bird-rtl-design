library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myOR3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out STD_LOGIC);
end myOR3;

architecture Behavioral of myOR3 is
begin

    Q <= A or B or C;

end Behavioral;
