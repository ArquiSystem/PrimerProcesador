library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Sumador32bits is
    Port ( datain1 : in  STD_LOGIC_VECTOR (31 downto 0);
           datain2 : in  STD_LOGIC_VECTOR (31 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador32bits;

architecture Behavioral of Sumador32bits is

begin
	dataout <= datain1 +datain2;

end Behavioral;

