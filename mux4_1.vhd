library ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Mux4_1 is 
    port(a1,a2,a3,a4:  in std_logic;
        s1,s2: in std_logic;
        Mux4_1_out: out std_logic);
end Mux4_1 ;
architecture struct of Mux4_1 is
    signal I1,I2,I3,I4: std_logic;
    signal b1,b2,b3,b4,b5: std_logic;
    Component mux21
        PORT(w0,w1: IN STD_LOGIC;
            s: IN STD_LOGIC;
            y: OUT STD_LOGIC);
    end Component;
    Component encoder2_4
        PORT(w: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            I: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END Component;
begin
    M1:mux21 port map
    (W0 => a1,
    W1 => a2,
    y => b1,
    s <= b2);
    M2:mux21 port map
    (W0 => a3,
    W1 => a4,
    y => b5,
    s => b4);
    M2:mux21 port map
    (W0 => b1,
    W1 => b2,
    y => Mux4_1_out,
    s => b3);
    E4: encoder2_4 port map
    (W(0) => s1,
    W(1) => s2,
    I(0) => b3,
    I(1) => b4,
    I(2) => b5);
end struct;
