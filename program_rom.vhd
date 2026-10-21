library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
    Port (
        addr : in  STD_LOGIC_VECTOR(3 downto 0);
        data : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is
    type rom_type is array (0 to 15) of std_logic_vector(11 downto 0);
    -- Set 2 Appendix B Program
    constant ROM : rom_type := (
        0 => x"155", -- LDI 0x55
        1 => x"6FF", -- XOR 0xFF
        2 => x"700", -- NOT
        3 => x"800", -- SHL
        4 => x"256", -- ADD 0x56
        5 => x"681", -- XOR 0x81
        6 => x"800", -- SHL
        others => x"000" -- NOP
    );
begin
    data <= ROM(to_integer(unsigned(addr)));
end Behavioral;