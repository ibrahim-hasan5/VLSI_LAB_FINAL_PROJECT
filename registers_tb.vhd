library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_registers is
end tb_registers;

architecture Behavior of tb_registers is
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal acc_in  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal acc_out : STD_LOGIC_VECTOR(7 downto 0);
    signal z_out   : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;
begin
    uut: entity work.registers
        port map (
            clk     => clk,
            reset   => reset,
            acc_in  => acc_in,
            acc_out => acc_out,
            z_out   => z_out
        );
		  
	 clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
	 
	 stim_proc: process
    begin
        -- Test RESET
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';

        -- Non-zero output -> Z flag = 0
        acc_in <= x"A5";
        wait for CLK_PERIOD;
		  
		  -- Zero output -> Z flag = 1
        acc_in <= x"00";
        wait for CLK_PERIOD;
        wait;
    end process;
end Behavior;