library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity suma_module is
    Port ( DATA_ONE : in  STD_LOGIC_VECTOR (31 downto 0);
           DATA_TWO : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end suma_module;

architecture Behavioral of suma_module is

begin
	result <= DATA_ONE + DATA_TWO;

end Behavioral;

