

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity flappy_processor_tb is
--  Port ( );
end flappy_processor_tb;

architecture Behavioral of flappy_processor_tb is

component flappy_processor is
    Port ( CLK : in STD_LOGIC ;
           B : in STD_LOGIC;
           ground_level : in STD_LOGIC_VECTOR (5 downto 0);
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           YPos : inout STD_LOGIC_VECTOR (5 downto 0);
           testport : out std_logic_vector (5 downto 0));
end component;

signal clk_in :std_logic := '0';
signal B_in : std_logic;
signal ground_level_in, YPos_out: std_logic_vector (5 downto 0);
signal J_out, F_out, D_out : std_logic;
signal testport_out : std_logic_vector (5 downto 0);

begin

uut: flappy_processor port map (clk_in, B_in, ground_level_in, J_out, F_out, D_out, YPos_out, testport_out);

clk_in <= not clk_in after 10ns;

-- Process to control B_in
B_sim_proc: process 

begin

B_in <= '0';
wait for 20ns;
B_in <= '1';
wait for 20ns;
B_in <= '0';

wait for 120ns;
B_in <= '1';
wait for 20ns;
B_in <= '0';

wait for 80ns;
B_in <= '1';
wait for 20ns;
B_in <= '0';

wait for 300ns;
B_in <= '1';
wait for 60ns;
B_in <= '0';

wait;

end process;


-- Process to control ground_level_in
Ground_sim: process 
begin
wait for 10ns;
for kk in 5 to 20 loop
    ground_level_in <= std_logic_vector(to_unsigned(kk,6));    
    wait for 20ns;
end loop;

for kk in 20 downto 5 loop
    ground_level_in <= std_logic_vector(to_unsigned(kk,6));    
    wait for 20ns;
end loop;



end process;


end Behavioral;
