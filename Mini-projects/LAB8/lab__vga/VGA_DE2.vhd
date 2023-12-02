library ieee;
use ieee.std_logic_1164.all;

entity vga_DE2 is
	port(
		CLOCK_50 :IN std_logic;						--	50 MHz
		reset:IN std_logic;							-- reset key
		SW: IN std_logic_vector (9 downto 0); 	-- switches
		VGA_CLK:OUT std_logic;			-- 
		VGA_HS: OUT std_logic;						-- VGA H_SYNC
		VGA_VS:OUT std_logic;						-- VGA V_SYNC
		VGA_BLANK:OUT std_logic;					-- VGA BLANK
		VGA_SYNC:OUT std_logic;					 	-- VGA SYNC
		VGA_R: OUT std_logic_vector(9 downto 0);	-- VGA Red[9:0]
		VGA_G: OUT std_logic_vector(9 downto 0);	-- VGA Green[9:0]
		VGA_B: OUT std_logic_vector(9 downto 0)	-- VGA Blue[9:0]
	);
end entity;

architecture vgade2arch of vga_de2 is
component VGA is port(
	--Host Side
	iRed,
	iGreen,
	iBlue : IN std_logic_vector (9 downto 0);
	oRequest : OUT std_logic;
	--VGA Side
	oVGA_R,
	oVGA_G,
	oVGA_B : OUT std_logic_vector (9 downto 0);
	oVGA_H_SYNC,
	oVGA_V_SYNC,
	oVGA_SYNC,
	oVGA_BLANK,
	oVGA_CLOCK : OUT std_logic;
	--Control Signal
	iCLK,
	iRST_N : IN std_logic;
	X,Y : OUT Integer  range 0 to 1023
);
end component;
signal red,blue,green: std_logic_vector (9 downto 0);
signal VGA_CTRL_CLK: std_logic;
signal X,Y : Integer  range 0 to 1023;
begin
-- GENERATE PIXELS
process(SW,X,Y)
begin
	.................................;  --Red
	.................................;  --green
	.................................;  --blue
end process;
-- GENERATE CLOCK
process (CLOCK_50,reset)
begin
	if(reset='0')then
		............................;   --VGA_CTRL_CLK init
	else
		if(CLOCK_50='1' and CLOCK_50'event) then
			......................................;   --VGA_CTRL_CLK
		end if;
	end if;
end process;
....................................;    --VGA_CLK
-- VGA COMPONENT
 VGA1: VGA port map(oRequest=>open,
					iRed=>.....,        
					iGreen=>.....,      
					iBlue=>.....,       
					oVGA_R=>.....,      
					oVGA_G=>.....,      
					oVGA_B=>.....,      
					oVGA_H_SYNC=>....., 
					oVGA_V_SYNC=>....., 
					oVGA_SYNC=>.....,   
					oVGA_BLANK=>.....,  
					iCLK=>.....,        
					iRST_N=>.....,      
					X=>open,
					Y=>open);
end vgade2arch;