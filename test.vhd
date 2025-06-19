entity testbench is

end entity;

architecture demo of testbench is
	signal s1 : integer := 0;
	signal s2 : integer := 10;
begin

	process is
	begin
		s1 <= s1 + 1;
		s2 <= s2 - 1;
		wait for 10 ns;
	end process;
	
	process(s1 , s2) is
	begin
	
		if s1>s2 then
			report "s1 is larger";
		elsif s2>s1 then
			report "s1 is smaller";
		else
			report "s1 equal s2";
		end if;
	end process;
	
end architecture;