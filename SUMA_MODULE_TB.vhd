
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SUMA_MODULE_TB IS
END SUMA_MODULE_TB;
 
ARCHITECTURE behavior OF SUMA_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUMA_MODULE
    PORT(
         DATA_ONE : IN  std_logic_vector(31 downto 0);
         DATA_TWO : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DATA_ONE : std_logic_vector(31 downto 0) := (others => '0');
   signal DATA_TWO : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUMA_MODULE PORT MAP (
          DATA_ONE => DATA_ONE,
          DATA_TWO => DATA_TWO,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		DATA_ONE <= "10000000000000000000000000000001";
		DATA_TWO <= "01000000000000000000000000000001";
		wait;
		
   end process;

END;
