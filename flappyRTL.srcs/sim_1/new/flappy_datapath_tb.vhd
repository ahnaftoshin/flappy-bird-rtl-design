

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity flappy_datapath_tb is
--  Port ( );
end flappy_datapath_tb;

architecture Behavioral of flappy_datapath_tb is

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

signal clk_in : std_logic :='0';
signal ld_YVel_in, ld_YPos_in, sel_PosReset_in, sel_VelJump_in : std_logic;
signal ground_level_in : std_logic_vector (5 downto 0) := "000010";
signal below_gnd_out : std_logic;
signal YPos_out, testport_out : std_logic_vector (5 downto 0);


begin

clk_in <= not clk_in after 10ns;

uut: flappy_datapath port map (clk_in, ld_YPos_in, ld_YVel_in, sel_PosReset_in, sel_VelJump_in,
                               below_gnd_out, ground_level_in, YPos_out, testport_out);


sim_proc: process 

begin

sel_PosReset_in <='1';
sel_VelJump_in <= '1';
ld_YPos_in <= '1';
ld_YVel_in <= '1';
ground_level_in <= "000111";

wait for 35ns;

sel_PosReset_in <='0';
sel_VelJump_in <='0';

wait for 100ns;
sel_VelJump_in <= '1';

wait for 20ns; 
sel_VelJump_in <= '0';

wait for 120ns;
ld_YPos_in <= '0';
ld_YVel_in <= '0';

wait for 40ns;
ld_YPos_in <= '1';
ld_YVel_in <= '1';

wait for 60ns;
sel_PosReset_in <= '1';
sel_VelJump_in <= '1';

wait for 20ns; 
sel_PosReset_in <= '0';
sel_VelJump_in <= '0';

wait for 20ns;
ground_level_in <= "001011";

wait for 120ns;
ld_YPos_in <= '0';
ld_YVel_in <= '0';

wait;

end process;


end Behavioral;


