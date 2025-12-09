
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity lessthan_6bit is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           E : out STD_LOGIC);
end lessthan_6bit;


architecture Behavioral of lessthan_6bit is



begin

E <= '1' when signed(A) < signed(B) 
    else '0';

end Behavioral;
