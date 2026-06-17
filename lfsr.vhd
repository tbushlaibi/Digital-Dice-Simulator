library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity lfsr is
    Port (
        clk : in STD_LOGIC; 
        roll_enable : in STD_LOGIC;
        random_number : out STD_LOGIC_VECTOR(2 downto 0) 
    );
end lfsr;
architecture lfsr_arch of lfsr is
    signal lfsr_reg : STD_LOGIC_VECTOR(3 downto 0) := "1001"; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if roll_enable = '1' then
                lfsr_reg <= lfsr_reg(2 downto 0) & (lfsr_reg(3) xor lfsr_reg(2)); 
            end if;
        end if;
    end process;
    random_number <= lfsr_reg(2 downto 0); 
end lfsr_arch;
