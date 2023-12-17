library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock is
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
end clock;

architecture structure of clock is   
	--COUNTER declaration
    component counter
    port ( clk : in STD_LOGIC;
           D : in unsigned(5 downto 0);
           Q : out unsigned(5 downto 0);
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC;
           max_val : in unsigned(5 downto 0));
    end component;
    
    signal clk_1 : std_logic := '0';
    signal reset_1 : std_logic := '1';
    signal ctrl_1 : std_logic_vector(1 downto 0) := "01";
    signal D_1 : unsigned(5 downto 0) := "000000";
    signal max_val_1 : unsigned(5 downto 0) := "001001"; --MAX = 9 NOTICE: minutes are set to 10 seconds each for clarity in simulation
    signal Q_1 : unsigned(5 downto 0);
    
    
    signal clk_2 : std_logic := '0';
    signal reset_2 : std_logic := '1';
    signal ctrl_2 : std_logic_vector(1 downto 0) := "00"; --Only set to 01 when seconds=60 to increment minutes
    signal D_2 : unsigned(5 downto 0) := "000000";
    signal max_val_2 : unsigned(5 downto 0) := "001001"; --MAX = 9 NOTICE: seconds are reset at 10 seconds for clarity in simulation
    signal Q_2 : unsigned(5 downto 0);
    
    signal alarm_q_sig : std_logic := '0';
    
    component split
     port ( bcd : in unsigned(5 downto 0); 
  		splittable : out std_logic_vector(6 downto 0));
     end component;
     
     component split_to_seg7
       port ( splittable : in std_logic_vector(6 downto 0); 
        segments1 : out std_logic_vector(6 downto 0);
        segments2 : out std_logic_vector(6 downto 0)); 
	  end component;
     
	 signal msplit : std_logic_vector(6 downto 0);
     signal ssplit : std_logic_vector(6 downto 0);                          
    
begin

cnt_1: counter port map(
        clk => clk,
        D => D_1,
        Q => Q_1,
        ctrl => ctrl_1,
        reset => reset_1,
        max_val => max_val_1);
        
cnt_2: counter port map(
        clk => clk,
        D => D_2,
        Q => Q_2,
        ctrl => ctrl_2,
        reset => reset_2,
        max_val => max_val_2);
		
    -- initialize all signals so that they are not XX
    reset_1 <= '0', '1' after 10ns;
    reset_2 <= '0', '1' after 10ns;
    

process(clk)
    begin
      -- Base assumption: 10 ns for a real life second
      -- start logic
        if (rising_edge(clk)) then
            if (Q_1 = (max_val_1 - 1)) then -- Seconds = max so let counter_2 increment 
                ctrl_2 <= "01";
            elsif (Q_1 = (alarm_in_s - 1) and Q_2 = alarm_in_m) then -- (alarm_in_s - 1) so the alarm goes at the rising edge of the next second
            	alarm_q_sig <= '1', '0' after 30 ns; -- reset alarm back after 3 seconds
            else
            	ctrl_2 <= "00";
			end if;
        end if;
    end process;

    Q_s <= Q_1;
    Q_m <= Q_2;
  
  split_1: split port map(
		bcd => Q_s,
        splittable => ssplit);

  split_2: split port map(
		bcd => Q_m,
        splittable => msplit);
        
  segments1: split_to_seg7 port map(
		splittable => ssplit,
        segments1 => Seg_s1,
        segments2 => Seg_s2);
        
  segments2: split_to_seg7 port map(
		splittable => msplit,
        segments1 => Seg_m1,
        segments2 => Seg_m2);

    alarm_q <= alarm_q_sig;


end structure;
