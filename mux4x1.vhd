LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux4x1 IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        d0, d1, d2, d3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY mux4x1;

ARCHITECTURE behavior OF mux4x1 IS
BEGIN
    y <= d0 WHEN sel = "00" ELSE
        d1 WHEN sel = "01" ELSE
        d2 WHEN sel = "10" ELSE
        d3;
END ARCHITECTURE behavior;