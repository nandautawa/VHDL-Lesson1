library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity state_machine is
 port (
  clk : in std_logic;
  rst : in std_logic;
  
  sIDLE : out std_logic;   --IDLE Status Indicatornya
  Lampuhijau : out std_logic;
  Lampukuning :out std_logic;
  Lampumerah : out std_logic
  );
  end state_machine;
  
  architecture bikin of state_machine is
  --Bagian sini tempat deklarasi masing2 status aktiv dalam 10clock cycles. count from 0 -> 9.
  constant perubahan_durasi : std_logic_vector(3 downto 0) := X"9";
  
  type states is (state_sIDLE, state_Lampuhijau, state_Lampukuning, state_Lampumerah);
  signal status_sekarang : states;   --current status
  signal status_selanjutnya : states; --Next States
  --Keep track of time each state. 4 bits are enough to cover 10-cycle duration
  signal count : std_logic_vector(3 downto 0) := (others => '0');
  
  begin
 --Mulai bikin status sequencenya
 process(clk)
 begin
  if rising_edge(clk) then
    if rst = '1' then
      status_sekarang <= state_sIDLE;
    else
      status_sekarang <= status_selanjutnya;
    end if;
  end if;
 end process;
 
 --Next state transistion based on current state and input condition
 process (status_sekarang, count)
 begin
  case (status_sekarang) is
     when state_sIDLE =>
            status_selanjutnya <= state_Lampuhijau;
     when state_Lampuhijau =>
            if (count = perubahan_durasi) then
                status_selanjutnya <= state_Lampukuning;
             end if;
     when state_Lampukuning =>
            if (count = perubahan_durasi) then
                status_selanjutnya <= state_Lampumerah;
             end if;
     when state_Lampumerah =>
            if (count = perubahan_durasi) then
                status_selanjutnya <= state_Lampuhijau;
              end if;
  end case;
end process;

--Sekarang bikin Output
process (status_sekarang)
begin
 --default unless a certain state activities a particular output
   sIDLE <= '0';
   Lampuhijau <= '0';
   Lampukuning <= '0';
   Lampumerah <= '0';
  
case (status_sekarang) is
    when state_sIDLE => sIDLE <= '1';
    when state_Lampuhijau => Lampuhijau <= '1';
    when state_Lampukuning => Lampukuning <= '1';
    when state_Lampumerah => Lampumerah <= '1';
 end case;
end process;

--Track time duration in each state
process (clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            count <= (others => '0');
        elsif (status_sekarang /= status_selanjutnya) then
            count <= (others => '0');
        elsif (count /= perubahan_durasi) then
            count <= count + 1;
        end if;
    end if;
end process;

end bikin;