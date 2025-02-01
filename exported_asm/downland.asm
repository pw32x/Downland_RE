                                                                                        //
                                                                                        // Coco Ram 
                                                                                        // RAM:0000-RAM:3fff
                                                                                        //
SomeTickTockValue_0x10 equ 0x10                            
SomeCounter_0x11 equ 0x11                                  
Joystick_LeftRight_Value_0x12 equ 0x12                     
Joystick_UpDown_Value_0x13 equ 0x13                        
InterruptHasBeenHitCounter_0x14 equ 0x14                   
Player_JoystickDirection_0x15 equ 0x15                     ; possible values:
                                                           ; left: 4
                                                           ; right: 2
                                                           ; up: 1
                                                           ; down: 3
                                                           ; 
ZeroValue equ 0x1b                                         
DrawSegmentLine_Counter_0x1d equ 0x1d                      
DrawSegment_SecondaryAxisSubpixelInc_0x1e equ 0x1e         
DrawSegmentLine_SubPixelOffset_0x1f equ 0x1f               
CrtArtifactDrawingMaskIndex_0x20 equ 0x20                  
DrawSegment_CurrentScreenYXPosition_0x21 equ 0x21          
DrawSegment_CurrentScreenY_0x21 equ 0x21                   
DrawSegment_CurrentScreenX_0x22 equ 0x22                   
PlayerY_AsSingleByte_0x23 equ 0x23                         
CurrentSegmentCounter_0x24 equ 0x24                        
DrawSegmentLine_SubPixelStartValue_Maybe_0x25 equ 0x25     
UtilityCounter_0x26 equ 0x26                               
Player_JumpUpInTheAirCounter_0x2c equ 0x2c                 ; counts down only when going upwards
                                                           ; looks like the value that controls how
                                                           ; far up the jump goes. Can change to make
                                                           ; jump higher or lower
Player_IsFalling_0x2d equ 0x2d                             ; 0: is touching ground
                                                           ; ff: is not touching ground
Player_SafeLandingFromFalling_0x2e equ 0x2e                ; 0: will die when landing
                                                           ; ff: will not die when landing
Player_CantJumpAfterLandingCounter_Maybe_0x2f equ 0x2f     
Player_DeathPauseInTheAirTimer equ 0x30                    
Player_IsJumping_0x31 equ 0x31                             
Ball_FallStateCounter_0x32 equ 0x32                        
SomeValue_0x34 equ 0x34                                    
SomeValue_0x35 equ 0x35                                    
Player_MoveLeftRightHoldingRopeCounter_0x36 equ 0x36       
Player_CurrentSpriteFrame_Maybe_0x37 equ 0x37              
CurrentRoomNumber_0x39 equ 0x39                            
GameCompletionCount_0x3a equ 0x3a                          
RoomGraphicsAndDoorDataAddress_0x3b equ 0x3b               
PerRoomPickupDataAddress_0x3d equ 0x3d                     
NumberOfDropsToProcess_0x3f equ 0x3f                       
Drop_TickTockBetweenFFto0andBack_0x40 equ 0x40             
Object_CollisionY_0x41 equ 0x41                            
Object_CollisionX_0x42 equ 0x42                            
Object_CollisionHeight_0x43 equ 0x43                       
Object_CollisionWidth_0x44 equ 0x44                        
Player_SpriteFrameAddress_Temp_0x45 equ 0x45               
Player_NeedsUpdate_Maybe_0x48 equ 0x48                     
Ball_IsActive_0x49 equ 0x49                                
Player_RegenerationTimer_0x4b equ 0x4b                     
SecondUtilityCounter_0x4d equ 0x4d                         
CurrentVideoMemLocation_0x4e equ 0x4e                      
CurrentNumberOfPlayers_0x50 equ 0x50                       
SelectedNumberOfPlayers_0x51 equ 0x51                      
CurrentPlayer_0x52 equ 0x52                                
CurrentInGamePlayerStringPointer equ 0x53                  
PlayerOne_Lives equ 0x55                                   
PlayerTwo_Lives equ 0x56                                   
Player1_SomeDataAddress_Always0Maybe equ 0x57              
DAT_0059 equ 0x59                                          
DAT_005b equ 0x5b                                          
Player2_SomeDataAddress_Always0Maybe equ 0x5c              
StoredPlayerPosition_0x5e equ 0x5e                         
TempRoomNumberHolder_0x60 equ 0x60                         
RomAddressCounter_0xc000to0xdf5a_0x61 equ 0x61             
InterruptHitCount equ 0x63                                 ; not really used, but incremented in the vsync interrupt
SomeValue_RelatedToDrops_0x64 equ 0x64                     
SomeValue_AlsoRelatedToDrops_0x65 equ 0x65                 
CharacterDrawingMask_0x69_Nice equ 0x69                    ; ensures that characters are 
                                                           ; drawn taking into account
                                                           ; CRT artifact effects
SAM_SETUP_BITS_MAYBE_0x6a equ 0x6a                         
GameTimerSecondDigit_0x6b equ 0x6b                         
DividerForNumberToStringConversion_0x6c equ 0x6c           
GameTimerLastDigit_0x6e equ 0x6e                           
SomeStringConversionValue_0x6f equ 0x6f                    
UnusedMask_Maybe_0x71 equ 0x71                             
RomStartAddress_0xc000 equ 0x72                            
Player_CollisionMaskBuffer_0x74 equ 0x74                   
DAT_0075 equ 0x75                                          
DAT_0076 equ 0x76                                          
DAT_0077 equ 0x77                                          
DAT_0078 equ 0x78                                          
DAT_0079 equ 0x79                                          
SpriteDrawingBuffer_0x83 equ 0x83                          ; This is a 48 byte buffer for the player splat sprite
                                                           ; and doors. 
                                                           ; The splat sprite is 3 bytes for 9 lines, but this space
                                                           ; is 3 bytes for 16 lines.
                                                           ; The door is 2 bytes for 16 lines.
DAT_0084 equ 0x84                                          
DAT_0085 equ 0x85                                          
DAT_0086+1 equ 0x86                                        
DAT_0086 equ 0x86                                          
DAT_0088 equ 0x88                                          
PlayerSplatSpriteInRam_0x98 equ 0x98                       
DAT_0099 equ 0x99                                          
SpriteDrawingBufferEnd_0xb3 equ 0xb3                       
HighScoreString_0xb3 equ 0xb3                              
HighScoreStringEnd_0xba equ 0xba                           
PlayerOneScoreString_0xbb equ 0xbb                         
DAT_00bc equ 0xbc                                          
PlayerOneScoreStringEnd_0xc2 equ 0xc2                      
PlayerTwoScoreString_0xc3 equ 0xc3                         
PlayerTwoScoreStringEnd_0xca equ 0xca                      
GameTimerString_0xcb equ 0xcb                              
DAT_00cc equ 0xcc                                          
DAT_0xcd equ 0xcd                                          
TimerNumbers_34_0xce equ 0xce                              
TimerNumbers_1_0xd0 equ 0xd0                               
TimerNumbers_0_0xd1 equ 0xd1                               
StringDataEnd_0xd2 equ 0xd2                                
InterruptJumpInstruction_0x10c equ 0x10c                   
InterruptHandlerAddress_0x10d equ 0x10d                    
DAT_0168 equ 0x168                                         
DAT_0169 equ 0x169                                         
DAT_016a equ 0x16a                                         
DAT_016b equ 0x16b                                         
DAT_016c equ 0x16c                                         
DAT_016d equ 0x16d                                         
DAT_019b equ 0x19b                                         
DAT_019d equ 0x19d                                         
DAT_019e equ 0x19e                                         
StackStart_0x019f equ 0x19f                                
Player_IsClimbingRope_0x19f equ 0x19f                      ; 0: Not climbing
                                                           ; 1: is climbing but hanging to the side
                                                           ; FF: is climbing
ConstantZeroToFFCounter equ 0x1a0                          ; used for various things, including animation timing for running, maybe
Player_CurrentAnimationFrame_0x1a2 equ 0x1a2               
Player_GameStateCounter_0x1a5 equ 0x1a5                    ; 0: entering room
                                                           ; 1: playing in room
                                                           ; then increments every time the player dies.
                                                           ; resets when changing rooms
Player_FacingDirection_0x1a6 equ 0x1a6                     ; facing left: 0
                                                           ; facing right: ff
Player_CantMoveCounter_Maybe_0x1a7 equ 0x1a7               ; used for pausing between deaths and regen
Player_State_AliveDeadRegenState_0x1a8 equ 0x1a8           ; State:
                                                           ; 0: alive
                                                           ; 1: dead
                                                           ; 2: dead and falling, or dead and checking the ground
                                                           ; FF: regenerating
Player_NumRowsInSprite_0x1a9 equ 0x1a9                     
Player_PhysicsData_0x1aa equ 0x1aa                         
Player_SpeedY_0x1aa equ 0x1aa                              ; Player Physics Data
                                                           ; 0-1: speed y
                                                           ; 2-3: speed x
                                                           ; 4-5: y
                                                           ; 6-7: x
                                                           ; 8-9: video page destination
                                                           ; 10-11: sprite pointer
                                                           ; 12-13: previous video page destination
                                                           ; 14-15: previous sprite pointer
Player_SpeedX_0x1ac equ 0x1ac                              
PlayerY_0x1ae equ 0x1ae                                    
PlayerX_0x1b0 equ 0x1b0                                    
Player_VideoPageDrawDestination_0x1b2 equ 0x1b2            
Player_SpritePointer_0x1b4 equ 0x1b4                       
PlayerY_PreviousVideoPageDrawPosition_0x1b6 equ 0x1b6      
Player_PreviousSpritePointer_0x1b8 equ 0x1b8               
Ball_InitState_0x1ba equ 0x1ba                             ; goes from 0, to 1, 2, FF, and 0 again
                                                           ; during lifetime
Ball_Unused_Maybe_0x1bb equ 0x1bb                          
Ball_Unused2_Maybe_0x1bc equ 0x1bc                         
Ball_FallCounter_UselessMaybe_0x1bd equ 0x1bd              
Ball_NumRowsInSpriteSetTo8_0x1be equ 0x1be                 
Ball_Physics_0x1bf equ 0x1bf                               
Ball_SpeedY_0x1bf equ 0x1bf                                ; The layout of the ball physics data match the one 
                                                           ; for the player.
                                                           ; Some functions rely on them matching.
                                                           ; 0-1: speed y 
                                                           ; 2-3: speed x 
                                                           ; 4-5: y 
                                                           ; 6-7: x 
                                                           ; 8-9: video page destination 
                                                           ; 10-11: sprite pointer 
                                                           ; 12-13: previous video page destination 
                                                           ; 14-15: previous sprite pointer
Ball_SpeedX_0x1c1 equ 0x1c1                                
Ball_Y_0x1c3 equ 0x1c3                                     
Ball_X_0x1c5 equ 0x1c5                                     
Ball_VideoPageDrawPosition_0x1c7 equ 0x1c7                 
Ball_SpriteData_0xc1c9 equ 0x1c9                           
Ball_PreviousVideoPageDrawPosition_0x1cb equ 0x1cb         
Ball_PreviousSpritePointer_0x1cd equ 0x1cd                 
EndOfBallData equ 0x1cf                                    
Bird_InitState_0x1cf equ 0x1cf                             
Bird_AnimationCounter_0x1d1 equ 0x1d1                      
Bird_AnimationFrame0or1_0x1d2 equ 0x1d2                    
Bird_NumRowsInSpriteSetTo6_0x1d3 equ 0x1d3                 
Bird_PhysicsData equ 0x1d4                                 
Bird_SpeedY_0x1d4 equ 0x1d4                                
Bird_SpeedX_0x1d6 equ 0x1d6                                
Bird_Y_0x1d8 equ 0x1d8                                     
Bird_X_0x1da equ 0x1da                                     
Bird_VideoPageDrawPosition_0x1dc equ 0x1dc                 
Bird_SpriteData_0x1de equ 0x1de                            
Bird_PreviousVideoPageDrawPosition_0x1e0 equ 0x1e0         
Bird_PreviousSpriteData_0x1e2 equ 0x1e2                    
PlayerLives_HeadIcons_Spacing_0x1e4 equ 0x1e4              
Player_FacingDirection_Copy_0x1e5 equ 0x1e5                
Player_NumLifeIcons_Counter_0x1e6 equ 0x1e6                
Player_State_Copy_0x1e7 equ 0x1e7                          
PlayerLives_HeadIcon_LinesToDraw_0x1e7 equ 0x1e8           
CurrentPlayerSpritePointer_0x1e9 equ 0x1e9                 
PlayerLives_DrawLocationInPage_0x1eb equ 0x1eb             
PlayerLives_DrawLocationInPage_Copy_0x1ed equ 0x1ed        
Drop0_Data_0x1ef equ 0x1ef                                 
DropDataBlock_0x1ef equ 0x1ef                              
Drop0_CeilingWiggleTimer_0x1ef equ 0x1ef                   ; Each drop data is 13 bytes long.
                                                           ; byte : description
                                                           ; 0: state / ceiling wiggle countdown 
                                                           ;     values:
                                                           ;     0: disabled
                                                           ;     1: initialized but not running
                                                           ;        will be initialized next update
                                                           ;     0xA8 - 0x80: wiggling
                                                           ;     0x7F: falling
                                                           ; 1-2: drop speed (0x200 falling, 
                                                           ;                  toggles between 0x80 and
                                                           ;                  0xff80 when jiggling to
                                                           ;                  move up and down)
                                                           ; 3-4: y position (pixel + subpixel)
                                                           ; 5: x position (0 - 127)
                                                           ; 6-7: location of sprite in ram
                                                           ; 8-9: draw location in video page
                                                           ; 10-11 (a-b): previous frame draw location in video page
                                                           ; 12 (c): the collision mask of the bottom of the drop.
                                                           ;         the mask is different depending on which frame
                                                           ;         of the drop sprite it uses.
                                                           ; 
Drop0_SpeedY_01f0 equ 0x1f0                                
Drop0_Y_0x1f2 equ 0x1f2                                    
Drop0_X_0x1f4 equ 0x1f4                                    
Drop0_SpriteData_0x1f5 equ 0x1f5                           
Drop0_VideoPageDrawLocation_0x1f7 equ 0x1f7                
Drop0_PreviousVideoPageDrawLocation_0x1f9 equ 0x1f9        
Drop0_CollisionMask_0x1fb equ 0x1fb                        
Drop1_Data_0x1fc equ 0x1fc                                 
Drop1_CeilingWiggleTimer_0x1fc equ 0x1fc                   
Drop1_SpeedY_0x1fd equ 0x1fd                               
Drop1_Y_0x1ff equ 0x1ff                                    
Drop1_X_0x201 equ 0x201                                    
Drop1_SpriteData_0x202 equ 0x202                           
Drop1_VideoPageDrawLocation_0x204 equ 0x204                
Drop1_PreviousVideoPageDrawLocation_0x206 equ 0x206        
Drop1_CollisionMask_0x208 equ 0x208                        
Drop2_Data equ 0x209                                       
Drop3_Data equ 0x216                                       
Drop4_Data equ 0x223                                       
Drop5_Data equ 0x230                                       
Drop6_Data equ 0x23d                                       
Drop7_Data equ 0x24a                                       
Drop8_Data equ 0x257                                       
Drop9_Data equ 0x264                                       
DropData_End equ 0x270                                     
EndOfDropDataBuffer_0x271 equ 0x271                        
Room0_Data equ 0x271                                       
PickUp_VisibleState_0x271 equ 0x271                        
PerRoomPickupData_0x271 equ 0x271                          ; Each room has five pick ups.
                                                           ; Two Keys, then diamonds and money bags.
                                                           ; byte:description
                                                           ; 0: pick up state (bit 1 for player 1, bit 2 for player 2)
                                                           ;                 1 -> available
                                                           ;                 0 -> taken
                                                           ; 1: pick up type (diamond: 0, money bag: 1: key: 2)
                                                           ; 2: y pos
                                                           ; 3: x pos
                                                           ; 4: if key, then which door it unlocks
                                                           ; In the buffer, the two keys are always first.
PickUp_Type equ 0x272                                      
PickUp_X equ 0x273                                         
PickUp_Y equ 0x274                                         
PickUp_DoorUnlockIndex equ 0x275                           
PickUp_Key2_VisibleState equ 0x276                         
PickUp_Key2_Type equ 0x277                                 
PickUp_Key2_Y equ 0x278                                    
PickUp_Key2_X equ 0x279                                    
PickUp_Key2_DoorUnlockIndex equ 0x27a                      
Room1Data equ 0x28a                                        
DAT_028b equ 0x28b                                         
DAT_028e equ 0x28e                                         
DAT_0290 equ 0x290                                         
DAT_0293 equ 0x293                                         
Room2Data equ 0x2a3                                        
Room3Data equ 0x2bc                                        
Room4Data equ 0x2d5                                        
Room5Data equ 0x2ee                                        
Room6Data equ 0x307                                        
Room7Data equ 0x320                                        
Room8Data equ 0x339                                        
Room9Data equ 0x352                                        
RoomsPlayersHaveVisited_0x36b equ 0x36b                    
Room1VisitedPlayerFlags_0x36c equ 0x36c                    
VideoMemory_Page0_0x0400 equ 0x400                         
DAT_0402 equ 0x402                                         
DAT_0420 equ 0x420                                         
DAT_0484 equ 0x484                                         
DAT_0485 equ 0x485                                         
DAT_048c equ 0x48c                                         
DAT_048d equ 0x48d                                         
DAT_07c9 equ 0x7c9                                         
DAT_0800 equ 0x800                                         
DAT_090a equ 0x90a                                         
DAT_0f66 equ 0xf66                                         
DAT_16cc equ 0x16cc                                        
DAT_1800 equ 0x1800                                        
DAT_1801 equ 0x1801                                        
DAT_1812 equ 0x1812                                        
DAT_1820 equ 0x1820                                        
DAT_1821 equ 0x1821                                        
DAT_1822 equ 0x1822                                        
DAT_1880 equ 0x1880                                        
DAT_1881 equ 0x1881                                        
DAT_1882 equ 0x1882                                        
DAT_18c0 equ 0x18c0                                        
DAT_18e0 equ 0x18e0                                        
DAT_1952 equ 0x1952                                        
DAT_1b14 equ 0x1b14                                        
VideoMemory_Page1_0x1c00 equ 0x1c00                        
DAT_1c02 equ 0x1c02                                        
DAT_1c05 equ 0x1c05                                        
DAT_1c06 equ 0x1c06                                        
DAT_1c0b equ 0x1c0b                                        
SUB_1d86 equ 0x1d86                                        
DAT_2000 equ 0x2000                                        
SpriteData_ClonedDestination_0x3400 equ 0x3400             ; This is where sprites are copied over four times, offset one bit per c
                                                           ; To make it easier to draw sprites when moving along bits.
PlayerSprite_Left_Stand_InRam_0x3880 equ 0x3880            
DAT_3881 equ 0x3881                                        
DAT_3882 equ 0x3882                                        
DAT_3883 equ 0x3883                                        
DAT_3884 equ 0x3884                                        
DAT_3885 equ 0x3885                                        
Player_CollisionMasks_InRam_0x3b80 equ 0x3b80              
BouncyBall_ClonedInRam_0x3dd8 equ 0x3dd8                   
PlayerOne_PerRoomTimers_0x3e98 equ 0x3e98                  ; level timers start at 0x1000 (4096)
PlayerTwo_PerRoomTimers_0x3eac equ 0x3eac                  ; level timers start at 0x1000 (4096)
Player_DoorStateData_0x3ec0 equ 0x3ec0                     
DAT_3ec1 equ 0x3ec1                                        
BirdSprite_ClonedInRam_0x3ee2 equ 0x3ee2                   
                                                                                        //
                                                                                        // ROM 
                                                                                        // RAM:c000-RAM:dfff
                                                                                        //
************************************************:          
* Game rom start and initial setup:                        
************************************************:          
CartridgeRomStart:                                         
NOP                                                        
ORCC       #01010000b                                      
LAB_c003+1:                                                ; setup stack at address 415 019f
LDS        #StackStart_0x019f                              
LDX        #0x0                                            
Clear_Memory_Loop:                                         
CLR        ,X+                                             
CMPX       #0x4000                                         
BNE        Clear_Memory_Loop                               
Setup IRQ vector:                                          ; JMP instruction number
LDA        #0x7e                                           
STA        InterruptJumpInstruction_0x10c                  
LDX        #InterruptHandler                               ; the address of the interrupt handler
STX        InterruptHandlerAddress_0x10d                   
init hardware register stuff:                              ; bit 0 VSYNC IRQ ON
LDA        #00110101b                                      
                                                           ; bit 2 DATA DIRECTION NORMAL
                                                           ; bit 4 1
                                                           ; bit 5 1
                                                           ; 
STA        PIA0_B_CTRL_REG__FF03                           
LDA        #00100000b                                      ; bit 5: swap artifact colors
STA        VMODE_REG                                       
LDA        #11111110b                                      ; enable all columns except the first 
STA        PIA0_B_DATA_REG__FF02                           ; setup keyboard columns
LDA        PIA0_A_DATA_REG__FF00                           ; get keyboard/joystick button state
ANDA       #00010000b                                      ; only keep bit 4, but never use it? ooookay.
BNE        Jump_OverPaletteSetting                         ; just jump ahead
LDD        #0x9                                            ; black (0x00) and magenta (0x09) color index?
STD        PALETTE_FFB4                                    
LDD        #0x243f                                         ; low intensity green (0x02) and faded blue (0x43) ? 
STD        PALETTE_FFB6                                    
LDA        #0xe8                                           
CMPX       #0x86f8                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: c043:                                      
Jump_OverPaletteSetting:                                   ; // 248
LDA        #11111000b                                      
LAB_c043:                                                  ; store at address 106
STA        <SAM_SETUP_BITS_MAYBE_0x6a                      
JSR        WaitForVSync_Maybe                              
                                                           ; undefined WaitForVSync_Maybe(void)
LDD        #VideoMemory_Page1_0x1c00                       
JSR        SetupSAMPages                                   
                                                           ; undefined SetupSAMPages(byte param_1)
JSR        InitVideoRegisters                              
                                                           ; undefined InitVideoRegisters(void)
CLRA                                                       
JSR        Clear512BytesInRamFrom_0x7e00_To_0x8000         
                                                           ; undefined Clear512BytesInRamFrom_0x7e00_To_0x8000(undefined param_1)
JSR        SetupStringEndCharactersForDynamicStrings       
                                                           ; undefined SetupStringEndCharactersForDynamicStrings(void)
STA        RomRam_MapType_FFDE                             
LDX        #CartridgeRomStart                              ; Load the number c000 into X
STX        <RomAddressCounter_0xc000to0xdf5a_0x61          
STX        <RomStartAddress_0xc000                         
LDA        #01010101b                                      ; some mask, maybe?
STA        <UnusedMask_Maybe_0x71                          
JSR        CopySpritesFromRomToRam                         
                                                           ; undefined CopySpritesFromRomToRam(void)
INC        <SelectedNumberOfPlayers_0x51                   
LAB_c06b:                                                  
LDX        #RoomsPlayersHaveVisited_0x36b                  
LDA        #10                                             ; setup a loop to
                                                           ; clear 10 bytes from 0x36b
LOOP_Clear10Bytes_c070:                                    
CLR        ,X+=>RoomsPlayersHaveVisited_0x36b              
DECA                                                       
BNE        LOOP_Clear10Bytes_c070                          
JSR        EnableSound                                     
                                                           ; undefined EnableSound(void)
LDA        #1                                              ; store 1 to 0x3a. 
STA        <GameCompletionCount_0x3a                       ; set this so that the title screen has 10 drops
JSR        InitDrops                                       
                                                           ; undefined InitDrops(void)
LDA        #0xa                                            ; menu screen room number
STA        <CurrentRoomNumber_0x39                         
LDA        #01010101b                                      ; store the character drawing mask
STA        <CharacterDrawingMask_0x69_Nice                 
JSR        LoadPage1AddressToX                             
                                                           ; undefined LoadPage1AddressToX(void)
JSR        WaitForVSync_Maybe                              
                                                           ; undefined WaitForVSync_Maybe(void)
LDD        #VideoMemory_Page1_0x1c00                       ; somewhere in video memory?
                                                           ; get overriden  by SetupSAMPages
JSR        SetupSAMPages                                   
                                                           ; undefined SetupSAMPages(byte param_1)
JSR        InitVideoRegisters                              
                                                           ; undefined InitVideoRegisters(void)
JSR        ClearVideoMemory_0x0400_to_0x3400               
                                                           ; undefined ClearVideoMemory_0x0400_to_0x3400(void)
LDX        #0x400                                          ; likely page 0 location
STX        <CurrentVideoMemLocation_0x4e                   ; store 0x400 to 0x4e
************************************************:          
* Draw Title Screen:                                       
************************************************:          ; = 80h
LDU        #TitleScreenBackground_DrawCommands             
JSR        DrawBackground                                  
                                                           ; undefined DrawBackground(void)
Print Intro Text To Screen:                                ; = 13
LDU        #TextStrings                                    
LDX        #TextScreenPositions                            ; = 07C9h
LDA        #13                                             ; number of strings to process
STA        <UtilityCounter_0x26                            
Loop_PrintString:                                          
PSHS        X                                              
LDX        ,X=>TextScreenPositions                         ; load to X the address stored in X (c23d)
JSR        PrintString                                     
                                                           ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
