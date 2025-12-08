library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6bitReg is
    Port (
        D   : in  STD_LOGIC_VECTOR (5 downto 0);
        LD  : in  STD_LOGIC;
        CLR : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (5 downto 0)
    );
end my6bitReg;

architecture Behavioral of my6bitReg is
begin
    process (CLK) begin
        if CLR = '1' then
            Q <= "000000";
        elsif rising_edge(CLK) then
            if LD = '1' then
                Q <= D;
            end if;
        end if;
        
    end process;
    
end Behavioral;
