library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LLS is 
	Port (  LLS_INPUT  : in STD_LOGIC_VECTOR (3 DOWNTO 0); 
			LLS_OUTPUT : out STD_LOGIC_VECTOR (3 DOWNTO 0)
		 ); 
end LLS; 

architecture Behavioral of LLS is 
begin 
	process (LLS_INPUT) 
	begin 
		LLS_OUTPUT(0) <= '0'; 
		LLS_OUTPUT(1) <= LLS_INPUT(0); 
		LLS_OUTPUT(3) <= LLS_INPUT(2); 
		LLS_OUTPUT(2) <= LLS_INPUT(1); 
	end process;
end Behavioral;