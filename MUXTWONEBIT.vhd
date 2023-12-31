library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
ENTITY MUXTWONEBIT IS
PORT (
		 A0 : IN STD_LOGIC; 
		 A1  : IN STD_LOGIC;
		 S  : IN STD_LOGIC;
		 OUTPUT : OUT STD_LOGIC);
END MUXTWONEBIT;
ARCHITECTURE Behavior OF MUXTWONEBIT IS	
BEGIN
	WITH S SELECT
		    OUTPUT <= 	A0 WHEN '0',
						A1 WHEN  OTHERS;
END Behavior;