library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity password_lock is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        password : in  STD_LOGIC_VECTOR (3 downto 0);
        unlock   : out STD_LOGIC;
        alarm    : out STD_LOGIC
    );
end password_lock;

architecture Behavioral of password_lock is
    constant CORRECT_PASSWORD : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    signal state : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= '0';
            unlock <= '0';
            alarm <= '0';
        elsif rising_edge(clk) then
            if password = CORRECT_PASSWORD then
                state <= '1';
                unlock <= '1';
                alarm <= '0';
            else
                state <= '0';
                unlock <= '0';
                alarm <= '1';
            end if;
        end if;
    end process;
end Behavioral;