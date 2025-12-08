library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myAdder is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        Cin : in  STD_LOGIC;
        S   : out STD_LOGIC;
        C   : out STD_LOGIC
    );
end myAdder;

architecture Structural of myAdder is
    -- To make a full adder, 2 half adders and an OR gate are needed

    component myHalfAdder is
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC
        );
    end component;

    component myOR is
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    signal net1 : std_logic;
    signal net2 : std_logic;
    signal net3 : std_logic;

begin
    addhalf1 : myHalfAdder port map (A, B, net1, net2);
    sum      : myHalfAdder port map (Cin, net1, S, net3);
    carry    : myOR        port map (net2, net3, C);
end Structural;

