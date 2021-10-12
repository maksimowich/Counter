library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity testbench is
end;

architecture arch of testbench is
	signal count: integer range 0 to 15;
	signal clock: std_logic;
	signal q: std_logic;
	signal up: std_logic;
	signal nRst: std_logic;
	signal load: std_logic;
	signal Dload: unsigned(3 downto 0);
	signal Din: unsigned(3 downto 0);
	component clock_generator
	port
	(
		out_clock: out std_logic
	);
	end component;
	component control
	port
	(
		out_up: out std_logic;
		out_nRst: out std_logic;
		out_load: out std_logic;
		out_Dout: out unsigned(3 downto 0)
	);	
	end component;
	component counter
	port
	(
		in_clock: in std_logic;
		in_up: in std_logic;
		in_nRst: in std_logic;
		in_load: in std_logic;
		in_Din: in unsigned(3 downto 0);
		out_q: out std_logic
	);
	end component;
begin
	cmp_counter: counter
	port map
	(
		in_clock => clock,
		in_up => up,
		out_q => q,
		in_nRst => nRst,
		in_load => load,
		in_Din => Dload
	);
	cmp_clock_generator: clock_generator
	port map
	(
		out_clock => clock
	);
	cmp_control: control
	port map
	(
		out_up => up,
		out_nRst => nRSt,
		out_load => load,
		out_Dout => Dload
	);
end;