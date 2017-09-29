LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registro32bit_tb IS
END registro32bit_tb;
 
ARCHITECTURE behavior OF registro32bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro32bit
    PORT(
         datain : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal datain : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro32bit PORT MAP (
          datain => datain,
          clk => clk,
          rst => rst,
          dataout => dataout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 30 ns;	
		datain <= "01010000000001010000000000101001";
      wait for 20 ns;
		rst <= '1';
		wait for 30 ns;
		rst <= '0';
      wait for 20 ns;
		datain <= "11110000000001010000000000101001";
      -- insert stimulus here 

      wait;
   end process;

END;
