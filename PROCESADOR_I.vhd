library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PROCESADOR_I is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ALU_RESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end PROCESADOR_I;

architecture ARCH_PC of PROCESADOR_I is

  COMPONENT SUMA_MODULE
  	PORT(
  		DATA_ONE : IN std_logic_vector(31 downto 0);
  		DATA_TWO : IN std_logic_vector(31 downto 0);
  		RESULT : OUT std_logic_vector(31 downto 0)
  		);
  	END COMPONENT;

  	COMPONENT REGISTER_MODULE
  	PORT(
  		data : IN std_logic_vector(31 downto 0);
  		CLK : IN std_logic;
  		RST : IN std_logic;
  		data_out : OUT std_logic_vector(31 downto 0)
  		);
  	END COMPONENT;

  	COMPONENT INSTRUCTION_MEMORY_MODULE
  	PORT(
  		address : IN std_logic_vector(5 downto 0);
  		RST : IN std_logic;
  		instruction : OUT std_logic_vector(31 downto 0)
  		);
  	END COMPONENT;

	COMPONENT CONTROL_UNIT_MODULE
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT REGISTER_FILE_MODULE
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		RST : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_MODULE
	PORT(
		rs2 : IN std_logic_vector(31 downto 0);
		data_SEU : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		data_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU_MODULE
	PORT(
		imm : IN std_logic_vector(12 downto 0);
		data_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU_MODULE
	PORT(
		DATA_I : IN std_logic_vector(31 downto 0);
		DATA_II : IN std_logic_vector(31 downto 0);
		SELEC : IN std_logic_vector(5 downto 0);
		RESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal DATA_ONE: std_logic_vector(31 downto 0);
signal dir: std_logic_vector(31 downto 0);
signal DATA_TWO: std_logic_vector(31 downto 0);
signal aux: std_logic_vector(5 downto 0);
signal party: std_logic_vector(31 downto 0);
signal Crs1: std_logic_vector(31 downto 0);
signal Crs2: std_logic_vector(31 downto 0);
signal Data_mux : std_logic_vector(31 downto 0);
signal Data_ALU : std_logic_vector(31 downto 0);
signal control_ALU : std_logic_vector(5 downto 0);
signal bi: std_logic_vector(31 downto 0);

begin

	aux(0) <= dir(0);
	aux(1) <= dir(1);
	aux(2) <= dir(2);
	aux(3) <= dir(3);
	aux(4) <= dir(4);
	aux(5) <= dir(5);

	INST_SUMADOR_MODULE: SUMA_MODULE PORT MAP(
		DATA_ONE => "00000000000000000000000000000001",
		DATA_TWO => dir,
		RESULT => DATA_TWO
	);

	INST_nPC_MODULE: REGISTER_MODULE PORT MAP(
		data => DATA_TWO,
		CLK => CLK,
		RST => RST,
		data_out => DATA_ONE
	);

	INST_PC_MODULE: REGISTER_MODULE PORT MAP(
		data => DATA_ONE,
		CLK => CLK,
		RST => RST,
		data_out => dir
	);

	INST_INSTRUCTION_MEMORY: INSTRUCTION_MEMORY_MODULE PORT MAP(
		address => aux,
		RST => RST,
		instruction => PARTY
	);

	INST_CONTROL_UNIT_MODULE: CONTROL_UNIT_MODULE PORT MAP(
		op => party(31 downto 30),
		op3 => party(24 downto 19),
		ALUOP => control_ALU
	);

	INST_REGISTER_FILE_MODULE: REGISTER_FILE_MODULE PORT MAP(
		rs1 => party(18 downto 14),
		rs2 => party( 4 downto 0),
		rd => party(29 downto 25),
		RST => RST,
		dwr => bi,
		crs1 => Crs1,
		crs2 => Crs2
	);

	INST_MUX_MODULE: MUX_MODULE PORT MAP(
		rs2 => Crs2,
		data_SEU => Data_mux,
		i => party(13),
		data_out => Data_ALU
	);

	INST_SEU_MODULE: SEU_MODULE PORT MAP(
		imm => party(12 downto 0),
		data_out => Data_mux
	);

	INST_ALU_MODULE: ALU_MODULE PORT MAP(
		DATA_I => Crs1,
		DATA_II => Data_ALU,
		SELEC => control_ALU,
		RESULT => bi
	);

	ALU_RESULT <= bi;

end ARCH_PC;
