library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cpu is
end tb_cpu;

architecture Behavior of tb_cpu is
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);
    signal Z     : STD_LOGIC;
    signal PC_out: STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;
begin
    uut: entity work.cpu_top
        port map (
            CLK    => CLK,
            RESET  => RESET,
            Q      => Q,
            Z      => Z,
            PC_out => PC_out
        );

    clk_process :process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        -- Assert RESET for 1 clock edge
        RESET <= '1';
        wait for CLK_PERIOD;
        RESET <= '0';
        
        -- Run for 8 instruction cycles
        wait for CLK_PERIOD * 8;
        
        wait;
    end process;
end Behavior;