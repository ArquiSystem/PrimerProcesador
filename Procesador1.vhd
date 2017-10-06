library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador1 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ALUresult : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador1;

architecture Behavioral of Procesador1 is

COMPONENT DataPath
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ControlUnit
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Register_file
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux
	PORT(
		rs2 : IN std_logic_vector(31 downto 0);
		data_SEU : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		data_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seu
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		data_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		DATA_I : IN std_logic_vector(31 downto 0);
		DATA_II : IN std_logic_vector(31 downto 0);
		SELEC : IN std_logic_vector(5 downto 0);          
		RESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal party: std_logic_vector(31 downto 0);
signal Crs1: std_logic_vector(31 downto 0);
signal Crs2: std_logic_vector(31 downto 0);
signal Data_mux : std_logic_vector(31 downto 0);
signal Data_ALU : std_logic_vector(31 downto 0);
signal control_ALU : std_logic_vector(5 downto 0);
signal bi: std_logic_vector(31 downto 0);

begin

	Inst_DataPath: DataPath PORT MAP(
		clk => clk,
		rst => rst,
		instruction => party
	);
	
	Inst_ControlUnit: ControlUnit PORT MAP(
		op => party(31 downto 30),
		op3 => party(24 downto 19),
		ALUOP => control_ALU
	);
	
	Inst_Register_file: Register_file PORT MAP(
		rs1 => party(18 downto 14),
		rs2 => party( 4 downto 0),
		rd => party(29 downto 25),
		rst => rst,
		dwr => bi,
		crs1 => Crs1,
		crs2 => Crs2
	);
	
	Inst_Mux: Mux PORT MAP(
		rs2 => Crs2,
		data_SEU => Data_mux,
		i => party(13),
		data_out => Data_ALU
	);
	
	Inst_seu: seu PORT MAP(
		imm => party(12 downto 0),
		data_out => Data_mux
	);

	Inst_ALU: ALU PORT MAP(
		DATA_I => Crs1,
		DATA_II => Data_ALU,
		SELEC => control_ALU,
		RESULT => bi
	);
	
	ALUresult <= bi;
	
end Behavioral;

