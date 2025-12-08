library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_output_logic is
    Port (
      S0           : in  STD_LOGIC;
      S1           : in  STD_LOGIC;
      J            : out STD_LOGIC;
      F            : out STD_LOGIC;
      D            : out STD_LOGIC;
      ld_YPos      : out STD_LOGIC;
      ld_YVel      : out STD_LOGIC;
      sel_PosReset : out STD_LOGIC;
      sel_VelJump  : out STD_LOGIC;
      testport     : out STD_LOGIC
    );
end flappy_output_logic;

architecture Structural of flappy_output_logic is

  component myAND
    Port ( A : in STD_LOGIC; B : in STD_LOGIC; Q : out STD_LOGIC );
  end component;

  component myOR
    Port ( A : in STD_LOGIC; B : in STD_LOGIC; Q : out STD_LOGIC );
  end component;

  component myNOT
    Port ( A : in STD_LOGIC; Q : out STD_LOGIC );
  end component;

  signal S1inv : std_logic;
  signal S0inv : std_logic;
  signal Jnet  : std_logic;
  signal Fnet  : std_logic;
  signal Dnet  : std_logic;

begin

  notS1 : myNOT port map ( A => S1, Q => S1inv );
  notS0 : myNOT port map ( A => S0, Q => S0inv );

  AND1: myAND port map ( A => S1inv, B => S0, Q => Jnet );
  AND2: myAND port map ( A => S1,    B => S0, Q => Fnet );
  AND3: myAND port map ( A => S1inv, B => S0inv, Q => Dnet );

  OR_ld_YVel : myOR port map ( A => Jnet, B => Fnet, Q => ld_YVel );
  OR_ld_YPos : myOR port map ( A => Dnet, B => Fnet, Q => ld_YPos );

  J <= Jnet;
  F <= Fnet;
  D <= Dnet;
  sel_PosReset <= Dnet;
  sel_VelJump  <= Jnet;

  testport <= '0'; -- or expose useful debug bit
end Structural;
