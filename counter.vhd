library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter is
port
(
	in_clock: in std_logic;
	in_up: in std_logic;
	in_nRst: in std_logic;
	in_load: in std_logic;
	in_Din: in unsigned(3 downto 0);
	out_q: out std_logic;
	out_Dout: out unsigned(3 downto 0)
);
end;

architecture arch of counter is
	signal count: integer range 0 to 15;
begin
	process(in_clock)
	begin
		if in_nRst = '0' then
			count <= 0;
			out_q <= '0';
		elsif rising_edge(in_clock) then
			if in_load = '1' then
				count <= to_integer(unsigned(in_Din));
				out_q <= '0';
			else
				if in_up = '1' then
					if count < 15 then
						count <= count + 1;
						if count < 14 then
							out_q <= '0';
						else
							out_q <= '1';
						end if;
					else 
						count <= 0;
						out_q <= '0';
					end if;
				else
					if count > 0 then
						count <= count - 1;
						if count > 1 then
							out_q <= '0';
						else
							out_q <= '1';
						end if;
					else 
						count <= 15;
						out_q <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	out_Dout <= to_unsigned(count, 4);
end;