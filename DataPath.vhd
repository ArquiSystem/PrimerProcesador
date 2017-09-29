
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataPath is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end DataPath;

architecture Behavioral of DataPath is

COMPONENT i_memory
	PORT(
		address : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registro32bit
	PORT(
		datain : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Sumador32bits
	PORT(
		datain1 : IN std_logic_vector(31 downto 0);
		datain2 : IN std_logic_vector(31 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal data1: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
signal dir: std_logic_vector(31 downto 0)"00000000000000000000000000000000";
signal data2: std_logic_vector(31 downto 0)"00000000000000000000000000000000";
signal aux: std_logic_vector(5 downto 0);

begin

	aux(0) <= dir(0);	
	aux(1) <= dir(1);	
	aux(2) <= dir(2);	
	aux(3) <= dir(3);	
	aux(4) <= dir(4);	
	aux(5) <= dir(5);	
	
	IM: i_memory PORT MAP(
		address => aux,
		rst => rst,
		instruction => instruction
	);
	
		PC: registro32bit PORT MAP(
		datain => data1,
		clk => clk ,
		rst => rst,
		dataout => dir
	);
	
	nPC: registro32bit PORT MAP(
		datain => data2,
		clk => clk ,
		rst => rst,
		dataout => data1
	);
	
	SUMADOR: Sumador32bits PORT MAP(
		datain1 => "00000000000000000000000000000001",
		datain2 => dir,
		dataout => data2
	);

end Behavioral;

