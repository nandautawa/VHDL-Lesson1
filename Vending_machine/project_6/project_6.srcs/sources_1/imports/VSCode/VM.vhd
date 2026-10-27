library IEEE;
use IEEE.std_logic_1164.all;


--Note :
--  Rp 0            = "000"
--  Rp 1000         = "001"
--  Rp 2000         = "010"
--  Rp 5000         = "011"
--  Rp 10000         = "100"
--  Rp 20000         = "101"
--  Rp 50000         = "110"
--  Rp 100000         = "111"
--  Harga Barang:
--      Choose = 1 : Rp 1000
--      Choose = 2 : Rp 2000
--      Choose = 3 : Rp 3000
--      Choose = 4 : Rp 4000
--      Choose = 5 : Rp 5000
--      Choose = 6 : Rp 6000
--      Choose = 7 : Rp 7000
--      Choose = 10 : Rp 10000
--      Choose = 15 : Rp 15000
--      Choose = 20 : Rp 20000

entity vending_machine is
    port(
        clock: in std_logic;
        reset: in std_logic;
        in_money: in std_logic_vector (2 downto 0);
        choose: in integer := 0;
        thing: out integer := 0; --thing = barangnya
        out_money_1: out std_logic_vector (2 downto 0);
        out_money_2: out std_logic_vector (2 downto 0);
        out_money_3: out std_logic_vector (2 downto 0);
        out_money_4: out std_logic_vector (2 downto 0);
        out_money_5: out std_logic_vector (2 downto 0);
        out_money_6: out std_logic_vector (2 downto 0)
    );
end entity;

architecture VM of vending_machine is
    type state_type is
        (
            idle, money_in, thing_out,
            in_1, in_2, in_3, in_4, in_5,
            in_6, in_7, in_8, in_9, in_10,
            in_11, in_12, in_13, in_14, in_15,
            in_16, in_17, in_18, in_19, in_20,
            in_21, in_22, in_23, in_24, in_25,
            in_26, in_27, in_28, in_29, in_30,
            in_31, in_32, in_33, in_34, in_35,
            in_36, in_37, in_38, in_39, in_50,
            in_51, in_52, in_53, in_54, in_55,
            in_56, in_57, in_58, in_59, in_60,
            in_61, in_62, in_63, in_64, in_65,
            in_66, in_67, in_68, in_69, in_100,
            in_101, in_102, in_103, in_104, in_105,
            in_106, in_107, in_108, in_109, in_110,
            in_111, in_112, in_113, in_114, in_115,
            in_116, in_117, in_118, in_119
            );
            signal current_state, next_state: state_type;
