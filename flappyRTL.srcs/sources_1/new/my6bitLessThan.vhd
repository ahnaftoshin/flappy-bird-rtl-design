library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6bitLessThan is
    Port (
        A  : in  STD_LOGIC_VECTOR(5 downto 0);
        B  : in  STD_LOGIC_VECTOR(5 downto 0);
        EQ : out STD_LOGIC
    );
end my6bitLessThan;

architecture Behavioral of my6bitLessThan is
begin
    EQ <= '1' when A <  B 
    else '0';
end Behavioral;
