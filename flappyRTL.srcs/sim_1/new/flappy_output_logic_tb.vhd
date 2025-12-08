

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity flappy_output_logic_tb is
--  Port ( );
end flappy_output_logic_tb;

architecture Behavioral of flappy_output_logic_tb is

component  flappy_output_logic is
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

signal S0_in, S1_in : std_logic;
signal J_out, F_out, D_out, ld_YPos_out, ld_YVel_out, sel_PosReset_out, sel_VelJump_out, test_out: std_logic ;

begin

uut: flappy_output_logic port map (S0_in, S1_in , J_out, F_out, D_out,
                                   ld_YPos_out, ld_YVel_out, sel_PosReset_out, sel_VelJump_out, test_out);

sim_proc: process 

begin

for kk in 0 to 3 loop

    (S1_in, S0_in) <= std_logic_vector(to_unsigned(kk,2));
    
    wait for 50ns;
end loop;

wait;

end process;

                                   
end Behavioral;
