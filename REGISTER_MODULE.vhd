library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTER_MODULE is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR(31 downto 0));
end REGISTER_MODULE;

architecture Behavioral of REGISTER_MODULE is

begin
	process(clk,rst,data)
	begin
		if rst = '1' then
			data_out <= "00000000000000000000000000000000";
		elsif(clk'event and clk='1')then  
			DATA_OUT <= data;
		end if;
	end process;

end Behavioral;

