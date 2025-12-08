
-- Flappy controller consisting of:
--   1) Next state logic 
--   2) State registers (flip flops)
--   3) Output logic

-- This file should NOT need to be modified by students.  Rather they should update the 
-- next state and output modules referenced here.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_controller is
    Port ( CLK : in STD_LOGIC;
           B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           ld_YPos : out STD_LOGIC;
           ld_YVel : out STD_LOGIC;
           sel_PosReset: out std_logic;
           sel_VelJump: out std_logic;  
           testport : out std_logic_vector (5 downto 0));
end flappy_controller;

architecture Structural of flappy_controller is

component flappy_output_logic is
    Port ( S0: in std_logic;
           S1: in std_logic;
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           ld_YPos : out STD_LOGIC;
           ld_YVel : out STD_LOGIC;
           sel_PosReset: out std_logic;
           sel_VelJump: out std_logic;  
           testport : out std_logic);
end component;

component flappy_nextstate_logic is
    Port ( B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           N0 : out STD_LOGIC;
           N1 : out STD_LOGIC;
           testport : out std_logic); 
end component;

component dflipflop is
     Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LD : in std_logic ;
           CLR : in std_logic; 
           Q : inout STD_LOGIC := '0');
end component;

signal S0, S1, N0, N1: std_logic;
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';
signal next_test, output_test : std_logic;

begin

-- State Registers
statereg0: dflipflop port map (N0, CLK, vdd, gnd, S0);
statereg1: dflipflop port map (N1, CLK, vdd, gnd, S1);

--Next State Logic
nextstate: flappy_nextstate_logic port map (B, below_gnd, S0, S1, N0, N1, next_test);

--Output Logic
output: flappy_output_logic port map ( S0, S1, J, F, D, ld_YPos, ld_YVel, sel_PosReset, sel_VelJump, output_test);

--testport debug (modify as needed)
testport(5) <= S0;
testport(4) <= S1;
testport(3) <= N0;
testport(2) <= N1;



end Structural;
