library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LRS is
    Port ( LRS_INPUT  : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           LRS_OUTPUT : out  STD_LOGIC_VECTOR (3 DOWNTO 0)
         );
end LRS;

architecture behavioral of LRS is
begin 
	process (LRS_INPUT)
	begin
		   LRS_OUTPUT(3) <= '0';
		   LRS_OUTPUT(2) <= LRS_INPUT(3);
		   LRS_OUTPUT(1) <= LRS_INPUT(2);
     	   LRS_OUTPUT(0) <= LRS_INPUT(1);
    end process;
end behavioral;