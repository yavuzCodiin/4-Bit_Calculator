library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
entity ALU is
Port(  ALU_OP: in STD_LOGIC_VECTOR (2 downto 0);
			X: in STD_LOGIC_VECTOR (3 downto 0);
			Y: in STD_LOGIC_VECTOR (3 downto 0);
			Cin: in STD_LOGIC;
			Cout: out STD_LOGIC;
			ALU_OUT: out STD_LOGIC_VECTOR (3 downto 0) );
			end ALU;
architecture Behavioral of ALU is
begin
	
	process(ALU_OP, X, Y, Cin)
	begin
		case ALU_OP is
			WHEN "000" => ALU_OUT <= X;
			WHEN "001" => ALU_OUT <= X + Y + (Cin);
			WHEN "010" => ALU_OUT <= X - Y - (NOT Cin);
			WHEN "011" => ALU_OUT <= Y - X - (NOT Cin);
			WHEN "100" => ALU_OUT <= X OR Y;
			WHEN "101" => ALU_OUT <= X AND Y;
			WHEN "110" => ALU_OUT <= X XOR Y;
			WHEN OTHERS => ALU_OUT <= X XNOR Y;
		end case;
		Cout<=((X(3) AND Y(3)) OR ((X(2) OR Y(2)) AND ((X(1) OR Y(1)) AND (X(0) AND Y(0)))));
	end process;
	
	
end Behavioral;
