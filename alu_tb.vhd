library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu is
end tb_alu;

architecture Behavior of tb_alu is
    signal acc_in  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal operand : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal alu_op  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal result  : STD_LOGIC_VECTOR(7 downto 0);
begin
    uut: entity work.alu
        port map (
            acc_in  => acc_in,
            operand => operand,
            alu_op  => alu_op,
            result  => result
        );

    stim_proc: process
    begin
	     -- Test LDI (001)
        operand <= x"55"; alu_op <= "001"; wait for 10 ns;
        
        -- Test XOR (011)
        acc_in <= x"55"; operand <= x"FF"; alu_op <= "011"; wait for 10 ns;
        
        -- Test NOT (100)
        acc_in <= x"AA"; alu_op <= "100"; wait for 10 ns;
        
        -- Test SHL (101)
        acc_in <= x"55"; alu_op <= "101"; wait for 10 ns;
		  
		  -- Test ADD (010)
        acc_in <= x"AA"; operand <= x"56"; alu_op <= "010"; wait for 10 ns;
        wait;
    end process;
end Behavior;
	 
	 