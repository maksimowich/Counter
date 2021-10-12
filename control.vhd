library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity control is
port
(
	out_up: out std_logic;
	out_nRst: out std_logic; 
	out_load: out std_logic;
	out_Dout: out unsigned(3 downto 0)
);
end;

architecture arch of control is
begin
	process
	begin
		out_up <= '1';
		wait for 1000 ns;
		out_up <= '0';
		wait;
	end process;
	
	process
	begin
		out_nRst <= '0';
		wait for 100 ns;
		out_nRst <= '1';
		wait for 1000 ns;
		out_nRst <= '0';
		wait for 17 ns;
		out_nRst <= '1';
		wait;
	end process;
	
	process
	begin
		out_load <= '0';
		wait for 1200 ns;
		out_load <= '1';
		out_Dout <= to_unsigned(7, 4);
		wait for 500 ns;
		out_load <= '0';
		wait;
	end process;
end;