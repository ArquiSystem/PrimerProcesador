library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( DATA_I : in  STD_LOGIC_VECTOR (31 downto 0);
           DATA_II : in  STD_LOGIC_VECTOR (31 downto 0);
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	DATA_OUT <= STD_LOGIC_VECTOR(UNSIGNED(DATA_I) + UNSIGNED(DATA_II));

end Behavioral;
