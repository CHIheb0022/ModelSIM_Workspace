library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Make use of the following code: Copy paste each entity associated with it's architecture in a seperate file --

entity and_ab is
port ( a : in std_logic ;
b : in std_logic ;
c : out std_logic ) ;
end and_ab ;

entity or_ab is
port ( a : in std_logic ;
b : in std_logic ;
c : out std_logic ) ;
end or_ab ;

entity xor_ab is
port ( a : in std_logic ;
b : in std_logic ;
c : out std_logic ) ;
end xor_ab ;

entity nand_ab is
port ( a : in std_logic ;
b : in std_logic ;
c : out std_logic ) ;
end nand_ab ;

entity nor_ab is
port ( a : in std_logic ;
b : in std_logic ;
c : out std_logic ) ;
end nor_ab ;

Architecture behv_and of and_ab is
begin
c <= a and b ;
end behv_and ;

Architecture behv_or of or_ab is
begin
c <= a or b ;
end behv_or ;

Architecture behv_xor of xor_ab is
begin
c <= a xor b ;
end behv_xor ;

Architecture behv_nand of nand_ab is
begin
c <= a nand b ;
end behv_nand ;

Architecture behv_nor of nor_ab is
begin
c <= a nor b ;
end behv_nor ;


