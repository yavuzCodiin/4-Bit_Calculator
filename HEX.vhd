library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity HEX is
	Port (
	          INPUT: in STD_LOGIC_VECTOR (3 downto 0);                       
	          OUTPUT: out STD_LOGIC_VECTOR (6 downto 0));                
End HEX;

Architecture Behavioral OF HEX is
Begin
Process (INPUT)
	Begin
	Case INPUT is           
		
			WHEN "0000" => OUTPUT <= "0000001";        
			WHEN "0001" => OUTPUT <= "1001111";        
			WHEN "0010" => OUTPUT <= "0010010";        
			WHEN "0011" => OUTPUT <= "0000110";        
			WHEN "0100" => OUTPUT <= "1001100";       
			WHEN "0101" => OUTPUT <= "0100100";        
			WHEN "0110" => OUTPUT <= "0100000";       
			WHEN "0111" => OUTPUT <= "0001111";        
			WHEN "1000" => OUTPUT <= "0000000";        
			WHEN "1001" => OUTPUT <= "0000100";        
			WHEN "1010" => OUTPUT <= "0001000";        
			WHEN "1011" => OUTPUT <= "1100000";      
			WHEN "1100" => OUTPUT <= "1110010";      
			WHEN "1101" => OUTPUT <= "1000010";      
			WHEN "1110" => OUTPUT <= "0110000";      
			WHEN OTHERS => OUTPUT <= "0111000";     
			
			
End Case;
End Process;
End Behavioral;