begin
    machine_state : process(clock,reset)
    begin
        if(reset='1') then
            current_state <= idle;
        elsif(clock'event and clock = '1' ) then
            current_state <= next_state;
        end if;
    end process;
    FSM : process(current_state, in_money)
    begin
        if(choose = 1) then
            case current_state is
                when idle => --state reset or idle
                thing <= 0;
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in;
                when money_in =>
                    if(in_money = "000") then       --Insert Rp 0
                        next_state <= money_in;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000
                        next_state <= in_1;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000
                        next_state <= in_5;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000
                        next_state <= in_10;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000
                        next_state <= in_20;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000
                        next_state <= in_50;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000
                        next_state <= in_100;
                        thing <= 0;
                    end if;
                when in_1 =>
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= thing_out;  --Maka barang keluar
                when in_2 => -- jika yg dimasukkan Rp2000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "001";
                next_state  <= thing_out;  --Maka barang keluar
                when in_5 => --jika Rp5000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "010";
                out_money_6 <= "010";
                next_state  <= thing_out;  --Maka barang keluar
                when in_10 => --jika Rp10000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "010";
                out_money_5 <= "010";
                out_money_6 <= "011";
                next_state  <= thing_out;  --Maka barang keluar 
                when in_20 => --jika Rp20000  kembalian 19000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "010";
                out_money_4 <= "010";
                out_money_5 <= "011";
                out_money_6 <= "100";
                next_state  <= thing_out;  --Maka barang keluar
                when in_50 => --jika Rp50000 kembali 49000
                out_money_1 <= "000";
                out_money_2 <= "010"; --2rb
                out_money_3 <= "010"; --2rb
                out_money_4 <= "011"; --5rb
                out_money_5 <= "101"; --20rb
                out_money_6 <= "101"; --20rb
                next_state  <= thing_out;  --Maka barang keluar
                when in_100 => --Rp100000 kembali 99000
                out_money_1 <= "010"; --2rb
                out_money_2 <= "010"; --2rb
                out_money_3 <= "011"; --5rb
                out_money_4 <= "101"; --20rb
                out_money_5 <= "101"; --20rb
                out_money_6 <= "110"; --50rb
                next_state  <= thing_out;  --Maka barang keluar

                when thing_out =>  --ketika barang sudah dikeluarkan
                    thing <= choose;   --maka barang yg dikeluarkan sesuai yg dipilih pembeli
                    next_state <= money_in; -- kemudian customer bisa membeli lagi dengan memasukkan uang

                when others =>  --Jika step2 diatas  tidak terpenuhi
                thing <= 0;      --ini masuk ke mode idle sebenarnya
                out_money_1 <= "000"; -- gak ada duit yg keluar
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in; --kemudian meminta customer memasukkan uang kemabali
            end case;
        elsif(choose=2) then --jika milih barang ke dua harga Rp 2000
            case current_state is
                when idle => --state reset or idle
                thing <= 0;
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in;
                when money_in =>
                    if(in_money = "000") then       --Insert Rp 0       
                        next_state <= money_in;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000
                        next_state <= in_1;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000
                        next_state <= in_5;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000
                        next_state <= in_10;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000
                        next_state <= in_20;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000
                        next_state <= in_50;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000
                        next_state <= in_100;
                        thing <= 0;
                    end if;
                when in_1 =>
                    if(in_money = "000") then       --Insert Rp 0   (1000)
                        next_state <= in_1;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000  Lagi (2000)
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000  lagi  (3000)
                        next_state <= in_3;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000  lagi  (6000)
                        next_state <= in_6;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000 lagi  (11000)
                        next_state <= in_11;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000 lagi  (21000)
                        next_state <= in_21;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000 lagi  (51000)
                        next_state <= in_51;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000 lagi  (101000)
                        next_state <= in_101;
                        thing <= 0;
                    end if;
                when in_2 => --Ketika uangnya 2000 pas maka tidak ada kembalian
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= thing_out;  --Maka barang keluar
                when in_3 => --Rp3000 kembali 1000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "001"; --1000
                next_state  <= thing_out;  --Maka barang keluar
                when in_5 => --Rp5000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "001"; --1000
                out_money_6 <= "010"; --2000
                next_state  <= thing_out;  --Maka barang keluar
                when in_6 => --Rp6000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "010"; --2000
                out_money_6 <= "010"; --2000
                next_state  <= thing_out;  --Maka barang keluar
                when in_10 => --Rp10000 maka kembali 8000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "001"; --1000
                out_money_5 <= "010"; --2000
                out_money_6 <= "011"; --5000
                next_state  <= thing_out;  --Maka barang keluar  
                when in_11 => --Rp11000 maka kembali 9000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "010"; --2000
                out_money_5 <= "010"; --2000
                out_money_6 <= "011"; --5000
                next_state  <= thing_out;  --Maka barang keluar 
                when in_20 => --Rp20000 maka kembali 18000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "001"; --1000
                out_money_4 <= "010"; --2000
                out_money_5 <= "011"; --5000
                out_money_6 <= "100"; --10000
                next_state  <= thing_out;  --Maka barang keluar
                when in_21 => --Rp21000 maka kembali 19000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "010"; --2000
                out_money_4 <= "010"; --2000
                out_money_5 <= "011"; --5000
                out_money_6 <= "100"; --10000
                next_state  <= thing_out;  --Maka barang keluar
                when in_50 => --Rp50000 maka kembali 48000
                out_money_1 <= "000";
                out_money_2 <= "001"; --1000
                out_money_3 <= "010"; --2000
                out_money_4 <= "011"; --5000
                out_money_5 <= "101"; --20000
                out_money_6 <= "101"; --20000
                next_state  <= thing_out;  --Maka barang keluar
                when in_51 => --Rp51000 maka kembali 49000
                out_money_1 <= "000";
                out_money_2 <= "010"; --2000
                out_money_3 <= "010"; --2000
                out_money_4 <= "011"; --5000
                out_money_5 <= "101"; --20000
                out_money_6 <= "101"; --20000
                next_state  <= thing_out;  --Maka barang keluar
                when in_100 => --Rp100000 maka kembali 98000
                out_money_1 <= "001"; --1000
                out_money_2 <= "010"; --2000
                out_money_3 <= "011"; --5000
                out_money_4 <= "101"; --20000
                out_money_5 <= "101"; --20000
                out_money_6 <= "110"; --50000
                next_state  <= thing_out;  --Maka barang keluar
                when in_101 => --Rp101000 maka kembali 99000
                out_money_1 <= "010"; --2000
                out_money_2 <= "010"; --2000
                out_money_3 <= "011"; --5000
                out_money_4 <= "101"; --2000
                out_money_5 <= "101"; --20000
                out_money_6 <= "110"; --50000
                next_state  <= thing_out;  --Maka barang keluar

                when thing_out =>
                    thing <= choose;
                    next_state <= money_in;

                when others =>
                thing <= 0;
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in;
            end case;

        elsif(choose=3) then --jika milih barang ke tiga harga Rp 3000
            case current_state is
                when idle => --state reset or idle
                thing <= 0;
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in;
                when money_in =>
                    if(in_money = "000") then       --Insert Rp 0       
                        next_state <= money_in;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000
                        next_state <= in_1;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000
                        next_state <= in_5;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000
                        next_state <= in_10;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000
                        next_state <= in_20;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000
                        next_state <= in_50;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000
                        next_state <= in_100;
                        thing <= 0;
                    end if;
                when in_1 =>
                    if(in_money = "000") then       --Insert Rp 0   (1000)
                        next_state <= in_1;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000  Lagi (2000)
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000  lagi  (3000)
                        next_state <= in_3;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000  lagi  (6000)
                        next_state <= in_6;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000 lagi  (11000)
                        next_state <= in_11;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000 lagi  (21000)
                        next_state <= in_21;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000 lagi  (51000)
                        next_state <= in_51;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000 lagi  (101000)
                        next_state <= in_101;
                        thing <= 0;
                    end if;
                when in_2 =>
                    if(in_money = "000") then       --Insert Rp 0   (2000)
                        next_state <= in_2;
                        thing <= 0;
                    elsif(in_money = "001") then       --Insert Rp 1000  Lagi (3000)
                        next_state <= in_3;
                        thing <= 0;
                    elsif(in_money = "010") then       --Insert Rp 2000  lagi  (4000)
                        next_state <= in_4;
                        thing <= 0;
                    elsif(in_money = "011") then       --Insert Rp 5000  lagi  (7000)
                        next_state <= in_7;
                        thing <= 0;
                    elsif(in_money = "100") then       --Insert Rp 10000 lagi  (12000)
                        next_state <= in_12;
                        thing <= 0;
                    elsif(in_money = "101") then       --Insert Rp 20000 lagi  (22000)
                        next_state <= in_22;
                        thing <= 0;
                    elsif(in_money = "110") then       --Insert Rp 50000 lagi  (52000)
                        next_state <= in_52;
                        thing <= 0;
                    elsif(in_money = "111") then       --Insert Rp 100000 lagi  (102000)
                        next_state <= in_102;
                        thing <= 0;
                    end if;
                when in_3 => --Rp3000 pas
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000"; 
                next_state  <= thing_out;  --Maka barang keluar
                when in_4 => --Rp4000 kembali 1000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "001"; --1000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_5 => --Rp5000 kembali 2000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "010"; --2000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_6 => --Rp6000 kembali 3000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "001"; --1000
                out_money_6 <= "010"; --2000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_7 => --Rp7000 kembali 4000
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "010"; --2000
                out_money_6 <= "010"; --2000 
                next_state  <= thing_out;  --Maka barang keluar
                -- in_8 kalo misal 2000x 4kali ??? gimna?
                when in_10 => --Rp10000 kembali 7000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "010"; --2000
                out_money_6 <= "011"; --5000 
                next_state  <= thing_out;  --Maka barang 
                when in_11 => --Rp11000 kembali 8000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "001"; --1000
                out_money_5 <= "010"; --2000
                out_money_6 <= "011"; --5000
                when in_12 => --Rp12000 kembali 9000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "010"; --2000
                out_money_5 <= "010"; --2000
                out_money_6 <= "011"; --5000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_20 => --Rp20000 kembali 17000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "010"; --2000
                out_money_5 <= "011"; --5000
                out_money_6 <= "100"; --10000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_21 => --Rp21000 kembali 18000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "001"; --1000
                out_money_4 <= "010"; --2000
                out_money_5 <= "011"; --5000
                out_money_6 <= "100"; --10000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_22 => --Rp22000 kembali 19000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "010"; --2000
                out_money_4 <= "010"; --2000
                out_money_5 <= "011"; --5000
                out_money_6 <= "100"; --10000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_50 => --Rp50000 kembali 47000 
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "010"; --2000
                out_money_4 <= "011"; --5000
                out_money_5 <= "101"; --20000
                out_money_6 <= "101"; --20000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_51 => --Rp20000 kembali 48000 
                out_money_1 <= "000";
                out_money_2 <= "001"; --1000
                out_money_3 <= "010"; --2000
                out_money_4 <= "011"; --5000
                out_money_5 <= "101"; --20000
                out_money_6 <= "101"; --20000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_52 => --Rp20000 kembali 49000 
                out_money_1 <= "000";
                out_money_2 <= "010"; --2000
                out_money_3 <= "010"; --2000
                out_money_4 <= "011"; --5000
                out_money_5 <= "101"; --20000
                out_money_6 <= "101"; --20000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_100 => --Rp100000 kembali 97000 
                out_money_1 <= "000";
                out_money_2 <= "010"; --2000
                out_money_3 <= "011"; --5000
                out_money_4 <= "101"; --20000
                out_money_5 <= "101"; --20000
                out_money_6 <= "110"; --50000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_101 => --Rp101000 kembali 98000 
                out_money_1 <= "001"; --1000
                out_money_2 <= "010"; --2000
                out_money_3 <= "011"; --5000
                out_money_4 <= "101"; --20000
                out_money_5 <= "101"; --20000
                out_money_6 <= "110"; --50000 
                next_state  <= thing_out;  --Maka barang keluar
                when in_102 => --Rp102000 kembali 99000 
                out_money_1 <= "010"; --2000 
                out_money_2 <= "010"; --2000
                out_money_3 <= "011"; --5000
                out_money_4 <= "101"; --20000
                out_money_5 <= "101"; --20000
                out_money_6 <= "110"; --50000 
                next_state  <= thing_out;  --Maka barang keluar

                when thing_out =>
                    thing <= choose;
                    next_state <= money_in;

                when others =>
                thing <= 0;
                out_money_1 <= "000";
                out_money_2 <= "000";
                out_money_3 <= "000";
                out_money_4 <= "000";
                out_money_5 <= "000";
                out_money_6 <= "000";
                next_state  <= money_in;
            end case;
            
--Ini bisa di lanjut sampai Choose 20
--Lanjut sampai When in_119 =>

        end if;
    end process FSM;
end VM;