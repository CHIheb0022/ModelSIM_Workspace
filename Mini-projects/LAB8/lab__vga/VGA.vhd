library ieee;
use ieee.std_logic_1164.all;

entity VGA is port(
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
end entity;

architecture vgaarch of vga is
--	Horizontal Parameter	( Pixel )
...........................................; 	-- H_SYNC_CYC 
...........................................;    -- H_SYNC_BACK 
...........................................;    -- H_SYNC_ACT 
...........................................;    -- H_SYNC_FRONT 
...........................................;    -- H_SYNC_TOTAL 
--	Vertical Parameter		( Line )
...........................................;    -- V_SYNC_CYC 
...........................................;    -- V_SYNC_BACK 
...........................................;    -- V_SYNC_ACT 
...........................................;    -- V_SYNC_FRONT 
...........................................; -  -- V_SYNC_TOTAL 
--	Start Offset
...........................................;    -- X_START 
...........................................;    -- Y_START 

signal H_Cont,V_Cont: integer range 0 to 1023;
signal oVGA_H_SYNC_s,oVGA_V_SYNC_s : std_logic;

begin
--  RGB GENERATION
	oVGA_R	<= iRed	 when(	............ and .............. and
						............. 	and ............ )
					else (others=>'0');
	oVGA_G	<= iGreen when(	............ and .............. and
						.............. 	and ............. )
					else (others=>'0');
	oVGA_B	<=	iBlue  when(	............ and .............. and
						.............. 	and ............. )
					else (others=>'0');

--	Pixel LUT Address Generator
process(iCLK)
begin
	if(iCLK='1')then
		if(iRST_N='0') then
			oRequest	<=	'0';
		else
			if(	H_Cont>=X_START-1 and H_Cont<X_START+H_SYNC_ACT-1 and
				V_Cont>=Y_START and V_Cont<Y_START+V_SYNC_ACT ) then
				oRequest	<=	'1';
			else
				oRequest	<=	'0';
			end if;
		end if;
	end if;
end process;

--	H_Sync Generator, Ref. 25.175 MHz Clock
process(iCLK)
begin
	if(iCLK='1')then
		if(iRST_N='0') then
			.............;     --H_Cont		
			..............;    --oVGA_H_SYNC_s	
		else
			--H_Sync Counter
			if( H_Cont < H_SYNC_TOTAL ) then
				............;   --H_Cont	
			else
				.............;   --H_Cont	
			end if;
			--	H_Sync Generator
			if( H_Cont < H_SYNC_CYC ) then
				................;   --oVGA_H_SYNC_s	
			else
				................;   --oVGA_H_SYNC_s
			end if;
		end if;
	end if;
end process;


--	V_Sync Generator, Ref. H_Sync
process(iCLK)
begin
	if(iCLK='1')then
		if(iRST_N='0') then
			................;    --V_Cont		
			................;    --oVGA_V_SYNC_s	
		else
			--	When H_Sync Re-start
			if(H_Cont=0) then
				--	V_Sync Counter
				if( V_Cont < V_SYNC_TOTAL )then
					............;    --V_Cont	
				else
					............;    --V_Cont
				end if;
				--	V_Sync Generator
				if(	V_Cont < V_SYNC_CYC ) then
					............;    --oVGA_V_SYNC_s
				else
					.............;   --oVGA_V_SYNC_s	
				end if;
			end if;
		end if;
	end if;
end process;
...........................;     -- oVGA_SYNC
............................;    -- oVGA_V_SYNC
............................;    -- oVGA_H_SYNC
............................;    -- oVGA_BLANK 
............................;    -- oVGA_CLOCK
............................;    -- X
............................;    -- Y
end vgaarch;


