library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6bitMUX is
    Port (
        A : in  STD_LOGIC_VECTOR (5 downto 0);  
        B : in  STD_LOGIC_VECTOR (5 downto 0);  
        S : in  STD_LOGIC;                      
        Y : out STD_LOGIC_VECTOR (5 downto 0)
    );
end my6bitMUX;

architecture Behavioral of my6bitMUX is
begin
    Y <= A when S = '0' else
         B;
end Behavioral;

