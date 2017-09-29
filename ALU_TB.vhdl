LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         DATA_I : IN  std_logic_vector(31 downto 0);
         DATA_II : IN  std_logic_vector(31 downto 0);
         DATA_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DATA_I : std_logic_vector(31 downto 0) := (others => '0');
   signal DATA_II : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          DATA_I => DATA_I,
          DATA_II => DATA_II,
          DATA_OUT => DATA_OUT
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      DATA_I<=X"00000002";
		  DATA_II<=X"00000002";
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
