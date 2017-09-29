----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:28 09/27/2017 
-- Design Name: 
-- Module Name:    IM - Behavioral 
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (5 downto 0);
           RST : in  STD_LOGIC;
           INSTRUCTION : out   STD_LOGIC_VECTOR (31 downto 0)
			 );
end IM;

architecture Behavioral of IM is
	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);                 
   signal ROM : rom_type:= ("10100000000100000010000000000100",
									 "10100010000100000011111111111010",
									 "10100100000001000000000000010001",
									 "10001000001001001010000000101011",
									 others => "00000000000000000000000000000000");                        

   signal rdata : std_logic_vector(31 downto 0);
begin 
	RDATA <= ROM(to_integer(unsigned(ADDRESS)));
   process (RST,RDATA)
	begin
		if (RST = '0') then
			INSTRUCTION <= rdata;
		else
			INSTRUCTION <= X"00000000";
      end if;
   end process;

end Behavioral;

