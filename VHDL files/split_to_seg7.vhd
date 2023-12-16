library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity split_to_seg7 is
  port (splittable : in std_logic_vector(6 downto 0); 
        segments1 : out std_logic_vector(6 downto 0);
        segments2 : out std_logic_vector(6 downto 0)); 
end split_to_seg7;

architecture behaviour of split_to_seg7 is

begin
  process (splittable)
  begin
    case splittable(3 downto 0) is
    	when "0000" => segments2 <= "1111110"; 
      	when "0001" => segments2 <= "0110000"; 
      	when "0010" => segments2 <= "1101101"; 
      	when "0011" => segments2 <= "1111001"; 
      	when "0100" => segments2 <= "0110011"; 
      	when "0101" => segments2 <= "1011011"; 
      	when "0110" => segments2 <= "1011111"; 
      	when "0111" => segments2 <= "1110000"; 
      	when "1000" => segments2 <= "1111111"; 
      	when "1001" => segments2 <= "1110011"; 
      	when others => segments2 <= "0000000"; 
    end case;
    
    case splittable(6 downto 4) is
      when "000" => segments1 <= "1111110"; 
      when "001" => segments1 <= "0110000"; 
      when "010" => segments1 <= "1101101"; 
      when "011" => segments1 <= "1111001"; 
      when "100" => segments1 <= "0110011"; 
      when "101" => segments1 <= "1011011"; 
      when "110" => segments1 <= "1011111"; 
      when others => segments1 <= "0000000";
    end case;
  end process; 
end behaviour;
