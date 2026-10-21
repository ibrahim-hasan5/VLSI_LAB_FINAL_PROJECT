library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        acc_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        acc_out : out STD_LOGIC_VECTOR(7 downto 0);
        z_out   : out STD_LOGIC
    );
end registers;

architecture Behavioral of registers is
    signal acc_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal z_reg   : STD_LOGIC := '1';
	 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                acc_reg <= (others => '0');
                z_reg   <= '1';
            else
                acc_reg <= acc_in;
                if acc_in = x"00" then
                    z_reg <= '1';
                else
                    z_reg <= '0';
                end if;
            end if;
        end if;
    end process;
	 
	 acc_out <= acc_reg;
    z_out   <= z_reg;
end Behavioral;