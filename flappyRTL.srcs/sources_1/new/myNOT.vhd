library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myNot is
    Port ( A : in  STD_LOGIC;
           Q : out STD_LOGIC);
end myNot;

architecture Behavioral of myNot is
begin

    Q <= not A;

end Behavioral;
