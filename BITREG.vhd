library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity BITREG is
Port( 
			INPUT: in STD_LOGIC_VECTOR (3 downto 0);
			OUTPUT: out STD_LOGIC_VECTOR (3 downto 0);
			LOAD: in STD_LOGIC;
			RST: in STD_LOGIC;
			CLK: in STD_LOGIC);
end BITREG;
architecture Behavioral of BITREG is
begin
		process (CLK, LOAD, RST)
		begin
			if CLK'event and CLK ='1' then  
			if RST = '1' then 
			OUTPUT <= "0000";   
			elsif LOAD = '1' then
			OUTPUT <= INPUT;    
end if;
end if;
end process;
end Behavioral;