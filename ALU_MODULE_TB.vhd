--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:48 09/29/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/GG/S/ALU_TB.vhd
-- Project Name:  S
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_MODULE_TB IS
END ALU_MODULE_TB;
 
ARCHITECTURE behavior OF ALU_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_MODULE
    PORT(
         DATA_I : IN  std_logic_vector(31 downto 0);
         DATA_II : IN  std_logic_vector(31 downto 0);
         SELEC : IN  std_logic_vector(5 downto 0);
         RESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DATA_I : std_logic_vector(31 downto 0) := (others => '0');
   signal DATA_II : std_logic_vector(31 downto 0) := (others => '0');
   signal SELEC : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_MODULE PORT MAP (
          DATA_I => DATA_I,
          DATA_II => DATA_II,
          SELEC => SELEC,
          RESULT => RESULT
        );
   -- Stimulus process
   stim_proc: process
   begin		
		SELEC<="000001";		--AND
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
      wait for 40 ns;	
		SELEC<="000101";		--ANDN
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
      wait for 40 ns;	
		SELEC<="000010";		--OR
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
      wait for 40 ns;	
		SELEC<="000110";		--ORN
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
      wait for 40 ns;	
		SELEC<="000011";		--XOR
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
      wait for 40 ns;	
		SELEC<="000111";		--XORN
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
		wait for 40 ns;	
		SELEC<="000000";		--ADD
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
		wait for 40 ns;	
		SELEC<="000100";		--SUB
      DATA_I<=X"00000000";
		DATA_II<=X"00000011";
		wait;
   end process;

END;