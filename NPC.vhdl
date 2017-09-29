library ieee;
use ieee.std_logic_1164.all;

entity NPC is
    port (CLK  : in std_logic;
          RST  : in std_logic;
          DI   : in std_logic_vector(31 downto 0);
          DO   : out std_logic_vector(31 downto 0));
end NPC;

architecture FIRST of NPC is
begin

    process (RST,CLK)
    begin
		  
        IF RST='1' THEN
				DO <= X"00000000";
		  ELSIF CLK'event and CLK = '1' then
				DO <= DI;
		  END IF;
    end process;

end FIRST;
