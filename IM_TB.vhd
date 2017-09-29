--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:15:14 09/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/Documentos/Fundamentos/Processor_I/IM_TB.vhd
-- Project Name:  Processor_I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY IM_TB IS
END IM_TB;
 
ARCHITECTURE behavior OF IM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         ADDRESS : IN  std_logic_vector(5 downto 0);
         RST : IN  std_logic;
         INSTRUCTION : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDRESS : std_logic_vector(5 downto 0) := (others => '0');
   signal RST : std_logic := '0';

 	--Outputs
   signal INSTRUCTION : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          ADDRESS => ADDRESS,
          RST => RST,
          INSTRUCTION => INSTRUCTION
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      address<="000001";
      wait for 5 ns;
		address<="000010";
      wait for 5 ns;
		address<="000011";
      wait for 5 ns;
		address<="000100";
      wait for 5 ns;
		rst<='1';
      wait for 200 ns;
    rst<='0';
      wait;
   end process;

END;
