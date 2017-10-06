
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY suma_tb IS
END suma_tb;
 
ARCHITECTURE behavior OF suma_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT suma_module
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: suma_module PORT MAP (
          data1 => data1,
          data2 => data2,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		data1 <= "10000000000000000000000000000001";
		data2 <= "01000000000000000000000000000001";
		wait;
		
   end process;

END;
