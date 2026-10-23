library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        opcode : in  STD_LOGIC_VECTOR(3 downto 0);
        alu_op : out STD_LOGIC_VECTOR(2 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is
begin
    process(opcode)
    begin
        case opcode is
            when "0001" => alu_op <= "001"; -- LDI
            when "0010" => alu_op <= "010"; -- ADD
            when "0110" => alu_op <= "011"; -- XOR
            when "0111" => alu_op <= "100"; -- NOT
            when "1000" => alu_op <= "101"; -- SHL
            when others => alu_op <= "000"; -- NOP
        end case;
    end process;
end Behavioral;