-- Highest level of flappy game simulator.  Connections between controller and datapath

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_processor is
    Port ( CLK : in STD_LOGIC ;
           B : in STD_LOGIC;
           ground_level : in STD_LOGIC_VECTOR (5 downto 0);
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           YPos : inout STD_LOGIC_VECTOR (5 downto 0);
           testport : out std_logic_vector (5 downto 0));
end flappy_processor;

architecture Behavioral of flappy_processor is

component flappy_controller is
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
end component;

component flappy_datapath is
  Port (clk:  in std_logic; 
        ld_YPos: in std_logic; 
        ld_YVel: in std_logic;
        sel_PosReset: in std_logic;
        sel_VelJump: in std_logic;        
        below_gnd: out std_logic;
        ground_level: in std_logic_vector (5 downto 0);
        YPos: inout std_logic_vector (5 downto 0);
        testport: out std_logic_vector (5 downto 0));   
end component;

-- IO signals
signal ld_YPos_net, ld_YVel_net, sel_PosReset_net, sel_VelJump_net, below_gnd_net  : std_logic; 
signal control_test, data_test : std_logic_vector (5 downto 0);

begin

controller: flappy_controller port map (CLK, B, below_gnd_net, J, F, D, ld_YPos_net, ld_YVel_net,
                                        sel_PosReset_net, sel_VelJump_net, control_test);
datapath: flappy_datapath port map (CLK, ld_YPos_net, ld_YVel_net,  sel_PosReset_net, sel_VelJump_net, below_gnd_net,
                                    ground_level,  YPos, data_test);

-- Debug port (can be modified by students)
testport(0) <= ld_YPos_net;
testport(1) <= ld_YVel_net;
testport(2) <= sel_PosReset_net;
testport(3) <= sel_VelJump_net;

end Behavioral;
