----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:01 09/29/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_MODULE is
    Port ( DATA_I : in  STD_LOGIC_VECTOR (31 downto 0);
           DATA_II : in  STD_LOGIC_VECTOR (31 downto 0);
           SELEC : in  STD_LOGIC_VECTOR (5 downto 0);
			  RESULT	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			  );
end ALU_MODULE;

architecture Behavioral of ALU_MODULE is

begin
process (SELEC,DATA_I,DATA_II)
begin
   case SELEC is
		-- LOGICAL INSTRUCTIONS	
      when "000001" => RESULT <= DATA_I AND DATA_II;
      when "000101" => RESULT <= DATA_I AND (NOT DATA_II);
      when "000010" => RESULT <=	DATA_I OR DATA_II;
      when "000110" => RESULT <= DATA_I OR (NOT DATA_II);
		when "000011" => RESULT <= DATA_I XOR DATA_II;
		when "000111" => RESULT <= DATA_I XNOR DATA_II;
		-- ADD INSTRUCTIONS
		when "000000" => RESULT <= DATA_I + DATA_II;
		-- SUBTRACT INSTRUCTIONS
		when "000100" => RESULT <= DATA_I - DATA_II;
      when others => RESULT <= X"00000000";
   end case;
end process;

end Behavioral;
