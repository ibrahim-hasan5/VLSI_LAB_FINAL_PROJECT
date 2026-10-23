library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(7 downto 0);
        Z     : out STD_LOGIC;
        PC_out: out STD_LOGIC_VECTOR(3 downto 0)
    );
end cpu_top;

architecture Structural of cpu_top is
    signal pc_current : STD_LOGIC_VECTOR(3 downto 0);
    signal instr      : STD_LOGIC_VECTOR(11 downto 0);
    signal alu_op     : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_res    : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_val    : STD_LOGIC_VECTOR(7 downto 0);
begin
    u_pc: entity work.pc
        port map (
            clk       => CLK,
            reset     => RESET,
            jz_take   => '0',
            jz_target => (others => '0'),
            pc_out    => pc_current
        );

    u_rom: entity work.program_rom
        port map (
            addr => pc_current,
            data => instr
        );

    u_control: entity work.control_unit
        port map (
            opcode => instr(11 downto 8),
            alu_op => alu_op
        );

    u_alu: entity work.alu
        port map (
            acc_in  => acc_val,
            operand => instr(7 downto 0),
            alu_op  => alu_op,
            result  => alu_res
        );

    u_registers: entity work.registers
        port map (
            clk     => CLK,
            reset   => RESET,
            acc_in  => alu_res,
            acc_out => acc_val,
            z_out   => Z
        );

    Q      <= acc_val;
    PC_out <= pc_current;
end Structural;