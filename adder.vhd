LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder IS
    PORT (
        a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sum : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
END ENTITY adder;

ARCHITECTURE behavioral OF adder IS
BEGIN
    PROCESS (a, b)
        VARIABLE result : UNSIGNED(4 DOWNTO 0); -- 5 bits
    BEGIN
        result := RESIZE(unsigned(a), 5) + RESIZE(unsigned(b), 5);
        sum <= STD_LOGIC_VECTOR(result);
    END PROCESS;
END ARCHITECTURE behavioral;