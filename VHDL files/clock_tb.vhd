library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_tb is
end clock_tb;

architecture Behavior of clock_tb is
    
    component clock
    Port ( clk : in STD_LOGIC;
           alarm_in_s : in unsigned(5 downto 0);
           alarm_in_m : in unsigned(5 downto 0);
           Q_s : out unsigned(5 downto 0);
           Q_m : out unsigned(5 downto 0);
           alarm_q : out STD_LOGIC;
           Seg_m1 : out std_logic_vector(6 downto 0);
     	   Seg_m2 : out std_logic_vector(6 downto 0);
           Seg_s1 : out std_logic_vector(6 downto 0);
           Seg_s2 : out std_logic_vector(6 downto 0));
    end component;
    
    signal clk : std_logic := '0';
    signal alarm_in_s : unsigned(5 downto 0) := "000110"; --6 seconds
    signal alarm_in_m : unsigned(5 downto 0) := "000001"; --1 minute
    signal alarm_q : std_logic;
    signal Q_s : unsigned(5 downto 0);
    signal Q_m : unsigned(5 downto 0);
    signal Seg_m1 : std_logic_vector(6 downto 0);
    signal Seg_m2 : std_logic_vector(6 downto 0);
    signal Seg_s1 : std_logic_vector(6 downto 0);
    signal Seg_s2 : std_logic_vector(6 downto 0);
    
    constant clk_period : time := 10 ns;
    
begin

    uut: clock port map(
        clk => clk,
        alarm_in_s => alarm_in_s,
        alarm_in_m => alarm_in_m,
        Q_s => Q_s,
        Q_m => Q_m,
        alarm_q => alarm_q,
        Seg_m1 => Seg_m1,
        Seg_m2 => Seg_m2,
        Seg_s1 => Seg_s1,
        Seg_s2 => Seg_s2);
        
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    
end Behavior;

    
end Behavior;
