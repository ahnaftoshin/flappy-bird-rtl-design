-- This is a combinational logic circuit mapping all inputs and current state
-- to the next state.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_nextstate_logic is
    Port ( B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           N0 : out STD_LOGIC;
           N1 : out STD_LOGIC;
           testport : out std_logic); 
end flappy_nextstate_logic;

architecture Structural of flappy_nextstate_logic is

component myAND is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component myOR is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component myNOT is
    Port ( A : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component myAND3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component myOR3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out STD_LOGIC);
end component;


-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;

    signal ORtoAND1 : std_logic;
    signal ORtoAND2 : std_logic;
    signal ANDtoOR1 : std_logic;
    signal ANDtoOR2 : std_logic;
        
    signal Binv : std_logic;
    signal below_gndinv : std_logic;
    signal S1inv : std_logic;
    signal S0inv : std_logic;
    
    signal N0inv : std_logic;

begin

-- Instances of components
notB: myNOT port map (B, Binv);
notbelow_gnd: myNOT port map (below_gnd, below_gndinv);
notS1inv: myNOT port map (S1, S1inv);
notS0inv: myNOT port map (S0, S0inv);

OR1: myAND port map (S1inv,S0,ORtoAND1);
OR2: myAND3 port map (S0,Binv,below_gndinv,ORtoAND2);
AND3: myOR port map (ORtoAND1,ORtoAND2,N1); 

AND1: myAND port map (S0inv,Binv,ANDtoOR1);
AND2: myAND port map (S1,below_gnd, ANDtoOR2);
OR3: myOR port map (ANDtoOR1,ANDtoOR2,N0inv);  

finalNOT: myNOT port map (N0inv, N0);

-- Single bit test port
testport <= ANDtoOR1;
end Structural;
