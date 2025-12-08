library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity flappy_nextstate_logic_tb is
--  Port ( );
end flappy_nextstate_logic_tb;

architecture Behavioral of flappy_nextstate_logic_tb is

component flappy_nextstate_logic is
    Port ( B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           N0 : out STD_LOGIC;
           N1 : out STD_LOGIC;
           testport : out STD_LOGIC); 
end component;

signal B_in, below_gnd_in, S0_in, S1_in : std_logic ;
signal N0_out, N1_out, test_out: std_logic ;

begin

uut: flappy_nextstate_logic port map (B_in, below_gnd_in, S0_in, S1_in, N0_out, N1_out, test_out);

sim_proc: process 

begin

for kk in 0 to 15 loop

    (S1_in, S0_in, B_in, below_gnd_in) <= std_logic_vector(to_unsigned(kk,4));
    
    wait for 50ns;
end loop;

wait;

end process;

end Behavioral;
