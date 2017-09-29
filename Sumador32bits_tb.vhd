
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Sumador32bits_tb IS
END Sumador32bits_tb;
 
ARCHITECTURE behavior OF Sumador32bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador32bits
    PORT(
         datain1 : IN  std_logic_vector(31 downto 0);
         datain2 : IN  std_logic_vector(31 downto 0);
         dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal datain1 : std_logic_vector(31 downto 0) := (others => '0');
   signal datain2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador32bits PORT MAP (
          datain1 => datain1,
          datain2 => datain2,
          dataout => dataout
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		datain1 <= "01010000000001010000000000101001";
		datain2 <= "11110000000001010000000000101001";
      wait for 30 ns;
		datain1 <= "11111111111111111111111111111111";
		datain2 <= "11111111111111111111111111111111";
      wait for 30 ns;
		datain1 <= "11111111111111111111111111111111";
		datain2 <= "00000000000000000000000000000001";
		-- insert stimulus here 

      wait;
   end process;

END;
