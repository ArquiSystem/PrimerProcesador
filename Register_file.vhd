library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Register_file is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture Behavioral of Register_file is

type ram_type is array (0 to 31) of std_logic_vector (31 downto 0); --2^15 x 8bits
			
	 signal RAM: ram_type := (others => "00000000000000000000000000000000");
	 
signal registro1 : std_logic_vector(31 downto 0);
signal registro2 : std_logic_vector(31 downto 0);

begin
	
	process(rst,rs1,rs2,rd,dwr,RAM)
	begin
	if rst = '1' then
		RAM <= (others =>"00000000000000000000000000000000");
		crs1 <= (others =>'0');
		crs2 <= (others =>'0');
	else
		registro1 <= RAM(conv_integer(rs1));
		registro2 <= RAM(conv_integer(rs2));
		if rd /= "00000" then
			RAM(conv_integer(rd)) <= dwr;
			end if;
		crs1 <= registro1;
		crs2 <= registro2;
	end if;
	end process;
end Behavioral;

