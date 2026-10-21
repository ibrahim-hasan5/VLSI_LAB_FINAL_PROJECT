library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        acc_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        operand : in  STD_LOGIC_VECTOR(7 downto 0);
        alu_op  : in  STD_LOGIC_VECTOR(2 downto 0);
        result  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end alu;

architecture Behavioral of alu is
begin
    process(acc_in, operand, alu_op)
    begin
        case alu_op is
            when "001" => -- LDI
                result <= operand;
            when "010" => -- ADD
                result <= std_logic_vector(unsigned(acc_in) + unsigned(operand));
            when "011" => -- XOR
                result <= acc_in xor operand;
            when "100" => -- NOT
				    result <= not acc_in;
            when "101" => -- SHL
                result <= acc_in(6 downto 0) & '0';
            when others =>
                result <= acc_in;
        end case;
    end process;
end Behavioral;