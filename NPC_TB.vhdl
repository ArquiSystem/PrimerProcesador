LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NPC_TB IS
END NPC_TB;
 
ARCHITECTURE first OF NPC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NPC
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         DI : IN  std_logic_vector(31 downto 0);
         DO : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal DI : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DO : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NPC PORT MAP (
          CLK => CLK,
          RST => RST,
          DI => DI,
          DO => DO
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	WAIT FOR 10 NS;	
	DI<=X"10000000";
	WAIT FOR 10 NS;
	RST<='1';
      -- insert stimulus here 

      wait;
   end process;

END;

