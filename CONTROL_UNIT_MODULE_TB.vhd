LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CONTROL_UNIT_MODULE_TB IS
END CONTROL_UNIT_MODULE_TB;
 
ARCHITECTURE behavior OF CONTROL_UNIT_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL_UNIT_MODULE
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL_UNIT_MODULE PORT MAP (
          op => op,
          op3 => op3,
          ALUOP => ALUOP
        );

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";
		op3 <= "000000";
      wait for 10 ns;
		op3 <= "000001";
      wait for 10 ns;
		op3 <= "000011";		
		wait for 10 ns;
		op <= "00";
		op3 <= "011000";

      -- insert stimulus here 

      wait;
   end process;

END;