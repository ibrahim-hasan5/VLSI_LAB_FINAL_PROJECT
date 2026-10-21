library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pc is
end tb_pc;

architecture Behavior of tb_pc is
    signal clk       : STD_LOGIC := '0';
    signal reset     : STD_LOGIC := '0';
    signal jz_take   : STD_LOGIC := '0';
    signal jz_target : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal pc_out    : STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 10 ns; 
begin
    uut: entity work.pc
        port map (
            clk       => clk,
            reset     => reset,
            jz_take   => jz_take,
            jz_target => jz_target,
            pc_out    => pc_out
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
        -- Test Synchronous Reset
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        
        -- Verify Normal Increment (PC = PC + 1)
        wait for CLK_PERIOD * 3;
        
        -- Test Jump Target (JZ)
        jz_target <= "0101";
        jz_take <= '1';
        wait for CLK_PERIOD;
        jz_take <= '0';
        
        wait for CLK_PERIOD * 2;
        wait;
    end process;
end Behavior;

	 

	 