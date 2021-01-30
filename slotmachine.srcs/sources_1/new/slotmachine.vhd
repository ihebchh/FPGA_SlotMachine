----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2020 15:12:07
-- Design Name: 
-- Module Name: slotmachine - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity slotmachine is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           f : out STD_LOGIC;
           r : out STD_LOGIC);
end slotmachine;

architecture Behavioral of slotmachine is
type state_type is (repos,e1 , e2 , e3 ,e4 ,e5 ,e6); 
   signal state, next_state : state_type;
   signal m :std_logic_vector(1 downto 0):="00";
begin
m<=p2&p1;
SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (rst = '1') then
            state <= repos;
            
         else
            state <= next_state;
            
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;
   NEXT_STATE_DECODE: process (state, m)
      begin
         --declare default state for next_state to avoid latches
         next_state <= state;  --default is to stay in current state
         --insert statements to decode next_state
         --below is a simple example
         case (state) is
            when repos => 
               if m="10"  then
                  next_state <= e2;
               elsif m="01" then 
               next_state <= e1; 
               else 
               next_state <= repos;
               end if;
               f<='0';
               r<='0';
               
               when e1 => 
              if m="01"  then
              next_state <= e2;
              elsif m="10" then 
               next_state <= e3; 
               else 
               next_state <= e1;
               end if;
               f<='0';
               r<='0';
               
               
               when e2 => 
                             if m="01"  then
                             next_state <= e3;
                             elsif m="10" then 
                              next_state <= e4; 
                              else 
                              next_state <= e2;
                              end if;
                              f<='0';
                              r<='0';
                              
                              
                              
                when e3 => 
                            if m="01"  then
                            next_state <= e4;
                            elsif m="10" then 
                             next_state <= e5; 
                             else 
                             next_state <= e3;
                             end if;
                             f<='0';
                             r<='0'; 
                 when e4 => 
                             if m="01"  then
                             next_state <= e5;
                             elsif m="10" then 
                              next_state <= e6; 
                              else 
                              next_state <= e4;
                              end if;
                              f<='0';
                              r<='0'; 
                                          
                  when e5 => 
                           
                           next_state <= repos;
                            f<='1';
                            r<='0';
                   when e6 => 
                              next_state <= repos;
                              f<='1';
                              r<='1';  
                                     
               when others =>
                                          next_state <= repos;
            
         end case;      
      end process;


end Behavioral;
