LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder_tb IS
END ENTITY adder_tb;

ARCHITECTURE behavior OF adder_tb IS
    SIGNAL a : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL b : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
    -- Instantiate the adder
    UUT : ENTITY work.adder
        PORT MAP(
            a => a,
            b => b,
            sum => sum
        );

    -- Stimulus process
    PROCESS
    BEGIN
        -- Test case 1
        a <= "0001"; -- 1
        b <= "0010"; -- 2
        WAIT FOR 10 ns;

        -- Test case 2
        a <= "0011"; -- 3
        b <= "0100"; -- 4
        WAIT FOR 10 ns;

        -- Test case 3
        a <= "1111"; -- 15
        b <= "0001"; -- 1
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;
END ARCHITECTURE behavior;