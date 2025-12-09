-- Component to implement all necessary mathematical and multi-bit operations 
-- for the flappy game simulator project. 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_datapath is
  Port (clk:  in std_logic; 
        ld_YPos: in std_logic;          
        ld_YVel: in std_logic;          
        sel_PosReset: in std_logic;     
        sel_VelJump: in std_logic;      
        below_gnd: out std_logic;     
        ground_level: in std_logic_vector (5 downto 0);
        YPos: inout std_logic_vector (5 downto 0);
        testport: out std_logic_vector (5 downto 0));    
end flappy_datapath;

architecture structural of flappy_datapath is

component my6bitAdder is
    Port (
        A   : in  STD_LOGIC_VECTOR(5 downto 0); 
        B   : in  STD_LOGIC_VECTOR(5 downto 0); 
        Cin : in  STD_LOGIC; 
        S   : out STD_LOGIC_VECTOR(5 downto 0);
        C   : out STD_LOGIC
    );
end component;

component lessthan_6bit is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           E : out STD_LOGIC);
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



signal gnd : std_logic := '0';
signal tmp : std_logic;

signal net1 : STD_LOGIC_VECTOR(5 downto 0);   
signal net2 : STD_LOGIC_VECTOR(5 downto 0);   
signal net3 : STD_LOGIC_VECTOR(5 downto 0);   
signal net4 : STD_LOGIC_VECTOR(5 downto 0);  
signal net5 : STD_LOGIC_VECTOR(5 downto 0); 
signal net6 : STD_LOGIC_VECTOR(5 downto 0);  
signal net7 : std_logic;


begin

YPosReg: my6bitReg port map (D => net4, LD => ld_YPos, CLR => gnd, CLK => clk, Q => net1);

YVelReg: my6bitReg port map (D => net6, LD => ld_YVel, CLR => gnd, CLK => clk, Q => net2);


addPosVel: my6bitAdder  port map (A => net1, B => net2, Cin => gnd, S => net3, C => tmp);

decrementVel: my6bitAdder  port map (A => net2, B => "111111", Cin => gnd, S => net5, C => tmp);
GL_comp: lessthan_6bit 
    port map (A => net3, B => ground_level, E => below_gnd);

PosResetMUX: my6bitMUX 
    port map (A => net3, B => "001010", S => sel_PosReset, Y => net4);VelJumpMUX: my6bitMUX 
    port map (A => net5, B => "000011", S => sel_VelJump, Y => net6);

YPos <= net1;
testport <= net2;

end structural;
