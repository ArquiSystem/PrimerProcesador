library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity SEU_MODULE is
    Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_MODULE;

architecture Behavioral of SEU_MODULE is

signal inmed_on_31 : std_logic_vector(31 downto 0):=(others => '0');

begin
process(imm,inmed_on_31)
begin
	if imm(12)='1' then
	inmed_on_31<=std_logic_vector("11111111111111111110000000000000"+ imm );
  elsif imm(12)='0' then
  inmed_on_31<=std_logic_vector("00000000000000000000000000000000"+ imm );
  end if;
	data_out<=inmed_on_31;
end process;

end Behavioral;
