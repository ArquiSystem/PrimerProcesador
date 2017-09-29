----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:13 09/29/2017 
-- Design Name: 
-- Module Name:    seu - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seu is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture Behavioral of seu is

signal inmed_on_31 : std_logic_vector(31 downto 0):=(others => '0');

begin
process(inmed_on_31,imm13)
begin
	if imm13(12)='1' then
		inmed_on_31<=std_logic_vector("1111111111111111111"+conv_integer(imm13));
	else
		inmed_on_31<=std_logic_vector("0000000000000000000"+conv_integer(imm13));
	end if;
data_out<=inmed_on_31;
end process;

end Behavioral;

