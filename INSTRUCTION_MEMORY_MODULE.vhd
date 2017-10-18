----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    16:43:06 09/27/2017
-- Design Name:
-- Module Name:    i_memory - Behavioral
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

entity INSTRUCTION_MEMORY_MODULE is
    Port ( address : in  STD_LOGIC_VECTOR (5 downto 0);
           rst : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end INSTRUCTION_MEMORY_MODULE;

architecture Behavioral of INSTRUCTION_MEMORY_MODULE is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);

	signal ROM: rom_type := ("10000010000100000010000000001000",
									 "10000100000100000011111111111001",
									 "10010000000000000100000000000010",
									 "10010010000110000100000000000010",
									 "10010100001010000100000000000010",
									 "10010110001110000100000000000010",
									 "10011000001000000100000000000010",
									 others => "00000000000000000000000000000000");

begin
process(rst,ROM,address)
	begin
		if(rst = '1') then
			instruction<="00000000000000000000000000000000";
		else
			instruction<=ROM(conv_integer(address));
		end if;
end process;

end Behavioral;
