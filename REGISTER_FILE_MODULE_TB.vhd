--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:52:21 10/05/2017
-- Design Name:   
-- Module Name:   C:/Users/equipo/Desktop/arquitectura/Register_file/Register_file_tb.vhd
-- Project Name:  Register_file
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_file
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
 
ENTITY REGISTER_FILE_MODULE_TB IS
END REGISTER_FILE_MODULE_TB;
 
ARCHITECTURE behavior OF REGISTER_FILE_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REGISTER_FILE_MODULE
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         rst : IN  std_logic;
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REGISTER_FILE_MODULE PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rs1 <="00001";
		rs2 <="00010";
		rd <= "00011";
		dwr <= "10100001111110000010000000000001";
		wait for 100 ns;
		rs1 <= "00011";
		rs2 <= "01000";
		--rd <= "00000";
		wait for 100 ns;
		rst <= '1';
		rs1 <= "10000";
		rs2 <="00010";
		rd <= "00011";

      wait;
   end process;

END;
