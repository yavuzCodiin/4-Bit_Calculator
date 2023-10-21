library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
entity ARS is 
Port (  ARS_INPUT 	: in STD_LOGIC_VECTOR (3 DOWNTO 0); 
		ARS_OUTPUT : out STD_LOGIC_VECTOR (3 DOWNTO 0)
	 ); 
end ARS;
architecture Behavioral of ARS is 
begin 
	process (ARS_INPUT)
	begin 
		ARS_OUTPUT(3) <= ARS_INPUT(3); 
		ARS_OUTPUT(2) <= ARS_INPUT(3); 
		ARS_OUTPUT(1) <= ARS_INPUT(2); 
		ARS_OUTPUT(0) <= ARS_INPUT(1);
end process; 
end Behavioral;