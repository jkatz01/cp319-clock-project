library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity split is
  port (bcd : in unsigned(5 downto 0); 
  splittable : out std_logic_vector(6 downto 0)); 
end split;

architecture behaviour of split is

begin
  process (bcd)
  begin
    case bcd is
		when "000000" => splittable <= "0000000";
		when "000001" => splittable <= "0000001";
		when "000010" => splittable <= "0000010";
		when "000011" => splittable <= "0000011";
		when "000100" => splittable <= "0000100";
		when "000101" => splittable <= "0000101";
		when "000110" => splittable <= "0000110";
		when "000111" => splittable <= "0000111";
		when "001000" => splittable <= "0001000";
		when "001001" => splittable <= "0001001";
		when "001010" => splittable <= "0010000";
		when "001011" => splittable <= "0010001";
		when "001100" => splittable <= "0010010";
		when "001101" => splittable <= "0010011";
		when "001110" => splittable <= "0010100";
		when "001111" => splittable <= "0010101";
		when "010000" => splittable <= "0010110";
		when "010001" => splittable <= "0010111";
		when "010010" => splittable <= "0011000";
		when "010011" => splittable <= "0011001";
		when "010100" => splittable <= "0100000";
		when "010101" => splittable <= "0100001";
		when "010110" => splittable <= "0100010";
		when "010111" => splittable <= "0100011";
		when "011000" => splittable <= "0100100";
		when "011001" => splittable <= "0100101";
		when "011010" => splittable <= "0100110";
		when "011011" => splittable <= "0100111";
		when "011100" => splittable <= "0101000";
		when "011101" => splittable <= "0101001";
		when "011110" => splittable <= "0110000";
		when "011111" => splittable <= "0110001";
		when "100000" => splittable <= "0110010";
		when "100001" => splittable <= "0110011";
		when "100010" => splittable <= "0110100";
		when "100011" => splittable <= "0110101";
		when "100100" => splittable <= "0110110";
		when "100101" => splittable <= "0110111";
		when "100110" => splittable <= "0111000";
		when "100111" => splittable <= "0111001";
		when "101000" => splittable <= "1000000";
		when "101001" => splittable <= "1000001";
		when "101010" => splittable <= "1000010";
		when "101011" => splittable <= "1000011";
		when "101100" => splittable <= "1000100";
		when "101101" => splittable <= "1000101";
		when "101110" => splittable <= "1000110";
		when "101111" => splittable <= "1000111";
		when "110000" => splittable <= "1001000";
		when "110001" => splittable <= "1001001";
		when "110010" => splittable <= "1010000";
		when "110011" => splittable <= "1010001";
		when "110100" => splittable <= "1010010";
		when "110101" => splittable <= "1010011";
		when "110110" => splittable <= "1010100";
		when "110111" => splittable <= "1010101";
		when "111000" => splittable <= "1010110";
		when "111001" => splittable <= "1010111";
		when "111010" => splittable <= "1011000";
		when "111011" => splittable <= "1011001";
        when others => splittable <= "1111111";
    end case;
  end process;
end behaviour;
