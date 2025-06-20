LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux4x1_test IS
END ENTITY mux4x1_test;

ARCHITECTURE behavior OF mux4x1_test IS
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL d0, d1, d2, d3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL y : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    -- Instantiate the mux4x1
    UUT : ENTITY work.mux4x1
        PORT MAP(
            sel => sel,
            d0 => d0,
            d1 => d1,
            d2 => d2,
            d3 => d3,
            y => y
        );

    -- Stimulus process
    PROCESS
    BEGIN
        -- Test case 1
        sel <= "00";
        d0 <= "0001";
        d1 <= "0010";
        d2 <= "0011";
        d3 <= "0100";
        WAIT FOR 10 ns;

        -- Test case 2
        sel <= "01";
        WAIT FOR 10 ns;

        -- Test case 3
        sel <= "10";
        WAIT FOR 10 ns;

        -- Test case 4
        sel <= "11";
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;
END ARCHITECTURE behavior;