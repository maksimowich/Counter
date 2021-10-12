library ieee;
	use ieee.std_logic_1164.all;

entity clock_generator is
port
(
	out_clock: out std_logic
);
end;

architecture arch of clock_generator is
	signal clock: std_logic;
begin
	gen: process
	begin
		clock <= '0';
		wait for 20 ns;
		clock <= '1';
		wait for 20 ns;
	end process;
	out_clock <= clock;
end;