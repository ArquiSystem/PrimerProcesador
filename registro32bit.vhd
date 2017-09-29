library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity registro32bit is
    Port ( datain : in  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic;
			  rst : in std_logic;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end registro32bit;

architecture Behavioral of registro32bit is
	signal registro : std_logic_vector(31 downto 0):=(others=>'0');
begin
dataout <= registro;
process(clk,rst)
begin
	if(rst='1') then
			registro <= (others=>'0');
	else
		if ((clk'event) and (clk='1')) then
			registro <= datain;
		end if;
	end if;
end process;
end Behavioral;

