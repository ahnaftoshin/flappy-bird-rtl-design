library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dflipflop is
     Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LD : in std_logic ;
           CLR : in std_logic;           
           Q : inout STD_LOGIC := '0');
end dflipflop;

architecture structural of dflipflop is

begin

process(CLK) begin

    if rising_edge(CLK) then
        if CLR = '1' then
            Q <= '0';
        elsif LD = '1' then
            Q <= D;        
        end if;        
    end if;

end process;


end structural;
