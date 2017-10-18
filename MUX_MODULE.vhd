library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_MODULE is
    Port ( rs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           data_SEU : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_MODULE;

architecture Behavioral of MUX_MODULE is

begin
process(i, rs2, data_SEU)
begin
	if (i = '1') then
		data_out <= data_SEU;
	else
		data_out <= rs2;
	end if;
end process;
end Behavioral;