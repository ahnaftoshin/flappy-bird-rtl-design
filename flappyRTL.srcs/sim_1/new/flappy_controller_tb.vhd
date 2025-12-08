
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity flappy_controller_tb is
--  Port ( );
end flappy_controller_tb;

architecture Behavioral of flappy_controller_tb is

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



--inputs
signal B_in, below_gnd_in: std_logic;
signal clk_in : std_logic := '0';

--output
signal D_out, J_out, F_out: std_logic;
signal ld_YPos_out, ld_YVel_out, sel_PosReset_out, sel_VelJump_out : std_logic;

--debugging
signal test_out : std_logic_vector(5 downto 0);

begin

clk_in <= not clk_in after 15ns;

uut: flappy_controller port map(clk_in, B_in, below_gnd_in, J_out, F_out, D_out,
                                   ld_YPos_out, ld_YVel_out, sel_PosReset_out, sel_VelJump_out, test_out);
                                 

sim_proc: process 

begin

B_in <= '1';
below_gnd_in <= '0';

wait for 120ns;

B_in <= '0';

wait for 60ns;

below_gnd_in <= '1';

wait for 60ns;
below_gnd_in <= '0';

wait for 30ns;
B_in <= '1';

wait for 30ns; 
B_in <='0';

wait for 90ns; 
B_in <='1';

wait for 30ns;
B_in <='0';


wait;

end process;
                                 

end Behavioral;
