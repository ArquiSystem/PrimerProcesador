LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX_MODULE_TB IS
END MUX_MODULE_TB;
 
ARCHITECTURE behavior OF MUX_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_MODULE
    PORT(
         rs2 : IN  std_logic_vector(31 downto 0);
         data_SEU : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal data_SEU : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_MODULE PORT MAP (
          rs2 => rs2,
          data_SEU => data_SEU,
          i => i,
          data_out => data_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		data_SEU <= (others => '0');
		rs2 <= "00000000000100010000001000000001";
		i <= '1';
      wait for 10 ns;	
		i <= '0';
      wait for 10 ns;
		i <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;