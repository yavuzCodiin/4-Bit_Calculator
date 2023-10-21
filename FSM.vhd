LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY FSM IS
PORT     (
         CLK           : IN STD_LOGIC;
         RUN           : IN STD_LOGIC;
         RST         : OUT STD_LOGIC;
         Alu_op        : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);              		
         MOP          : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      	 Input_Select  : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); 
      	 Load_A        : OUT STD_LOGIC;
     	 Load_B        : OUT STD_LOGIC;
         Cin           : OUT STD_LOGIC;
         out_state     : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
         
 );
END FSM;

ARCHITECTURE Behavior OF FSM IS
SIGNAL y_present, y_next : STD_LOGIC_VECTOR(4 DOWNTO 0);
         CONSTANT s0  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10000";
         CONSTANT s1  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
         CONSTANT s2  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
         CONSTANT s3  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
         CONSTANT s4  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
BEGIN
	PROCESS (RUN, y_present)
	BEGIN
		CASE y_present IS
				WHEN s0 =>
				IF RUN='0' THEN y_next <= s0;
				ELSIF RUN='1' THEN y_next <= s1;
				END IF;
				
				WHEN s1 =>
				IF RUN='0' THEN y_next <= s0;
				ELSIF RUN='1' THEN  y_next <= s2;
				END IF;
				
				WHEN s2 =>
				IF RUN='0' THEN y_next <= s0;
				ELSIF RUN='1' THEN  y_next <= s3;
				END IF;	
				
				WHEN s3 =>
				IF RUN='0' THEN y_next <=s0;
				ELSIF RUN='1' THEN  y_next <= s4;
				END IF;
				
				WHEN s4 =>
				IF RUN='0' THEN  y_next <= s0;
				ELSIF RUN='1' THEN  y_next <= s4;
				END IF;
				
				WHEN OTHERS =>
				y_next <= s0;
	END CASE;
	END PROCESS;
	
	PROCESS (CLK)
	BEGIN
		IF RUN='0' THEN
		y_present <= s0;
		ELSIF (CLK'EVENT AND CLK='1') THEN
		y_present <= y_next;
		END IF;
		
	END PROCESS;
	
		process (y_present, MOP)
		begin
		 if y_present = s0 then 
				out_state <= "0000";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';	
				end if; 
				
          if y_present = s1 then  
		  	if (MOP="0111") then
				out_state <= "0001";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "001";
				RST <= '0';	
				else
				out_state <= "0001";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
			    end if;	
			    end if;
			    
			    
			    if y_present = s2 then   
		     	if (MOP="0111") then
				out_state <= "0010";
				Input_Select <= "100";
				Load_A <= '1';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				else
				out_state <= "0010";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
			    end if;	
			    end if;	
				
			      
			   if y_present = s3 then  
				if (MOP="0000") then
				out_state <= "0011";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				
				elsif (MOP="0001") then
				out_state <= "0011";
                Input_Select <= "000";
                Load_A <= '0';
                Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
	            RST <= '1';
	         
	            elsif (MOP="0010") then
				out_state <= "0011";	
                Input_Select <= "110";
				Load_A <= '1';
			    Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';

				
				elsif (MOP="0011") then
				out_state <= "0011";
				Input_Select <= "110";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';		
				
				elsif (MOP="0100") then
				out_state <= "0011";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				
				elsif (MOP="0101") then
				out_state <= "0011";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "001";
				RST <= '0';
				
				elsif (MOP="0110") then
				out_state <= "0011";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '1';
				Alu_op <= "001";
				RST <= '0';
				
				elsif (MOP="0111") then
				out_state <= "0011";
				Input_Select <= "110";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "001";
				RST <= '0';
				
				elsif (MOP="1000") then
				out_state <= "0011";
				Input_Select <= "101";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '1';
				Alu_op <= "001";
				RST <= '0';
				
				elsif (MOP="1001") then
				out_state <= "0011";
				Input_Select <= "101";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				
				elsif (MOP="1010") then
				out_state <= "0011";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "101";
				RST <= '0';
				
				elsif (MOP="1011") then
				out_state <= "0011";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "100";
				RST <= '0';
				
				elsif (MOP="1100") then
				out_state <= "0011";
				Input_Select <= "100";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "110";
				RST <= '0';
				
				elsif (MOP="1101") then
				out_state <= "0011";
				Input_Select <= "010";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				
				elsif (MOP="1110") then
				out_state <= "0011";
				Input_Select <= "001";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				
				elsif (MOP="1111") then
				out_state <= "0011";
				Input_Select <= "011";
				Load_A <= '0';
				Load_B <= '1';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';
				end if;
				
			    end if; 
			    
			    if y_present = s4 then 
				out_state <= "0100";
				Input_Select <= "000";
				Load_A <= '0';
				Load_B <= '0';
				Cin <= '0';
				Alu_op <= "000";
				RST <= '0';	
				end if; 
		 end process;	  
END Behavior;