library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_program_rom is
end tb_program_rom;

architecture Behavior of tb_program_rom is
    signal addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data : STD_LOGIC_VECTOR(11 downto 0);
begin
    uut: entity work.program_rom
        port map (
            addr => addr,
            data => data
        );
		  
	 stim_proc: process
    begin
        -- Check ROM contents for Set 2
        addr <= "0000"; wait for 100 ns; -- Expected: 0x155
        addr <= "0001"; wait for 100 ns; -- Expected: 0x6FF
        addr <= "0010"; wait for 100 ns; -- Expected: 0x700
        addr <= "0011"; wait for 100 ns; -- Expected: 0x800
		  addr <= "0100"; wait for 100 ns; -- Expected: 0x256
        addr <= "0101"; wait for 100 ns; -- Expected: 0x681
        addr <= "0110"; wait for 100 ns; -- Expected: 0x800
        wait;
    end process;
end Behavior;