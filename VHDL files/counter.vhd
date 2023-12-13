library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( clk : in STD_LOGIC;
           D : in unsigned(5 downto 0);
           Q : out unsigned(5 downto 0);
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC;
           max_val : in unsigned(5 downto 0));
end counter;

-- CONTROL TABLE
-- ctrl     function
-- 00       hold
-- 01       count up
-- 10       load D into Q
-- 11       output wipe

architecture structure of counter is
        
    signal processQ : unsigned(5 downto 0);
    
begin

    process(clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '0') then -- resets the input to D on reset low
                processQ <= D;
            elsif (ctrl = "00") then -- holds when 00
                processQ <= processQ;
            elsif (ctrl = "01") then -- counts normally when 01
                if (processQ < max_val) then -- counts if value less than max
                    processQ <= processQ + 1;
                else -- otherwise loads value
                    processQ <= D;
                end if;
            elsif (ctrl = "10") then -- loads D into output
                processQ <= D;
            elsif (ctrl = "11") then -- clears output
                processQ <= (others => '0');
            end if;
        end if;
    end process;
     
    Q <= processQ;

end structure;