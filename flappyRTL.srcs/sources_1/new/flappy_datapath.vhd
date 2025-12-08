
-- Component to implement all necessary mathematical and multi-bit operations 
-- for the flappy game simulator project. 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_datapath is
  Port (clk:  in std_logic; 
        ld_YPos: in std_logic; -- Updates YPosReg when 1 
        ld_YVel: in std_logic; -- Updates YVelReg when 1
        sel_PosReset: in std_logic; -- Select bit: 1 means reset YPos to 10
        sel_VelJump: in std_logic; -- Select bit: 1 means set YVel to 3       
        below_gnd: out std_logic; -- Character is below ground (YPos < ground_level)
        ground_level: in std_logic_vector (5 downto 0);
        YPos: inout std_logic_vector (5 downto 0);
        testport: out std_logic_vector (5 downto 0));    
end flappy_datapath;

architecture structural of flappy_datapath is
-- Components we need (add below):

component my6bitAdder is
    Port (
        A   : in  STD_LOGIC_VECTOR(5 downto 0); 
        B   : in  STD_LOGIC_VECTOR(5 downto 0); 
        Cin : in  STD_LOGIC; 
        S   : out STD_LOGIC_VECTOR(5 downto 0);
        C   : out STD_LOGIC
    );
end component;

component my6bitLessThan is
    Port (
        A  : in  STD_LOGIC_VECTOR(5 downto 0);
        B  : in  STD_LOGIC_VECTOR(5 downto 0);
        EQ : out STD_LOGIC
    );
end component;

component my6bitMUX is
    Port (
        A : in  STD_LOGIC_VECTOR (5 downto 0);  
        B : in  STD_LOGIC_VECTOR (5 downto 0);  
        S : in  STD_LOGIC;                      
        Y : out STD_LOGIC_VECTOR (5 downto 0)
    );
end component;

component my6bitReg is
    Port (
        D   : in  STD_LOGIC_VECTOR (5 downto 0);
        LD  : in  STD_LOGIC;
        CLR : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (5 downto 0)
    );
end component;
-- hardcoded signals we need (add others as needed):
signal gnd: std_logic := '0'; -- to hardcode inputs to 0
signal tmp: std_logic; -- to be tied to unused outputs.

-- Additional signals for internal nets
signal YVel: std_logic_vector (5 downto 0); -- signal to use as output of velocity register
-- Add other signals for interal nets as needed

signal net1 : STD_LOGIC_VECTOR(5 downto 0);
signal net2 : STD_LOGIC_VECTOR(5 downto 0);
signal net3 : STD_LOGIC_VECTOR(5 downto 0);
signal net4 : STD_LOGIC_VECTOR(5 downto 0);
signal net5 : STD_LOGIC_VECTOR(5 downto 0);
signal net6 : STD_LOGIC_VECTOR(5 downto 0);
signal net7 : std_logic;
  
           
begin
-- Add instances of components here

YPosReg: my6bitReg port map (net4, ld_YPos, gnd, clk, net1 );
YVelReg: my6bitReg port map (net6, ld_YVel, gnd, clk, net2);
addPosVel: my6bitAdder port map (net1, net2, gnd, net3, gnd);
decrementVel: my6bitAdder port map (net2, "111111", gnd, net5, gnd);
GL_comp: my6bitLessThan port map (net3, ground_level, below_gnd);
PosResetMUX: my6bitMUX port map(net3,"001010",sel_PosReset,net4);
VelJumpMUX: my6bitMUX port map(net5, "000011", sel_VelJump, net6);

-- The testport can be used for evaluating internal nets.
--    Test a bus
testport <= YVel; -- default . . . output velocity value.

--   Test individual bits 
--   testport(0) <= gnd;

end structural;