library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6bitAdder is
    Port (
        A   : in  STD_LOGIC_VECTOR(5 downto 0); 
        B   : in  STD_LOGIC_VECTOR(5 downto 0); 
        Cin : in  STD_LOGIC; 
        S   : out STD_LOGIC_VECTOR(5 downto 0);
        C   : out STD_LOGIC
    );
end my6bitAdder;

architecture Structural of my6bitAdder is
    component myAdder is
        Port (
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            Cin : in  STD_LOGIC;
            S   : out STD_LOGIC;
            C   : out STD_LOGIC
        );
    end component;
    
signal carry : STD_LOGIC_VECTOR(5 downto 0);

begin
    bit0: myAdder port map (A(0), B(0), Cin, S(0), carry(0));
    bit1: myAdder port map (A(1), B(1), carry(0), S(1), carry(1));
    bit2: myAdder port map (A(2), B(2), carry(1), S(2), carry(2));
    bit3: myAdder port map (A(3), B(3), carry(2), S(3), carry(3));
    bit4: myAdder port map (A(4), B(4), carry(3), S(4), carry(4));
    bit5: myAdder port map (A(5), B(5), carry(4), S(5), carry(5));
    C <= carry(5);

end Structural;

