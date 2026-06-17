library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity debounce is
    Port (
        clk : in STD_LOGIC; 
        btn : in STD_LOGIC;
        btn_out : out STD_LOGIC 
    );
end debounce;
architecture debounce_arch of debounce is
    signal btn_counter : integer range 0 to 100000 := 0; 
    signal btn_stable : STD_LOGIC := '0'; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn = '1' then
                btn_counter <= btn_counter + 1;
                if btn_counter = 100000 then
                    btn_stable <= '1';
                end if;
            else
                btn_counter <= 0;
                btn_stable <= '0';
            end if;
        end if;
    end process;
    btn_out <= btn_stable; 
end debounce_arch;
