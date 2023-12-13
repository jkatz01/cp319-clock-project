library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture Behavior of counter_tb is
    
    component counter
    port ( clk : in STD_LOGIC;
           D : in unsigned(5 downto 0);
           Q : out unsigned(5 downto 0);
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC;
           max_val : in unsigned(5 downto 0));
    end component;
    
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal ctrl : std_logic_vector(1 downto 0) := (others => '0');
    signal D : unsigned(5 downto 0) := "100000";
    signal max_val : unsigned(5 downto 0) := "100100";
    
    signal Q : unsigned(5 downto 0);
    
    constant clk_period : time := 10 ns;
    
begin

    uut: counter port map(
        clk => clk,
        D => D,
        Q => Q,
        ctrl => ctrl,
        reset => reset,
        max_val => max_val);
        
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
    end process;
    
    reset <= '1';
    D <= "001000";
    max_val <= "111100";
    ctrl <= "00", "01" after 70 ns, "10" after 130 ns, "01" after 200 ns;
    
end Behavior;