PULS        X                                              
LEAX       0x2,X                                           ; move to next screen position
DEC        <UtilityCounter_0x26                            
BNE        Loop_PrintString                                
print player one score:                                    
LDU        #PlayerOneScoreString_0xbb                      
JSR        CheckScoreStringAgainstHighScoreString          
                                                           ; undefined CheckScoreStringAgainstHighScoreString(undefined param_1, un
LDU        #PlayerOneScoreString_0xbb                      
LDX        #DAT_1812                                       ; screen location
JSR        FindFirstNonZeroCharacterInString               
                                                           ; undefined FindFirstNonZeroCharacterInString(void)
JSR        PrintString                                     
                                                           ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
print player two score:                                    
LDU        #PlayerTwoScoreString_0xc3                      
JSR        CheckScoreStringAgainstHighScoreString          
                                                           ; undefined CheckScoreStringAgainstHighScoreString(undefined param_1, un
LDU        #PlayerTwoScoreString_0xc3                      
LDX        #DAT_1952                                       ; screen location
JSR        FindFirstNonZeroCharacterInString               
                                                           ; undefined FindFirstNonZeroCharacterInString(void)
JSR        PrintString                                     
                                                           ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
print high score:                                          
LDU        #HighScoreString_0xb3                           
LDX        #DAT_16cc                                       ; screen location
JSR        FindFirstNonZeroCharacterInString               
                                                           ; undefined FindFirstNonZeroCharacterInString(void)
JSR        PrintString                                     
                                                           ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
LDD        #VideoMemory_Page0_0x0400                       ; A = 0x04, B = 0x00. A is Sam Page setup bits
JSR        SetupSAMPages                                   
                                                           ; undefined SetupSAMPages(byte param_1)
Done drawing. Copy from page 0 to page 1:                  ; setup loop to copy page 0 to page 1
LDX        #VideoMemory_Page0_0x0400                       
LOOP_Copy_Page0_to_Page1:                                  ; load to D from two bytes of the first video page
LDD        ,X=>VideoMemory_Page0_0x0400                    
STD        0x1800,X=>VideoMemory_Page1_0x1c00              ; store D to the first two bytes of the second video page
LEAX       0x2,X=>DAT_0402                                 ; move X to the next pair of bytes in video page 0
CMPX       #VideoMemory_Page1_0x1c00                       
BNE        LOOP_Copy_Page0_to_Page1                        
Some initial player setup:                                 ; disable interrupts, maybe
ANDCC      #11101111b                                      
LDA        <SelectedNumberOfPlayers_0x51                   
STA        <CurrentNumberOfPlayers_0x50                    
LDA        #0x1                                            ; set to player one
STA        <CurrentPlayer_0x52                             ; store current player
************************************************:          
* Title Screen Handling Code:                              
************************************************:          
Loop_TitleScreenLoop:                                      
JSR        IncrementRomAddressCounter                      
                                                           ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
JSR        UpdateJoystick_Maybe                            
                                                           ; undefined UpdateJoystick_Maybe(void)
LDA        <Player_JoystickDirection_0x15                  
CMPA       #0x4                                            ; holding left on the joystick
BNE        Jump_NotHoldingLeft                             
LDA        #0x1                                            ; setup one player mode?
STA        <CurrentNumberOfPlayers_0x50                    
STA        <SelectedNumberOfPlayers_0x51                   
BRA        Jump_NotHoldingRight                            
Jump_NotHoldingLeft:                                       ; holding right on the joystick
CMPA       #0x2                                            
BNE        Jump_NotHoldingRight                            
LDA        #0x2                                            ; setup two player mode?
STA        <CurrentNumberOfPlayers_0x50                    
STA        <SelectedNumberOfPlayers_0x51                   
Jump_NotHoldingRight:                                      
LDA        <CurrentNumberOfPlayers_0x50                    
LDB        #0xff                                           ; bit pattern for the line cursor choosing
                                                           ; the number of players
LSRA                                                       
BEQ        Jump_DrawOnePlayerCursor                        ; in one player mode
CLR        1364                                            ; clear the cursor next to one player
STB        1370                                            ; draw the cursor pos for two player mode
BRA        Jump_UpdateAndDrawDrops                         ; Jump_SkipDrawOnePlayerCursor
Jump_DrawOnePlayerCursor:                                  ; draw the cursor pos for one player mode
STB        1364                                            
CLR        1370                                            ; clear the cursor pos for two player mode
Jump_UpdateAndDrawDrops:                                   
JSR        UpdateAndDrawDrops                              
                                                           ; undefined UpdateAndDrawDrops(void)
LDA        PIA0_A_DATA_REG__FF00                           
BITA       #0x1                                            ; test for joystick button
BNE        Loop_TitleScreenLoop                            ; if not pressed, then loop back
************************************************:          
* Initialize game:                                         
************************************************:          
LDB        #0x3                                            
STB        <PlayerOne_Lives                                
STB        <PlayerTwo_Lives                                
JSR        ClearTimerAndScoreStrings                       
                                                           ; undefined ClearTimerAndScoreStrings(void)
CLR        <GameCompletionCount_0x3a                       ; init the completion count
LDA        #0x1                                            ; set player one
STA        <CurrentPlayer_0x52                             ; set current player
LDU        #String_PL1                                     ; = 25
STU        <CurrentInGamePlayerStringPointer               
LDD        InitialPlayerPosition_0xd272                    ; = A570h
STD        <StoredPlayerPosition_0x5e                      
CLR        <TempRoomNumberHolder_0x60                      
JSR        InitAllTimers                                   
                                                           ; undefined InitAllTimers(undefined A, undefined B, undefined2 * X)
JSR        InitDrops                                       
                                                           ; undefined InitDrops(void)
JSR        InitRoomKeysAndPickups                          
                                                           ; undefined InitRoomKeysAndPickups(void)
JSR        InitVideoAndSetupRoomAndGraphics                
                                                           ; undefined InitVideoAndSetupRoomAndGraphics(void)
JSR        InitKeyStateData                                
                                                           ; undefined InitKeyStateData(void)
JSR        Init_PlayerLivesIconParameters                  
                                                           ; undefined Init_PlayerLivesIconParameters(void)
JSR        LoadPlayerPhysicsToYAndRoomDataInfoX            
                                                           ; undefined LoadPlayerPhysicsToYAndRoomDataInfoX(void)
JSR        InitRoom_Maybe                                  
                                                           ; undefined InitRoom_Maybe()
JSR        InitPlayerSomething                             
                                                           ; undefined InitPlayerSomething(void)
LDY        #Player_PhysicsData_0x1aa                       
JSR        BigInitFunction_Maybe                           
                                                           ; undefined BigInitFunction_Maybe(undefined A, undefined B, byte * X, sh
Loop_MainGameLoop_Maybe:                                   
LDA        <Player_NeedsUpdate_Maybe_0x48                  
BEQ        Jump_SkipPlayerUpdate                           
CLR        <Player_NeedsUpdate_Maybe_0x48                  
LDY        #Player_PhysicsData_0x1aa                       
JSR        EraseAndUpdateAndDrawObject                     
                                                           ; undefined EraseAndUpdateAndDrawObject(void)
Jump_SkipPlayerUpdate:                                     
JSR        FUN_ccb1                                        
                                                           ; undefined FUN_ccb1()
JSR        UpdatePlayerSoundAndCollisionsAndPhysics        
                                                           ; undefined UpdatePlayerSoundAndCollisionsAndPhysics(undefined A, undefi
LDA        <Ball_IsActive_0x49                             
BEQ        Jump_SkipBallUpdate                             
CLR        <Ball_IsActive_0x49                             
LDY        #Ball_Physics_0x1bf                             
JSR        EraseAndUpdateAndDrawObject                     
                                                           ; undefined EraseAndUpdateAndDrawObject(void)
Jump_SkipBallUpdate:                                       
LDX        #PIA0_A_DATA_REG__FF00                          
LDA        #0xfb                                           
STA        0x2,X=>PIA0_B_DATA_REG__FF02                    
LDA        ,X=>PIA0_A_DATA_REG__FF00                       
ANDA       #01000000b                                      
BNE        LAB_c1c4                                        
PSHS        CC=>DAT_019e                                   
ORCC       #0x50                                           
LAB_c1b8:                                                  
LDA        #0xfd                                           
STA        0x2,X=>PIA0_B_DATA_REG__FF02                    
LDB        ,X=>PIA0_A_DATA_REG__FF00                       
ANDB       #01000000b                                      
BNE        LAB_c1b8                                        
PULS       CC=>DAT_019e                                    
LAB_c1c4:                                                  
LDA        Player_CurrentAnimationFrame_0x1a2              
DECA                                                       
BNE        LAB_c1d8                                        
LDA        ConstantZeroToFFCounter                         
ANDA       #0x7                                            
CMPA       #0x6                                            
BCS        LAB_c1d8                                        
LDA        #00101111b                                      
STA        PIA1_A_DATA_REG__FF20                           
LAB_c1d8:                                                  
JSR        UpdateAndDrawDrops                              
                                                           ; undefined UpdateAndDrawDrops(void)
LDA        #00000010b                                      
STA        PIA1_A_DATA_REG__FF20                           
JSR        UpdateBall                                      
                                                           ; undefined UpdateBall(void)
JSR        UpdateRoomTimers                                
                                                           ; undefined UpdateRoomTimers(void)
Loop_WaitForInterrupt:                                     
LDA        <InterruptHasBeenHitCounter_0x14                
BEQ        Jump_InterruptNotHitYet                         
CLR        <InterruptHasBeenHitCounter_0x14                
BRA        Loop_MainGameLoop_Maybe                         
Jump_InterruptNotHitYet:                                   
LDX        #0x23                                           
JSR        IncrementRomAddressCounter                      
                                                           ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
BRA        Loop_WaitForInterrupt                           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall Clear512BytesInRamFrom_0x7e0:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
Clear512BytesInRamFrom_0x7e00_To_0x8000:                   
LDX        #0x7e00                                         
LAB_c1f9:                                                  
STA        ,X+=>DAT_7e00                                   
CMPX       #0x8000                                         
BNE        LAB_c1f9                                        
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall WaitForVSync_Maybe(void):              
undefined         A:1            <RETURN>:                 
WaitForVSync_Maybe:                                        
PSHS        CC                                             
CLR        <InterruptHasBeenHitCounter_0x14                
ANDCC      #11101111b                                      ; keep all except interrupt
                                                           ; listen only to IRQ
LoopUntilInterruptChanges0x14:                             
LDA        <InterruptHasBeenHitCounter_0x14                
BEQ        LoopUntilInterruptChanges0x14                   
PULS       CC PC                                           ; pop CC and PC, effectively return
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ClearTimerAndScoreStrings(vo:          
undefined         A:1            <RETURN>:                 
ClearTimerAndScoreStrings:                                 
LDX        #PlayerOneScoreString_0xbb                      
Loop_ClearCharacter:                                       
CLR        ,X+=>PlayerOneScoreString_0xbb                  
CMPX       #0xd3                                           
BNE        Loop_ClearCharacter                             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall SetupStringEndCharactersForD:          
undefined         A:1            <RETURN>:                 
SetupStringEndCharactersForDynamicStrings:                 
LDA        #0xff                                           
STA        <HighScoreStringEnd_0xba                        
STA        <PlayerOneScoreStringEnd_0xc2                   
STA        <PlayerTwoScoreStringEnd_0xca                   
STA        <StringDataEnd_0xd2                             
Jump_ToRTS:                                                
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall CheckScoreStringAgainstHighS:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
undefined2        X:2            param_3:                  
undefined2        Y:2            param_4:                  
byte *            U:2            param_5:                  
CheckScoreStringAgainstHighScoreString:                    
LDX        #HighScoreString_0xb3                           
PSHS        param_5 param_3                                
Loop_SameCharacter:                                        ; load letter from source string, advance U
LDA        ,param_5+                                       
BMI        Jump_HitEndOfString                             ; hit end of source string
CMPA       ,param_3+=>HighScoreString_0xb3                 ; compare the letter in the source string
                                                           ; with the letter in the highscore string
BEQ        Loop_SameCharacter                              ; if equal, loop
BHI        Jump_SourceCharacterIsHigher                    
Jump_HitEndOfString:                                       
PULS        param_3 param_5 PC                             
Jump_SourceCharacterIsHigher:                              
PULS        param_3 param_5                                
Loop_NextCharacterToCopy:                                  ; load next character
LDA        ,param_5+                                       
BMI        Jump_ToRTS                                      ; if at the end, jump so we can return
STA        ,param_3+=>HighScoreString_0xb3                 ; copy the character to the highscore string
BRA        Loop_NextCharacterToCopy                        
TextScreenPositions:                                       ; Downland V1.1
dw         07C9h                                           
WORD_c23f:                                                 ; Written By:
dw         090Ah                                           
dw         0A47h                                           ; Micheal Aichlmayr
dw         0B89h                                           ; Copyright 1983
dw         0CC6h                                           ; Spectral Associates
dw         0E0Ah                                           ; Licensed To
dw         0F47h                                           ; Tandy Corporation
dw         1086h                                           ; All rights reserved
dw         1305h                                           ; One Player
dw         1311h                                           ; Two Player
dw         158Bh                                           ; High Score
dw         1806h                                           ; Player One
dw         1946h                                           ; Player Two
Jump_PerformObjectBoundingBoxCollisions:                   
PULS        Y                                              
************************************************:          
* Test collisions with pick up items:                      
************************************************:          
LDY        <PerRoomPickupDataAddress_0x3d                  
LDA        #0xa                                            
STA        <Object_CollisionHeight_0x43                    
LDA        #0x8                                            
STA        <Object_CollisionWidth_0x44                     
LDB        #0x5                                            ; test against 5 items
Loop_CollisionTestPickup:                                  
LDA        ,Y                                              
ANDA       <CurrentPlayer_0x52                             ; pick up state byte also handles player 2?
                                                           ; evidence suggests yes
BEQ        Jump_PickupIsInactive                           
LDA        0x2,Y                                           
STD        <Object_CollisionY_0x41                         
LDA        0x3,Y                                           
STA        <Object_CollisionX_0x42                         
JSR        TestPlayerObjectCollision                       ; undefined TestPlayerObjectCollision(void)
BNE        Jump_CollidesWithPickup                         
Jump_PickupIsInactive:                                     ; next pickup
LEAY       0x5,Y                                           
DECB                                                       
BNE        Loop_CollisionTestPickup                        
************************************************:          
* Test collisions with drops:                              
************************************************:          
LDY        #Drop0_CeilingWiggleTimer_0x1ef                 
LDA        #0x6                                            
STA        <Object_CollisionHeight_0x43                    
LDA        #0x4                                            
STA        <Object_CollisionWidth_0x44                     
LDB        <NumberOfDropsToProcess_0x3f                    
Loop_ProcessCollisionWithDrop:                             
LDA        ,Y=>Drop0_CeilingWiggleTimer_0x1ef              
BEQ        Jump_NoCollisionOrCollisionIgnored              ; the drop is inactive with wiggle timer of 0
LDA        0x3,Y=>Drop0_Y_0x1f2                            
STA        <Object_CollisionY_0x41                         
LDA        0x5,Y=>Drop0_X_0x1f4                            
STA        <Object_CollisionX_0x42                         
JSR        TestPlayerObjectCollision                       ; undefined TestPlayerObjectCollision(void)
BEQ        Jump_NoCollisionOrCollisionIgnored              ; no collision occured
LDA        ,Y=>Drop0_CeilingWiggleTimer_0x1ef              ; don't collide if the drop is still wiggling
BMI        Jump_NoCollisionOrCollisionIgnored              ; no collision because the drop is still wiggling
BRA        Jump_CollidesWithObjectThatKills                ; the drop collides with the player
Jump_NoCollisionOrCollisionIgnored:                        ; skip to next drop
LEAY       0xd,Y                                           
DECB                                                       
BNE        Loop_ProcessCollisionWithDrop                   
************************************************:          
* Test player collision with the ball:                     
************************************************:          
LDA        #0x8                                            
STA        <Object_CollisionHeight_0x43                    
LDA        #0x8                                            
STA        <Object_CollisionWidth_0x44                     
LDA        Ball_Y_0x1c3                                    
STA        <Object_CollisionY_0x41                         
LDA        Ball_X_0x1c5                                    
STA        <Object_CollisionX_0x42                         
JSR        TestPlayerObjectCollision                       ; undefined TestPlayerObjectCollision(void)
BNE        Jump_CollidesWithObjectThatKills                
************************************************:          
* Test player collision with the bird:                     
************************************************:          
LDA        #0x6                                            
STA        <Object_CollisionHeight_0x43                    
LDA        #0x8                                            
STA        <Object_CollisionWidth_0x44                     
LDA        Bird_Y_0x1d8                                    
STA        <Object_CollisionY_0x41                         
LDA        Bird_X_0x1da                                    
STA        <Object_CollisionX_0x42                         
JSR        TestPlayerObjectCollision                       ; undefined TestPlayerObjectCollision(void)
BNE        Jump_CollidesWithObjectThatKills                
LDY        #Player_PhysicsData_0x1aa                       
JMP        Jump_HandlePlayerJumpAndRope                    
Jump_CollidesWithObjectThatKills:                          
LDY        #Player_PhysicsData_0x1aa                       
JMP        Jump_PerformPlayerDeath                         
Jump_CollidesWithPickup:                                   
LDA        <CurrentPlayer_0x52                             
figure out which player bit to turn off for the:           
COMA                                                       
ANDA       ,Y=>PickUp_VisibleState_0x271                   
STA        ,Y=>PickUp_VisibleState_0x271                   
LDB        0x4,Y=>PickUp_DoorUnlockIndex                   
BMI        Jump_SkipDoorActivation                         
activate the door for the picked up key:                   
LDX        #Player_DoorStateData_0x3ec0                    
LEAX       B,X                                             
LDA        ,X=>Player_DoorStateData_0x3ec0                 
ORA        <CurrentPlayer_0x52                             
STA        ,X=>Player_DoorStateData_0x3ec0                 ; activate the door for the selected key for this player
                                                           ; 
JSR        LoadRoomDoorDataAddrIntoX                       ; undefined LoadRoomDoorDataAddrIntoX(void)
Loop_Doors:                                                ; compare B with the room number of the door
CMPB       0x5,X                                           
BEQ        Jump_DoneDoorSearch                             ; if door index is the same as in B, we're done
LEAX       0x6,X                                           ; jump to next door
LDA        ,X                                              ; get the first value of the door data block
BNE        Loop_Doors                                      ; if the value isn't the zero sentinel value, loop
BRA        Jump_SkipDoorActivation                         
Jump_DoneDoorSearch:                                       ; draw the unlocked door on both video memory pages
LDU        #VideoMemory_Page1_0x1c00                       
STU        <CurrentVideoMemLocation_0x4e                   
JSR        DrawDoorOrMultipleDoors_Maybe                   ; undefined DrawDoorOrMultipleDoors_Maybe(undefined A, undefined B, usho
LDU        #VideoMemory_Page0_0x0400                       
STU        <CurrentVideoMemLocation_0x4e                   
JSR        DrawDoorOrMultipleDoors_Maybe                   ; undefined DrawDoorOrMultipleDoors_Maybe(undefined A, undefined B, usho
Jump_SkipDoorActivation:                                   
LDD        <ZeroValue                                      
JSR        IncrementRomAddressCounter                      ; call this to get a "random" value in B
ANDB       #0x7f                                           ; keep only the first 7 bits
LDA        0x1,Y                                           ; get the pickup type 
                                                           ; 0: diamond
                                                           ; 1: money bag
                                                           ; 2: key)
BEQ        Jump_IsDiamond                                  
DECA                                                       
BEQ        Jump_IsMoneyBag                                 
at this point, it's a key:                                 
CLRA                                                       
ADDD       #0xc8                                           ; pick up points
BRA        Jump_AddToScore                                 
Jump_IsMoneyBag:                                           ; pick up points
ADDD       #0x12c                                          
BRA        Jump_AddToScore                                 
Jump_IsDiamond:                                            ; pick up points
ADDD       #0x190                                          
Jump_AddToScore:                                           
PSHS        Y                                              
JSR        UpdateAndPrintPlayerScore                       ; undefined UpdateAndPrintPlayerScore(undefined A, undefined B, undefine
PULS        Y                                              
JSR        SetupPickupScreenLocationAndNumLinesToClear     ; undefined SetupPickupScreenLocationAndNumLinesToClear(void)
STB        <UtilityCounter_0x26                            
BSR        ClearPickupFromScreen                           ; undefined ClearPickupFromScreen(undefined A, undefined B, undefined2 *
LDD        #0x1280                                         ; setup A and B parameters for pickup sound
BSR        PlaySound                                       ; undefined PlaySound(undefined A, undefined B)
LDY        #Player_PhysicsData_0x1aa                       
JMP        EraseAndUpdateAndDrawObject                     
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
************************************************:          
* Clears the sprite graphics from page 0:                  
* How: copies two bytes from page1 to page0 for:           
* the number of lines specified in UtilityCounte:          
************************************************:          
undefined __stdcall ClearPickupFromScreen(undefi:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined2 *      X:2            X:                        
ClearPickupFromScreen:                                     ; load value to D on second page
??         ECh                                             
                                                           ; 
??         89h                                             
??         18h                                             
??         00h                                             
STD        ,X                                              ; store D to first page
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            
BNE        ClearPickupFromScreen                           
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall PlaySound(undefined A, undef:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
PlaySound:                                                 
STA        <SecondUtilityCounter_0x4d                      
STB        <UtilityCounter_0x26                            
Loop_UpdateRegisters:                                      
LDA        #11111111b                                      
STA        PIA1_A_DATA_REG__FF20                           
BSR        DoIdleLoopOnB                                   ; undefined DoIdleLoopOnB(void)
LDA        #00000010b                                      
STA        PIA1_A_DATA_REG__FF20                           
BSR        DoIdleLoopOnB                                   ; undefined DoIdleLoopOnB(void)
DEC        <UtilityCounter_0x26                            
BNE        Loop_UpdateRegisters                            
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DoIdleLoopOnB(void):                   
undefined         A:1            <RETURN>:                 
DoIdleLoopOnB:                                             
LDB        <SecondUtilityCounter_0x4d                      
Loop_DecrementB:                                           
DECB                                                       
BNE        Loop_DecrementB                                 
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall TestPlayerObjectCollision(vo:          
undefined         A:1            <RETURN>:                 
TestPlayerObjectCollision:                                 
LDX        #Player_PhysicsData_0x1aa                       
LDA        0x4,X=>PlayerY_0x1ae                            
CMPA       <Object_CollisionY_0x41                         
BLS        LAB_c38d                                        
SUBA       <Object_CollisionY_0x41                         
CMPA       <Object_CollisionHeight_0x43                    
BLS        LAB_c395                                        
BRA        Jump_NoCollision                                
LAB_c38d:                                                  
LDA        <Object_CollisionY_0x41                         
SUBA       0x4,X=>PlayerY_0x1ae                            
CMPA       -0x1,X=>Player_NumRowsInSprite_0x1a9            
BHI        Jump_NoCollision                                
LAB_c395:                                                  
LDA        0x6,X=>PlayerX_0x1b0                            
CMPA       <Object_CollisionX_0x42                         
BLS        LAB_c3a3                                        
SUBA       <Object_CollisionX_0x42                         
CMPA       <Object_CollisionWidth_0x44                     
BLS        Jump_HasCollision                               
BRA        Jump_NoCollision                                
LAB_c3a3:                                                  
LDA        <Object_CollisionX_0x42                         
SUBA       0x6,X=>PlayerX_0x1b0                            
CMPA       #0x8                                            
BLS        Jump_HasCollision                               
BRA        Jump_NoCollision                                
Jump_NoCollision:                                          
CLRA                                                       
RTS                                                        
Jump_HasCollision:                                         
LDA        #0xff                                           
RTS                                                        
Jump_Return:                                               
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdatePlayerSoundAndCollisio:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
ushort *          X:2            X:                        
Stack[-0x2]:2  previousFunctionOnStack_Maybe:              
UpdatePlayerSoundAndCollisionsAndPhysics:                  
LDY        #Player_PhysicsData_0x1aa                       
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
DECA                                                       
BNE        Jump_SkipPlaySound                              
LDB        #00111111b                                      
STB        PIA1_A_DATA_REG__FF20                           ; play sound when animation frame is not 0?
Jump_SkipPlaySound:                                        
LDA        -0x5,Y=>Player_GameStateCounter_0x1a5           
BEQ        Jump_IsAlreadyClimbing::Jump_Return             ; inactive, so just return
CMPA       #0x1                                            ; check if the game is currently in a room transition
LBEQ       Jump_HandlePlayerJumpAndRope                    ; it is in a screen transition
LDA        <Player_DeathPauseInTheAirTimer                 ; are we in a death animation?
LBNE       Jump_PlayerStillDyingInTheAir                   
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
LBMI       BigInitFunction_Maybe::Jump_JoystickCheck       ; jump if player state is FF
LBNE       Jump_PlayerIsDeadSoSkipStuff                    ; jump if the state is 1 or more
INC        -0xa,Y=>ConstantZeroToFFCounter                 
The "mysterious sprites" located between the pla:          
ball sprites in rom data are masks used to extra:          
lines across the player sprite on the screen. Th:          
lines are then compared to a clean version of th:          
sprite overlaid a clean background. Any differen:          
the extracted pixels and the clean version trigg:          
jump to a bounding box collision check against a:          
moving objects.:                                           ; location of the collision masks in RAM
LDU        #Player_CollisionMasks_InRam_0x3b80             
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
LDB        #0x3c                                           ; size of the four collision masks for a frame along 4 pixels
                                                           ; (5 lines * 3 bytes * 4 frames)
MUL                                                        
LEAU       B,U                                             ; compute the address of the set of collision masks we want
LDA        0x6,Y=>PlayerX_0x1b0                            
ANDA       #0x3                                            ; get the last two bits if player X. this gets 
                                                           ; us which collision mask for the X position 
                                                           ; to look for (0 - 3)
LDB        #0xf                                            ; the size of one collision mask (5 lines * 3 bytes)
MUL                                                        
LEAU       B,U                                             ; compute the address of the collision mask to use for this
                                                           ; particular X position
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CMPA       #0x3                                            ; compare the animation frame with 3. The run animation
                                                           ; goes from 0 to 3.
BHI        Jump_DontAdjustU                                ; Jump if we're not running towards the right
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BNE        Jump_DontAdjustU                                ; Jump if we're still facing right, ie not facing left
LEAU       0x168,U                                         ; otherwise, skip the right facing run frames and the
                                                           ; two climbing frames to get to the left facing frames
Jump_DontAdjustU:                                          
LDX        0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LEAX       0x20,X                                          ; get the position one pixel under the player location
                                                           ; on screen
PSHS        Y                                              
LDY        #Player_CollisionMaskBuffer_0x74                
LDA        #0x5                                            ; five lines of the sprite
STA        <UtilityCounter_0x26                            
X - video page location of player sprite on scre:          
Y - player sprite utility buffer:                          
U - player collision mask for current frame and:           
x position:                                                
Fill the buffer with the pixels around the playe:          
background. Then later it's compared with the pl:          
in ram. Any differences means that there's a col:          
something.:                                                
Loop_FillPlayerCollisionMaskBuffer:                        ; fill A and B, move U up two bytes
PULU        A B=>DAT_0168                                  
                                                           ; they are masks that decide what pixels to keep 
                                                           ; when extracting from the screen
first byte of line:                                        ; keep only the screen pixel bits that correspond 
ANDA       ,X                                              
                                                           ; to the mask bits
                                                           ; screen: 01010101
                                                           ; mask:   00011110
                                                           ; result: 00010100 
ORA        0x1800,X=>DAT_1820                              ; blend with the clean background area. probably 
                                                           ; in case some other drawing routine had erased some
                                                           ; pixels.
STA        ,Y+=>Player_CollisionMaskBuffer_0x74            ; store in the the collision mask extraction buffer
second byte of line:                                       ; do all the same for B
ANDB       0x1,X                                           
ORB        0x1801,X=>DAT_1821                              
STB        ,Y+=>DAT_0075                                   
third byte of line:                                        ; do the same for the third byte of the current line
PULU        A=>DAT_016a                                    
ANDA       0x2,X                                           
ORA        0x1802,X=>DAT_1822                              
STA        ,Y+=>DAT_0076                                   
LEAX       0x60,X                                          ; move three pixels down on screen to get the next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_FillPlayerCollisionMaskBuffer              
get the current player animation frame:                    
PULS        Y                                              
LDU        #SpriteData_ClonedDestination_0x3400            
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
LDB        #0xc0                                           ; size of sprite for animation frame: 16 lines * 3 bytes * 4 positions o
MUL                                                        
LEAU       B,U                                             ; set U to the current animation sprite
LDA        0x6,Y=>PlayerX_0x1b0                            
ANDA       #0x3                                            
LDB        #0x30                                           
MUL                                                        
LEAU       B,U                                             ; set U to the current animation sprite along X
LEAU       0x3,U                                           ; move to the next line in the sprite
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CMPA       #0x3                                            ; check if we're running or standing
BHI        Jump_DontAdjustUAgain                           ; we're climbing
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BNE        Jump_DontAdjustUAgain                           
LEAU       0x480,U                                         ; move to the left facing sprites
Jump_DontAdjustUAgain:                                     
LDX        0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LEAX       0x1820,X                                        ; set X to the clean video page, one pixel down
PSHS        Y                                              
LDY        #Player_CollisionMaskBuffer_0x74                
LDA        #0x5                                            ; num sprite collision mask rows
STA        <UtilityCounter_0x26                            
U - player sprite:                                         
X - second video memory page:                              
Y - sprite utility buffer:                                 
The utility buffer contains the extracted player:          
background pixels for five lines. And then it tr:          
compare those lines with the ones from the playe:          
in ram and the clean background.:                          
Any differences in pixels means that the player:           
overlapping an object and so it jumps to the bou:          
box collision functions.:                                  
Loop_CheckCollisionMaskLine:                               ; get the first two sprite bytes
PULU        A B                                            
test first byte:                                           ; blend with the byte from the clean background
ORA        ,X=>DAT_1820                                    
CMPA       ,Y+=>Player_CollisionMaskBuffer_0x74            ; check against the collision mask buffer for differences
LBNE       Jump_PerformObjectBoundingBoxCollisions         
test second byte:                                          
ORB        0x1,X=>DAT_1821                                 
CMPB       ,Y+=>DAT_0075                                   
LBNE       Jump_PerformObjectBoundingBoxCollisions         
test third byte:                                           
PULU        A=>DAT_0485                                    
ORA        0x2,X=>DAT_1822                                 
CMPA       ,Y+=>DAT_0076                                   
LBNE       Jump_PerformObjectBoundingBoxCollisions         
LEAX       0x60,X                                          ; go down three pixels
LEAU       0x6,U                                           ; skip two lines in the sprite frame
DEC        <UtilityCounter_0x26                            
BNE        Loop_CheckCollisionMaskLine                     
PULS        Y                                              
At this point, the player isn't colliding with a:          
Jump_HandlePlayerJumpAndRope:                              
LDA        <Player_JumpUpInTheAirCounter_0x2c              
LBNE       Jump_PlayerIsJumpingUpwards                     
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
LBNE       Jump_PlayerIsNotFalling                         ; 0 means not on rope
                                                           ; 1 or FF means on rope
Jump_PlayerIsDeadSoSkipStuff:                              ; char ComputeSomeScreenOffset_Maybe(void)
BSR        ComputeSomeScreenOffset_Maybe                   
At this point:                                             
B -> 0 or 1:                                               
X -> 0, 2, 4, 6:                                           ; sixteen pixels down
LEAX       0x200,X                                         
LDU        #PlayerFloorCollisionMask                       ; = 0000001111000000b
LDD        A,U=>PlayerFloorCollisionMask                   ; A will contain offset into the array for the 
                                                           ; x position
detecting whether we're standing or not, maybe:            
ANDA       0x1800,X                                        
ANDB       0x1801,X                                        
CMPD       <ZeroValue                                      ; check if A and B are empty. if they are
                                                           ; then we need to fall.
BEQ        Jump_HandleFall                                 
PSHS        B                                              
JSR        TerrainCollisionTest                            ; call the function but then do nothing about it?
PULS        A                                              
BNE        Jump_PlayerIsNotFalling                         
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
BNE        Jump_PlayerIsNotFalling                         
Jump_HandleFall:                                           
LDA        #0xff                                           
STA        <Player_IsFalling_0x2d                          
LDD        ,Y=>Player_SpeedY_0x1aa                         
ADDD       #0x6                                            ; add falling speed
CMPD       #0x100                                          ; max falling speed, likely
BLS        Jump_NotHitTerminalVelocity                     
CLR        <Player_SafeLandingFromFalling_0x2e             ; set to 0, will die when landing. maybe.
LDD        #0x100                                          ; clamp the falling speed
Jump_NotHitTerminalVelocity:                               
STD        ,Y=>Player_SpeedY_0x1aa                         
LDA        <Player_SafeLandingFromFalling_0x2e             
BMI        Jump_PlayerLandingIsSafe                        
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BMI        Jump_UpdateXGoingLeft                           
LDD        0x2,Y=>Player_SpeedX_0x1ac                      
ADDD       #0x1                                            
BMI        Jump_SetPlayerYSpeed                            
LDD        <ZeroValue                                      
BRA        Jump_SetPlayerYSpeed                            
************************************************:          
*                          FUNCTION:                       
************************************************:          
char __stdcall ComputeSomeScreenOffset_Maybe(voi:          
char              A:1            <RETURN>:                 
ComputeSomeScreenOffset_Maybe:                             ; set X to this table
LDX        #SomeKindOfHorizontalBitOffsetTable             
LDB        0x6,Y                                           ; get X position from object physics data
ANDB       #0x3                                            ; get the last two bits of the x position
TFR        B,A                                             ; give it to A
LDB        B,X=>SomeKindOfHorizontalBitOffsetTable         ; load into B one of the items in the table. 
                                                           ; Will be either 0 or 1. 
                                                           ; 
LDX        0x8,Y                                           ; load the video page destination of the object
ABX                                                        ; add the offset in B to X
LSLA                                                       ; double A
RTS                                                        
Jump_UpdateXGoingLeft:                                     
LDD        0x2,Y=>Player_SpeedX_0x1ac                      
ADDD       #0xffff                                         
BPL        Jump_SetPlayerYSpeed                            
LDD        <ZeroValue                                      
Jump_SetPlayerYSpeed:                                      
STD        0x2,Y=>Player_SpeedX_0x1ac                      
Jump_PlayerLandingIsSafe:                                  
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
BNE        Jump_PlayerIsDead_Maybe                         
Jump_NotTouchingGround:                                    
JMP        BigInitFunction_Maybe::Jump_JumpToClimbingRope  
SomeKindOfHorizontalBitOffsetTable:                        
db         0h                                              
db         0h                                              
db         0h                                              
db         1h                                              
PlayerFloorCollisionMask:                                  
dw         0000001111000000b                               
dw         0000000011110000b                               
dw         0000000000111100b                               
dw         0000111100000000b                               
Ball_WideCollisionMask:                                    
dw         0011111111110000b                               
dw         0000111111111100b                               
dw         0000001111111111b                               
dw         1111111111000000b                               
RopeShapeLookupTable_Maybe+1:                              
RopeShapeLookupTable_Maybe:                                
dw         0000001100000000b                               
dw         0000000011000000b                               
dw         0000000000110000b                               
dw         0000110000000000b                               
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ClearSpeedToZero(void):                
undefined         A:1            <RETURN>:                 
ClearSpeedToZero:                                          
LDD        <ZeroValue                                      
STD        ,Y                                              
STD        0x2,Y                                           
RTS                                                        
Jump_PlayerIsNotFalling:                                   
CLR        <Player_IsFalling_0x2d                          
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
BNE        Jump_PlayerIsDead_Maybe                         
LDD        ,Y=>Player_SpeedY_0x1aa                         
CMPD       #0x100                                          
LBNE       BigInitFunction_Maybe::Jump_PlayerLanding_Maybe 
Jump_PerformPlayerDeath:                                   ; undefined ClearSpeedToZero(void)
BSR        ClearSpeedToZero                                
CLR        -0xb,Y=>Player_IsClimbingRope_0x19f             
CLR        <Player_JumpUpInTheAirCounter_0x2c              
CLR        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
LDA        <Player_IsFalling_0x2d                          
BEQ        Jump_PlayerStartDeathFallling                   
LDA        #0x32                                           
STA        <Player_DeathPauseInTheAirTimer                 
Jump_PlayerStillDyingInTheAir:                             
DEC        <Player_DeathPauseInTheAirTimer                 
BEQ        Jump_PlayerStartDeathFallling                   
LDA        <Player_DeathPauseInTheAirTimer                 
ANDA       #0x4                                            ; use the timer to swap the player direction while
                                                           ; hanging in the air, maybe
BEQ        Jump_FaceLeftInTheAir                           
LDA        #0xff                                           ; set facing right
STA        -0x4,Y=>Player_FacingDirection_0x1a6            
CMPX       #0x6f3c                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: c55d:                                      
Jump_FaceLeftInTheAir:                                     ; set facing left
CLR        -0x4,Y=>Player_FacingDirection_0x1a6            
LAB_c55d:                                                  
LDA        #0x2                                            
STA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
JMP        LAB_c97f                                        
Jump_PlayerStartDeathFallling:                             
LDA        #0xa                                            
STA        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
LDA        #0x2                                            ; set to the mid-air jump frame
STA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
JMP        Jump_IsAlreadyClimbing::Jump_Return             
Jump_PlayerIsDead_Maybe:                                   
LDA        <Player_IsFalling_0x2d                          
BNE        Jump_NotTouchingGround                          
BSR        ClearSpeedToZero                                ; undefined ClearSpeedToZero(void)
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
DECA                                                       
BEQ        LAB_c5ac                                        
clear from 0x83 to 0xb3 for the:                           
sprite drawing buffer:                                     
LDX        #SpriteDrawingBuffer_0x83                       
LDA        #0x30                                           ; clean 48 bytes
Loop_ClearSpriteDrawingBuffer:                             
CLR        ,X+=>SpriteDrawingBuffer_0x83                   
DECA                                                       
BNE        Loop_ClearSpriteDrawingBuffer                   
from 0x98 to 0xb3, load the splat sprite:                  
LDX        #PlayerSplatSpriteInRam_0x98                    
LDU        #PlayerSplatSprite                              ; = 0000010000000000b
LDA        #0x1b                                           ; 27 bytes. 9 lines of 3 bytes each
Loop_LoadUndentifiedData:                                  ; = 0000010000000000b
LDB        ,U+=>PlayerSplatSprite                          
STB        ,X+=>PlayerSplatSpriteInRam_0x98                
DECA                                                       
BNE        Loop_LoadUndentifiedData                        ; 27 bytes
LDA        0x6,Y=>PlayerX_0x1b0                            ;         
ANDA       #0x3                                            ; get 0 to 3 offset
                                                           ; so, for every four pixels...
BEQ        Jump_PlaySplatSound                             ; don't need to adjust if we are on pixel 0
adjust the sprite to draw:                                 ; pixel offset
STA        <UtilityCounter_0x26                            
LDB        #0x10                                           ; 16 lines in the sprite
JSR        ShiftBitsInSpriteDrawingBuffer                  ; undefined ShiftBitsInSpriteDrawingBuffer(undefined param_1, char param
Jump_PlaySplatSound:                                       ; setup A and B parameters for splat sound 
LDD        #0x2508                                         
JSR        PlaySound                                       ; play splat sound
perform actual drawing of sprite:                          
LDU        #SpriteDrawingBuffer_0x83                       
JSR        DrawLifeIconsAndPlayerRegeneration              ; undefined DrawLifeIconsAndPlayerRegeneration(undefined A, undefined B,
LAB_c5ac:                                                  
DEC        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
LBNE       Jump_IsAlreadyClimbing::Jump_Return             
DEC        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
BEQ        ResetTimerTo2048IfAtZeroWhenDied_Maybe          
LDA        #0xc                                            
STA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
LBSR       EraseSpriteFromScreen                           ; undefined EraseSpriteFromScreen(void)
LDA        #0x10                                           
STA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
LDA        #0x46                                           
STA        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
LBRA       Jump_IsAlreadyClimbing::Jump_Return             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall GetPlayerLivesAddress(void):           
undefined         A:1            <RETURN>:                 
GetPlayerLivesAddress:                                     ; = 0055
LDX        #PlayerLivesAddresses                           
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
LDX        A,X=>PlayerLivesAddresses                       ; = 0055
RTS                                                        
PlayerLivesAddresses:                                      
addr       PlayerOne_Lives                                 
addr       PlayerTwo_Lives                                 
AddressesToSomePlayerData:                                 
addr       Player1_SomeDataAddress_Always0Maybe            
addr       Player2_SomeDataAddress_Always0Maybe            
PTR_String_GetReadyPlayerOne_c5da:                         ; = 16
addr       String_GetReadyPlayerOne                        
addr       String_GetReadyPlayerTwo                        ; = 16
ResetTimerTo2048IfAtZeroWhenDied_Maybe:                    
LDA        Bird_InitState_0x1cf                            
BEQ        Jump_SkipResettingTimerAndBird                  
JSR        GetPlayerRoomTimerBuffer                        ; undefined GetPlayerRoomTimerBuffer(void)
LDB        <CurrentRoomNumber_0x39                         
LSLB                                                       ; double B to get relative address in buffer
ABX                                                        ; get timer location in room timer buffer
LDD        #0x800                                          ; set timer to 2048
STD        ,X                                              
LDA        #0xff                                           
STA        Bird_InitState_0x1cf                            
Jump_SkipResettingTimerAndBird:                            ; undefined GetPlayerLivesAddress(void)
BSR        GetPlayerLivesAddress                           
LDA        ,X                                              
CMPA       #0x5                                            
BLS        Jump_SkipClampingLivesCount                     
LDA        #0x5                                            
STA        ,X                                              
Jump_SkipClampingLivesCount:                               
DEC        ,X                                              
LBMI       Jump_PlayerOutOfLives                           ; lives is 0xff, less than 0, so gave over
PSHS        Y                                              
LDA        <CurrentNumberOfPlayers_0x50                    
ANDA       #00000010b                                      
LBEQ       Jump_IncrementGameState                         
LAB_c610:                                                  
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
BNE        Jump_ToPlayerOneSetup                           
INC        <CurrentPlayer_0x52                             
LDU        #String_PL2                                     ; = 25
LDX        #Player1_SomeDataAddress_Always0Maybe           
BRA        DoneSetupPlayer_DrawGetReadyScreen              
Jump_ToPlayerOneSetup:                                     
DEC        <CurrentPlayer_0x52                             
LDU        #String_PL1                                     ; = 25
LDX        #Player2_SomeDataAddress_Always0Maybe           
DoneSetupPlayer_DrawGetReadyScreen:                        
STU        <CurrentInGamePlayerStringPointer               
LDA        0x4,Y=>PlayerY_0x1ae                            
LDB        0x6,Y=>PlayerX_0x1b0                            
STD        0x2,X=>DAT_0059                                 
LDA        <CurrentRoomNumber_0x39                         
STA        0x4,X=>DAT_005b                                 
JSR        ClearVideoMemory_0x0400_to_0x3400               ; undefined ClearVideoMemory_0x0400_to_0x3400(void)
LDD        #VideoMemory_Page1_0x1c00                       
JSR        SetupSAMPages                                   ; undefined SetupSAMPages(byte param_1)
LDU        #TitleScreenBackground_DrawCommands             ; = 80h
JSR        DrawBackground                                  ; undefined DrawBackground(void)
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
LDX        #PTR_String_GetReadyPlayerOne_c5da              ; = dada
LDU        A,X=>PTR_String_GetReadyPlayerOne_c5da          ; = dada
LDX        #DAT_0f66                                       
JSR        PrintString                                     ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
JSR        WaitForVSync_Maybe                              ; undefined WaitForVSync_Maybe(void)
ANDCC      #0xef                                           
LDD        #VideoMemory_Page0_0x0400                       ; A = 0x04, B = 0x00. A is Sam Page setup bits
JSR        SetupSAMPages                                   ; undefined SetupSAMPages(byte param_1)
LDX        #VideoMemory_Page0_0x0400                       ; setup loop to copy page 0 to page 1
LOOP_Copy_Page0_to_Page1:                                  ; load D from X, advance X by 2
LDD        ,X++=>VideoMemory_Page0_0x0400                  
STD        0x17fe,X=>VideoMemory_Page1_0x1c00              ; set D to Page 1.
CMPX       #VideoMemory_Page1_0x1c00                       
BNE        LOOP_Copy_Page0_to_Page1                        
Init drops:                                                ; undefined InitDrops(void)
JSR        InitDrops                                       
LDA        #10                                             ; menu screen room number
STA        <NumberOfDropsToProcess_0x3f                    ; set to 10 drops
STA        <CurrentRoomNumber_0x39                         
Loop_ProcessGetReadyScreen:                                ; undefined UpdateAndDrawDrops(void)
JSR        UpdateAndDrawDrops                              
LDX        #PIA0_A_DATA_REG__FF00                          
LDA        #11111111b                                      
STA        0x2,X=>PIA0_B_DATA_REG__FF02                    
LDA        ,X=>PIA0_A_DATA_REG__FF00                       ; get joystick button state
BITA       <CurrentPlayer_0x52                             ; test button state against current player
BEQ        Jump_PlayerPressedButtonAndIsReady              ; button has been pressed
BITA       #0x1                                            
BEQ        Loop_ProcessGetReadyScreen                      
BITA       #0x2                                            
BEQ        Loop_ProcessGetReadyScreen                      
CLR        0x2,X=>PIA0_B_DATA_REG__FF02                    
LDA        ,X=>PIA0_A_DATA_REG__FF00                       
ORA        #10000011b                                      
CMPA       #11111111b                                      
BEQ        Loop_ProcessGetReadyScreen                      
Jump_PlayerPressedButtonAndIsReady:                        ; = 0057
LDX        #AddressesToSomePlayerData                      
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
LDX        A,X=>AddressesToSomePlayerData                  ; = 0057
LDY        ,S=>previousFunctionOnStack_Maybe               
JSR        InitRoom_Maybe                                  ; undefined InitRoom_Maybe()
Jump_IncrementGameState:                                   
PULS        Y                                              
INC        -0x5,Y=>Player_GameStateCounter_0x1a5           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall BigInitFunction_Maybe(undefi:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
byte *            X:2            X:                        
short *           Y:2            Y:                        
BigInitFunction_Maybe:                                     ; 40 frames for initial pause when the game starts
LDA        #0x28                                           
STA        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
LDD        #0x190                                          ; 400
STD        <Player_RegenerationTimer_0x4b                  
LDA        #0xff                                           
STA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
CLR        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      ; set back to standing
************************************************:          
* if the player has moved, then set the regen ti:          
************************************************:          
Jump_JoystickCheck:                                        ; undefined UpdateJoystick_Maybe(void)
JSR        UpdateJoystick_Maybe                            
LDA        <Player_JoystickDirection_0x15                  
BEQ        Jump_DecrementRegenTimer                        ; if player is moving, then set the
                                                           ; regeneration timer to zero
LDD        <ZeroValue                                      
STD        <Player_RegenerationTimer_0x4b                  
Jump_DecrementRegenTimer:                                  
CLRA                                                       
LDD        <Player_RegenerationTimer_0x4b                  
BEQ        Jump_RegenTimerIsZero                           
SUBD       #0x1                                            ; decrement the regen timer
STD        <Player_RegenerationTimer_0x4b                  
************************************************:          
* decrement the regen mini timer if it's not zer:          
************************************************:          
Jump_RegenTimerIsZero:                                     
LDA        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
BEQ        Jump_CheckActiveRegenTimers                     
DECA                                                       
STA        -0x3,Y=>Player_CantMoveCounter_Maybe_0x1a7      
Jump_CheckActiveRegenTimers:                               
BNE        Jump_RegenTimersNotDone                         
LDD        <Player_RegenerationTimer_0x4b                  
BNE        Jump_RegenTimersNotDone                         
PSHS        Y                                              
The player stopped regenerating, so erase the:             
regenerating head icon for the current life.:              
LDY        #CurrentPlayerSpritePointer_0x1e9               
JSR        GetPlayerLivesAddress                           ; undefined GetPlayerLivesAddress(void)
LDA        ,X                                              
LDB        -0x5,Y=>PlayerLives_HeadIcons_Spacing_0x1e4     
MUL                                                        
LDX        0x2,Y=>PlayerLives_DrawLocationInPage_0x1eb     
LEAX       B,X                                             ; X will contain the location on screen of the
                                                           ; current life head icon
LDA        -0x1,Y=>PlayerLives_HeadIcon_LinesToDraw_0x1e7  
STA        <UtilityCounter_0x26                            
LDD        <ZeroValue                                      ; The value to draw, which will blank out the pixels
Loop_ClearHeadIcon:                                        ; clear line of the head icon
STD        ,X                                              
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_ClearHeadIcon                              
clear the screen for the area covered by the:              
regenerating player:                                       
PULS        Y                                              
CLR        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  ; set to alive state
LDX        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
LDB        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
STB        <UtilityCounter_0x26                            
Loop_ClearPlayerArea:                                      ; copy two bytes from second page
LDD        0x1800,X                                        
STD        ,X                                              ; paste two bytes to first page
LDA        0x1802,X                                        ; copy byte 3 from second page
STA        0x2,X                                           ; paste byte 3 of first page
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_ClearPlayerArea                            
Jump_PlayerLanding_Maybe:                                  
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BMI        Jump_ProcessPlayerControls_Maybe                
LDD        ,Y=>Player_SpeedY_0x1aa                         
BEQ        Jump_ProcessPlayerControls_Maybe                
LDA        #0x4                                            
STA        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
CLR        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CLR        <Player_SafeLandingFromFalling_0x2e             
LDA        #01111111b                                      
STA        PIA1_A_DATA_REG__FF20                           
JMP        Jump_ClearSpeedAndClimbingRopeFlag              
Jump_RegenTimersNotDone:                                   
CLRA                                                       
JMP        LAB_c85f                                        
Jump_ProcessPlayerControls_Maybe:                          ; undefined UpdateJoystick_Maybe(void)
JSR        UpdateJoystick_Maybe                            
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        LAB_c763                                        
CMPA       #0x1                                            ; compare to going up?
LBEQ       Jump_HandleRun                                  
LDA        <Player_JoystickDirection_0x15                  
CMPA       #0x2                                            ; compare to going right
BEQ        Jump_GoingRight                                 
CMPA       #0x4                                            ; compare to going left
BEQ        Jump_GoingLeft                                  ; Jump_GoingLeft
CLR        <Player_JumpUpInTheAirCounter_0x2c              
CLR        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
CLR        <Player_SafeLandingFromFalling_0x2e             
BRA        Jump_HandleRun                                  
Jump_GoingLeft:                                            ; set the facing direction to 0
CLR        -0x4,Y=>Player_FacingDirection_0x1a6            
LDD        #0xffca                                         ; speed -54
BRA        Jump_UpdateSpeed                                
Jump_GoingRight:                                           
LDA        #0xff                                           
STA        -0x4,Y=>Player_FacingDirection_0x1a6            ; set the facing direction to FF
LDD        #0x36                                           ; speed 54
Jump_UpdateSpeed:                                          
STD        0x2,Y=>Player_SpeedX_0x1ac                      
LAB_c763:                                                  
LDA        <CurrentPlayer_0x52                             
BITA       PIA0_A_DATA_REG__FF00                           
BNE        Jump_HandleRun                                  
LDA        <Player_IsJumping_0x31                          
BNE        Player_IsNotJumping                             
DEC        <Player_IsJumping_0x31                          ; set to FF
LDA        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
BNE        Jump_HandleRun                                  
LDD        #0xff61                                         ; jump up speed
STD        ,Y=>Player_SpeedY_0x1aa                         
LDA        #0x28                                           
STA        <Player_JumpUpInTheAirCounter_0x2c              
LDA        #0xff                                           
STA        <Player_SafeLandingFromFalling_0x2e             
STA        <Player_IsFalling_0x2d                          
Jump_JumpToClimbingRopeSubroutine:                         
JMP        Jump_Player_IsClimbingRope_IsPositive           
Jump_HandleGoingToOneHandedRope:                           
LDB        0x6,Y=>PlayerX_0x1b0                            
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BEQ        Jump_GoToLeftOfRope                             
ADDB       #0x4                                            ; move by 4 pixels to the right
                                                           ; going to the right side of the rope one handed
BRA        Jump_HandledXPositionOfOneHandedRope            
Jump_GoToLeftOfRope:                                       ; move by 4 pixels to the left
SUBB       #0x4                                            
                                                           ; going to the left side of the rope one handed
Jump_HandledXPositionOfOneHandedRope:                      
STB        0x6,Y=>PlayerX_0x1b0                            
JSR        ClearSpeedToZero                                ; undefined ClearSpeedToZero(void)
STA        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BMI        Jump_SetupHandingFromSideOfRope                 
CLR        -0xb,Y=>Player_IsClimbingRope_0x19f             ; let go of the rope because we were already holding it 
                                                           ; from the side?
JMP        LAB_c879                                        
Jump_SetupHandingFromSideOfRope:                           
LDA        #0x1                                            
STA        -0xb,Y=>Player_IsClimbingRope_0x19f             
JMP        LAB_c879                                        
Jump_PlayerIsJumpingUpwards:                               
LDA        <Player_JumpUpInTheAirCounter_0x2c              
LSLA                                                       
ORA        #00000010b                                      
STA        PIA1_A_DATA_REG__FF20                           
LDD        ,Y=>Player_SpeedY_0x1aa                         
ADDD       #0x3                                            ; add gravity to jump speed, maybe
STD        ,Y=>Player_SpeedY_0x1aa                         
DEC        <Player_JumpUpInTheAirCounter_0x2c              
LBNE       LAB_c879                                        
Jump_ClearSpeedAndClimbingRopeFlag:                        
LDD        <ZeroValue                                      
STD        ,Y=>Player_SpeedY_0x1aa                         
STA        -0xb,Y=>Player_IsClimbingRope_0x19f             
JMP        LAB_c879                                        
Jump_HandleRun:                                            
CLR        <Player_IsJumping_0x31                          
Player_IsNotJumping:                                       
LDA        <Player_JoystickDirection_0x15                  
LBMI       Jump_SetRunRightAnimationFrame                  
BEQ        Jump_NotMovingJoystick_Maybe                    
CMPA       #0x2                                            ; going right?
BCS        Jump_ClimbingUp_Maybe                           
BEQ        Jump_MovingRight_Maybe                          
CMPA       #0x3                                            ; going down?
BEQ        Jump_MovingDown_Maybe                           
handling going left, maybe:                                
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BEQ        Jump_FacingLeft_Already                         
CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36    
CLR        -0x4,Y=>Player_FacingDirection_0x1a6            
Jump_FacingLeft_Already:                                   
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        Jump_UpdateLeftSpeed                            
Pressing left while holding on to the rope to go:          ; undefined ClearSpeedToZero(void)
JSR        ClearSpeedToZero                                
INC        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        <Player_MoveLeftRightHoldingRopeCounter_0x36    
CMPA       #InterruptHasBeenHitCounter_0x14                
BHI        Jump_HandleGoingToOneHandedRope                 
LDD        <ZeroValue                                      
BRA        Jump_UpdateSpeed                                
Jump_UpdateLeftSpeed:                                      ; speed going left
LDD        #0xffca                                         
Jump_UpdateSpeed:                                          
STD        0x2,Y=>Player_SpeedX_0x1ac                      
BRA        Jump_SetRunRightAnimationFrame                  
Jump_ClimbingUp_Maybe:                                     
CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BPL        Jump_NotMovingJoystick_Maybe                    
LDD        #0xffc0                                         ; climb up speed
STD        ,Y=>Player_SpeedY_0x1aa                         
BRA        Jump_SetClimbingAnimationFrame                  
Jump_NotMovingJoystick_Maybe:                              
CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36    
JSR        ClearSpeedToZero                                ; undefined ClearSpeedToZero(void)
LDB        -0xb,Y=>Player_IsClimbingRope_0x19f             
BPL        LAB_c85f                                        
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CMPA       #0x3                                            
BHI        LAB_c81b                                        
LDA        #0x4                                            
LAB_c81b:                                                  
BRA        Jump_SetCurrentAnimationFrame                   
Jump_MovingDown_Maybe:                                     
CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BPL        Jump_NotMovingJoystick_Maybe                    
LDD        #0x70                                           ; climb down speed, maybe
STD        ,Y=>Player_SpeedY_0x1aa                         
Jump_SetClimbingAnimationFrame:                            ; the timer decides which frame to display
LDA        -0xa,Y=>ConstantZeroToFFCounter                 
LSRA                                                       
LSRA                                                       
LSRA                                                       
ANDA       #0x1                                            
ADDA       #0x4                                            
Jump_SetCurrentAnimationFrame:                             
STA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
BRA        LAB_c879                                        
Jump_MovingRight_Maybe:                                    
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BMI        LAB_c83f                                        
CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        #0xff                                           
STA        -0x4,Y=>Player_FacingDirection_0x1a6            
LAB_c83f:                                                  
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        Jump_SetRightSpeed                              
Handle pressing right to go one handed while hol:          ; undefined ClearSpeedToZero(void)
JSR        ClearSpeedToZero                                
INC        <Player_MoveLeftRightHoldingRopeCounter_0x36    
LDA        <Player_MoveLeftRightHoldingRopeCounter_0x36    
CMPA       #InterruptHasBeenHitCounter_0x14                
LBHI       Jump_HandleGoingToOneHandedRope                 
LDD        <ZeroValue                                      
BRA        Jump_SetSpeed                                   
Jump_SetRightSpeed:                                        ; speed 54
LDD        #0x36                                           
Jump_SetSpeed:                                             
STD        0x2,Y=>Player_SpeedX_0x1ac                      
Jump_SetRunRightAnimationFrame:                            
LDA        -0xa,Y=>ConstantZeroToFFCounter                 
LSRA                                                       
LSRA                                                       
ANDA       #0x3                                            
LAB_c85f:                                                  
LDB        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        Jump_AnimationFrameIsSet                        
BPL        Jump_Player_IsClimbingRope_IsPositive           ; Player_IsClimbingRope is positive. How?
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CMPA       #0x3                                            
BHI        Jump_AnimationFrameIsSet                        
LDA        #0x5                                            ; climbing animation frame
BRA        Jump_AnimationFrameIsSet                        
Jump_Player_IsClimbingRope_IsPositive:                     
LDA        #0x2                                            
Jump_AnimationFrameIsSet:                                  
STA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
LDB        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
BEQ        LAB_c879                                        
DEC        <Player_CantJumpAfterLandingCounter_Maybe_0x2f  
LAB_c879:                                                  
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
CMPA       #0x1                                            
BEQ        Jump_IsAlreadyClimbing::Jump_ApplyPlayerPhysics 
Check whether the player is touching a vine/rope:          ; char ComputeSomeScreenOffset_Maybe(void)
JSR        ComputeSomeScreenOffset_Maybe                   
LEAX       0x100,X                                         ; eight pixels underneath. midheight on player sprite?
LDU        #RopeShapeLookupTable_Maybe                     ; = 0000001100000000b
LDD        A,U=>RopeShapeLookupTable_Maybe                 ; = 0000001100000000b
ANDA       0x1800,X                                        
ANDB       0x1801,X                                        
CMPD       <ZeroValue                                      
BEQ        Jump_NotTouchingRope_Maybe                      
PSHS        B                                              
BSR        RopeCollisionTest                               ; byte RopeCollisionTest(byte param_1)
PULS        A                                              
BNE        LAB_c8a4                                        
BSR        RopeCollisionTest                               ; byte RopeCollisionTest(byte param_1)
BEQ        Jump_NotTouchingRope_Maybe                      
LAB_c8a4:                                                  
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BMI        Jump_IsAlreadyClimbing                          
Set player as climbing:                                    
LDA        #0xff                                           
STA        -0xb,Y=>Player_IsClimbingRope_0x19f             
JSR        ClearSpeedToZero                                ; undefined ClearSpeedToZero(void)
CLR        <Player_JumpUpInTheAirCounter_0x2c              
CLR        <Player_SafeLandingFromFalling_0x2e             
BRA        Jump_IsAlreadyClimbing                          ; undefined Jump_IsAlreadyClimbing(undefined A, undefined B, char * X, s
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
Jump_NotTouchingRope_Maybe:                                
CLR        -0xb,Y=>Player_IsClimbingRope_0x19f             
BRA        Jump_IsAlreadyClimbing::Jump_ApplyPlayerPhysics 
************************************************:          
*                          FUNCTION:                       
************************************************:          
byte __stdcall RopeCollisionTest(byte param_1):            
byte              A:1            <RETURN>:                 
byte              A:1            param_1:                  
RopeCollisionTest:                                         ; byte TerrainCollisionTest(byte A)
JSR        TerrainCollisionTest                            
LDA        <SecondUtilityCounter_0x4d                      
COMA                                                       
ANDA       <SomeValue_0x34                                 
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall Jump_IsAlreadyClimbing(undef:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
char *            X:2            X:                        
short *           Y:2            Y:                        
Jump_IsAlreadyClimbing:                                    
LDA        <Player_JumpUpInTheAirCounter_0x2c              
BNE        Jump_ApplyPlayerPhysics                         
LDD        ,Y=>Player_SpeedY_0x1aa                         
BPL        Jump_ApplyPlayerPhysics                         
JSR        ComputeSomeScreenOffset_Maybe                   ; char ComputeSomeScreenOffset_Maybe(void)
LEAX       0xe0,X                                          
LDU        #RopeShapeLookupTable_Maybe                     ; = 0000001100000000b
LDD        A,U=>RopeShapeLookupTable_Maybe                 ; = 0000001100000000b
ANDA       0x1800,X                                        
ANDB       0x1801,X                                        
CMPD       <ZeroValue                                      
BEQ        Loop_SkipRopeChecks                             
PSHS        B                                              
BSR        RopeCollisionTest                               ; byte RopeCollisionTest(byte param_1)
PULS        A                                              
BNE        Jump_ApplyPlayerPhysics                         
BSR        RopeCollisionTest                               ; byte RopeCollisionTest(byte param_1)
BNE        Jump_ApplyPlayerPhysics                         
Loop_SkipRopeChecks:                                       
LDA        #0x4                                            
STA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
LDD        <ZeroValue                                      
STD        ,Y=>Player_SpeedY_0x1aa                         
Jump_ApplyPlayerPhysics:                                   
LDD        0x4,Y=>PlayerY_0x1ae                            
ADDD       ,Y=>Player_SpeedY_0x1aa                         
STD        0x4,Y=>PlayerY_0x1ae                            
LDD        0x6,Y=>PlayerX_0x1b0                            
ADDD       0x2,Y=>Player_SpeedX_0x1ac                      
STD        0x6,Y=>PlayerX_0x1b0                            
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        Jump_NoClimbingRope                             
LDA        <PlayerY_AsSingleByte_0x23                      
CMPA       0x4,Y=>PlayerY_0x1ae                            
BEQ        Jump_NoClimbingRope                             
LDA        -0xa,Y=>ConstantZeroToFFCounter                 
ANDA       #0x7                                            
LSLA                                                       
LSLA                                                       
LSLA                                                       
ORA        #00011010b                                      
STA        PIA1_A_DATA_REG__FF20                           
Jump_NoClimbingRope:                                       
LDA        0x4,Y=>PlayerY_0x1ae                            
STA        <PlayerY_AsSingleByte_0x23                      
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BNE        Jump_ClimbingRope                               
LDX        #SomeKindOfHorizontalBitOffsetTable             
LDB        0x6,Y=>PlayerX_0x1b0                            
ANDB       #0x3                                            
TFR        B,A                                             
LDB        B,X=>SomeKindOfHorizontalBitOffsetTable         
PSHS        B A                                            
JSR        LoadPosRelativeToYAndComputeScreenPos           ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
STD        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
TFR        B,X                                             
PULS        A B                                            
LEAX       0x1e0,X                                         
ABX                                                        
LSLA                                                       
LDU        #PlayerFloorCollisionMask                       ; = 0000001111000000b
LDD        A,U=>PlayerFloorCollisionMask                   ; = 0000001111000000b
ANDA       0x1800,X                                        
ANDB       0x1801,X                                        
CMPD       <ZeroValue                                      
BEQ        LAB_c97f                                        
PSHS        B                                              
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
PULS        A                                              
BNE        LAB_c95d                                        
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
BEQ        LAB_c97f                                        
LAB_c95d:                                                  
LDD        0x6,Y=>PlayerX_0x1b0                            
SUBD       0x2,Y=>Player_SpeedX_0x1ac                      
STD        0x6,Y=>PlayerX_0x1b0                            
LDA        <Player_JumpUpInTheAirCounter_0x2c              
BNE        LAB_c96b                                        
CLR        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
BRA        Jump_ClimbingRope                               
LAB_c96b:                                                  
LDA        #0x1                                            
STA        <Player_JumpUpInTheAirCounter_0x2c              
LDD        0x2,Y=>Player_SpeedX_0x1ac                      
COMA                                                       
COMB                                                       
ADDD       #0x1                                            
STD        0x2,Y=>Player_SpeedX_0x1ac                      
COM        -0x4,Y=>Player_FacingDirection_0x1a6            
Jump_ClimbingRope:                                         ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
JSR        LoadPosRelativeToYAndComputeScreenPos           
STD        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
LAB_c97f:                                                  
LDU        #SpriteData_ClonedDestination_0x3400            
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
CMPA       #0x3                                            
BHI        LAB_c990                                        
LDA        -0x4,Y=>Player_FacingDirection_0x1a6            
BNE        LAB_c990                                        
LEAU       0x480,U                                         
LAB_c990:                                                  
LDA        -0x8,Y=>Player_CurrentAnimationFrame_0x1a2      
LDB        #0xc0                                           
MUL                                                        
LEAU       B,U                                             
STU        <Player_CurrentSpriteFrame_Maybe_0x37           
LDA        0x6,Y=>PlayerX_0x1b0                            
ANDA       #0x3                                            
LDB        #0x30                                           
MUL                                                        
LEAU       B,U                                             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawLifeIconsAndPlayerRegene:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
char *            X:2            X:                        
short             Y:2            Y:                        
ushort            U:2            U:                        
Check whether we need to draw the player:                  
DrawLifeIconsAndPlayerRegeneration:                        
STU        0xa,Y=>Player_SpritePointer_0x1b4               
CMPU       0xe,Y=>Player_PreviousSpritePointer_0x1b8       
BNE        Jump_ContinueDrawing                            ; Are the sprite pointer and previous sprite pointer the same?
                                                           ; If not, then skip to draw
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
BMI        Jump_ContinueDrawing                            ; Is the player regenerating? 
                                                           ; If so, then skip to draw
LDU        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
CMPU       0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LBEQ       Jump_IsAlreadyClimbing::Jump_Return             ; Is the current draw position and the previous draw position
                                                           ; the same?
                                                           ; If so, then jump to return
INC        <Player_NeedsUpdate_Maybe_0x48                  
RTS                                                        
Jump_ContinueDrawing:                                      
LDA        -0x2,Y=>Player_State_AliveDeadRegenState_0x1a8  
LBGT       Jump_PlayerIsDead                               
Reinits the player animations for regeneration:            
LDB        -0x4,Y=>Player_FacingDirection_0x1a6            
PSHS        Y                                              
LDY        #CurrentPlayerSpritePointer_0x1e9               
STA        -0x2,Y=>Player_State_Copy_0x1e7                 
STB        -0x4,Y=>Player_FacingDirection_Copy_0x1e5       
LDU        <Player_CurrentSpriteFrame_Maybe_0x37           
STU        ,Y=>CurrentPlayerSpritePointer_0x1e9            
LDU        0x2,Y=>PlayerLives_DrawLocationInPage_0x1eb     
STU        0x4,Y=>PlayerLives_DrawLocationInPage_Copy_0x1ed
JSR        GetPlayerLivesAddress                           ; undefined GetPlayerLivesAddress(void)
LDA        ,X                                              ; contains player lives
LDB        -0x2,Y=>Player_State_Copy_0x1e7                 
BPL        Jump_PlayerIsAlive                              ; if plus, then player state is not generating
INCA                                                       ; increment lives temporarily for displaying
                                                           ; regenerating head icon
Jump_PlayerIsAlive:                                        
STA        -0x3,Y=>Player_NumLifeIcons_Counter_0x1e6       
BRA        Jump_SkipDecrementLives                         
Loop_DrawHeadIcons:                                        
DEC        -0x3,Y=>Player_NumLifeIcons_Counter_0x1e6       
Jump_SkipDecrementLives:                                   
LBEQ       Jump_FinishedDrawingHeadIcons                   
LDX        0x4,Y=>PlayerLives_DrawLocationInPage_Copy_0x1ed
LDU        ,Y=>CurrentPlayerSpritePointer_0x1e9            
LDA        -0x1,Y=>PlayerLives_HeadIcon_LinesToDraw_0x1e7  
STA        <UtilityCounter_0x26                            
LDA        -0x2,Y=>Player_State_Copy_0x1e7                 
LBPL       Loop_DrawHeadLifeIcon                           ; if the player is alive or dead (not regen)
                                                           ; draw the head life icon
LDA        -0x3,Y=>Player_NumLifeIcons_Counter_0x1e6       
CMPA       #0x1                                            
LBNE       Loop_DrawHeadLifeIcon                           ; if we're not at the last life icon, just draw it normally
At this point I think it's the regenerating:               
head life icon:                                            ; address to the facing right player sprites
LDU        #SpriteData_ClonedDestination_0x3400            
LDA        -0x4,Y=>Player_FacingDirection_Copy_0x1e5       
BNE        Jump_SkipGettingLeftFacingSprites               
LEAU       0x480,U                                         ; move to the facing left player sprites
Jump_SkipGettingLeftFacingSprites:                         
STU        <Player_SpriteFrameAddress_Temp_0x45            
JSR        IncrementRomAddressCounter                      ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
TFR        PC,Y                                            ; setup Y to become a random data generator
LEAY       B,Y                                             
Loop_DrawRegenHeadLifeIcon:                                ; get the first two bytes of the sprite
LDD        ,U=>PlayerSprite_Left_Stand_InRam_0x3880        
mess around the two bytes of the sprite:                   
LSLA                                                       
LSLB                                                       
ORA        ,U+=>PlayerSprite_Left_Stand_InRam_0x3880       
ORB        ,U+=>DAT_3881                                   
ANDA       ,Y+                                             
ANDB       ,Y+                                             
STD        ,X                                              ; draw the messed up bytes to the address in the
                                                           ; first page of video memory stored in X
do the same to the third byte of the sprite's th:          
bytes per line:                                            
LDA        ,U=>DAT_3882                                    
LSLA                                                       
ORA        ,U+=>DAT_3882                                   
ANDA       ,Y+                                             
STA        0x2,X                                           ; store two bytes to X
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_DrawRegenHeadLifeIcon                      
draw player sprite in regeneration mode:                   
LDY        #Player_PhysicsData_0x1aa                       
LDX        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
STX        0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LDA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
STA        <UtilityCounter_0x26                            
LDU        <Player_SpriteFrameAddress_Temp_0x45            
LDA        0x6,Y=>PlayerX_0x1b0                            
ANDA       #0x3                                            ; which bit offset to draw on
LDB        #0x30                                           ; converted player sprite size 
                                                           ; (2 bytes * 16 lines) + 1 byte extra 
                                                           ; per line: 0x30
MUL                                                        ; find which sprite to use
LEAU       B,U                                             ; move U to the sprite frame that depends on the X position
CLR        0xe,Y=>Player_PreviousSpritePointer_0x1b8       
JSR        IncrementRomAddressCounter                      ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
TFR        PC,Y                                            ; setup Y to become a random data generator
LEAY       B,Y                                             
draw the player sprite but use random data and:            
bit manipulation to generate the static effect:            
Loop_DrawRegenPlayerSprite:                                ; load the first two bytes of the player sprite
LDD        ,U                                              
mess around the pixel bytes:                               
LSLA                                                       
LSLB                                                       
ORA        ,U+                                             
ORB        ,U+                                             
ANDA       ,Y+                                             
ORA        0x1800,X                                        ; Binary Or with value at second page, store in A
ANDB       ,Y+                                             
ORB        0x1801,X                                        
STD        ,X                                              ; draw the pixels to the first page of video memory
do the same for the third byte:                            
LDA        ,U                                              
LSLA                                                       
ORA        ,U+                                             
ANDA       ,Y+                                             
ORA        0x1802,X                                        ; get two bytes at X + 2 from page 1
STA        0x2,X                                           ; store to same location in page 0
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_DrawRegenPlayerSprite                      
we're done, so return:                                     
PULS        Y                                              
RTS                                                        
Loop_DrawHeadLifeIcon:                                     
PULU        A B                                            
STD        ,X                                              ; write two bytes to X
PULU        A                                              
STA        0x2,X                                           ; store A two bytes later in X
LEAX       0x20,X                                          ; move to next line
DEC        <UtilityCounter_0x26                            ; next sprite line
BNE        Loop_DrawHeadLifeIcon                           
LDX        0x4,Y=>PlayerLives_DrawLocationInPage_Copy_0x1ed
LDA        -0x5,Y=>PlayerLives_HeadIcons_Spacing_0x1e4     
LEAX       A,X                                             
STX        0x4,Y=>PlayerLives_DrawLocationInPage_Copy_0x1ed
JMP        Loop_DrawHeadIcons                              
Jump_FinishedDrawingHeadIcons:                             
PULS        Y                                              
Jump_PlayerIsDead:                                         
INC        <Player_NeedsUpdate_Maybe_0x48                  
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
byte __stdcall TerrainCollisionTest(byte A):               
byte              A:1            <RETURN>:                 
byte              A:1            A:                        
TerrainCollisionTest:                                      ; store pixel from A here
STA        <SomeValue_0x34                                 
ANDA       #01010101b                                      ; apply mask to A
LSLA                                                       ; double A, ie shift the pixels left
STA        <SomeValue_0x35                                 ; store retult
LDA        <SomeValue_0x34                                 ; load original value from A
ANDA       #10101010b                                      ; apply another mask
LSRA                                                       ; shift left
ORA        <SomeValue_0x35                                 ; combine with 0x35
EORA       <SomeValue_0x34                                 ; don't combine shared pixels
STA        <SecondUtilityCounter_0x4d                      
ANDA       <SomeValue_0x34                                 ; apply mask in 0x34
ANDA       #01010101b                                      ; apply mask
RTS                                                        
Jump_ToBallInit:                                           
JMP        InitBouncingBall                                
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdateBall(void):                      
undefined         A:1            <RETURN>:                 
UpdateBall:                                                
LDY        #Ball_Physics_0x1bf                             
LDA        -0x5,Y=>Ball_InitState_0x1ba                    ; needs to be initialized?
BEQ        Jump_ToBallInit                                 ; it does
LDA        <Ball_FallStateCounter_0x32                     
BGT        Jump_BallJumpingUp                              
BMI        Jump_HandleBallOnGround                         
ball is falling:                                           
LDX        #SomeKindOfHorizontalBitOffsetTable             
LDB        0x6,Y=>Ball_X_0x1c5                             
ANDB       #0x3                                            ; figure out which two bits on the byte it affects.
TFR        B,A                                             
LDB        B,X=>SomeKindOfHorizontalBitOffsetTable         
LDX        0x8,Y=>Ball_VideoPageDrawPosition_0x1c7         
LEAX       0x100,X                                         ; move X so that it's 8 pixels underneath
                                                           ; the ball. This is the ground sensor
ABX                                                        ; add the offset thingie to X. Sometimes 1,
                                                           ; mostly 0.
LSLA                                                       ; use A to find the right ball collsion mask in the table
                                                           ; the table is two bytes per item
LDU        #Ball_GroundCollisionMaskData                   ; = 0000001100000000b
LDD        A,U=>Ball_GroundCollisionMaskData               ; = 0000001100000000b
Binary and A & B with the terrain underneath:              
the ball. If it's zero, then we haven't hit:               
anything.:                                                 
ANDA       DAT_1800,X                                      
ANDB       DAT_1801,X                                      
CMPD       <ZeroValue                                      
BEQ        Jump_NoBallGroundHit                            
PSHS        B                                              
BSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
PULS        A                                              
BNE        Jump_TheBallHasHitTheGround                     
BSR        TerrainCollisionTest                            ; unsure why we're testing twice here
BNE        Jump_TheBallHasHitTheGround                     
Jump_NoBallGroundHit:                                      
LDD        ,Y=>Ball_SpeedY_0x1bf                           
ADDD       #0x12                                           
CMPD       #0x100                                          ; 0x100 (256) maximum speed?
BLS        Jump_SkipFallSpeedClamp                         
LDD        #0x100                                          
************************************************:          
* Increment 0x1bf until it reaches A for some re:          
************************************************:          
Jump_SkipFallSpeedClamp:                                   
STD        ,Y=>Ball_SpeedY_0x1bf                           
Increment a value up to A, but I don't know what:          
this is for.:                                              
LDA        -0x2,Y=>Ball_FallCounter_UselessMaybe_0x1bd     
CMPA       #0xa                                            
BCC        Jump_SkipFallCounterIncrement                   
INCA                                                       
STA        -0x2,Y=>Ball_FallCounter_UselessMaybe_0x1bd     
Jump_SkipFallCounterIncrement:                             
BRA        Jump_UpdateBallPosition                         
Ball_GroundCollisionMaskData:                              
dw         0000001100000000b                               
dw         0000000011000000b                               
dw         0000000000110000b                               
dw         0000110000000000b                               
Jump_TheBallHasHitTheGround:                               
LDD        #0xff00                                         
STD        ,Y=>Ball_SpeedY_0x1bf                           
LDA        #0xfb                                           ; set this value so that the ball sticks
                                                           ; to the ground a little, while looking 
                                                           ; squished
STA        <Ball_FallStateCounter_0x32                     
BRA        Jump_SetupBallSprite                            
Jump_HandleBallOnGround:                                   ; the value will roll up to 0 and then will
INC        <Ball_FallStateCounter_0x32                     
                                                           ; setup the ball to jump up
BMI        Jump_SetupBallSprite                            ; the counter is negative, so stay at this 
                                                           ; position for now. don't update physics
the fall state counter is now positive.:                   
setup the ball to jump up:                                 
LDD        #0xff00                                         
STD        ,Y=>Ball_SpeedY_0x1bf                           
LDA        #0xa                                            
STA        <Ball_FallStateCounter_0x32                     ; setup so we move up at least 0xA number of times
BRA        Jump_UpdateBallPosition                         
Jump_BallJumpingUp:                                        
LDD        ,Y=>Ball_SpeedY_0x1bf                           
ADDD       #0xa                                            ; add a bit of gravity
STD        ,Y=>Ball_SpeedY_0x1bf                           
DEC        <Ball_FallStateCounter_0x32                     ; we're only falling for a limited number of steps
if the fall state counter is 0, then stop going:           
BNE        Jump_UpdateBallPosition                         
LDD        <ZeroValue                                      
STD        ,Y=>Ball_SpeedY_0x1bf                           ; set speed y to 0
Jump_UpdateBallPosition:                                   
LDD        0x4,Y=>Ball_Y_0x1c3                             
ADDD       ,Y=>Ball_SpeedY_0x1bf                           
STD        0x4,Y=>Ball_Y_0x1c3                             
LDD        0x6,Y=>Ball_X_0x1c5                             
ADDD       0x2,Y=>Ball_SpeedX_0x1c1                        
STD        0x6,Y=>Ball_X_0x1c5                             
terrain collision checking:                                
possibly for when running into a wall:                     
LDX        #SomeKindOfHorizontalBitOffsetTable             
LDB        0x6,Y=>Ball_X_0x1c5                             
ANDB       #0x3                                            
TFR        B,A                                             
LDB        B,X=>SomeKindOfHorizontalBitOffsetTable         
PSHS        B A                                            
JSR        LoadPosRelativeToYAndComputeScreenPos           ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
STD        0x8,Y=>Ball_VideoPageDrawPosition_0x1c7         
TFR        D,X                                             
PULS        A B                                            
LEAX       0xa0,X                                          ; sensor 5 pixels underneath
ABX                                                        
LSLA                                                       
LDU        #Ball_WideCollisionMask                         ; = 0011111111110000b
LDD        A,U=>Ball_WideCollisionMask                     ; = 0011111111110000b
ANDA       0x1800,X                                        
ANDB       0x1801,X                                        
CMPD       <ZeroValue                                      
BEQ        Jump_SetupBallSprite                            ; no collision, so just draw the sprite
PSHS        B                                              
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
PULS        A                                              
BNE        Jump_ResetBallStateToFF                         
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
BEQ        Jump_SetupBallSprite                            
Jump_ResetBallStateToFF:                                   ; Set to FF. This will be reset by the next call
LDA        #0xff                                           
                                                           ; to UpdateObjectPhysics for the ball.
STA        -0x5,Y=>Ball_InitState_0x1ba                    ; The ball will be reinitialized
Jump_SetupBallSprite:                                      ; the address of the ball sprites in memory
LDU        #0x3dd8                                         
LDA        <Ball_FallStateCounter_0x32                     
BPL        Jump_SkipSetSquishedBallSprite                  
LEAU       0x60,U                                          ; change to the squished ball sprite
Jump_SkipSetSquishedBallSprite:                            
LDA        0x6,Y=>Ball_X_0x1c5                             
figure out which ball sprite to use:                       
depending on x position:                                   
ANDA       #0x3                                            
clamp X value from 0 to 3:                                 ; size of a ball sprite in ram (3 bytes for 8 lines)
LDB        #0x18                                           
MUL                                                        
LEAU       D,U                                             ; Move U to the correct sprite for 
                                                           ; the X position with the offset
                                                           ; computed in D
STU        0xa,Y=>Ball_SpriteData_0xc1c9                   ; store the sprite address to the ball data
INC        <Ball_IsActive_0x49                             ; indicate that we are definitely active
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitAllTimers(undefined A, u:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined2 *      X:2            X:                        
InitAllTimers:                                             ; undefined GetPlayerRoomTimerBuffer(void)
BSR        GetPlayerRoomTimerBuffer                        
LDB        #20                                             ; total number of player one and two timers
STB        <UtilityCounter_0x26                            
LDD        #0x1000                                         ; aka 4096
LAB_cbae:                                                  
STD        ,X++                                            
DEC        <UtilityCounter_0x26                            ; next timer
BNE        LAB_cbae                                        ; Loop_ClearTimer
RTS                                                        
PlayerRoomTimerBufferPointers_0xccb5:                      
addr       PlayerOne_PerRoomTimers_0x3e98                  
addr       PlayerTwo_PerRoomTimers_0x3eac                  
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall GetPlayerRoomTimerBuffer(voi:          
undefined         A:1            <RETURN>:                 
GetPlayerRoomTimerBuffer:                                  ; = 3e98
LDX        #PlayerRoomTimerBufferPointers_0xccb5           
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
LDX        A,X=>PlayerRoomTimerBufferPointers_0xccb5       ; = 3e98
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdateRoomTimers(void):                
undefined         A:1            <RETURN>:                 
UpdateRoomTimers:                                          
LDB        <CurrentRoomNumber_0x39                         
LSLB                                                       
BSR        GetPlayerRoomTimerBuffer                        ; undefined GetPlayerRoomTimerBuffer(void)
LDD        B,X                                             ; get current room timer in player room timer data
LDX        #0x1b14                                         ; screen location
JSR        PrintTimerStringToScreen                        ; undefined PrintTimerStringToScreen(void)
BSR        GetPlayerRoomTimerBuffer                        ; undefined GetPlayerRoomTimerBuffer(void)
CLR        <UtilityCounter_0x26                            ; init room timer counter
increment other room timers:                               
Loop_NextRoomTimer:                                        ; current room timer counter
LDB        <UtilityCounter_0x26                            
CMPB       #0xa                                            ; num room timers
BEQ        Jump_DoneIncrementingOtherRoomTimers            
CMPB       <CurrentRoomNumber_0x39                         
BEQ        Jump_IsCurrentRoomTimer                         
LDD        ,X=>DAT_1b14                                    
ADDD       #0x1                                            ; increment timer that's not the current room's
CMPD       #0x1000                                         ; are we at the 4096 limit?
BLS        Jump_RoomTimerLimitNotHit                       
LDD        #0x1000                                         ; reset room timer to 4096
Jump_RoomTimerLimitNotHit:                                 
STD        ,X=>DAT_1b14                                    
Jump_IsCurrentRoomTimer:                                   ; go to next room timer
LEAX       0x2,X                                           
INC        <UtilityCounter_0x26                            ; we're done with this room timer
BRA        Loop_NextRoomTimer                              
update current room timer and activate bird:               
if it hits zero.:                                          
Jump_DoneIncrementingOtherRoomTimers:                      
LDY        #Bird_PhysicsData                               
LDA        -0x5,Y=>Bird_InitState_0x1cf                    
BNE        Jump_BirdIsActive                               ; bird is already active, so skip the init check
                                                           ; don't update the room timer, either
LDA        Player_State_AliveDeadRegenState_0x1a8          
BMI        Jump_PlayerIsRegenerating                       ; don't update the timer if the player is in the
                                                           ; regeneration state
BSR        GetPlayerRoomTimerBuffer                        ; undefined GetPlayerRoomTimerBuffer(void)
LDB        <CurrentRoomNumber_0x39                         
LSLB                                                       
ABX                                                        
LDD        ,X                                              ; load timer value for current room
BEQ        Jump_TimerOverInitTheBird                       ; if 0, then init the bird
SUBD       #0x1                                            ; count down the timer
BEQ        Jump_StoreZeroTimerAndInitTheBird               
STD        ,X                                              
Jump_PlayerIsRegenerating:                                 
RTS                                                        
Jump_StoreZeroTimerAndInitTheBird:                         
STD        ,X                                              
Jump_TimerOverInitTheBird:                                 ; initial screen Y and X position
LDD        #0x1a23                                         
                                                           ; y: 23 (0-191) x: 35 (0-127, maybe)
STA        0x4,Y=>Bird_Y_0x1d8                             
STB        0x6,Y=>Bird_X_0x1da                             
JSR        LoadPosRelativeToYAndComputeScreenPos           ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
STD        0x8,Y=>Bird_VideoPageDrawPosition_0x1dc         
LDA        #0x1                                            
STA        -0x5,Y=>Bird_InitState_0x1cf                    ; bird in active state
LDA        #0x6                                            
STA        -0x1,Y=>Bird_NumRowsInSpriteSetTo6_0x1d3        
LDA        #0x1                                            
JSR        IncrementRomAddressCounter                      ; use this to fill B with a random-ish value
                                                           ; coming from the counter interating through the
                                                           ; cart rom addresses
STD        ,Y=>Bird_SpeedY_0x1d4                           ; set Y speed to 0x1XX where XX comes from
                                                           ; the value computed from IncrementRomAddressCounter
JSR        IncrementRomAddressCounter                      ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
STD        0x2,Y=>Bird_SpeedX_0x1d6                        
Jump_BirdIsActive:                                         ; increment and then shift three times to figure
INC        -0x3,Y=>Bird_AnimationCounter_0x1d1             
                                                           ; out the correct frame to display. Then store
                                                           ; the frame.
LDA        -0x3,Y=>Bird_AnimationCounter_0x1d1             
LSRA                                                       
LSRA                                                       
LSRA                                                       
ANDA       #0x1                                            
STA        -0x2,Y=>Bird_AnimationFrame0or1_0x1d2           
LDD        0x4,Y=>Bird_Y_0x1d8                             
ADDD       ,Y=>Bird_SpeedY_0x1d4                           
CMPA       #0x10                                           ; upper screen bound
BLS        Jump_BirdYHitUpperScreenBound                   
CMPA       #0xb1                                           ; lower screen bound
BCS        Jump_BirdYHasntHitScreenBounds                  
the bird hit the bottom of the screen:                     
LDD        ,Y=>Bird_SpeedY_0x1d4                           
BMI        Jump_UpdateBirdYPosition                        ; if we were already going up, then skip
BRA        Jump_FlipBirdYSpeed                             ; the bird is currently going down, we'll need 
                                                           ; to change that
Jump_BirdYHitUpperScreenBound:                             ; get the current Y speed
LDD        ,Y=>Bird_SpeedY_0x1d4                           
BPL        Jump_UpdateBirdYPosition                        ; if we were already going downwards, then just
                                                           ; skip the next part
we reach here if:                                          
the bird hit the upper screen bound going up:              
the bird hit the lower screen bound going down:            
in that case, we invert the speed:                         
Jump_FlipBirdYSpeed:                                       ; invert the Y speed
COMA                                                       
COMB                                                       
ADDD       #0x1                                            
STD        ,Y=>Bird_SpeedY_0x1d4                           
Jump_UpdateBirdYPosition:                                  
LDD        0x4,Y=>Bird_Y_0x1d8                             
ADDD       ,Y=>Bird_SpeedY_0x1d4                           
Jump_BirdYHasntHitScreenBounds:                            
STD        0x4,Y=>Bird_Y_0x1d8                             
update X position and check bounds:                        
LDD        0x6,Y=>Bird_X_0x1da                             
ADDD       0x2,Y=>Bird_SpeedX_0x1d6                        
CMPA       #0x7                                            
BLS        Jump_BirdHitLeftScreenBound                     
CMPA       #0x73                                           
BCS        Jump_BirdUpdateAnimation                        ; jump if it hasn't hit the right screen bound
LDD        0x2,Y=>Bird_SpeedX_0x1d6                        
BMI        Jump_UpdateBirdXPosition                        
BRA        Jump_FlipBirdXSpeed                             
Jump_BirdHitLeftScreenBound:                               
LDD        0x2,Y=>Bird_SpeedX_0x1d6                        
BPL        Jump_UpdateBirdXPosition                        
we reach here if:                                          
the bird hit the left screen bound going left:             
the bird hit the right screen bound going right:           
in that case, we invert the speed:                         
Jump_FlipBirdXSpeed:                                       
COMA                                                       
COMB                                                       
ADDD       #0x1                                            
STD        0x2,Y=>Bird_SpeedX_0x1d6                        
Jump_UpdateBirdXPosition:                                  
LDD        0x6,Y=>Bird_X_0x1da                             
ADDD       0x2,Y=>Bird_SpeedX_0x1d6                        
Jump_BirdUpdateAnimation:                                  
STD        0x6,Y=>Bird_X_0x1da                             
JSR        LoadPosRelativeToYAndComputeScreenPos           ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
STD        0x8,Y=>Bird_VideoPageDrawPosition_0x1dc         
LDU        #BirdSprite_ClonedInRam_0x3ee2                  
LDA        -0x2,Y=>Bird_AnimationFrame0or1_0x1d2           
BEQ        Jump_DontGoToFrame1OfAnimation                  ; if LDA is 1, move the sprite pointer to the
                                                           ; next frame of the bird animation
LEAU       0x48,U                                          
figure out which frame of the sprite:                      
to display depending on X position:                        
Jump_DontGoToFrame1OfAnimation:                            
LDA        0x6,Y=>Bird_X_0x1da                             
ANDA       #0x3                                            
LDB        #0x12                                           
MUL                                                        
LEAU       D,U                                             
STU        0xa,Y=>Bird_SpriteData_0x1de                    
JMP        EraseAndUpdateAndDrawObject                     
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall LoadPlayerPhysicsToYAndRoomD:          
undefined         A:1            <RETURN>:                 
LoadPlayerPhysicsToYAndRoomDataInfoX:                      
LDY        #Player_PhysicsData_0x1aa                       
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall LoadRoomDoorDataAddrIntoX(vo:          
undefined         A:1            <RETURN>:                 
LoadRoomDoorDataAddrIntoX:                                 
LDX        <RoomGraphicsAndDoorDataAddress_0x3b            
LDA        <CurrentRoomNumber_0x39                         
LSLA                                                       
LDX        A,X                                             ; find the right room graphics and door data
LEAX       0x2,X                                           ; skip the graphics pointer?
LAB_ccb0:                                                  
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined FUN_ccb1():                                      
undefined         A:1            <RETURN>:                 
FUN_ccb1:                                                  ; undefined DrawPickups(undefined A, undefined B, byte * X)
JSR        DrawPickups                                     
BSR        LoadPlayerPhysicsToYAndRoomDataInfoX            ; undefined LoadPlayerPhysicsToYAndRoomDataInfoX(void)
LAB_ccb6:                                                  
LDA        ,X                                              
BEQ        LAB_ccb0                                        
LDB        0x1,X                                           
CMPA       0x4,Y                                           
LBNE       LAB_cd7a                                        
CMPB       0x6,Y                                           
LBNE       LAB_cd7a                                        
LDU        #Player_DoorStateData_0x3ec0                    
LDA        0x5,X                                           
LDA        A,U=>Player_DoorStateData_0x3ec0                
ANDA       <CurrentPlayer_0x52                             
BEQ        LAB_ccb0                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined InitRoom_Maybe():                                
undefined         A:1            <RETURN>:                 
InitRoom_Maybe:                                            ; get the room number from the door data
LDA        0x5,X                                           
CMPA       #0x21                                           ; touching the last door?
BNE        Jump_NotTheLastDoor                             
PSHS        Y X                                            
INC        <GameCompletionCount_0x3a                       ; we've completed a run of the game
                                                           ; increase the difficulty
JSR        InitRoomKeysAndPickups                          ; reinit the rooms and keys for hard difficulty
JSR        InitKeyStateData                                ; undefined InitKeyStateData(void)
LDD        #0x2710                                         
JSR        UpdateAndPrintPlayerScore                       ; undefined UpdateAndPrintPlayerScore(undefined A, undefined B, undefine
PULS        X Y                                            
Jump_NotTheLastDoor:                                       
LDD        0x2,X                                           
STA        0x4,Y                                           
STB        0x6,Y                                           
LDA        0x4,X                                           
STA        <CurrentRoomNumber_0x39                         
LDA        #0x1                                            
STA        -0x5,Y                                          
JSR        ClearSpeedToZero                                ; undefined ClearSpeedToZero(void)
JSR        InitDrops                                       ; undefined InitDrops(void)
CLR        Ball_InitState_0x1ba                            
CLR        <Ball_FallStateCounter_0x32                     
CLR        Bird_InitState_0x1cf                            
LDX        <RoomGraphicsAndDoorDataAddress_0x3b            
LDA        <CurrentRoomNumber_0x39                         
LSLA                                                       
LDU        [A,X]                                           
LDX        #VideoMemory_Page1_0x1c00                       
STX        <CurrentVideoMemLocation_0x4e                   
LBSR       LoadPage1AddressToX                             ; undefined LoadPage1AddressToX(void)
JSR        DrawBackground                                  ; undefined DrawBackground(void)
BSR        LoadRoomDoorDataAddrIntoX                       ; undefined LoadRoomDoorDataAddrIntoX(void)
LDY        #Player_DoorStateData_0x3ec0                    ; address to room or door graphics?
Draw the activated doors for this room:                    
X - Door Information (location, index, etc.):              
Y - Door State Data (has door at index been acti:          
Loop_DrawNextDoor:                                         ; get the door index
LDA        0x5,X=>DAT_1c05                                 
LDA        A,Y=>Player_DoorStateData_0x3ec0                
ANDA       <CurrentPlayer_0x52                             ; is it active for this player?
BEQ        Jump_SkipDrawingDoor                            ; skip if not
BSR        DrawDoorOrMultipleDoors_Maybe                   ; undefined DrawDoorOrMultipleDoors_Maybe(undefined A, undefined B, usho
Jump_SkipDrawingDoor:                                      ; Skip to next door information
LEAX       0x6,X                                           
LDA        ,X=>DAT_1c06                                    ; get the first byte
BNE        Loop_DrawNextDoor                               ; loop if it's not 0, the sentinel value
LDX        #0x400                                          
STX        <CurrentVideoMemLocation_0x4e                   
LBSR       ScreenTransitionWipe                            ; char ScreenTransitionWipe(void)
LDX        PlayerLives_DrawLocationInPage_0x1eb            
LEAX       -0x4,X                                          ; get the player sprite address? and then not use it?
LDU        <CurrentInGamePlayerStringPointer               
JSR        PrintString                                     ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
LDA        <CurrentRoomNumber_0x39                         
BEQ        Jump_AlreadyVisitedThisRoom                     
LDX        #RoomsPlayersHaveVisited_0x36b                  
LDA        <CurrentRoomNumber_0x39                         
LEAX       A,X                                             
LDA        ,X=>RoomsPlayersHaveVisited_0x36b               ; get 0 or 1
ANDA       <CurrentPlayer_0x52                             ; and with 0b01 or 0b10
BNE        Jump_AlreadyVisitedThisRoom                     ; if result of AND is > 0 then jump
LDA        ,X=>RoomsPlayersHaveVisited_0x36b               
ORA        <CurrentPlayer_0x52                             
STA        ,X=>RoomsPlayersHaveVisited_0x36b               ; we've now visited this room
LDD        #0x3e8                                          
CMPX       #0xdc1b                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: cd5f:                                      
Jump_AlreadyVisitedThisRoom:                               
LDD        <ZeroValue                                      
LAB_cd5f:                                                  ; undefined UpdateAndPrintPlayerScore(undefined A, undefined B, undefine
JSR        UpdateAndPrintPlayerScore                       
LDX        #0x455                                          
LDU        #String_Chamber                                 ; = 12
JSR        PrintString                                     ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
LDU        #0xd0                                           
LDA        #0x24                                           
LDB        <CurrentRoomNumber_0x39                         
STD        ,U=>TimerNumbers_1_0xd0                         
JSR        PrintString                                     ; undefined PrintString(undefined param_1, undefined param_2, byte * scr
JMP        GetRoomDataForCurrentRoom                       
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
LAB_cd7a:                                                  
LEAX       0x6,X                                           
JMP        LAB_ccb6                                        
??         39h    9                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawDoorOrMultipleDoors_Mayb:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
ushort *          X:2            X:                        
undefined2        Y:2            Y:                        
undefined2        U:2            U:                        
DrawDoorOrMultipleDoors_Maybe:                             
PSHS        U X                                            
LDD        ,X                                              ; load the drawing address of the door
CMPA       #0xff                                           ; check if the address is for the start up door? (0xffff)
BEQ        LOOP_AlreadyDone                                
CMPB       #0x40                                           ; check against the door index?
BCS        Jump_OffsetLeft                                 
ADDB       #0x7                                            ; otherwise offset to the right.
                                                           ; for some reason
CMPX       #LAB_c003+1                                     
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: cd92:                                      
Jump_OffsetLeft:                                           
SUBB       #0x4                                            
LAB_cd92:                                                  ; save the X screen position
PSHS        B                                              
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
save the drawing location into U:                          
TFR        B,U                                             
PULS        A                                              ; retrieve the X screen position
ANDA       #0x3                                            
STA        <UtilityCounter_0x26                            ; pixel offset to draw door with?
PSHS        U                                              
LDU        #SpriteDrawingBuffer_0x83                       ; destination to write the door sprite?
LDX        #Data_DoorSprite_0xdf0a                         ; sprite source
LDA        #16                                             ; 16 lines of the door sprite
STA        <SecondUtilityCounter_0x4d                      
LOOP_DrawOneLineOfDoorToBufferAt0x83:                      ; copy two bytes from sprite
LDD        ,X++=>Data_DoorSprite_0xdf0a                    
STD        ,U++=>SpriteDrawingBuffer_0x83                  ; paste two bytes to U
CLR        ,U+=>DAT_0085                                   ; clear the nexte byte in U.
                                                           ; this takes into account any shifting
                                                           ; of the sprite in the buffer
DEC        <SecondUtilityCounter_0x4d                      
BNE        LOOP_DrawOneLineOfDoorToBufferAt0x83            
for the 1 to 3 offset in UtilityCounter, shift t:          
by offset * 2 bits:                                        
LDA        <UtilityCounter_0x26                            
BEQ        ShiftBitsInSpriteDrawingBuffer::Jump_DoneWork_  
LDB        #0x10                                           ; num lines in a sprite? 16
BSR        ShiftBitsInSpriteDrawingBuffer                  ; undefined ShiftBitsInSpriteDrawingBuffer(undefined param_1, char param
PULS        U                                              ; pull back the drawing location into U
LDX        #SpriteDrawingBuffer_0x83                       
LDA        #16                                             ; 16 lines of a sprite
JSR        DrawingFunctionFor3ByteWideSprites              ; draw the sprite from the buffer in 0x83
LOOP_AlreadyDone:                                          
PULS        X U PC                                         
************************************************:          
* ShiftBitsInSpriteDrawingBuffer:                          
* To maintain the CRT artifacts when drawing to:           
* we use this function to shift the graphics in:           
* drawing buffer so that they land on the approp:          
************************************************:          
undefined __stdcall ShiftBitsInSpriteDrawingBuff:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
char              B:1            param_2:                  
A: number of bits to shift by. the result will b:          
B: number of lines of the sprite to process:               
ShiftBitsInSpriteDrawingBuffer:                            
LDX        #SpriteDrawingBuffer_0x83                       
Jump_ProcessThreeBytes:                                    ; values from 1 to 3
LDA        <UtilityCounter_0x26                            
shift by two bits at a time to the right:                  
because the screen is 256 pixels wide:                     
and graphics are treated as 128?:                          
Jump_ShuffleBitsAround:                                    
LSR        ,X=>SpriteDrawingBuffer_0x83                    
ROR        0x1,X=>DAT_0084                                 
ROR        0x2,X=>DAT_0085                                 
LSR        ,X=>SpriteDrawingBuffer_0x83                    
ROR        0x1,X=>DAT_0084                                 
ROR        0x2,X=>DAT_0085                                 
DECA                                                       
BNE        Jump_ShuffleBitsAround                          
LEAX       0x3,X                                           
DECB                                                       ; next three bytes
BNE        Jump_ProcessThreeBytes                          
Jump_DoneWork_RTS_cde2:                                    
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitVideoRegisters(void):              
undefined         A:1            <RETURN>:                 
InitVideoRegisters:                                        
LDA        PIA1_B_DATA_REG__FF22                           
ANDA       #00000111b                                      ; bit 0: RS-232C DATA INPUT
                                                           ; bit 1: SINGLE BIT SOUDN OUTPUT
                                                           ; bit 2: RAM SIZE INPUT
ORA        <SAM_SETUP_BITS_MAYBE_0x6a                      
STA        PIA1_B_DATA_REG__FF22                           
STA        SAM_V0_FFC0                                     ; // turn off SAM V0 (because writing to FFC0 and not FFC1)
STA        SAM_V1_FFC3                                     ; // turn on SAM V1 (because writing to FFC3 and not FFC2)
STA        SAM_V2_FFC5                                     ; // turn on SAM V2 (because writing to FFC5 and not FFC4)
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall SetupSAMPages(byte param_1):           
undefined         A:1            <RETURN>:                 
byte              A:1            param_1:                  
SetupSAMPages:                                             ; The first Sam Page Select Register Address
LDX        #SAM_PAGE_SELECT_REG_SAM_F0_FFC6                
LSRA                                                       ; shift right A (to skip the first bit?)
LDB        #0x7                                            ; go through the 7 flags of A to setup
                                                           ; the pages which are cleared/set by
                                                           ; 7 pairs of addresses starting at FFC6.
                                                           ; Setting even address clears while setting
                                                           ; odd addresses sets.
LAB_cdfd:                                                  ; shift right A
LSRA                                                       
BCS        LAB_ce03                                        ; was there a bit? If so, jump.
STA        ,X=>SAM_PAGE_SELECT_REG_SAM_F0_FFC6             ; there wasn't, set the bit to disable the page
CMPX       #0xa701                                         ; now what? don't we want to skip this and the
                                                           ; setting on the odd numbered address?
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: ce05:                                      
LAB_ce03:                                                  ; set the value to the odd numbered SAM port at FFCX
STA        0x1,X=>SAM_PAGE_SELECT_REG_SAM_F0_FFC7          
                                                           ; to enable the page
LAB_ce05:                                                  ; skip to the next pair
LEAX       0x2,X                                           
DECB                                                       
BNE        LAB_cdfd                                        ; loop if we're not done processing
                                                           ; the 7 bits
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall LoadPage1AddressToX(void):             
undefined         A:1            <RETURN>:                 
LoadPage1AddressToX:                                       
LDX        #VideoMemory_Page1_0x1c00                       
BRA        ClearVideoMemory_0x0400_to_0x3400::JUMP_Load0x  
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ClearVideoMemory_0x0400_to_0:          
undefined         A:1            <RETURN>:                 
ClearVideoMemory_0x0400_to_0x3400:                         ; start of video memory?
LDX        #0x400                                          
JUMP_Load0x1bToD_ce13:                                     ; this the value to set
LDD        <ZeroValue                                      
LOOP_UntilReachingAddress0x3400:                           
STD        ,X++=>VideoMemory_Page0_0x0400                  
CMPX       #0x3400                                         
BNE        LOOP_UntilReachingAddress0x3400                 
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
char __stdcall ScreenTransitionWipe(void):                 
char              A:1            <RETURN>:                 
Stack[-0x1]:1  drawDottedLineFlag:                         
ScreenTransitionWipe:                                      ; save some space on the stack
CLR        ,-S=>drawDottedLineFlag                         
LDX        #0x400                                          ; initial setup main screen video page
Loop_DrawTransitionSections:                               
TFR        X,D                                             
BITB       #00011111b                                      
BNE        Jump_SkipSleep                                  ; pause when reaching the end of the line, maybe
run an empty loop to serve as a delay:                     ; start at the beginning of the first page
LDY        #0x400                                          
Loop_Sleep:                                                
LEAY       -0x1,Y                                          
BNE        Loop_Sleep                                      ; seems like just a delay
Jump_SkipSleep:                                            ; devide the screen into 6 equal parts
LDB        #0x6                                            
                                                           ; 1024 bytes each in video mem
Loop_NextSection:                                          ; get source pixel from second video page
LDA        0x1800,X=>VideoMemory_Page1_0x1c00              
STA        ,X=>VideoMemory_Page0_0x0400                    ; copy to first page
LDA        ,S=>drawDottedLineFlag                          
BNE        Jump_SkipDrawingDottedLine                      
LDA        #01010101b                                      ; dotted line pattern
STA        0x20,X=>DAT_0420                                ; draw dotted pattern on next line
Jump_SkipDrawingDottedLine:                                ; jump to next section 32 pixels down to wipe
LEAX       0x400,X                                         
PSHS        B                                              
TFR        X,D                                             ; use the A component of X to play the sound during the wipe
                                                           ; A goes from 8->C->10->14->18->1c
ORA        #00000010b                                      
STA        PIA1_A_DATA_REG__FF20                           ; send the data to the sound generator
PULS        B                                              
DECB                                                       
BNE        Loop_NextSection                                
LEAX       -0x17ff,X                                       ; done with the six sections, jump back to the start
                                                           ; but land one byte over
CMPX       #0x7e0                                          
BCS        Jump_SkipSettingDrawDottedLineFlag              ; if we reach the last line of the section, then set the
                                                           ; stack value which will stop the dotted line to be
                                                           ; drawn?
LDA        #0xff                                           ; we've reached the last line, set the value on the stack
STA        ,S=>drawDottedLineFlag                          
Jump_SkipSettingDrawDottedLineFlag:                        
CMPX       #0x800                                          
BNE        Loop_DrawTransitionSections                     
PULS        A                                              
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitPlayerSomething(void):             
undefined         A:1            <RETURN>:                 
InitPlayerSomething:                                       
LDY        #Player_PhysicsData_0x1aa                       
LDA        #0x2                                            
STA        -0x5,Y=>Player_GameStateCounter_0x1a5           
LDA        #0x10                                           
STA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitBouncingBall(void):                
undefined         A:1            <RETURN>:                 
Check whether we need to init the ball for the l:          
InitBouncingBall:                                          
LDX        #RoomsWithBouncingBall                          
Loop_SearchForRoomNumber:                                  ; = 2h
LDA        ,X+=>RoomsWithBouncingBall                      
BMI        Jump_NoBallForThisRoom                          
CMPA       <CurrentRoomNumber_0x39                         
BNE        Loop_SearchForRoomNumber                        
we found that the current room number:                     
uses the bouncing ball.:                                   
start initializing it:                                     
LDY        #Ball_Physics_0x1bf                             
Clear the ball data:                                       
LDX        #Ball_InitState_0x1ba                           
Loop_ClearBallData:                                        
CLR        ,X+=>Ball_InitState_0x1ba                       
CMPX       #EndOfBallData                                  ; end of ball data
BNE        Loop_ClearBallData                              
Init the ball data:                                        
LDA        #0x1                                            
STA        -0x5,Y=>Ball_InitState_0x1ba                    ; init ball state to 1
LDA        #0x8                                            
STA        -0x1,Y=>Ball_NumRowsInSpriteSetTo8_0x1be        
LDD        #0xffa8                                         ; horizontal speed, always go the left
STD        0x2,Y=>Ball_SpeedX_0x1c1                        
LDD        <ZeroValue                                      
STD        ,Y=>Ball_SpeedY_0x1bf                           
LDD        #0x7465                                         ; hardcoded init position -  Y: 116, X: 101
                                                           ; same start position for every level
STA        0x4,Y=>Ball_Y_0x1c3                             
STB        0x6,Y=>Ball_X_0x1c5                             
JSR        LoadPosRelativeToYAndComputeScreenPos           ; undefined LoadPosRelativeToYAndComputeScreenPos(void)
STD        0x8,Y=>Ball_VideoPageDrawPosition_0x1c7         
Jump_NoBallForThisRoom:                                    
RTS                                                        
RoomsWithBouncingBall:                                     
db         0h                                              
BYTE_cead:                                                 
db         2h                                              
db         5h                                              
db         6h                                              
db         Ah                                              ; this suggests the ball existing in rooms
                                                           ; past the tenth. 
db         Bh                                              
db         Ch                                              
db         Dh                                              
db         Eh                                              
db         FFh                                             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitVideoAndSetupRoomAndGrap:          
undefined         A:1            <RETURN>:                 
InitVideoAndSetupRoomAndGraphics:                          ; undefined ClearVideoMemory_0x0400_to_0x3400(void)
JSR        ClearVideoMemory_0x0400_to_0x3400               
JSR        InitVideoRegisters                              ; undefined InitVideoRegisters(void)
LDX        #RoomGraphicsAndDoorData_0xd25a                 ; = D26Eh
STX        <RoomGraphicsAndDoorDataAddress_0x3b            
CLR        <CurrentRoomNumber_0x39                         
RTS                                                        
TitleScreenBackground_DrawCommands:                        ; shape code: over 127 means that it repeats. stalactite
db         80h                                             
db         Ch                                              ; repeat count for previous shape.
db         4h                                              ; top right hand corner piece
db         81h                                             ; repeatable wall, going down
db         Ah                                              ; repeat 10 times
db         89h                                             ; repeatable floor piece going left
db         Eh                                              ; repeat 15 times
db         87h                                             ; repeatable wall, going up
db         Ah                                              ; do it 10 times
db         2h                                              ; left hand corner piece
db         FFh                                             ; end
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitKeyStateData(void):                
undefined         A:1            <RETURN>:                 
InitKeyStateData:                                          ; 34 bytes to clear
LDB        #0x22                                           
LDX        #Player_DoorStateData_0x3ec0                    ; clear start address
Loop_ClearKeyStateData:                                    
CLR        ,X+=>Player_DoorStateData_0x3ec0                
DECB                                                       
BNE        Loop_ClearKeyStateData                          
LDX        #Player_DoorStateData_0x3ec0                    
LDU        #OffsetsToKeysAlreadyActivated_0xceea           
LDB        #0x3                                            ; value to set, 0b00000011 to set the key as
                                                           ; already enabled for both players
Loop_ContinueSetActiveKeyStates:                           ; load value into A 
LDA        ,U+=>OffsetsToKeysAlreadyActivated_0xceea       
                                                           ; 0, 2, 4, 5, 7, etc.
BMI        Jump_HitEndOfActiveKeyOffsets                   ; loop until we hit FF
STB        A,X=>Player_DoorStateData_0x3ec0                ; store 3 to A + X
BRA        Loop_ContinueSetActiveKeyStates                 
Jump_HitEndOfActiveKeyOffsets:                             
RTS                                                        
OffsetsToKeysAlreadyActivated_0xceea:                      
db         0h                                              
BYTE_ceeb:                                                 
db         2h                                              
db         4h                                              
db         5h                                              
db         7h                                              
db         8h                                              
db         9h                                              
db         Ch                                              
db         Dh                                              
db         Eh                                              
db         Fh                                              
db         10h                                             
db         11h                                             
db         12h                                             
db         14h                                             
db         FFh                                             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall Init_PlayerLivesIconParamete:          
undefined         A:1            <RETURN>:                 
Init_PlayerLivesIconParameters:                            
LDY        #CurrentPlayerSpritePointer_0x1e9               
LDD        #0x214                                          
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
STD        0x2,Y=>PlayerLives_DrawLocationInPage_0x1eb     
LDA        #0x7                                            
STA        -0x1,Y=>PlayerLives_HeadIcon_LinesToDraw_0x1e7  
LDA        #0x3                                            ; 3 bytes meaning 24 pixels (3 bytes * 8 pixels)
STA        -0x5,Y=>PlayerLives_HeadIcons_Spacing_0x1e4     
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall GetRoomDataForCurrentRoom(un:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            B:                        
byte *            X:2            param_3:                  
GetRoomDataForCurrentRoom:                                 
LDY        #PerRoomPickupData_0x271                        
LDA        <CurrentRoomNumber_0x39                         
LDB        #0x19                                           
MUL                                                        
LEAY       B,Y                                             
STY        <PerRoomPickupDataAddress_0x3d                  
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawPickups(undefined A, und:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
byte *            X:2            X:                        
DrawPickups:                                               
LDA        #0x5                                            
STA        <SecondUtilityCounter_0x4d                      
LDY        <PerRoomPickupDataAddress_0x3d                  
Jump_ProcessPickup:                                        
LDA        ,Y                                              
ANDA       <CurrentPlayer_0x52                             ; is active for this player?
BEQ        Jump_SkipToNextPickup                           
JSR        SetupPickupScreenLocationAndNumLinesToClear     ; undefined SetupPickupScreenLocationAndNumLinesToClear(void)
LSLB                                                       
LDA        0x1,Y                                           
MUL                                                        
LDU        #PickupSpriteData                               ; = 0001000100010000b
LEAU       B,U                                             
LDB        #10                                             ; number of lines in the pickup sprite
STB        <UtilityCounter_0x26                            
BSR        DrawSprite_16PixelsWide                         ; undefined DrawSprite_16PixelsWide(undefined param_1, undefined param_2
Jump_SkipToNextPickup:                                     
LEAY       0x5,Y                                           
DEC        <SecondUtilityCounter_0x4d                      
BNE        Jump_ProcessPickup                              
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSprite_16PixelsWide(unde:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
byte *            X:2            X:                        
undefined2        Y:2            param_4:                  
DrawSprite_16PixelsWide:                                   ; load two bytes of the sprite (one line)
LDD        ,U++                                            
ORA        ,X                                              ; Or A with the value stored at X on screen
ORB        0x1,X                                           ; Or B with the value stored at X+1 on screen
STD        ,X                                              ; write A&B to the X location on screen
                                                           ; (combination sprite and the background)
LEAX       0x20,X                                          ; go to next line
DEC        <UtilityCounter_0x26                            
BNE        DrawSprite_16PixelsWide                         ; we're not done, go to next line in the sprite
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdateAndDrawDrops(void):              
undefined         A:1            <RETURN>:                 
UpdateAndDrawDrops:                                        
LDY        #DropDataBlock_0x1ef                            
LDA        <Drop_TickTockBetweenFFto0andBack_0x40          
BEQ        Jump_TickTockIsZero                             
LEAY       0xd,Y                                           ; If the value is not zero, skip to next drop?
Jump_TickTockIsZero:                                       
COM        <Drop_TickTockBetweenFFto0andBack_0x40          
Jump_ProcessDrop:                                          
LDA        ,Y=>Drop0_CeilingWiggleTimer_0x1ef              
BEQ        Jump_DropInactive                               
BMI        Jump_DropIsWiggling                             
DECA                                                       ; If the drop wiggle timer was initialized to 1,
                                                           ; this decrements to 0. And the branch will make
                                                           ; it so it'll be initialized for the first time.
BEQ        Jump_InitSingleDrop                             ; Init the drop for the first time
LDX        0xa,Y=>Drop1_PreviousVideoPageDrawLocation_0x206
LEAX       0x18c0,X                                        ; get the position and move it so that it
                                                           ; lands on the next page, where terrain collisions
                                                           ; are tested against. The location is offseted by 
                                                           ; 0xC0 (192) which is 6 lines underneath 
                                                           ; (192 / 32 bytes pitch)
                                                           ; 
LDA        ,X=>DAT_18c0                                    ; load the byte from terrain in second video page 
ANDA       0xc,Y=>Drop1_CollisionMask_0x208                
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
BNE        Jump_DropTouchedTerrain                         
LDA        0x20,X=>DAT_18e0                                ; load from the pixel underneath
ANDA       0xc,Y=>Drop1_CollisionMask_0x208                
JSR        TerrainCollisionTest                            ; byte TerrainCollisionTest(byte A)
BNE        Jump_DropTouchedTerrain                         
Jump_UpdateDropPosition:                                   
LDD        0x3,Y=>Drop1_Y_0x1ff                            
ADDD       offset Drop1_SpeedY_0x1fd,Y                     
STD        0x3,Y=>Drop1_Y_0x1ff                            
LDD        #0x200                                          ; falling drop speed to this, even if 
                                                           ; we were wiggling. 
STD        offset Drop1_SpeedY_0x1fd,Y                     
erase drop from screen:                                    
LDA        0x3,Y=>Drop1_Y_0x1ff                            
LDB        0x5,Y=>Drop1_X_0x201                            
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
STD        0x8,Y=>Drop1_VideoPageDrawLocation_0x204        
LBSR       EraseDropSpriteFromScreen                       ; byte EraseDropSpriteFromScreen(void)
store previous video page draw location:                   
LDX        0x8,Y=>Drop1_VideoPageDrawLocation_0x204        
STX        0xa,Y=>Drop1_PreviousVideoPageDrawLocation_0x206
draw the drop sprite at the new location:                  
LDU        0x6,Y=>Drop1_SpriteData_0x202                   
LDB        #0x6                                            ; number of lines in the sprite
STB        <UtilityCounter_0x26                            
BSR        DrawSprite_16PixelsWide                         ; undefined DrawSprite_16PixelsWide(undefined param_1, undefined param_2
LEAY       0x1a,Y                                          ; advance by two drops?
CMPY       #EndOfDropDataBuffer_0x271                      
BCS        Jump_ProcessDrop                                ; continue processing drops
Jump_DropInactive:                                         
RTS                                                        
Jump_DropIsWiggling:                                       
DEC        ,Y=>Drop1_CeilingWiggleTimer_0x1fc              
LDA        ,Y=>Drop1_CeilingWiggleTimer_0x1fc              
ANDA       #0x2                                            
BEQ        Jump_WiggleUpwards                              
LDD        #0x80                                           ; wiggle downwards
BRA        Jump_StoreDropSpeedY                            
Jump_WiggleUpwards:                                        ; drop speed?
LDD        #0xff80                                         
Jump_StoreDropSpeedY:                                      
STD        offset Drop1_SpeedY_0x1fd,Y                     
BRA        Jump_UpdateDropPosition                         
Jump_DropTouchedTerrain:                                   ; byte EraseDropSpriteFromScreen(void)
BSR        EraseDropSpriteFromScreen                       
Jump_InitSingleDrop:                                       ; pre-drop wiggle countdown
LDB        #0xa8                                           
STB        ,Y=>Drop0_CeilingWiggleTimer_0x1ef              
LDX        #Drops_SpawnPositionsTable                      ; = D073h
LDA        <CurrentRoomNumber_0x39                         ; figure out which pointer to room data to use
LSLA                                                       
LDX        A,X=>Drops_SpawnPositionsTable                  ; jump to the actual per-room data
LDA        #0x3                                            ; data size for each drops area
LDB        ,X+                                             ; store the number of drops areas into B
                                                           ; move X to first drops area in the data
                                                           ; The number in the data is one less than the actual count
                                                           ; ie having one area means the value is 0, three areas makes 
                                                           ; the value 2
JSR        GenerateRandomNumberFrom0ToB                    ; undefined GenerateRandomNumberFrom0ToB()
MUL                                                        ; multiply A and B to figure out which drops area to use
ABX                                                        ; move X to the selected drops area
LDB        ,X                                              ; load the number of drops positions in the area into B
JSR        GenerateRandomNumberFrom0ToB                    ; undefined GenerateRandomNumberFrom0ToB()
LDA        #0x8                                            ; spacing between drops
MUL                                                        ; multiply the selected horizontal drops position by the 
                                                           ; spacing in A
ADDB       0x2,X                                           ; add the horizontal position of the drop area
LDA        <GameCompletionCount_0x3a                       
CMPA       #0x3                                            
BCS        Jump_SkipPositionAdjustment                     ; when the player has completed the game less
                                                           ; than 3 times, it adjusts horizontal positions 
                                                           ; of drops to be even. Otherwise X positions are
                                                           ; unaffected, which (I think) means that drops are 
                                                           ; closer to the sides of vines.
ANDB       #11111110b                                      ; ensure X position is even when in hard mode?
                                                           ; 
Jump_SkipPositionAdjustment:                               ; get the vertical position of the drops area
LDA        0x1,X                                           
STA        0x3,Y=>Drop1_Y_0x1ff                            ; store it in the drop data
STB        0x5,Y=>Drop1_X_0x201                            
ADDA       #0x6                                            
ADDB       #0x4                                            
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
TFR        D,X                                             
LDA        DAT_1800,X                                      ; load source pixel
LDX        #Drawing_PixelBits_d84a                         ; = 11000000b
LDB        0x5,Y=>Drop1_X_0x201                            
ANDB       #0x3                                            ; figure out which bits in the byte to draw
ANDA       B,X=>Drawing_PixelBits_d84a                     ; = 11000000b
JSR        RopeCollisionTest                               ; byte RopeCollisionTest(byte param_1)
BEQ        LAB_d00e                                        
DEC        0x5,Y=>Drop1_X_0x201                            
LAB_d00e:                                                  
LDA        0x3,Y=>Drop1_Y_0x1ff                            
LDB        0x5,Y=>Drop1_X_0x201                            
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
STD        0x8,Y=>Drop1_VideoPageDrawLocation_0x204        
STD        0xa,Y=>Drop1_PreviousVideoPageDrawLocation_0x206
LDU        #Data_DropSprites_0xdf2a                        
LDA        0x5,Y=>Drop1_X_0x201                            
ANDA       #0x3                                            ; figure out which drop sprite frame to  use
LDX        #Drop_CollisionMasks_0xd031                     ; = 11110000b
LDB        A,X=>Drop_CollisionMasks_0xd031                 ; = 11110000b
STB        0xc,Y=>Drop1_CollisionMask_0x208                ; store the offset into the drop sprite data
LDB        #0xc                                            ; this is the size of each frame of drop sprites
MUL                                                        
LEAU       D,U                                             ; figure out the address of the drop sprite frame to use
STU        0x6,Y=>Drop1_SpriteData_0x202                   ; store the drop sprite frame address
LBRA       Jump_DropIsWiggling                             
Drop_CollisionMasks_0xd031:                                
db         11110000b                                       
db         00111100b                                       
db         00001111b                                       
db         00000011b                                       
************************************************:          
*                          FUNCTION:                       
************************************************:          
byte __stdcall EraseDropSpriteFromScreen(void):            
byte              A:1            <RETURN>:                 
EraseDropSpriteFromScreen:                                 ; previous position
LDX        0xa,Y                                           
LDU        0x6,Y                                           ; sprite data
LDA        #0x6                                            ; number of lines in a drop
STA        <UtilityCounter_0x26                            ; store progress at this memory location
Jump_DoSpriteLine:                                         ; get the pixel data for the byte
LDA        ,U+                                             
COMA                                                       ; invert the pixel data
ANDA       ,X                                              ; erase the pixel data from the location
ORA        0x1800,X                                        ; add the pixel data from the second page
STA        ,X                                              ; store back to the first page, resetting it to 
                                                           ; original value
LDB        ,U+                                             ; second byte of sprite data
BEQ        Jump_NextLine                                   ; if it's empty, then skip
COMB                                                       ; it's not empty so do the same as we did on A
ANDB       0x1,X                                           
ORB        0x1801,X                                        
STB        0x1,X                                           
Jump_NextLine:                                             ; move to next line
LEAX       0x20,X                                          
DEC        <UtilityCounter_0x26                            ; next sprite line
BNE        Jump_DoSpriteLine                               
RTS                                                        
Drops_SpawnPositionsTable:                                 ; = 6
dw         Room0_DropPositions                             
dw         Room1_DropPositions                             ; = 5
dw         Room2_DropPositions                             ; = 4
dw         Room3_DropPositions                             ; = 5
dw         Room4_DropPositions                             ; = 4
dw         Room5_DropPositions                             ; = 4
dw         Room6_DropPositions                             ; = 1
dw         Room7_DropPositions                             ; = 6
dw         Room8_DropPositions                             ; = 4
dw         Room9_DropPositions                             ; = 2
dw         Room10_DropPositions                            
Drop Positions:                                            
Format::                                                   
byte 0: number of drops areas (add 1):                     
for every area:                                            
byte 0: drop positions count:                              
byte 1: vertical position in screen pixels:                
byte 2: horizontal position in screen pixels:              
Room0_DropPositions:                                       
db         6                                               
db         12                                              
db         17                                              
db         15                                              
db         9                                               
db         62                                              
db         39                                              
db         1                                               
db         107                                             
db         15                                              
db         5                                               
db         107                                             
db         47                                              
db         1                                               
db         152                                             
db         31                                              
db         1                                               
db         152                                             
db         63                                              
db         1                                               
db         152                                             
db         95                                              
Room1_DropPositions:                                       
db         5                                               
db         5                                               
db         17                                              
db         15                                              
db         4                                               
db         17                                              
db         79                                              
db         5                                               
db         62                                              
db         15                                              
db         1                                               
db         62                                              
db         79                                              
db         1                                               
db         107                                             
db         103                                             
db         2                                               
db         152                                             
db         71                                              
Room2_DropPositions:                                       
db         4                                               
db         12                                              
db         17                                              
db         15                                              
db         2                                               
db         62                                              
db         15                                              
db         1                                               
db         62                                              
db         55                                              
db         9                                               
db         107                                             
db         39                                              
db         4                                               
db         152                                             
db         15                                              
Room3_DropPositions:                                       
db         5                                               
db         12                                              
db         17                                              
db         15                                              
db         3                                               
db         62                                              
db         15                                              
db         6                                               
db         62                                              
db         63                                              
db         3                                               
db         107                                             
db         15                                              
db         0                                               
db         152                                             
db         15                                              
db         1                                               
db         152                                             
db         47                                              
Room4_DropPositions:                                       
db         4                                               
db         12                                              
db         17                                              
db         15                                              
db         1                                               
db         62                                              
db         15                                              
db         8                                               
db         77                                              
db         31                                              
db         1                                               
db         152                                             
db         47                                              
db         1                                               
db         152                                             
db         87                                              
Room5_DropPositions:                                       
db         4                                               
db         12                                              
db         17                                              
db         15                                              
db         1                                               
db         62                                              
db         103                                             
db         10                                              
db         107                                             
db         31                                              
db         1                                               
db         152                                             
db         15                                              
db         2                                               
db         152                                             
db         71                                              
Room6_DropPositions:                                       
db         1                                               
db         12                                              
db         17                                              
db         15                                              
db         9                                               
db         92                                              
db         39                                              
Room7_DropPositions:                                       
db         6                                               
db         5                                               
db         17                                              
db         15                                              
db         1                                               
db         32                                              
db         63                                              
db         4                                               
db         17                                              
db         79                                              
db         0                                               
db         92                                              
db         39                                              
db         0                                               
db         92                                              
db         87                                              
db         0                                               
db         107                                             
db         47                                              
db         0                                               
db         107                                             
db         79                                              
Room8_DropPositions:                                       
db         4                                               
db         12                                              
db         17                                              
db         15                                              
db         8                                               
db         62                                              
db         47                                              
db         10                                              
db         92                                              
db         15                                              
db         10                                              
db         122                                             
db         31                                              
db         10                                              
db         152                                             
db         15                                              
Room9_DropPositions:                                       
db         2                                               
db         12                                              
db         17                                              
db         15                                              
db         3                                               
db         62                                              
db         15                                              
db         5                                               
db         92                                              
db         55                                              
Room10_DropPositions:                                      ; count of drops areas
db         0                                               
db         12                                              ; number of drops
db         17                                              ; vertical position in screen pixels
db         14                                              ; horizontal position in screen pixels
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitDrops(void):                       
undefined         A:1            <RETURN>:                 
InitDrops:                                                 ; Disable all the drops in memory
CLRA                                                       
LDB        #10                                             ; num drops
BSR        SetFirstByteOfEachDrop                          ; undefined SetFirstByteOfEachDrop(byte value, byte numDrops)
determine how many drops to init:                          
LDA        <GameCompletionCount_0x3a                       
BEQ        Jump_NormalDifficultyMode                       ; if completed the game at least once, we're 
                                                           ; in hard mode. Init the full 10 drops 
                                                           ; instead of 5. 
LDB        #10                                             ; if is zero, then do all 10 drops
BRA        Jump_InitDrops                                  
Jump_NormalDifficultyMode:                                 
LDB        <CurrentRoomNumber_0x39                         
CMPB       #0x5                                            
BCC        Jump_IncrementDropCount                         ; if our room number is 5 or greater, use that as
                                                           ; the base number of drops to update. Then jump and 
                                                           ; increment it.
LDB        #0x5                                            ; Rooms 0 to 5 have 5 drops going max
Jump_IncrementDropCount:                                   ; always increment drop count by 1
INCB                                                       
Jump_InitDrops:                                            ; Store the current B count
STB        <NumberOfDropsToProcess_0x3f                    
LDA        #0x1                                            ; indicate that the drop needs to be initialized
BSR        SetFirstByteOfEachDrop                          ; undefined SetFirstByteOfEachDrop(byte value, byte numDrops)
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall SetFirstByteOfEachDrop(byte:           
undefined         A:1            <RETURN>:                 
byte              A:1            value:                    
byte              B:1            numDrops:                 
SetFirstByteOfEachDrop:                                    ; point X to this address. 
LDX        #Drop0_CeilingWiggleTimer_0x1ef                 
                                                           ; Drop data block? 
Loop_NextDrop:                                             ; store A to address in X
STA        ,X=>Drop0_CeilingWiggleTimer_0x1ef              
LEAX       0xd,X                                           ; move x by 13 bytes
DECB                                                       ; b--
BNE        Loop_NextDrop                                   ; loop while B is not zero
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall SetupPickupScreenLocationAnd:          
undefined         A:1            <RETURN>:                 
SetupPickupScreenLocationAndNumLinesToClear:               
LDD        0x2,Y                                           
JSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
TFR        D,X                                             
LDB        #0xa                                            
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InitRoomKeysAndPickups(void):          
undefined         A:1            <RETURN>:                 
InitRoomKeysAndPickups:                                    
LDA        #0xff                                           
LDX        #PerRoomPickupData_0x271                        
LDB        #0x32                                           ; size of all buffer containing all the 
                                                           ; pickups for all the rooms
LAB_d153:                                                  
CLR        ,X=>PerRoomPickupData_0x271                     
CLR        0x1,X=>PickUp_Type                              
STA        0x4,X=>PickUp_DoorUnlockIndex                   
LEAX       0x5,X                                           ; next pick up in the buffer
DECB                                                       ; dec pick up counter
BNE        LAB_d153                                        ; Loop_ClearNextPickUp
LDX        #PerRoomPickupData_0x271                        
LDU        #KeyPickUpDoorIndexes_EasyMode                  ; = 01h
LDA        <GameCompletionCount_0x3a                       ; if the game hasn't been completed, use one
                                                           ; set of keys data, otherwise use another.
BEQ        Jump_OverHardMode                               
LDU        #KeyPickUpDoorIndexes_HardMode                  ; = 01h
Jump_OverHardMode:                                         ; setup keys for all 10 rooms
LDB        #0xa                                            
Loop_InitKeyUnlockDoorIndexes:                             ; pick up type for key is 2
LDA        #0x2                                            
STA        0x1,X=>PickUp_Type                              ; store pick up type for key one
STA        0x6,X=>PickUp_Key2_Type                         ; store pick up type for key two
LDA        ,U+=>KeyPickUpDoorIndexes_HardMode              ; load the door unlock index for the first key
STA        0x4,X=>PickUp_DoorUnlockIndex                   ; store the door unlock index for the first key
LDA        ,U+=>DAT_d1d7                                   ; load the door unlock index for the second key
STA        0x9,X=>PickUp_Key2_DoorUnlockIndex              ; store the door unlock index for the second key
LEAX       0x19,X                                          ; move to next room data
DECB                                                       
BNE        Loop_InitKeyUnlockDoorIndexes                   
LDU        #PickUp_StartPositions                          ; = 3Ah    :
LDB        #10                                             
STB        <UtilityCounter_0x26                            
LDX        #PerRoomPickupData_0x271                        
Jump_ProcessRoomPickUps:                                   ; for the five pickups in a room maybe
LDB        #0x5                                            
STB        <SecondUtilityCounter_0x4d                      
Loop_ProcessRoomPickups:                                   
PSHS        X                                              
LDB        <SecondUtilityCounter_0x4d                      
DECB                                                       ; going from 5 to 4
LDA        #0x5                                            ; find the correct pick up data
                                                           ; key index (0 - 4) * key data size (5 bytes)
MUL                                                        
LEAX       D,X                                             ; set X to the correct key data
LDA        #0x3                                            ; set the initial visible/enable state of the pick up
STA        ,X=>PerRoomPickupData_0x271                     
LDB        <SecondUtilityCounter_0x4d                      
DECB                                                       ; we've processed a pick up data
TFR        B,A                                             ; A now contains B (5 on the first loop)
LSLA                                                       ; double A (5 -> 10 on the first loop)
                                                           ; to find the correct position in the 
                                                           ; PickUp_StartPositions buffer
LDD        A,U=>PickUp_StartPositions                      ; = 3Ah    :
                                                           ; = 23h    #
STD        0x2,X                                           ; store the YX position to bytes 3 and 4 
                                                           ; of the pick up data
LDB        0x1,X=>PickUp_Type                              
BNE        Jump_DontCreateTreasure                         
JSR        IncrementRomAddressCounter                      ; use the IncrementRomAddressCounter as a
                                                           ; way to randomly pick between diamonds
                                                           ; (type 0) and money bags (type 1) for the 
                                                           ; three remaining pick ups of the room.
ANDB       #0x1                                            
STB        0x1,X=>PickUp_Type                              
Jump_DontCreateTreasure:                                   
PULS        X                                              
DEC        <SecondUtilityCounter_0x4d                      
BNE        Loop_ProcessRoomPickups                         
LEAX       0x19,X                                          ; move to next room's pick updata
LEAU       0xa,U                                           ; move U by 10 bytes in Pickup_StartPositions
DEC        <UtilityCounter_0x26                            
BNE        Jump_ProcessRoomPickUps                         
RTS                                                        
KeyPickUpDoorIndexes_EasyMode:                             
undefined1 01h                                             
DAT_d1c3:                                                  
undefined1 03h                                             
??         1Eh                                             
??         1Ch                                             
??         13h                                             
??         06h                                             
??         0Bh                                             
??         0Ah                                             
??         15h                                             
??         1Ah                                             
??         16h                                             
??         17h                                             
??         18h                                             
??         19h                                             
??         1Bh                                             
??         21h    !                                        
??         1Dh                                             
??         FFh                                             
??         1Fh                                             
??         20h                                             
KeyPickUpDoorIndexes_HardMode:                             
undefined1 01h                                             
DAT_d1d7:                                                  
undefined1 03h                                             
DAT_d1d8:                                                  
undefined1 1Eh                                             
DAT_d1d9:                                                  
undefined1 1Ch                                             
??         06h                                             
??         13h                                             
??         0Ah                                             
??         0Bh                                             
??         15h                                             
??         1Ah                                             
??         17h                                             
??         16h                                             
??         19h                                             
??         18h                                             
??         21h    !                                        
??         1Bh                                             
??         1Dh                                             
??         FFh                                             
??         20h                                             
??         1Fh                                             
PickUp_StartPositions:                                     
??         3Ah    :                                        
??         1Ch                                             
??         69h    i                                        
??         5Ch    \                                        
??         65h    e                                        
??         20h                                             
??         91h                                             
??         30h    0                                        
??         91h                                             
??         50h    P                                        
DAT_d1f4:                                                  
??         23h    #                                        
??         34h    4                                        
??         23h    #                                        
??         48h    H                                        
??         38h    8                                        
??         64h    d                                        
??         97h                                             
??         3Ch    <                                        
??         97h                                             
??         5Ch    \                                        
??         3Ah    :                                        
??         60h    `                                        
??         44h    D                                        
??         1Ch                                             
??         4Dh    M                                        
??         34h    4                                        
??         69h    i                                        
??         64h    d                                        
??         78h    x                                        
??         40h    @                                        
??         41h    A                                        
??         70h    p                                        
??         4Bh    K                                        
??         24h    $                                        
??         6Ch    l                                        
??         50h    P                                        
??         6Ch    l                                        
??         70h    p                                        
??         9Dh                                             
??         0Ch                                             
??         3Fh    ?                                        
??         0Ch                                             
??         6Ch    l                                        
??         0Ch                                             
??         17h                                             
??         60h    `                                        
??         96h                                             
??         3Ch    <                                        
??         96h                                             
??         64h    d                                        
??         14h                                             
??         6Ch    l                                        
??         30h    0                                        
??         04h                                             
??         4Bh    K                                        
??         1Ch                                             
??         5Dh    ]                                        
??         04h                                             
??         9Bh                                             
??         50h    P                                        
??         15h                                             
??         18h                                             
??         6Ah    j                                        
??         6Ch    l                                        
??         2Bh    +                                        
??         40h    @                                        
??         5Fh    _                                        
??         18h                                             
??         93h                                             
??         34h    4                                        
??         30h    0                                        
??         0Ch                                             
??         9Bh                                             
??         44h    D                                        
??         2Ch    ,                                        
??         3Ch    <                                        
??         3Dh    =                                        
??         6Ch    l                                        
??         9Bh                                             
??         2Ch    ,                                        
??         21h    !                                        
??         38h    8                                        
??         34h    4                                        
??         20h                                             
??         40h    @                                        
??         60h    `                                        
??         5Dh    ]                                        
??         1Ch                                             
??         7Ch    |                                        
??         60h    `                                        
??         13h                                             
??         30h    0                                        
??         3Dh    =                                        
??         38h    8                                        
??         44h    D                                        
??         18h                                             
??         96h                                             
??         38h    8                                        
??         96h                                             
??         60h    `                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawBackground(void):                  
undefined         A:1            <RETURN>:                 
Each room has an array of draw commands.:                  
Each command defines a shape to draw.:                     
Commands with the highest bit set get repeated:            
with the next byte in the buffer being the repea:          
Background Piece codes:                                    
0: normal stalactite going right:                          
1: single wall piece going down:                           
2: left hand corner piece:                                 
3: top right hand corner piece / bottom:                   
4: top right hand corner piece:                            
5: bottom right side of floating platfor:                  
6: floor piece going right:                                
7: wall piece going up:                                    
8: corner piece going down-left:                           
9: floor piece going left:                                 
a: short line going down:                                  
b: short line going up:                                    
c: very short rope:                                        
d: short rope:                                             
e: mid-length rope:                                        
f: long rope:                                              
10: very long rope:                                        
11: super long rope:                                       
12: excessively long rope:                                 
13: rediculously long rope:                                
14: horizontal rope start going right:                     
15: horizontal rope end going right:                       
16: horizontal rope going right:                           
17: blank area going right:                                
18: blank area going left, maybe:                          
19: blank area going down-right:                           
repeatable pieces (code + count):                          
80: stalactite (80 + 0):                                   
81: wall going down (80 + 1):                              
82: left hand corner piece going up-righ:                  
83: etc, etc.:                                             
U contains the pointer to the room draw commands:          
DrawBackground:                                            
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               ; store 1 at 0x20
LDD        #0x100f                                         
STD        <DrawSegment_CurrentScreenYXPosition_0x21       ; store draw start position 0x100f aka x: 15, y: 16
                                                           ; X is in half resolution. 128 pixels wide instead of 
                                                           ; the screen's 256 pixels.
JMP        Jump_ProcessDrawCommands                        
RoomGraphicsAndDoorData_0xd25a:                            ; = D35Eh
dw         Room0_GraphicsAndDoorData_0xd26e                
dw         Room1_GraphicsAndDoorData                       ; = D3A0h
dw         Room2_GraphicsAndDoorData                       ; = D3E4h
dw         Room3_GraphicsAndDoorData                       ; = D426h
dw         Room4_GraphicsAndDoorData                       ; = D467h
dw         Room5_GraphicsAndDoorData                       ; = D4A2h
dw         Room6_GraphicsAndDoorData                       ; = D4D9h
dw         Room7_GraphicsAndDoorData                       ; = D4F6h
dw         Room8_GraphicsAndDoorData                       ; = D52Fh
dw         Room9_GraphicsAndDoorData                       ; = D561h
Room0_GraphicsAndDoorData_0xd26e:                          ; first level exit door?
dw         Room0_DrawCommands                              
dw         FFFFh                                           ; initial start up "door", maybe
InitialPlayerPosition_0xd272:                              ; initial game start position
dw         A570h                                           
db         0h                                              ; room number, maybe
db         0h                                              ; global door index
dw         1E72h                                           ; door position
dw         8707h                                           ; spawn here in next room
db         1h                                              ; room index, maybe
db         1h                                              ; global door index
db         0h                                              ; end tag
Room1_GraphicsAndDoorData:                                 ; = 80h
dw         Room1_DrawCommands                              
dw         8705h                                           ; first door spawn position
dw         1E70h                                           ; spawn here in next room
db         0h                                              ; room index, maybe
db         2h                                              ; global door index
dw         4B72h                                           
dw         A507h                                           
db         2h                                              ; room index
db         3h                                              
dw         1E72h                                           
dw         7807h                                           
db         2h                                              ; room index
db         4h                                              
dw         1E05h                                           
dw         7870h                                           
db         6h                                              ; room index
db         1Ah                                             
db         0h                                              
Room2_GraphicsAndDoorData:                                 ; = 80h
dw         Room2_DrawCommands                              
dw         A505h                                           
dw         4B70h                                           
db         1h                                              
db         5h                                              
dw         7805h                                           
dw         1E70h                                           ; position after entering room from second room door?
db         1h                                              
db         6h                                              
dw         7872h                                           
dw         7807h                                           
db         3h                                              
db         7h                                              
dw         4B72h                                           
dw         4B07h                                           
db         3h                                              
db         13h                                             
dw         1E72h                                           
dw         1E07h                                           
db         3h                                              
db         12h                                             
dw         1E05h                                           
dw         8770h                                           
db         5h                                              
db         15h                                             
db         0h                                              
Room3_GraphicsAndDoorData:                                 ; = 80h
dw         Room3_DrawCommands                              
dw         7805h                                           
dw         7870h                                           
db         2h                                              
db         8h                                              
dw         A572h                                           
dw         A507h                                           
db         4h                                              
db         9h                                              
dw         7872h                                           
dw         7807h                                           
db         4h                                              
db         Ah                                              
dw         4B05h                                           
dw         4B70h                                           
db         2h                                              
db         14h                                             
dw         4B72h                                           
dw         4B07h                                           
db         4h                                              
db         Bh                                              
dw         1E05h                                           
dw         1E70h                                           
db         2h                                              
db         11h                                             
dw         1E72h                                           
dw         1E07h                                           
db         4h                                              
db         10h                                             
db         0h                                              
Room4_GraphicsAndDoorData:                                 ; = 80h
dw         Room4_DrawCommands                              
dw         A505h                                           
dw         A570h                                           
db         3h                                              
db         Ch                                              
dw         7805h                                           
dw         7870h                                           
db         3h                                              
db         Dh                                              
dw         4B05h                                           
dw         4B70h                                           
db         3h                                              
db         Eh                                              
dw         1E05h                                           
dw         1E70h                                           
db         3h                                              
db         Fh                                              
db         0h                                              
Room5_GraphicsAndDoorData:                                 ; = 12h
dw         Room5_DrawCommands                              
dw         8772h                                           
dw         1E07h                                           
db         2h                                              
db         16h                                             
dw         A505h                                           
dw         3C70h                                           
db         6h                                              
db         17h                                             
dw         4B72h                                           
dw         A507h                                           
db         7h                                              
db         1Ah                                             
db         0h                                              
Room6_GraphicsAndDoorData:                                 ; = 13h
dw         Room6_DrawCommands                              
dw         7872h                                           
dw         1E07h                                           
db         1h                                              
db         19h                                             
dw         3C72h                                           
dw         A507h                                           
db         5h                                              
db         18h                                             
db         0h                                              
Room7_GraphicsAndDoorData:                                 
dw         Room7_DrawCommands                              
dw         A505h                                           
dw         4B70h                                           
db         5h                                              
db         1Bh                                             
dw         4B72h                                           
dw         A507h                                           
db         8h                                              
db         1Ch                                             
db         0h                                              
Room8_GraphicsAndDoorData:                                 ; = 14h
dw         Room8_DrawCommands                              
dw         A505h                                           
dw         4B70h                                           
db         7h                                              
db         1Dh                                             
dw         2D72h                                           
dw         1E07h                                           
db         9h                                              
db         1Eh                                             
db         0h                                              
Room9_GraphicsAndDoorData:                                 ; = 80h
dw         Room9_DrawCommands                              
dw         9605h                                           
dw         A570h                                           
db         8h                                              
db         20h                                             
dw         1E05h                                           
dw         2D70h                                           
db         8h                                              
db         1Fh                                             
dw         A572h                                           
dw         A570h                                           
db         0h                                              
db         21h                                             
db         0h                                              
Room0_DrawCommands:                                        
db         Fh                                              
db         80h                                             
db         6h                                              
db         Ch                                              
db         80h                                             
db         4h                                              
db         4h                                              
db         Ah                                              
db         89h                                             
db         Bh                                              
db         3h                                              
db         80h                                             
db         8h                                              
db         Fh                                              
db         4h                                              
db         81h                                             
db         7h                                              
db         89h                                             
db         Eh                                              
db         87h                                             
db         4h                                              
db         2h                                              
db         Fh                                              
db         19h                                             
db         19h                                             
db         17h                                             
db         1h                                              
db         Ch                                              
db         7h                                              
db         97h                                             
db         3h                                              
db         1h                                              
db         Ch                                              
db         7h                                              
db         97h                                             
db         3h                                              
db         1h                                              
db         Ch                                              
db         7h                                              
db         9h                                              
db         98h                                             
db         3h                                              
db         9h                                              
db         98h                                             
db         3h                                              
db         9h                                              
db         18h                                             
db         1Ah                                             
db         1Ah                                             
db         5h                                              
db         17h                                             
db         3h                                              
db         Dh                                              
db         80h                                             
db         3h                                              
db         Dh                                              
db         5h                                              
db         89h                                             
db         7h                                              
db         18h                                             
db         89h                                             
db         3h                                              
db         87h                                             
db         4h                                              
db         2h                                              
db         FFh                                             
Room1_DrawCommands:                                        
db         80h                                             
db         5h                                              
db         4h                                              
db         17h                                             
db         2h                                              
db         0h                                              
db         0h                                              
db         Dh                                              
db         0h                                              
db         4h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         1h                                              
db         Ah                                              
db         89h                                             
db         3h                                              
db         3h                                              
db         Fh                                              
db         4h                                              
db         81h                                             
db         4h                                              
db         89h                                             
db         Ah                                              
db         87h                                             
db         6h                                              
db         9h                                              
db         81h                                             
db         5h                                              
db         9h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         Bh                                              
db         87h                                             
db         4h                                              
db         2h                                              
db         10h                                             
db         80h                                             
db         3h                                              
db         12h                                             
db         4h                                              
db         81h                                             
db         4h                                              
db         3h                                              
db         0h                                              
db         0h                                              
db         5h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         7h                                              
db         7h                                              
db         2h                                              
db         Dh                                              
db         7h                                              
db         9h                                              
db         9h                                              
db         7h                                              
db         18h                                             
db         1h                                              
db         89h                                             
db         7h                                              
db         Bh                                              
db         2h                                              
db         FFh                                             
Room2_DrawCommands:                                        
db         80h                                             
db         3h                                              
db         Ch                                              
db         80h                                             
db         4h                                              
db         Fh                                              
db         0h                                              
db         Dh                                              
db         0h                                              
db         4h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         1h                                              
db         Ah                                              
db         89h                                             
db         9h                                              
db         19h                                             
db         0h                                              
db         Fh                                              
db         80h                                             
db         3h                                              
db         Ch                                              
db         0h                                              
db         0h                                              
db         4h                                              
db         Ah                                              
db         9h                                              
db         9h                                              
db         1h                                              
db         9h                                              
db         9h                                              
db         1h                                              
db         9h                                              
db         9h                                              
db         1h                                              
db         89h                                             
db         8h                                              
db         Bh                                              
db         2h                                              
db         80h                                             
db         4h                                              
db         7h                                              
db         89h                                             
db         5h                                              
db         Bh                                              
db         87h                                             
db         3h                                              
db         2h                                              
db         Fh                                              
db         0h                                              
db         4h                                              
db         1h                                              
db         9h                                              
db         3h                                              
db         0h                                              
db         1Ah                                             
db         7h                                              
db         2h                                              
db         Ch                                              
db         5h                                              
db         89h                                             
db         8h                                              
db         Bh                                              
db         2h                                              
db         FFh                                             
Room3_DrawCommands:                                        
db         80h                                             
db         Ch                                              
db         4h                                              
db         Ah                                              
db         89h                                             
db         Dh                                              
db         19h                                             
db         80h                                             
db         3h                                              
db         4h                                              
db         1h                                              
db         9h                                              
db         9h                                              
db         1h                                              
db         Fh                                              
db         4h                                              
db         1h                                              
db         1h                                              
db         0h                                              
db         87h                                             
db         5h                                              
db         2h                                              
db         12h                                             
db         0h                                              
db         Dh                                              
db         0h                                              
db         12h                                             
db         0h                                              
db         4h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         1h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         1h                                              
db         Ah                                              
db         89h                                             
db         4h                                              
db         87h                                             
db         3h                                              
db         8h                                              
db         81h                                             
db         2h                                              
db         89h                                             
db         9h                                              
db         Bh                                              
db         2h                                              
db         5h                                              
db         9h                                              
db         9h                                              
db         Bh                                              
db         2h                                              
db         0h                                              
db         7h                                              
db         9h                                              
db         9h                                              
db         Bh                                              
db         2h                                              
db         1Ah                                             
db         9h                                              
db         Bh                                              
db         2h                                              
db         FFh                                             
Room4_DrawCommands:                                        
db         80h                                             
db         Bh                                              
db         12h                                             
db         4h                                              
db         81h                                             
db         Ah                                              
db         89h                                             
db         Eh                                              
db         Bh                                              
db         7h                                              
db         5h                                              
db         9h                                              
db         Bh                                              
db         7h                                              
db         5h                                              
db         9h                                              
db         Bh                                              
db         2h                                              
db         0h                                              
db         4h                                              
db         11h                                             
db         0h                                              
db         14h                                             
db         96h                                             
db         4h                                              
db         15h                                             
db         98h                                             
db         6h                                              
db         80h                                             
db         6h                                              
db         19h                                             
db         19h                                             
db         9h                                              
db         98h                                             
db         4h                                              
db         9h                                              
db         81h                                             
db         3h                                              
db         Ch                                              
db         87h                                             
db         3h                                              
db         97h                                             
db         4h                                              
db         81h                                             
db         3h                                              
db         Ch                                              
db         87h                                             
db         3h                                              
db         1Ah                                             
db         1Ah                                             
db         7h                                              
db         89h                                             
db         7h                                              
db         7h                                              
db         89h                                             
db         4h                                              
db         Bh                                              
db         2h                                              
db         FFh                                             
Room5_DrawCommands:                                        
db         12h                                             
db         80h                                             
db         7h                                              
db         Dh                                              
db         80h                                             
db         3h                                              
db         4h                                              
db         Ah                                              
db         89h                                             
db         3h                                              
db         3h                                              
db         0h                                              
db         4h                                              
db         Ah                                              
db         89h                                             
db         4h                                              
db         7h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         7h                                              
db         89h                                             
db         5h                                              
db         81h                                             
db         4h                                              
db         Dh                                              
db         0h                                              
db         Fh                                              
db         80h                                             
db         7h                                              
db         4h                                              
db         1h                                              
db         Ah                                              
db         9h                                              
db         9h                                              
db         7h                                              
db         89h                                             
db         5h                                              
db         3h                                              
db         0h                                              
db         0h                                              
db         4h                                              
db         1h                                              
db         89h                                             
db         Bh                                              
db         Bh                                              
db         2h                                              
db         0h                                              
db         7h                                              
db         9h                                              
db         9h                                              
db         87h                                             
db         7h                                              
db         2h                                              
db         FFh                                             
Room6_DrawCommands:                                        
db         13h                                             
db         80h                                             
db         9h                                              
db         Dh                                              
db         0h                                              
db         4h                                              
db         1h                                              
db         1h                                              
db         Ah                                              
db         89h                                             
db         Bh                                              
db         3h                                              
db         80h                                             
db         7h                                              
db         10h                                             
db         0h                                              
db         4h                                              
db         1h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         1h                                              
db         1h                                              
db         89h                                             
db         Eh                                              
db         87h                                             
db         Ah                                              
db         2h                                              
db         FFh                                             
Room7_DrawCommands:                                        
db         0h                                              
db         13h                                             
db         80h                                             
db         3h                                              
db         4h                                              
db         0h                                              
db         2h                                              
db         0h                                              
db         0h                                              
db         13h                                             
db         0h                                              
db         4h                                              
db         81h                                             
db         3h                                              
db         Ah                                              
db         9h                                              
db         3h                                              
db         81h                                             
db         5h                                              
db         89h                                             
db         7h                                              
db         7h                                              
db         7h                                              
db         5h                                              
db         7h                                              
db         2h                                              
db         2h                                              
db         7h                                              
db         7h                                              
db         9h                                              
db         1h                                              
db         9h                                              
db         1h                                              
db         9h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         1h                                              
db         1h                                              
db         84h                                             
db         3h                                              
db         8h                                              
db         1h                                              
db         1h                                              
db         89h                                             
db         6h                                              
db         87h                                             
db         6h                                              
db         5h                                              
db         9h                                              
db         Bh                                              
db         87h                                             
db         2h                                              
db         2h                                              
db         FFh                                             
Room8_DrawCommands:                                        
db         14h                                             
db         96h                                             
db         9h                                              
db         15h                                             
db         98h                                             
db         Bh                                              
db         Fh                                              
db         80h                                             
db         9h                                              
db         Dh                                              
db         0h                                              
db         4h                                              
db         1h                                              
db         Ah                                              
db         89h                                             
db         9h                                              
db         86h                                             
db         7h                                              
db         Eh                                              
db         4h                                              
db         81h                                             
db         3h                                              
db         89h                                             
db         Bh                                              
db         86h                                             
db         9h                                              
db         Eh                                              
db         4h                                              
db         81h                                             
db         3h                                              
db         89h                                             
db         Eh                                              
db         Bh                                              
db         2h                                              
db         86h                                             
db         Ah                                              
db         89h                                             
db         Bh                                              
db         87h                                             
db         3h                                              
db         2h                                              
db         Eh                                              
db         86h                                             
db         9h                                              
db         89h                                             
db         Bh                                              
db         87h                                             
db         4h                                              
db         2h                                              
db         FFh                                             
Room9_DrawCommands:                                        
db         80h                                             
db         5h                                              
db         Dh                                              
db         0h                                              
db         Dh                                              
db         0h                                              
db         Dh                                              
db         0h                                              
db         12h                                             
db         4h                                              
db         81h                                             
db         Ah                                              
db         89h                                             
db         Ah                                              
db         9Ah                                             
db         3h                                              
db         5h                                              
db         9h                                              
db         9h                                              
db         3h                                              
db         99h                                             
db         3h                                              
db         9h                                              
db         9h                                              
db         7h                                              
db         9h                                              
db         9h                                              
db         87h                                             
db         6h                                              
db         2h                                              
db         11h                                             
db         0h                                              
db         0h                                              
db         19h                                             
db         17h                                             
db         17h                                             
db         1h                                              
db         Dh                                              
db         7h                                              
db         17h                                             
db         1h                                              
db         Dh                                              
db         7h                                              
db         17h                                             
db         1h                                              
db         Dh                                              
db         7h                                              
db         9h                                              
db         18h                                             
db         9h                                              
db         18h                                             
db         9h                                              
db         18h                                             
db         18h                                             
db         1Ah                                             
db         5h                                              
db         89h                                             
db         5h                                              
db         Bh                                              
db         2h                                              
db         FFh                                             
Jump_ProcessDrawCommands:                                  ; load the address of a data block to X
LDX        #DrawCommandFunctions_d5bb                      
U will point to the room's draw commands:                  
LOOP_GetNextDrawCommand:                                   ; get next command, increment U
LDA        ,U+                                             
BPL        Jump_SingleDrawCommand                          
INCA                                                       ; is not plus, so increment
BEQ        Jump_EncounteredFFEndValue                      ; Ju
DECA                                                       
LDB        ,U+                                             ; This is a repeatable command, get the count and store in B
CMPX       #0xc601                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: d5ae:                                      
Jump_SingleDrawCommand:                                    ; load 1 to B, overriding above. but why?
LDB        #0x1                                            
LAB_d5ae:                                                  ; double A to get the appropriate function address
LSLA                                                       
                                                           ; offset from the DrawCommandFunctions array
Loop_CallDrawCommand:                                      ; push to the stack
PSHS        U X B A                                        
JSR        [A,X]                                           ; call function from DrawCommandFunctions_d5bb table 
                                                           ; A is the offset into the table
PULS        A B X U                                        ; done calling the function
DECB                                                       
BNE        Loop_CallDrawCommand                            ; are we done?
BRA        LOOP_GetNextDrawCommand                         
Jump_EncounteredFFEndValue:                                
RTS                                                        
there are more than two dozen different pieces:            
these seem to be the function related to drawing:          
each piece. maybe.:                                        
DrawCommandFunctions_d5bb:                                 
dw         DrawPiece_00_Stalactite                         
dw         DrawPiece_01_WallGoingDown                      
dw         DrawPiece_02_LeftHandCornerPiece                
dw         DrawPiece_03_TopRightHandCornerPiece            
dw *       DrawPiece_04_TopRightHandCornerPiece2           
dw         DrawPiece_05_BottomRightSideOfFloatingPlatforms 
dw         DrawPiece_06_FloorPieceGoingRight               
dw         DrawPiece_07_WallPieceGoingUp                   
dw         DrawPiece_08_CornerPieceGoingDownLeft           
dw         DrawPiece_09_FloorPieceGoingLeft                ; DrawPiece_0_
dw         DrawPiece_0a_ShortLineGoingDown                 
dw         DrawPiece_0b_ShortLineGoingUp                   
dw         DrawPiece_0c_VeryShortRope                      
dw         DrawPiece_0d_ShortRope                          
dw         DrawPiece_0e_MidLengthRope                      
dw         DrawPiece_0f_LongRope                           
dw         DrawPiece_10_VeryLongRope                       
dw         DrawPiece_11_SuperLongRope                      
dw         DrawPiece_12_ExcessivelyLongRope                
dw         DrawPiece_13_RediculouslyLongRope               
dw         DrawPiece_14_HorizontalRopeStartGoingRight      
dw         DrawPiece_15_HorizontalRopeEndGoingRight        
dw         DrawPiece_16_HorizontalRopeGoingRight           
dw         DrawPiece_17_BlankAreaGoingRight                
dw         DrawPiece_18_BlankAreaGoingLeft                 
dw         DrawPiece_19_BlankAreaGoingDownRight            
dw         DrawPiece_20_UnknownOrBuggy                     
DrawPiece_00_Stalactite:                                   ; = 03h
LDU        #DrawData_00_Stalactite                         
JMP        DrawBackgroundPiece                             
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
DrawData_00_Stalactite:                                    ; num segments
db         03h                                             
                                                           ; 
db         80h                                             ; subpixels to move along X
db         04h                                             ; number of pixels to move along Y 
db         00h                                             ; orientation 0, up and right
                                                           ; 
db         80h                                             ; subpixels to move along X
db         0Ah                                             ; number of pixels to move along Y 
db         03h                                             ; orientation 3, down and right
                                                           ; 
db         80h                                             ; subpixels to move along X
db         07h                                             ; number of pixels to move along Y 
db         00h                                             ; orienation 0, up and right
DrawPiece_07_WallPieceGoingUp:                             ; = 03h
LDU        #DrawData_07_WallPieceGoingUp                   
BRA        Jump_JumpToDrawBackgroundPiece                  
DrawPiece_01_WallGoingDown:                                ; = 03h
LDU        #DrawData_01_WallGoingDown                      
Jump_JumpToDrawBackgroundPiece:                            
JMP        DrawBackgroundPiece                             
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
DrawData_01_WallGoingDown:                                 
db         03h                                             
db         40h                                             
db         08h                                             
db         04h                                             
db         40h                                             
db         05h                                             
db         03h                                             
db         00h                                             
db         05h                                             
db         04h                                             
DrawData_07_WallPieceGoingUp:                              
db         03h                                             
db         00h                                             
db         05h                                             
db         00h                                             
db         40h                                             
db         05h                                             
db         07h                                             
db         40h                                             
db         08h                                             
db         00h                                             
DrawPiece_02_LeftHandCornerPiece:                          ; = 3h
LDU        #DrawData_02_LeftHandCornerPiece                
BRA        Jump_AnotherJumpToDrawBackgroundPiece           
DrawData_02_LeftHandCornerPiece:                           
db         3h                                              
db         0h                                              
db         4h                                              
db         7h                                              
db         80h                                             
db         7h                                              
db         0h                                              
db         FFh                                             
db         7h                                              
db         0h                                              
DrawPiece_08_CornerPieceGoingDownLeft:                     ; = 03h
LDU        #DrawData_08_CornerPieceGoingDownLeft           
Jump_AnotherJumpToDrawBackgroundPiece:                     
JMP        DrawBackgroundPiece                             
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
DrawData_08_CornerPieceGoingDownLeft:                      
db         03h                                             
db         FFh                                             
db         07h                                             
db         04h                                             
db         80h                                             
db         07h                                             
db         04h                                             
db         00h                                             
db         04h                                             
db         03h                                             
DrawPiece_03_TopRightHandCornerPiece:                      ; = 03h
LDU        #DrawData_03_TopRightHandCornerPiece            
BRA        Jump_AgainAnotherJumpToDrawBackgroundPiece      
DrawData_03_TopRightHandCornerPiece:                       
db         03h                                             
db         80h                                             
db         06h                                             
db         03h                                             
db         00h                                             
db         04h                                             
db         03h                                             
db         FFh                                             
db         08h                                             
db         03h                                             
DrawPiece_04_TopRightHandCornerPiece2:                     ; set a new U stack
LDU        #DrawData_04_TopRightHandCornerPiece2           
Jump_AgainAnotherJumpToDrawBackgroundPiece:                
JMP        DrawBackgroundPiece                             
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
DrawData_04_TopRightHandCornerPiece2:                      
db         03h                                             
db         80h                                             
db         06h                                             
db         03h                                             
db         FFh                                             
db         05h                                             
db         03h                                             
db         80h                                             
db         07h                                             
db         03h                                             
DrawPiece_05_BottomRightSideOfFloatingPlatforms:           ; = 03h
LDU        #DrawData_05_BottomRightSideOfFloatingPlatforms 
BRA        Jump_AgainAnotherJumpToDrawBackgroundPiece      
DrawData_05_BottomRightSideOfFloatingPlatforms:            
db         03h                                             
db         FFh                                             
db         08h                                             
db         00h                                             
db         00h                                             
db         05h                                             
db         00h                                             
db         80h                                             
db         05h                                             
db         00h                                             
DrawPiece_14_HorizontalRopeStartGoingRight:                ; = 01h
LDU        #DrawData_14_HorizontalRopeStartGoingRight      
LDA        #0x3                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
BSR        DrawBackgroundPieceWrapper                      ; undefined DrawBackgroundPieceWrapper(void)
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
RTS                                                        
DrawData_14_HorizontalRopeStartGoingRight:                 
db         01h                                             
db         FFh                                             
db         0Ah                                             
db         03h                                             
DrawPiece_15_HorizontalRopeEndGoingRight:                  ; = 01h
LDU        #DrawData_15_HorizontalRopeEndGoingRight        
LDA        #0x3                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
BSR        DrawBackgroundPieceWrapper                      ; undefined DrawBackgroundPieceWrapper(void)
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
RTS                                                        
DrawData_15_HorizontalRopeEndGoingRight:                   
db         01h                                             
db         FFh                                             
db         0Ah                                             
db         00h                                             
DrawPiece_06_FloorPieceGoingRight:                         ; = 01h
LDU        #DrawData_17_BlankAreaGoingRight                
************************************************:          
*                       THUNK FUNCTION:                    
************************************************:          
thunk undefined __stdcall DrawBackgroundPieceWra:          
Thunked-Function: DrawBackgroundPiece:                     
undefined         A:1            <RETURN>:                 
DrawBackgroundPieceWrapper:                                
JMP        DrawBackgroundPiece                             
DrawData_17_BlankAreaGoingRight:                           
db         01h                                             
db         00h                                             
db         09h                                             
db         02h                                             
DrawPiece_09_FloorPieceGoingLeft:                          ; = 01h
LDU        #DrawData_18_BlankAreaGoingLeft                 
BRA        DrawBackgroundPieceWrapper                      ; undefined DrawBackgroundPieceWrapper(void)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
DrawData_18_BlankAreaGoingLeft:                            
db         01h                                             
db         00h                                             
db         09h                                             
db         06h                                             
DrawPiece_0a_ShortLineGoingDown:                           ; = 01h
LDU        #DrawData_19_BlankAreaGoingDownRight            
BRA        DrawBackgroundPieceWrapper                      ; undefined DrawBackgroundPieceWrapper(void)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
DrawData_19_BlankAreaGoingDownRight:                       
db         01h                                             
db         00h                                             
db         10h                                             
db         03h                                             
DrawPiece_0b_ShortLineGoingUp:                             ; = 01h
LDU        #DrawData_0b_ShortLineGoingUp                   
BRA        DrawBackgroundPieceWrapper                      ; undefined DrawBackgroundPieceWrapper(void)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
DrawData_0b_ShortLineGoingUp:                              
db         01h                                             
db         00h                                             
db         10h                                             
db         00h                                             
DrawPiece_17_BlankAreaGoingRight:                          ; = 01h
LDU        #DrawData_17_BlankAreaGoingRight                
Jump_DrawBlankArea:                                        
LDA        #0xff                                           
STA        <CrtArtifactDrawingMaskIndex_0x20               
JSR        DrawBackgroundPiece                             ; undefined DrawBackgroundPiece(void)
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
RTS                                                        
DrawPiece_18_BlankAreaGoingLeft:                           ; = 01h
LDU        #DrawData_18_BlankAreaGoingLeft                 
BRA        Jump_DrawBlankArea                              
DrawPiece_19_BlankAreaGoingDownRight:                      ; = 01h
LDU        #DrawData_19_BlankAreaGoingDownRight            
BRA        Jump_DrawBlankArea                              
DrawPiece_20_UnknownOrBuggy:                               ; = 03h
LDU        #DrawData_07_WallPieceGoingUp                   
BRA        Jump_DrawBlankArea                              
DrawPiece_0c_VeryShortRope:                                ; = 02h
LDX        #DrawData_0c_VeryShortRope                      
BRA        Jump_DrawRope                                   
DrawData_0c_VeryShortRope:                                 
db         02h                                             
db         00h                                             
db         07h                                             
db         03h                                             
db         00h                                             
db         07h                                             
db         00h                                             
DrawPiece_0d_ShortRope:                                    ; = 02h
LDX        #DrawData_0d_ShortRope                          
BRA        Jump_DrawRope                                   
DrawData_0d_ShortRope:                                     
db         02h                                             
db         00h                                             
db         16h                                             
db         03h                                             
db         00h                                             
db         16h                                             
db         00h                                             
DrawPiece_0e_MidLengthRope:                                ; = 02h
LDX        #DrawData_0e_MidLengthRope                      
BRA        Jump_DrawRope                                   
DrawData_0e_MidLengthRope:                                 
db         02h                                             
db         00h                                             
db         25h                                             
db         03h                                             
db         00h                                             
db         25h                                             
db         00h                                             
DrawPiece_0f_LongRope:                                     ; = 02h
LDX        #DrawData_0f_LongRope                           
BRA        Jump_DrawRope                                   
DrawData_0f_LongRope:                                      
db         02h                                             
db         00h                                             
db         34h                                             
db         03h                                             
db         00h                                             
db         34h                                             
db         00h                                             
DrawPiece_10_VeryLongRope:                                 ; = 02h
LDX        #DrawData_10_VeryLongRope                       
BRA        Jump_DrawRope                                   
DrawData_10_VeryLongRope:                                  
db         02h                                             
db         00h                                             
db         43h                                             
db         03h                                             
db         00h                                             
db         43h                                             
db         00h                                             
DrawPiece_11_SuperLongRope:                                ; = 02h
LDX        #DrawData_11_SuperLongRope                      
BRA        Jump_DrawRope                                   
DrawData_11_SuperLongRope:                                 
db         02h                                             
db         00h                                             
db         52h                                             
db         03h                                             
db         00h                                             
db         52h                                             
db         00h                                             
DrawPiece_12_ExcessivelyLongRope:                          ; = 02h
LDX        #DrawData_12_ExcessivelyLongRope                
BRA        Jump_DrawRope                                   
DrawData_12_ExcessivelyLongRope:                           
db         02h                                             
db         00h                                             
db         61h                                             
db         03h                                             
db         00h                                             
db         61h                                             
db         00h                                             
DrawPiece_13_RediculouslyLongRope:                         ; = 02h
LDX        #DrawData_13_RediculouslyLongRope               
BRA        Jump_DrawRope                                   
DrawData_13_RediculouslyLongRope:                          
db         02h                                             
db         00h                                             
db         8Eh                                             
db         03h                                             
db         00h                                             
db         8Eh                                             
db         00h                                             
Jump_DrawRope:                                             
PSHS        X                                              
LDU        #DrawData_PreRope_Maybe                         ; = 01h
BSR        DrawBackgroundPiece                             ; undefined DrawBackgroundPiece(void)
LDA        #0x3                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
PULS        U                                              
BSR        DrawBackgroundPiece                             ; undefined DrawBackgroundPiece(void)
LDU        #DrawData_PostRope_Maybe                        ; = 01h
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
BRA        DrawBackgroundPiece                             ; undefined DrawBackgroundPiece(void)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
DrawData_PreRope_Maybe:                                    
db         01h                                             
db         FFh                                             
db         06h                                             
db         03h                                             
DrawData_PostRope_Maybe:                                   
db         01h                                             
db         FFh                                             
db         06h                                             
db         00h                                             
DrawPiece_16_HorizontalRopeGoingRight:                     ; = 01h
LDU        #DrawData_17_BlankAreaGoingRight                
LDA        #0x3                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
BSR        DrawBackgroundPiece                             ; undefined DrawBackgroundPiece(void)
LDA        #0x1                                            
STA        <CrtArtifactDrawingMaskIndex_0x20               
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawBackgroundPiece(void):             
undefined         A:1            <RETURN>:                 
DrawBackgroundPiece:                                       ; get segment count
LDA        ,U+                                             
STA        <CurrentSegmentCounter_0x24                     ; store segment count
CLR        <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
Loop_ProcessSegment:                                       ; get first value from segment
LDA        ,U+                                             
STA        <DrawSegmentLine_SubPixelOffset_0x1f            
LDA        ,U+                                             ; get second value from segment
STA        <DrawSegmentLine_Counter_0x1d                   
LDA        ,U+                                             ; get and compute the drawing function offset
LSLA                                                       
LDX        #LineDrawingFunctions_0xd77d                    ; = D78Dh
JSR        [A,X]                                           ; call the DrawSegment_MovePos function
DEC        <CurrentSegmentCounter_0x24                     
BNE        Loop_ProcessSegment                             
RTS                                                        
LineDrawingFunctions_0xd77d:                               
dw         DrawSegment_Orientation0_UpAndRight             
dw         DrawSegment_Orientation1_RightAndUp             
dw         DrawSegment_Orientation2_RightAndDown           
dw         DrawSegment_Orientation3_DownAndRight           
dw         DrawSegment_Orientation4_DownAndLeft            
dw         DrawSegment_Orientation5_LeftAndDown            
dw         DrawSegment_Orientation6_LeftAndUp              
dw         DrawSegment_Orientation7_UpAndLeft              
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation0_UpA:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation0_UpAndRight:                       
LDX        #DrawSegment_MovePosUpAndRight                  
CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawVerticalSegment                             ; undefined DrawVerticalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation1_Rig:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation1_RightAndUp:                       
LDX        #DrawSegment_MovePosRightAndUp                  
LDA        #0xff                                           
STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawHorizontalSegment                           ; undefined DrawHorizontalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation2_Rig:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation2_RightAndDown:                     
LDX        #DrawSegment_MovePosRightAndDown                
CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawHorizontalSegment                           ; undefined DrawHorizontalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation3_Dow:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation3_DownAndRight:                     
LDX        #DrawSegment_MovePosDownAndRight                
CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawVerticalSegment                             ; undefined DrawVerticalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation4_Dow:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation4_DownAndLeft:                      
LDX        #DrawSegment_MovePosDownAndLeft                 
LDA        #0xff                                           
STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawVerticalSegment                             ; undefined DrawVerticalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation5_Lef:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation5_LeftAndDown:                      
LDX        #DrawSegment_MovePosLeftAndDown                 
CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawHorizontalSegment                           ; undefined DrawHorizontalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation6_Lef:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation6_LeftAndUp+2:                      
DrawSegment_Orientation6_LeftAndUp:                        
LDX        #DrawSegment_MovePosLeftAndUp                   
LDA        #0xff                                           
STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawHorizontalSegment                           ; undefined DrawHorizontalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_Orientation7_UpA:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
DrawSegment_Orientation7_UpAndLeft:                        
LDX        #DrawSegment_MovePosUpAndLeft                   
LDA        #0xff                                           
STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
BRA        DrawVerticalSegment                             ; undefined DrawVerticalSegment(undefined A, undefined B, undefined * X)
-- Flow Override: CALL_RETURN (CALL_TERMINATOR):           
************************************************:          
* Draw a segment horizontally pixel by pixel, fo:          
* the number specified in DrawSegmentLine_Counte:          
* Also move along Y using a subpixel offset spec:          
* in 0x1e and 0x1f:                                        
* A DrawSegment_MovePos function determines whet:          
* we're going left or first, then up or down.:             
************************************************:          
undefined __stdcall DrawHorizontalSegment(undefi:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined *       X:2            X:                        
X contains a DrawSegment_MovePos function:                 
DrawHorizontalSegment:                                     
LDA        <DrawSegment_CurrentScreenY_0x21                
LDB        <DrawSegmentLine_Counter_0x1d                   
BEQ        Jump_DoneDrawingPixels                          
LDB        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
Loop_DrawPixels:                                           
PSHS        U X B A                                        
BSR        DrawPixelWithCrtArtifacts                       ; undefined DrawPixelWithCrtArtifacts(void)
PULS        A B X U                                        
DEC        <DrawSegmentLine_Counter_0x1d                   
BEQ        Jump_DoneDrawingPixels                          
JSR        ,X                                              ; call the DrawSegment_MovePos function
STA        <DrawSegment_CurrentScreenY_0x21                
BRA        Loop_DrawPixels                                 
Jump_DoneDrawingPixels:                                    
RTS                                                        
************************************************:          
* Draw a segment vertically pixel by pixel,:               
* for the number specified in DrawSegmentLine_Co:          
* Also move along X using a subpixel offset spec:          
* in 0x1e and 0x1f:                                        
* A DrawSegment_MovePos function determines whet:          
* we're going up or down first, then left or rig:          
************************************************:          
undefined __stdcall DrawVerticalSegment(undefine:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined *       X:2            X:                        
X contains a DrawSegment_MovePos function:                 
DrawVerticalSegment:                                       
LDA        <DrawSegment_CurrentScreenX_0x22                
LDB        <DrawSegmentLine_Counter_0x1d                   
BEQ        Jump_DoneDrawingPixels                          
setup loop:                                                
LDB        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25  
Loop_DrawPixels:                                           
PSHS        U X B A                                        
BSR        DrawPixelWithCrtArtifacts                       ; undefined DrawPixelWithCrtArtifacts(void)
PULS        A B X U                                        
DEC        <DrawSegmentLine_Counter_0x1d                   
BEQ        Jump_DoneDrawingPixels                          
JSR        ,X                                              ; call the DrawSegment_MovePos function
STA        <DrawSegment_CurrentScreenX_0x22                
BRA        Loop_DrawPixels                                 
Jump_DoneDrawingPixels:                                    
RTS                                                        
************************************************:          
* These DrawSegment_MovePos functions work like:           
* Take a primary axis and move along it one pixe:          
* For the secondary axis, subpixels are used.:             
* Subpixel increment is specified in the shape's:          
* Shape::                                                  
*         Num Segments:                                    
*         For each segment:                                
*                 subpixel increment along secon:          
*                 pixels along primary axis:               
*                 orientation (ie which DrawSegm:          
*:                                                         
* The mem location used to modify the secondary:           
* is 0x1e, but only 0x1f can have an actual valu:          
************************************************:          
undefined __stdcall DrawSegment_MovePosUpAndRigh:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosUpAndRight:                             
DEC        <DrawSegment_CurrentScreenY_0x21                
ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosRightAndU:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosRightAndUp:                             
INC        <DrawSegment_CurrentScreenX_0x22                
SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosRightAndD:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosRightAndDown:                           
INC        <DrawSegment_CurrentScreenX_0x22                
ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosDownAndRi:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosDownAndRight:                           
INC        <DrawSegment_CurrentScreenY_0x21                
ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosDownAndLe:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosDownAndLeft:                            
INC        <DrawSegment_CurrentScreenY_0x21                
SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosLeftAndDo:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosLeftAndDown:                            
DEC        <DrawSegment_CurrentScreenX_0x22                
ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosLeftAndUp:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosLeftAndUp:                              
DEC        <DrawSegment_CurrentScreenX_0x22                
SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawSegment_MovePosUpAndLeft:          
undefined         A:1            <RETURN>:                 
DrawSegment_MovePosUpAndLeft:                              
DEC        <DrawSegment_CurrentScreenY_0x21                
SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DrawPixelWithCrtArtifacts(vo:          
undefined         A:1            <RETURN>:                 
Stack[-0x1]:1  local_1:                                    
DrawPixelWithCrtArtifacts:                                 
LDD        <DrawSegment_CurrentScreenYXPosition_0x21       
BSR        ComputeScreenLocationFromAAndB                  ; undefined ComputeScreenLocationFromAAndB(void)
TFR        D,Y                                             ; move screen position to Y
LDB        <DrawSegment_CurrentScreenX_0x22                ; which pair of bits will it draw on?
ANDB       #0x3                                            ; get the last two bits of the x position
LDU        #Drawing_PixelBits_d84a                         ; = 11000000b
LEAX       0x4,U                                           ; load the address of the CRT artfiact mask
                                                           ; table into X
LDA        <CrtArtifactDrawingMaskIndex_0x20               
BMI        Jump_DoneDrawingReturn                          
LDA        A,X=>CrtArtifactDrawing_LineDrawingMask         ; load the mask into A
ANDA       B,U=>Drawing_PixelBits_d84a                     ; blend the pixel we want to draw with the
                                                           ; CRT artifact mask
STA        ,-S=>local_1                                    ; manipulate the stack to store
                                                           ; the value temporarily
LDA        B,U=>Drawing_PixelBits_d84a                     ; = 11000000b
COMA                                                       
ANDA       ,Y                                              
ORA        ,S+                                             
STA        ,Y                                              ; write the final pixel
Jump_DoneDrawingReturn:                                    
RTS                                                        
there are eight pixels for a given byte.:                  
use this table to set a pair of bits for a:                
given x screen position. The game treats the:              
256 wide screen as 128 so it draws two bits:               
at a time.:                                                
Drawing_PixelBits_d84a:                                    
db         11000000b                                       
db         00110000b                                       
db         00001100b                                       
db         00000011b                                       
objects choose which CRT artifacting mask to use:          
CrtArtifactDrawing_LineDrawingMask:                        ; invisible. doesn't draw any pixels
db         00000000b                                       
db         01010101b                                       ; only draw odd pixels. If used to draw platform, then can walk on
db         10101010b                                       ; only draw even pixels. if used to draw platform, can't walk on
db         11111111b                                       ; draw all pixels. if drawn as horizontal line, 
                                                           ; treated as horziontal rope
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall LoadPosRelativeToYAndCompute:          
undefined         A:1            <RETURN>:                 
LoadPosRelativeToYAndComputeScreenPos:                     
LDA        0x4,Y                                           
LDB        0x6,Y                                           
************************************************:          
* Generates a memory location in a video page fo:          
* the given X and Y.:                                      
*:                                                         
* A register holds the Y position (0 - 191):               
* B register holds the X position (0 - 127):               
*:                                                         
* Note that X works in half resolution, not 256:           
* pixels like the current screen mode. The funct:          
* scales X up so that it maps to the screen res.:          
*:                                                         
* To find the correct byte along the X axis, it:           
* doubles X to map its position to 256 pixels. T:          
* divides by 8 (bits) to find the corresponding:           
* video memory.:                                           
*:                                                         
* Formula::                                                
* offset = (Y * screen_width_in_bytes) + (X * 2:           
* final pos = offset + video_memory_location:              
*:                                                         
* example::                                                
* (0x24 * 0x20) + (0x4f * 2 / 8) + 0x400 = 0x893:          
*:                                                         
* background draw origin point: Y:0x10, X:0xF:             
* (0x10 * 0x20) + (0xf * 2 / 8) + 0x400 = 0x603:           
************************************************:          
undefined __stdcall ComputeScreenLocationFromAAn:          
undefined         A:1            <RETURN>:                 
ComputeScreenLocationFromAAndB:                            
LSLB                                                       
LSRA                                                       
RORB                                                       
LSRA                                                       
RORB                                                       
LSRA                                                       
RORB                                                       
ADDD       <CurrentVideoMemLocation_0x4e                   
RTS                                                        
************************************************:          
* Used by the player, the ball, and the bird:              
************************************************:          
undefined __stdcall EraseAndUpdateAndDrawObject(:          
undefined         A:1            <RETURN>:                 
EraseAndUpdateAndDrawObject:                               
LDA        -0x5,Y=>Player_GameStateCounter_0x1a5           
BEQ        DrawingFunctionFor3ByteWideSprites::Jump_SkipU  
BMI        Jump_StateIsFFAndUninitialized                  
DECA                                                       
BEQ        Jump_StateIsNowZero                             
BSR        EraseSpriteFromScreen                           ; undefined EraseSpriteFromScreen(void)
??         8Ch                                             
Jump_StateIsNowZero:                                       
INC        -0x5,Y=>Player_GameStateCounter_0x1a5           
CMPY       #Player_SpeedY_0x1aa                            ; check if we're updating the player physics
BNE        Jump_SkipRopeHandling                           
LDA        -0xb,Y=>Player_IsClimbingRope_0x19f             
BEQ        Jump_SkipRopeHandling                           
LDB        0x6,Y=>PlayerX_0x1b0                            
ADDB       #0x3                                            
LDA        0x4,Y=>PlayerY_0x1ae                            
STD        <DrawSegment_CurrentScreenYXPosition_0x21       
CLR        <CrtArtifactDrawingMaskIndex_0x20               ; draw nothing?
LDD        <ZeroValue                                      
STD        <DrawSegment_SecondaryAxisSubpixelInc_0x1e      
LDA        #12                                             ; a length or a count of some kind
                                                           ; or the short rope? (draw object 12)
STA        <DrawSegmentLine_Counter_0x1d                   
JSR        DrawSegment_Orientation3_DownAndRight           ; undefined DrawSegment_Orientation3_DownAndRight(undefined param_1, und
LDY        #Player_PhysicsData_0x1aa                       
Jump_SkipRopeHandling:                                     
LDU        0x8,Y=>Player_VideoPageDrawDestination_0x1b2    
STU        0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LDX        0xa,Y=>Player_SpritePointer_0x1b4               
STX        0xe,Y=>Player_PreviousSpritePointer_0x1b8       
LDA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined DrawingFunctionFor3ByteWideSprites():            
undefined         A:1            <RETURN>:                 
DrawingFunctionFor3ByteWideSprites:                        
STA        <UtilityCounter_0x26                            
Loop_NextLine:                                             ; load from page to D
LDD        ,U                                              
ORA        ,X+                                             ; binary or A with sprite data
ORB        ,X+                                             ; binary or B with sprite data
STD        ,U                                              ; store to page
LDA        0x2,U                                           ; load the third byte from the page
ORA        ,X+                                             ; or A with the sprite data
STA        0x2,U                                           ; store third byte into page
LEAU       0x20,U                                          ; move to next line in page
DEC        <UtilityCounter_0x26                            
BNE        Loop_NextLine                                   ; Lo
Jump_SkipUpdate:                                           
RTS                                                        
Jump_StateIsFFAndUninitialized:                            
CLR        -0x5,Y=>Player_GameStateCounter_0x1a5           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall EraseSpriteFromScreen(void):           
undefined         A:1            <RETURN>:                 
EraseSpriteFromScreen:                                     
LDU        0xc,Y=>PlayerY_PreviousVideoPageDrawPosition_0  
LDX        0xe,Y=>Player_PreviousSpritePointer_0x1b8       
LDA        -0x1,Y=>Player_NumRowsInSprite_0x1a9            
STA        <UtilityCounter_0x26                            
Loop_ClearNextRow:                                         ; get the first byte of the sprite
LDD        ,X++                                            
COMA                                                       ; inverse it
ANDA       ,U                                              ; and with the byte in the first video page. 
                                                           ; this should remove the sprite pixels from
                                                           ; the screen
ORA        0x1800,U                                        ; in case we've taken too many bytes from the
                                                           ; background, bitwise or with the clean background
second byte of the line:                                   
COMB                                                       
ANDB       0x1,U                                           
ORB        0x1801,U                                        
store to the screen:                                       
STD        ,U                                              
third byte of the line:                                    
LDA        ,X+                                             
COMA                                                       
ANDA       0x2,U                                           
ORA        0x1802,U                                        
store third byte to the screen:                            
STA        0x2,U                                           
LEAU       0x20,U                                          ; go to next line
DEC        <UtilityCounter_0x26                            
BNE        Loop_ClearNextRow                               
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall PrintString(undefined param_:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
undefined         B:1            param_2:                  
byte *            X:2            screenLocation:           
undefined2        Y:2            param_4:                  
byte *            U:2            textStrings:              
PrintString:                                               ; = 00110000b
LDY        #CharacterFont                                  
LDB        #0x7                                            ; number of lines in a character. Redundant because
                                                           ; it's set again below?
LDA        ,textStrings+                                   
BMI        Loop_HitEndOfString                             ; last character was 0xff
MUL                                                        
LEAY       param_2,param_4                                 ; Jump to the specified character in rom
LDB        #0x7                                            ; number of lines in a character
Loop_DrawCharacter:                                        ; get the character row
LDA        ,param_4+=>CharacterFont                        
ANDA       <CharacterDrawingMask_0x69_Nice                 ; apply the character row draw mask
ORA        0x1800,screenLocation                           ; blend into second page
STA        ,screenLocation                                 ; draw blended value to first page
LEAX       0x20,screenLocation                             ; Go to next line
DECB                                                       
BNE        Loop_DrawCharacter                              
LEAX       -0xdf,screenLocation                            ; backup by 223 bytes
BRA        PrintString                                     
Loop_HitEndOfString:                                       
RTS                                                        
CharacterFont:                                             ; Number 0
db         00110000b                                       
BYTE_d909:                                                 
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Number_1:                                                  
db         00110000b                                       
db         11110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         11111100b                                       
Number_2:                                                  
db         00110000b                                       
db         11001100b                                       
db         00001100b                                       
db         00110000b                                       
db         00110000b                                       
db         11000000b                                       
db         11111100b                                       
Number_3:                                                  
db         00110000b                                       
db         11001100b                                       
db         00001100b                                       
db         00111100b                                       
db         00001100b                                       
db         11001100b                                       
db         00110000b                                       
Number_4:                                                  
db         00001100b                                       
db         00111100b                                       
db         11001100b                                       
db         11111100b                                       
db         00001100b                                       
db         00001100b                                       
db         00001100b                                       
Number_5:                                                  
db         11111100b                                       
db         11000000b                                       
db         11000000b                                       
db         11111100b                                       
db         00001100b                                       
db         11001100b                                       
db         00110000b                                       
Number_6:                                                  
db         00110000b                                       
db         11001100b                                       
db         11000000b                                       
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Number_7:                                                  
db         11111100b                                       
db         00001100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         11000000b                                       
db         11000000b                                       
Number_8:                                                  
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Number_9:                                                  
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         00111100b                                       
db         00001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_A:                                                  ; Index 10
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11111100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
Letter_B:                                                  ; index 11
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
Letter_C:                                                  
db         00110000b                                       
db         11001100b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
db         11001100b                                       
db         00110000b                                       
Letter_D:                                                  
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
Letter_E:                                                  
db         11111100b                                       
db         11000000b                                       
db         11000000b                                       
db         11110000b                                       
db         11000000b                                       
db         11000000b                                       
db         11111100b                                       
Letter_F:                                                  
db         11111100b                                       
db         11000000b                                       
db         11000000b                                       
db         11110000b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
Letter_G:                                                  
db         00110000b                                       
db         11001100b                                       
db         11000000b                                       
db         00111100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_H:                                                  
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11111100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
Letter_I:                                                  
db         11111100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         11111100b                                       
Letter_J:                                                  
db         00001100b                                       
db         00001100b                                       
db         00001100b                                       
db         00001100b                                       
db         00001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_K:                                                  
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
db         11000000b                                       
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
Letter_L:                                                  
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
db         11111100b                                       
Letter_M:                                                  
db         11001100b                                       
db         11111100b                                       
db         11111100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
Letter_N:                                                  
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
db         11111100b                                       
db         11111100b                                       
db         11001100b                                       
db         11001100b                                       
Letter_O:                                                  
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_P:                                                  
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
db         11000000b                                       
db         11000000b                                       
db         11000000b                                       
Letter_Q:                                                  
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11111100b                                       
db         00111100b                                       
Letter_R:                                                  
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
db         11110000b                                       
db         11110000b                                       
db         11001100b                                       
db         11001100b                                       
Letter_S:                                                  
db         00110000b                                       
db         11001100b                                       
db         11000000b                                       
db         00110000b                                       
db         00001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_T:                                                  
db         11111100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
Letter_U:                                                  
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
Letter_V:                                                  
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
db         00110000b                                       
Letter_W:                                                  
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         11111100b                                       
db         11111100b                                       
db         11001100b                                       
Letter_X:                                                  
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         11001100b                                       
db         11001100b                                       
Letter_Y:                                                  
db         11001100b                                       
db         11001100b                                       
db         11001100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
Letter_Z:                                                  
db         11111100b                                       
db         00001100b                                       
db         00110000b                                       
db         00110000b                                       
db         00110000b                                       
db         11000000b                                       
db         11111100b                                       
Letter_Space:                                              
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
Letter_Colon:                                              
db         00000000b                                       
db         11000000b                                       
db         11000000b                                       
db         00000000b                                       
db         11000000b                                       
db         11000000b                                       
db         00000000b                                       
Letter_Period:                                             
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00000000b                                       
db         00110000b                                       
db         00110000b                                       
TextStrings:                                               ; D
db         13                                              
db         24                                              ; O
db         32                                              ; W
db         23                                              ; N
db         21                                              ; L
db         10                                              ; A
db         23                                              ; N
db         13                                              ; D
db         36                                              ; space
db         31                                              ; V
db         1                                               ; 1
db         38                                              ; .
db         1                                               ; 1
db         255                                             ; EOS
String_WrittenBy:                                          ; W
db         32                                              
db         27                                              ; R
db         18                                              ; I
db         29                                              ; T
db         29                                              ; T
db         14                                              ; E
db         23                                              ; N
db         36                                              ; ' '
db         11                                              ; B
db         34                                              ; Y
db         37                                              ; :
db         255                                             
String_MichaelAichlmayer:                                  ; Michael Aichlmayr
db         22                                              
db         18                                              
db         12                                              
db         17                                              
db         10                                              
db         14                                              
db         21                                              
db         36                                              
db         10                                              
db         18                                              
db         12                                              
db         17                                              
db         21                                              
db         22                                              
db         10                                              
db         34                                              
db         27                                              
db         255                                             
String_Copyright1983:                                      
db         12                                              
db         24                                              
db         25                                              
db         34                                              
db         27                                              
db         18                                              
db         16                                              
db         17                                              
db         29                                              
db         36                                              
db         1                                               
db         9                                               
db         8                                               
db         3                                               
db         255                                             
String_SpectralAssociates:                                 
db         28                                              
db         25                                              
db         14                                              
db         12                                              
db         29                                              
db         27                                              
db         10                                              
db         21                                              
db         36                                              
db         10                                              
db         28                                              
db         28                                              
db         24                                              
db         12                                              
db         18                                              
db         10                                              
db         29                                              
db         14                                              
db         28                                              
db         255                                             
String_LicensedTo:                                         
db         21                                              
db         18                                              
db         12                                              
db         14                                              
db         23                                              
db         28                                              
db         14                                              
db         13                                              
db         36                                              
db         29                                              
db         24                                              
db         36                                              
db         255                                             
String_TandyCorporation:                                   
db         29                                              
db         10                                              
db         23                                              
db         13                                              
db         34                                              
db         36                                              
db         12                                              
db         24                                              
db         27                                              
db         25                                              
db         24                                              
db         27                                              
db         10                                              
db         29                                              
db         18                                              
db         24                                              
db         23                                              
db         255                                             
String_AllRightsReserved:                                  
db         10                                              
db         21                                              
db         21                                              
db         36                                              
db         27                                              
db         18                                              
db         16                                              
db         17                                              
db         29                                              
db         28                                              
db         36                                              
db         27                                              
db         14                                              
db         28                                              
db         14                                              
db         27                                              
db         31                                              
db         14                                              
db         13                                              
db         255                                             
String_OnePlayer:                                          
db         24                                              
db         23                                              
db         14                                              
db         36                                              
db         25                                              
db         21                                              
db         10                                              
db         34                                              
db         14                                              
db         27                                              
db         255                                             
String_TwoPlayer:                                          
db         29                                              
db         32                                              
db         24                                              
db         36                                              
db         25                                              
db         21                                              
db         10                                              
db         34                                              
db         14                                              
db         27                                              
db         255                                             
String_HighScore:                                          
db         17                                              
db         18                                              
db         16                                              
db         17                                              
db         36                                              
db         28                                              
db         12                                              
db         24                                              
db         27                                              
db         14                                              
db         255                                             
String_PlayerOne:                                          
db         25                                              
db         21                                              
db         10                                              
db         34                                              
db         14                                              
db         27                                              
db         36                                              
db         24                                              
db         23                                              
db         14                                              
db         255                                             
String_PlayerTwo:                                          
db         25                                              
db         21                                              
db         10                                              
db         34                                              
db         14                                              
db         27                                              
db         36                                              
db         29                                              
db         32                                              
db         24                                              
db         255                                             
String_PL1:                                                ; P
db         25                                              
db         21                                              ; L
db         1                                               ; 1
db         255                                             
String_PL2:                                                ; P
db         25                                              
db         21                                              ; L
db         2                                               ; 2
db         255                                             
String_GetReadyPlayerOne:                                  ; G
db         16                                              
db         14                                              ; E
db         29                                              ; T
db         36                                              ; ' '
db         27                                              ; R
db         14                                              ; E
db         10                                              ; A
db         13                                              ; D
db         34                                              ; Y
db         36                                              ; ' '
db         25                                              ; P
db         21                                              ; L
db         10                                              ; A
db         34                                              ; Y
db         14                                              ; E
db         27                                              ; R
db         36                                              ; ' '
db         24                                              ; O
db         23                                              ; N
db         14                                              ; E
db         255                                             
String_GetReadyPlayerTwo:                                  ; G
db         16                                              
db         14                                              ; E
db         29                                              ; T
db         36                                              ; ' '
db         27                                              ; R
db         14                                              ; E
db         10                                              ; A
db         13                                              ; D
db         34                                              ; Y
db         36                                              ; ' '
db         25                                              ; P
db         21                                              ; L
db         10                                              ; A
db         34                                              ; Y
db         14                                              ; E
db         27                                              ; R
db         36                                              ; ' '
db         29                                              ; T
db         32                                              ; W
db         24                                              ; O
db         255                                             
String_Chamber:                                            ; C
db         12                                              
db         17                                              ; H
db         10                                              ; A
db         22                                              ; M
db         11                                              ; B
db         14                                              ; E
db         27                                              ; R
db         255                                             
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdateAndPrintPlayerScore(un:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined2        X:2            X:                        
undefined2        Y:2            Y:                        
UpdateAndPrintPlayerScore:                                 ; undefined ConvertDRegisterToString(void)
BSR        ConvertDRegisterToString                        
LDU        #PlayerScoreStringLocationPointers              ; = 00bb
LAB_db11:                                                  
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
LDU        A,U=>PlayerScoreStringLocationPointers          ; = 00bb
BSR        AddPickupPointsToScore                          ; undefined AddPickupPointsToScore(void)
LDX        #0x1b03                                         ; screen position
BSR        FindFirstNonZeroCharacterInString               ; undefined FindFirstNonZeroCharacterInString(void)
JMP        PrintString                                     
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall FindFirstNonZeroCharacterInS:          
undefined         A:1            <RETURN>:                 
FindFirstNonZeroCharacterInString:                         ; get character
LDA        ,U                                              
BMI        Jump_FoundEndOfString                           ; Jump_IfAtEndOfString
BNE        Jump_FoundNonZeroCharacter                      
LEAU       0x1,U                                           ; advance U by 1
LEAX       0x1,X                                           ; advance X by 1
BRA        FindFirstNonZeroCharacterInString               
Jump_FoundEndOfString:                                     
LEAU       -0x1,U                                          
LEAX       -0x1,X                                          
Jump_FoundNonZeroCharacter:                                
RTS                                                        
PlayerScoreStringLocationPointers:                         
addr       PlayerOneScoreString_0xbb                       
addr       PlayerTwoScoreString_0xc3                       
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall PrintTimerStringToScreen(voi:          
undefined         A:1            <RETURN>:                 
PrintTimerStringToScreen:                                  
PSHS        X                                              
BSR        ConvertDRegisterToString                        ; undefined ConvertDRegisterToString(void)
PULS        X                                              
LDU        #GameTimerString_0xcb                           
BSR        ReplaceZerosToSpaces_Maybe                      ; undefined ReplaceZerosToSpaces_Maybe(void)
JMP        PrintString                                     
-- Flow Override: CALL_RETURN (COMPUTED_CALL_TER:          
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ReplaceZerosToSpaces_Maybe(v:          
undefined         A:1            <RETURN>:                 
ReplaceZerosToSpaces_Maybe:                                
TFR        U,Y                                             
Loop_NextCharacter:                                        
LDA        ,Y+                                             
BMI        Jump_EndOfString                                
BNE        Jump_ToExit                                     
LDA        #0x24                                           ; store a space at the character location in the string
STA        -0x1,Y                                          
BRA        Loop_NextCharacter                              
Jump_EndOfString:                                          
CLR        -0x2,Y                                          
Jump_ToExit:                                               
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ConvertDRegisterToString(voi:          
undefined         A:1            <RETURN>:                 
ConvertDRegisterToString:                                  ; store the timer here
STD        <GameTimerLastDigit_0x6e                        
clear game timer string:                                   
LDB        #0x7                                            
LDX        #GameTimerString_0xcb                           
Loop_ClearGameTimerString:                                 
CLR        ,X+=>GameTimerString_0xcb                       
DECB                                                       
BNE        Loop_ClearGameTimerString                       
LDX        #DAT_0xcd                                       
LDD        #10000                                          
BSR        ConvertNumberAtPlaceToCharacter                 ; undefined ConvertNumberAtPlaceToCharacter()
LDD        #1000                                           
BSR        ConvertNumberAtPlaceToCharacter                 ; undefined ConvertNumberAtPlaceToCharacter()
LDD        #100                                            
BSR        ConvertNumberAtPlaceToCharacter                 ; undefined ConvertNumberAtPlaceToCharacter()
LDD        #10                                             
BSR        ConvertNumberAtPlaceToCharacter                 ; undefined ConvertNumberAtPlaceToCharacter()
LDB        <SomeStringConversionValue_0x6f                 ; store to 0x6f, but why? it's unused.
STB        ,X=>DAT_0xcd                                    
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined ConvertNumberAtPlaceToCharacter():               
undefined         A:1            <RETURN>:                 
ConvertNumberAtPlaceToCharacter:                           
CLR        <GameTimerSecondDigit_0x6b                      
STD        <DividerForNumberToStringConversion_0x6c        ; store the divider here
LDD        <GameTimerLastDigit_0x6e                        
Loop_ContinueSub:                                          
STD        <GameTimerLastDigit_0x6e                        
SUBD       <DividerForNumberToStringConversion_0x6c        
BCS        Jump_DoneFindingCharacter                       
INC        <GameTimerSecondDigit_0x6b                      
BRA        Loop_ContinueSub                                
Jump_DoneFindingCharacter:                                 
LDA        <GameTimerSecondDigit_0x6b                      
STA        ,X+                                             ; move to next character in timer string
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall AddPickupPointsToScore(void):          
undefined         A:1            <RETURN>:                 
The area in memory used to contain:                        
the timer now contains the score of:                       
the pick up the player touched. Add:                       
it to the player's score.:                                 
AddPickupPointsToScore:                                    ; set to 0
CLRB                                                       
LDX        #StringDataEnd_0xd2                             
LEAU       0x7,U                                           ; the string is stored in U.
                                                           ; jump to the end of the string
Loop_NextCharacterInString:                                ; load number from string
LDA        ,-U                                             
                                                           ; go backwards
ADDB       #0xf0                                           ; increase B by 15
ADCA       ,-X=>TimerNumbers_0_0xd1                        
DAA                                                        
TFR        A,B                                             
ANDA       #0xf                                            
STA        ,U                                              
CMPX       #GameTimerString_0xcb                           
BNE        Loop_NextCharacterInString                      
ADDB       #0xf0                                           
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall CopySpritesFromRomToRam(void:          
undefined         A:1            <RETURN>:                 
CopySpritesFromRomToRam:                                   ; set U to start of data block
LDU        #SpriteCopyInfo                                 
Jump_CopyNextAnimation:                                    ; a size counter?
LDD        ,U++=>SpriteCopyInfo                            
BMI        Loop_FinishedCopyingSpritesToRam                
LDX        ,U++=>->PlayerSprite_Right_Stand_0xdcd6         ; source address
LDY        ,U++=>->SpriteData_ClonedDestination_0x3400     ; destination address
Jump_CopySpriteToRam:                                      ; undefined CopySpritesFromRomToRamHelper()
BSR        CopySpritesFromRomToRamHelper                   
DECA                                                       
BNE        Jump_CopySpriteToRam                            
BRA        Jump_CopyNextAnimation                          
Loop_FinishedCopyingSpritesToRam:                          
RTS                                                        
SpriteCopyInfo:                                            ; The number of sprites to copy
db         Ah                                              
db         10h                                             ; the number of lines per sprite
PTR_PlayerSprite_Right_Stand_0xdcd6_dbc3:                  ; address to player sprite data
addr       PlayerSprite_Right_Stand_0xdcd6                 
PTR_SpriteData_ClonedDestination_0x3400_dbc5:              ; copies of sprites along 4 bits
addr       SpriteData_ClonedDestination_0x3400             
NextSpriteToCopy_Size:                                     ; the number of sprites to copy
db         Ah                                              
db         5h                                              ; the number of lines per sprite
dw         Player_CollisionMasks_0xde17                    ; unidentified sprite location
dw         Player_CollisionMasks_InRam_0x3b80              ; copy destination
db         2h                                              ; the number of sprites to copy
db         8h                                              ; the number of lines per sprite
dw         BouncyBallSprite1_0xde7b                        ; = 0000000100000000b
dw         BouncyBall_ClonedInRam_0x3dd8                   ; copy destination
db         2h                                              ; the number of sprites to copy
db         6h                                              ; the number of lines per sprite
dw         BirdSprite1_0xde9b                              ; = 1100000110000011b
dw         BirdSprite_ClonedInRam_0x3ee2                   ; copy destination
db         FFh                                             ; end marker
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined CopySpritesFromRomToRamHelper():                 
undefined         A:1            <RETURN>:                 
Stack[-0x6]:2  StackValue1_0x6:                            
Stack[-0xa]:1  StackValue2_0xa:                            
CopySpritesFromRomToRamHelper:                             ; D -> 0x0a10
PSHS        U B A                                          
                                                           ; X -> 0xdcd7
                                                           ; Y -> 0x3400
CLRA                                                       
LAB_dbdd:                                                  
STD        ,--S=>StackValue1_0x6                           
PSHS        X B A                                          
LAB_dbe1:                                                  
CLR        0x2,Y                                           
LDD        ,X++                                            
LAB_dbe5:                                                  
TST        0x4,S=>StackValue1_0x6                          
BEQ        LAB_dbf5                                        
LSRA                                                       
RORB                                                       
ROR        0x2,Y                                           
LSRA                                                       
RORB                                                       
ROR        0x2,Y                                           
DEC        0x4,S=>StackValue1_0x6                          
BRA        LAB_dbe5                                        
LAB_dbf5:                                                  
STD        ,Y                                              
LEAY       0x3,Y                                           
LDA        ,S=>StackValue2_0xa                             
STA        0x4,S=>StackValue1_0x6                          
DEC        0x5,S=>StackValue1_0x6+0x1                      
BNE        LAB_dbe1                                        
PULS        A B X U                                        
INCA                                                       
CMPA       #0x4                                            
BNE        LAB_dbdd                                        
LSLB                                                       
ABX                                                        
PULS        A B U PC                                       
Jump_PlayerOutOfLives:                                     
PULS        X                                              
LDA        <CurrentNumberOfPlayers_0x50                    
ANDA       #0x2                                            
LBEQ       LAB_c06b                                        
DEC        <CurrentNumberOfPlayers_0x50                    ; one of the players lost all their lives
TFR        Y,B                                             
PSHS        X B A                                          
JMP        LAB_c610                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined GenerateRandomNumberFrom0ToB():                  
undefined         A:1            <RETURN>:                 
GenerateRandomNumberFrom0ToB:                              
PSHS        X A                                            
CLRA                                                       
STD        <SomeValue_RelatedToDrops_0x64                  
COMA                                                       
LAB_dc25:                                                  
ROLB                                                       
BCS        LAB_dc2d                                        
COMA                                                       
ROR        <SomeValue_RelatedToDrops_0x64                  
BRA        LAB_dc25                                        
LAB_dc2d:                                                  
COM        <SomeValue_RelatedToDrops_0x64                  
LAB_dc2f:                                                  ; undefined IncrementRomAddressCounter(undefined A, undefined B, undefin
BSR        IncrementRomAddressCounter                      
ANDB       <SomeValue_RelatedToDrops_0x64                  
CMPB       <SomeValue_AlsoRelatedToDrops_0x65              
BHI        LAB_dc2f                                        
PULS        A X PC                                         
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall IncrementRomAddressCounter(u:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
undefined         B:1            B:                        
undefined2        X:2            X:                        
IncrementRomAddressCounter:                                
PSHS        X                                              
LDX        <RomAddressCounter_0xc000to0xdf5a_0x61          
LEAX       0x1,X                                           
CMPX       #EndOfGameRom                                   ; count until this address
BCS        Jump_NotReachedLimit                            
LDX        #CartridgeRomStart                              
Jump_NotReachedLimit:                                      
STX        <RomAddressCounter_0xc000to0xdf5a_0x61          
LDB        ,X=>CartridgeRomStart                           
PULS        X PC                                           
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall InterruptHandler(void):                
undefined         A:1            <RETURN>:                 
InterruptHandler:                                          ; get keyboard state
LDA        PIA0_B_DATA_REG__FF02                           
INC        <InterruptHasBeenHitCounter_0x14                
INC        <InterruptHitCount                              
RTI                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall SetupJoystickBits_Maybe(unde:          
undefined         A:1            <RETURN>:                 
undefined         A:1            param_1:                  
byte              B:1            param_2:                  
undefined2        X:2            param_3:                  
undefined2        Y:2            param_4:                  
SetupJoystickBits_Maybe:                                   ; setup left joystick maybe
LDU        #PIA0_A_CONTROL_REG__FF01                       
BSR        ResetJoystickAxisBit_Maybe                      ; undefined ResetJoystickAxisBit_Maybe(undefined A, byte B, undefined2 X
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall ResetJoystickAxisBit_Maybe(u:          
undefined         A:1            <RETURN>:                 
undefined         A:1            A:                        
byte              B:1            B:                        
undefined2        X:2            X:                        
undefined2        Y:2            Y:                        
byte *            U:2            U:                        
ResetJoystickAxisBit_Maybe:                                
LDA        ,U                                              
ANDA       #11110111b                                      ; reset bit for joystick X
LSRB                                                       
BCC        Jump_StoreToA                                   
ORA        #00001000b                                      ; actually we want Joystick Y
Jump_StoreToA:                                             ; store the value and
STA        ,U++                                            
                                                           ; move to the right joystick register at FF03
RTS                                                        
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall UpdateJoystick_Maybe(void):            
undefined         A:1            <RETURN>:                 
UpdateJoystick_Maybe:                                      ; undefined DisableSound(void)
BSR        DisableSound                                    
LDX        #InterruptHasBeenHitCounter_0x14                
LDB        #0x1                                            
LAB_dc6d:                                                  
STB        <SomeTickTockValue_0x10                         
LDA        <CurrentPlayer_0x52                             
ANDA       #0x2                                            
PSHS        A                                              
ADDB       ,S+                                             
BSR        SetupJoystickBits_Maybe                         ; undefined SetupJoystickBits_Maybe(undefined param_1, byte param_2, und
LDD        #0x4080                                         
LAB_dc7c:                                                  
STA        <SomeCounter_0x11                               
ORB        #00000010b                                      
STB        PIA1_A_DATA_REG__FF20                           
EORB       #00000010b                                      
LDA        PIA0_A_DATA_REG__FF00                           
BMI        LAB_dc8d                                        
SUBB       <SomeCounter_0x11                               
CMPX       #LAB_db11                                       
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: dc8f:                                      
LAB_dc8d:                                                  
ADDB       <0x11                                           
LAB_dc8f:                                                  
LDA        <SomeCounter_0x11                               
LSRA                                                       
CMPA       #0x1                                            
BNE        LAB_dc7c                                        
STB        ,-X=>Joystick_UpDown_Value_0x13                 
LDB        <SomeTickTockValue_0x10                         
DECB                                                       
BPL        LAB_dc6d                                        
LDD        ,X=>Joystick_UpDown_Value_0x13                  
CLR        <Player_JoystickDirection_0x15                  
LSRB                                                       
LSRB                                                       
BEQ        Jump_GoingUp                                    
CMPB       #0x3f                                           
BNE        LAB_dcb0                                        
LDB        #0x3                                            
CMPX       #0xc601                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: dcae:                                      
Jump_GoingUp:                                              
LDB        #0x1                                            
LAB_dcae:                                                  
STB        <Player_JoystickDirection_0x15                  
LAB_dcb0:                                                  
LSRA                                                       
LSRA                                                       
BEQ        Jump_GoingLeft                                  
CMPA       #0x3f                                           
BNE        LAB_dcbf                                        
LDA        #0x2                                            
CMPX       #0x8604                                         
-- Length Override: 1 (actual length is 3):                
-- Fallthrough: dcbd:                                      
Jump_GoingLeft:                                            
LDA        #0x4                                            
LAB_dcbd:                                                  
STA        <Player_JoystickDirection_0x15                  
LAB_dcbf:                                                  
LDA        #00000010b                                      
STA        PIA1_A_DATA_REG__FF20                           
CLRB                                                       
BSR        SetupJoystickBits_Maybe                         ; undefined SetupJoystickBits_Maybe(undefined param_1, byte param_2, und
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall EnableSound(void):                     
undefined         A:1            <RETURN>:                 
EnableSound:                                               
LDA        PIA1_B_CONTROL_REG_FF23                         
ORA        #00001000b                                      
BRA        DisableSound::JUMP_dcd3_Set_PIA1_B_CONTROL_REG  
************************************************:          
*                          FUNCTION:                       
************************************************:          
undefined __stdcall DisableSound(void):                    
undefined         A:1            <RETURN>:                 
DisableSound:                                              
LDA        PIA1_B_CONTROL_REG_FF23                         
ANDA       #11110111b                                      
JUMP_dcd3_Set_PIA1_B_CONTROL_REG:                          
STA        PIA1_B_CONTROL_REG_FF23                         
RTS                                                        
PlayerSprite_Right_Stand_0xdcd6:                           ; 0000101010000000b
dw         0000101010000000b                               
dw         0010101010100000b                               ; 0010101010100000b
dw         0001010111000000b                               
dw         0010110110100000b                               
dw         0010110111010000b                               
dw         0001011110100000b                               
dw         0000111111100000b                               
dw         0001101010000000b                               
dw         0001101011000000b                               
dw         0001101010000000b                               
dw         0001111110000000b                               
dw         0000111110000000b                               
dw         0000101011000000b                               
dw         0000101010000000b                               
dw         0000111111000000b                               
dw         0000111111100000b                               
PlayerSprite_Right_Run0_0xdcf7:                            
dw         0000101010000000b                               
dw         0010101010100000b                               
dw         0001010111000000b                               
dw         0010110110100000b                               
dw         0010110111010000b                               
dw         0001011110100000b                               
dw         0000111111100000b                               
dw         0000101010000000b                               
dw         0011101011011000b                               
dw         0111101011111000b                               
dw         0110101011111000b                               
dw         0000101010101000b                               
dw         0000101010101000b                               
dw         0010101000111000b                               
dw         0110101000111000b                               
dw         0110000000000000b                               
PlayerSprite_Right_Run1_Jump_0xdd17:                       
dw         0000000000000000b                               
dw         0000101010000000b                               
dw         0010101010100000b                               
dw         0001010111000000b                               
dw         0010110110100000b                               
dw         0010110111010000b                               
dw         0001011110100000b                               
dw         0000111111100110b                               
dw         1111101011111110b                               
dw         1111101011111110b                               
dw         0000101010100000b                               
dw         0000101010101010b                               
dw         0011101010101110b                               
dw         0110101000001110b                               
dw         0110000000000000b                               
dw         0000000000000000b                               
PlayerSprite_Right_Run2_0xdd37:                            
dw         0000101010000000b                               
dw         0010101010100000b                               
dw         0001010111000000b                               
dw         0010110110100000b                               
dw         0010110111010000b                               
dw         0001011110100000b                               
dw         0000111111100000b                               
dw         0000101010000000b                               
dw         0111101011011000b                               
dw         0111101011111000b                               
dw         0110101011110000b                               
dw         0000101010100000b                               
dw         0110101010100000b                               
dw         0110100001010000b                               
dw         0110000001110000b                               
dw         0000000000111000b                               
PlayerSprite_Right_Climb_0xdd57:                           
dw         0000101011000000b                               
dw         0001101010110000b                               
dw         0001010101011000b                               
dw         0011010101011000b                               
dw         0011010101011000b                               
dw         0001010101011000b                               
dw         0011010110111000b                               
dw         0110101010110000b                               
dw         1110101010100000b                               
dw         0110101010100000b                               
dw         0010101010100000b                               
dw         0010101010100000b                               
dw         0010100010100000b                               
dw         0001110010100000b                               
dw         0000000010100000b                               
dw         0000000111000000b                               
PlayerSprite_Left_Climb_0xdd77:                            
dw         0001101010000000b                               
dw         0110101011000000b                               
dw         1101010101000000b                               
dw         1101010101100000b                               
dw         1101010101100000b                               
dw         1101010101000000b                               
dw         1110101011100000b                               
dw         0110101010110000b                               
dw         0010101010111000b                               
dw         0010101010110000b                               
dw         0010101010100000b                               
dw         0010101010100000b                               
dw         0010100010100000b                               
dw         0010100111000000b                               
dw         0010100000000000b                               
dw         0001110000000000b                               
PlayerSprite_Left_Stand_0xdd97:                            
dw         0000001010100000b                               
dw         0000101010101000b                               
dw         0000011101010000b                               
dw         0000101101101000b                               
dw         0001011101101000b                               
dw         0000101111010000b                               
dw         0000111111100000b                               
dw         0000001010110000b                               
dw         0000011010110000b                               
dw         0000001010110000b                               
dw         0000001111110000b                               
dw         0000001111100000b                               
dw         0000011010100000b                               
dw         0000001010100000b                               
dw         0000011111100000b                               
dw         0000111111100000b                               
PlayerSprite_Left_Run0_0xddb7:                             
dw         0000001010100000b                               
dw         0000101010101000b                               
dw         0000011101010000b                               
dw         0000101101101000b                               
dw         0001011101101000b                               
dw         0000101111010000b                               
dw         0000111111110000b                               
dw         0000001010100000b                               
dw         0001101010111100b                               
dw         0001111010110111b                               
dw         0001111010100110b                               
dw         0000101010100000b                               
dw         0000101010100000b                               
dw         0001110010101110b                               
dw         0001110010101110b                               
dw         0000000000000110b                               
PlayerSprite_Left_Run1_Jump_0xddd7:                        
dw         0000000000000000b                               
dw         0000001010100000b                               
dw         0000101010101000b                               
dw         0000011101010000b                               
dw         0000101101101000b                               
dw         0001011101101000b                               
dw         0000101111010000b                               
dw         0110111111100000b                               
dw         0111111010111111b                               
dw         0111111010111111b                               
dw         0000101010100000b                               
dw         0110101010100000b                               
dw         0111101010101110b                               
dw         0111100010101110b                               
dw         0000000000000110b                               
dw         0000000000000000b                               
PlayerSprite_Left_Run2_0xddf7:                             
dw         0000001010100000b                               
dw         0000101010101000b                               
dw         0000011101010000b                               
dw         0000101101101000b                               
dw         0001011101101000b                               
dw         0000101111010000b                               
dw         0000111111100000b                               
dw         0000001010100000b                               
dw         0001101010111110b                               
dw         0001111010111110b                               
dw         0001111010100110b                               
dw         0000101010100000b                               
dw         0000101010101110b                               
dw         0000100010101110b                               
dw         0001110000000110b                               
dw         0001110000000000b                               
There is one collision mask per player sprite:             
each collision mask sprite is 5 pixels tall:               
player facing right:                                       
Player_CollisionMasks_0xde17:                              
dw         0011111111110000b                               
dw         0011111111110000b                               
dw         0011111111000000b                               
dw         0011111111000000b                               
dw         0000111111000000b                               
dw         0011111111110000b                               
dw         0011111111110000b                               
dw         0000111111000000b                               
dw         0110111111111000b                               
dw         0011111100111000b                               
dw         0000111111000000b                               
dw         0011111111110000b                               
dw         0000111111110110b                               
dw         0000111111110000b                               
dw         0111111100001110b                               
dw         0011111111110000b                               
dw         0011111111110000b                               
dw         0000111111000000b                               
dw         0110111111110000b                               
dw         0110110001110000b                               
player climbing:                                           
dw         0011111111110000b                               
dw         0011111111111100b                               
dw         1111111111110000b                               
dw         0011111111110000b                               
dw         0011110011110000b                               
dw         1111111111000000b                               
dw         1111111111110000b                               
dw         1111111111110000b                               
dw         0011111111110000b                               
dw         0011111111000000b                               
player facing left:                                        
dw         0000111111111100b                               
dw         0001111111111000b                               
dw         0000001111110000b                               
dw         0000001111110000b                               
dw         0000001111110000b                               
dw         0000111111111000b                               
dw         0001111111111000b                               
dw         0000001111110000b                               
dw         0001111111110110b                               
dw         0001110011111110b                               
dw         0000001111110000b                               
dw         0000111111111000b                               
dw         0110111111110000b                               
dw         0000111111110000b                               
dw         0111110011111110b                               
dw         0000111111111000b                               
dw         0001111111111000b                               
dw         0000001111110000b                               
dw         0001111111110110b                               
dw         0000110011111110b                               
BouncyBallSprite1_0xde7b:                                  
dw         0000000100000000b                               
dw         0000010101000000b                               
dw         0000110101100000b                               
dw         0001010101010000b                               
dw         0001010101010000b                               
dw         0000110101100000b                               
dw         0000010101000000b                               
dw         0000000100000000b                               
BouncyBallSprite2_0xde8b:                                  
dw         0000000000000000b                               
dw         0000000000000000b                               
dw         0000010101000000b                               
dw         0011010101011000b                               
dw         0101010101010100b                               
dw         0101010101010100b                               
dw         0011010101011000b                               
dw         0000010101000000b                               
BirdSprite1_0xde9b:                                        
dw         1100000110000011b                               
dw         1111001111001111b                               
dw         0011111111111100b                               
dw         0000111111110000b                               
dw         0000001111000000b                               
dw         0000000110000000b                               
BirdSprite2:                                               
dw         0000000110000000b                               
dw         0000001111000000b                               
dw         0000111111110000b                               
dw         0011111111111100b                               
dw         1111001111001111b                               
dw         1100000110000011b                               
PickupSpriteData:                                          
MoneyBagSprite:                                            
dw         0001000100010000b                               
dw         0001111011100100b                               
dw         0000101011011000b                               
dw         0000011111110000b                               
dw         0000110101101100b                               
dw         0001101010110010b                               
dw         0011101010111000b                               
dw         0011101010111000b                               
dw         0011101010111000b                               
dw         0001111111110000b                               
DiamondSprite:                                             
dw         0000001010000000b                               
dw         0010101010101000b                               
dw         1010101010101010b                               
dw         1010101010101010b                               
dw         0010101010101000b                               
dw         0010101010101000b                               
dw         0000101010100000b                               
dw         0000101010100000b                               
dw         0000001010000000b                               
dw         0000001010000000b                               
KeySprite:                                                 
dw         0000000000000000b                               
dw         0010000000000000b                               
dw         0010100000000000b                               
dw         1000100000000000b                               
dw         1000101101010101b                               
dw         1000101010101010b                               
dw         1000101101010101b                               
dw         1000100000110011b                               
dw         0010100000110011b                               
dw         0010000000000000b                               
Unlike the other sprites, this is 3 bytes per li:          
for 9 lines.:                                              
PlayerSplatSprite+1:                                       
PlayerSplatSprite:                                         
dw         0000010000000000b                               
dw         0000000000000011b                               
dw         0000011100000000b                               
dw         0011000100000110b                               
dw         0000000000011000b                               
dw         0000010011000000b                               
dw         0000100101010000b                               
dw         1000000000000101b                               
dw         0101010000000000b                               
dw         0001011001011100b                               
dw         0000000000111001b                               
dw         0101010100000000b                               
dw         1101101010101011b                               
db         11000000b                                       
Data_DoorSprite_0xdf0a:                                    
dw         0010101010000000b                               
WORD_df0c:                                                 
dw         1010101010100000b                               
dw         1010111110100000b                               
dw         1011010111100000b                               
dw         1010111110100000b                               
dw         1010101010100000b                               
dw         1010010110100000b                               
dw         1001101001100000b                               
dw         1001101001100000b                               
dw         1010010110100000b                               
dw         1010101010100000b                               
dw         1010101010100000b                               
dw         1010101010100000b                               
dw         1010101010100000b                               
dw         1010101010100000b                               
dw         1010101010100000b                               
Data_DropSprites_0xdf2a:                                   ; why four different drops?
dw         0000000000000000b                               
dw         0100000000000000b                               
dw         0110000000000000b                               
dw         1111000000000000b                               
dw         1111000000000000b                               
dw         0110000000000000b                               
dw         0000000000000000b                               
dw         0001000000000000b                               
dw         0001100000000000b                               
dw         0011110000000000b                               
dw         0011110000000000b                               
dw         0001100000000000b                               
dw         0000000000000000b                               
dw         0000010000000000b                               
dw         0000011000000000b                               
dw         0000111100000000b                               
dw         0000111100000000b                               
dw         0000011000000000b                               
dw         0000000000000000b                               
dw         0000000100000000b                               
dw         0000000110000000b                               
dw         0000001111000000b                               
dw         0000001111000000b                               
dw         0000000110000000b                               
EndOfGameRom:                                              
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         01h                                             
??         FFh                                             
??         00h                                             
??         FEh                                             
??         00h                                             
??         FEh                                             
??         01h                                             
??         FFh                                             
??         F7h                                             
??         FFh                                             
