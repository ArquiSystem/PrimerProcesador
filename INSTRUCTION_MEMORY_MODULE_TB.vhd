--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:19:00 09/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Daniel/Documents/Arquitectura/instruction_memory/tb_i_memory.vhd
-- Project Name:  instruction_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i_memory
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
 
ENTITY INSTRUCTION_MEMORY_MODULE_TB IS
END INSTRUCTION_MEMORY_MODULE_TB;
 
ARCHITECTURE behavior OF INSTRUCTION_MEMORY_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT INSTRUCTION_MEMORY_MODULE
    PORT(
         address : IN  std_logic_vector(5 downto 0);
         rst : IN  std_logic;
         instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(5 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: INSTRUCTION_MEMORY_MODULE PORT MAP (
          address => address,
          rst => rst,
          instruction => instruction
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		
		address<="000000";
      wait for 10 ns;
		address<="000001";
      wait for 10 ns;
		address<="000010";
      wait for 10 ns;
		address<="000011";
      wait for 10 ns;
		address<="000100";
      wait for 10 ns;
		rst<='1';

      -- insert stimulus here 

      wait;
   end process;

END;