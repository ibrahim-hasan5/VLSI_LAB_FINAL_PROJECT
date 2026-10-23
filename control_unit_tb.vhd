library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_unit is
end tb_control_unit;

architecture Behavior of tb_control_unit is
    -- Signal declarations
    signal opcode : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal alu_op : STD_LOGIC_VECTOR(2 downto 0);
	 
begin
    -- Instantiate the Control Unit
    uut: entity work.control_unit
        port map (
            opcode => opcode,
            alu_op => alu_op
        );
		  
	 -- Stimulus process
    stim_proc: process
    begin
        -- Test LDI Opcode (0001) -> Expected alu_op: 001
        opcode <= "0001";
        wait for 10 ns;

        -- Test ADD Opcode (0010) -> Expected alu_op: 010
        opcode <= "0010";
        wait for 10 ns;
		  
		  -- Test XOR Opcode (0110) -> Expected alu_op: 011
        opcode <= "0110";
        wait for 10 ns;

        -- Test NOT Opcode (0111) -> Expected alu_op: 100
        opcode <= "0111";
        wait for 10 ns;

        -- Test SHL Opcode (1000) -> Expected alu_op: 101
        opcode <= "1000";
        wait for 10 ns;
		  
		  -- Test NOP / Unused Opcode (0000) -> Expected alu_op: 000
        opcode <= "0000";
        wait for 10 ns;

        wait;
    end process;

end Behavior;