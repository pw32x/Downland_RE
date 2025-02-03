; Converted to LWASM-compatible assembly from Ghidra listing by GhidraToLWTOOLS
; Tool written by pw_32x
; https://github.com/pw32x/Downland_RE
;
; Downland V1.1 by Michael Aichlmayr
; For the Tandy Color Computer
; Originally released in 1983 by Spectral Associates
; V1.1 is a later release to support the Coco 3
; https://www.cocopedia.com/wiki/index.php/Downland
;
; Get LWTOOLS here: http://www.lwtools.ca/
; How to build this: lwasm.exe downland.asm --6809 --output=downland.bin --format=raw
;


; Hardware constants
PIA0_A_DATA_REG__FF00            equ 0xff00
PIA0_A_CONTROL_REG__FF01         equ 0xff01
PIA0_B_DATA_REG__FF02            equ 0xff02
PIA0_B_CTRL_REG__FF03            equ 0xff03
VMODE_REG__FF98                  equ 0xff98
PIA1_A_DATA_REG__FF20            equ 0xff20
PIA1_B_DATA_REG__FF22            equ 0xff22
PIA1_B_CONTROL_REG__FF23         equ 0xff23
PALETTE_FFB4                     equ 0xffb4
PALETTE_FFB6                     equ 0xffb6
SAM_V0_FFC0                      equ 0xffc0
SAM_V1_FFC3                      equ 0xffc3
SAM_V2_FFC5                      equ 0xffc5
SAM_PAGE_SELECT_REG_SAM_F0_FFC6  equ 0xffc6
RomRam_MapType_FFDE              equ 0xffde


;
; Coco Ram
; RAM:0000-RAM:3fff
;
SomeTickTockValue_0x10                                      equ 0x0010    
SomeCounter_0x11                                            equ 0x0011    
InterruptHasBeenHitCounter_0x14                             equ 0x0014    
Player_JoystickDirection_0x15                               equ 0x0015    ; possible values:
                                                                          ; left: 4
                                                                          ; right: 2
                                                                          ; up: 1
                                                                          ; down: 3
                                                                          ; 
ZeroValue                                                   equ 0x001b    
DrawSegmentLine_Counter_0x1d                                equ 0x001d    
DrawSegment_SecondaryAxisSubpixelInc_0x1e                   equ 0x001e    
DrawSegmentLine_SubPixelOffset_0x1f                         equ 0x001f    
CrtArtifactDrawingMaskIndex_0x20                            equ 0x0020    
DrawSegment_CurrentScreenYXPosition_0x21                    equ 0x0021    
DrawSegment_CurrentScreenY_0x21                             equ 0x0021    
DrawSegment_CurrentScreenX_0x22                             equ 0x0022    
PlayerY_AsSingleByte_0x23                                   equ 0x0023    
CurrentSegmentCounter_0x24                                  equ 0x0024    
DrawSegmentLine_SubPixelStartValue_Maybe_0x25               equ 0x0025    
UtilityCounter_0x26                                         equ 0x0026    
Player_JumpUpInTheAirCounter_0x2c                           equ 0x002c    ; counts down only when going upwards
                                                                          ; looks like the value that controls how
                                                                          ; far up the jump goes. Can change to make
                                                                          ; jump higher or lower
Player_IsFalling_0x2d                                       equ 0x002d    ; 0: is touching ground
                                                                          ; ff: is not touching ground
Player_SafeLandingFromFalling_0x2e                          equ 0x002e    ; 0: will die when landing
                                                                          ; ff: will not die when landing
Player_CantJumpAfterLandingCounter_Maybe_0x2f               equ 0x002f    
Player_DeathPauseInTheAirTimer                              equ 0x0030    
Player_IsJumping_0x31                                       equ 0x0031    
Ball_FallStateCounter_0x32                                  equ 0x0032    
SomeValue_0x34                                              equ 0x0034    
SomeValue_0x35                                              equ 0x0035    
Player_MoveLeftRightHoldingRopeCounter_0x36                 equ 0x0036    
Player_CurrentSpriteFrame_Maybe_0x37                        equ 0x0037    
CurrentRoomNumber_0x39                                      equ 0x0039    
GameCompletionCount_0x3a                                    equ 0x003a    
RoomGraphicsAndDoorDataAddress_0x3b                         equ 0x003b    
PerRoomPickupDataAddress_0x3d                               equ 0x003d    
NumberOfDropsToProcess_0x3f                                 equ 0x003f    
Drop_TickTockBetweenFFto0andBack_0x40                       equ 0x0040    
Object_CollisionY_0x41                                      equ 0x0041    
Object_CollisionX_0x42                                      equ 0x0042    
Object_CollisionHeight_0x43                                 equ 0x0043    
Object_CollisionWidth_0x44                                  equ 0x0044    
Player_SpriteFrameAddress_Temp_0x45                         equ 0x0045    
Player_NeedsUpdate_Maybe_0x48                               equ 0x0048    
Ball_IsActive_0x49                                          equ 0x0049    
Player_RegenerationTimer_0x4b                               equ 0x004b    
SecondUtilityCounter_0x4d                                   equ 0x004d    
CurrentVideoMemLocation_0x4e                                equ 0x004e    
CurrentNumberOfPlayers_0x50                                 equ 0x0050    
SelectedNumberOfPlayers_0x51                                equ 0x0051    
CurrentPlayer_0x52                                          equ 0x0052    
CurrentInGamePlayerStringPointer                            equ 0x0053    
PlayerOne_Lives                                             equ 0x0055    
PlayerTwo_Lives                                             equ 0x0056    
Player1_SomeDataAddress_Always0Maybe                        equ 0x0057    
Player2_SomeDataAddress_Always0Maybe                        equ 0x005c    
StoredPlayerPosition_0x5e                                   equ 0x005e    
TempRoomNumberHolder_0x60                                   equ 0x0060    
RomAddressCounter_0xc000to0xdf5a_0x61                       equ 0x0061    
InterruptHitCount                                           equ 0x0063    ; not really used, but incremented in the vsync interrupt
SomeValue_RelatedToDrops_0x64                               equ 0x0064    
SomeValue_AlsoRelatedToDrops_0x65                           equ 0x0065    
CharacterDrawingMask_0x69_Nice                              equ 0x0069    ; ensures that characters are 
                                                                          ; drawn taking into account
                                                                          ; CRT artifact effects
SAM_SETUP_BITS_MAYBE_0x6a                                   equ 0x006a    
GameTimerSecondDigit_0x6b                                   equ 0x006b    
DividerForNumberToStringConversion_0x6c                     equ 0x006c    
GameTimerLastDigit_0x6e                                     equ 0x006e    
SomeStringConversionValue_0x6f                              equ 0x006f    
UnusedMask_Maybe_0x71                                       equ 0x0071    
RomStartAddress_0xc000                                      equ 0x0072    
Player_CollisionMaskBuffer_0x74                             equ 0x0074    
SpriteDrawingBuffer_0x83                                    equ 0x0083    ; This is a 48 byte buffer for the player splat sprite
                                                                          ; and doors. 
                                                                          ; The splat sprite is 3 bytes for 9 lines, but this space
                                                                          ; is 3 bytes for 16 lines.
                                                                          ; The door is 2 bytes for 16 lines.
PlayerSplatSpriteInRam_0x98                                 equ 0x0098    
HighScoreString_0xb3                                        equ 0x00b3    
HighScoreStringEnd_0xba                                     equ 0x00ba    
PlayerOneScoreString_0xbb                                   equ 0x00bb    
PlayerOneScoreStringEnd_0xc2                                equ 0x00c2    
PlayerTwoScoreString_0xc3                                   equ 0x00c3    
PlayerTwoScoreStringEnd_0xca                                equ 0x00ca    
GameTimerString_0xcb                                        equ 0x00cb    
DAT_0xcd                                                    equ 0x00cd    
StringDataEnd_0xd2                                          equ 0x00d2    
InterruptJumpInstruction_0x10c                              equ 0x010c    
InterruptHandlerAddress_0x10d                               equ 0x010d    
StackStart_0x019f                                           equ 0x019f    
Player_IsClimbingRope_0x19f                                 equ 0x019f    ; 0: Not climbing
                                                                          ; 1: is climbing but hanging to the side
                                                                          ; FF: is climbing
ConstantZeroToFFCounter                                     equ 0x01a0    ; used for various things, including animation timing for running, maybe
Player_CurrentAnimationFrame_0x1a2                          equ 0x01a2    
Player_GameStateCounter_0x1a5                               equ 0x01a5    ; 0: entering room
                                                                          ; 1: playing in room
                                                                          ; then increments every time the player dies.
                                                                          ; resets when changing rooms
Player_FacingDirection_0x1a6                                equ 0x01a6    ; facing left: 0
                                                                          ; facing right: ff
Player_CantMoveCounter_Maybe_0x1a7                          equ 0x01a7    ; used for pausing between deaths and regen
Player_State_AliveDeadRegenState_0x1a8                      equ 0x01a8    ; State:
                                                                          ; 0: alive
                                                                          ; 1: dead
                                                                          ; 2: dead and falling, or dead and checking the ground
                                                                          ; FF: regenerating
Player_PhysicsData_0x1aa                                    equ 0x01aa    
Player_SpeedY_0x1aa                                         equ 0x01aa    ; Player Physics Data
                                                                          ; 0-1: speed y
                                                                          ; 2-3: speed x
                                                                          ; 4-5: y
                                                                          ; 6-7: x
                                                                          ; 8-9: video page destination
                                                                          ; 10-11: sprite pointer
                                                                          ; 12-13: previous video page destination
                                                                          ; 14-15: previous sprite pointer
Ball_InitState_0x1ba                                        equ 0x01ba    ; goes from 0, to 1, 2, FF, and 0 again
                                                                          ; during lifetime
Ball_Physics_0x1bf                                          equ 0x01bf    
Ball_SpeedY_0x1bf                                           equ 0x01bf    ; The layout of the ball physics data match the one 
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
Ball_Y_0x1c3                                                equ 0x01c3    
Ball_X_0x1c5                                                equ 0x01c5    
EndOfBallData                                               equ 0x01cf    
Bird_InitState_0x1cf                                        equ 0x01cf    
Bird_PhysicsData                                            equ 0x01d4    
Bird_Y_0x1d8                                                equ 0x01d8    
Bird_X_0x1da                                                equ 0x01da    
CurrentPlayerSpritePointer_0x1e9                            equ 0x01e9    
PlayerLives_DrawLocationInPage_0x1eb                        equ 0x01eb    
DropDataBlock_0x1ef                                         equ 0x01ef    
Drop0_CeilingWiggleTimer_0x1ef                              equ 0x01ef    ; Each drop data is 13 bytes long.
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
Drop1_SpeedY_0x1fd                                          equ 0x01fd    
EndOfDropDataBuffer_0x271                                   equ 0x0271    
PerRoomPickupData_0x271                                     equ 0x0271    ; Each room has five pick ups.
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
RoomsPlayersHaveVisited_0x36b                               equ 0x036b    
VideoMemory_Page0_0x0400                                    equ 0x0400    
DAT_0455                                                    equ 0x0455    
DAT_0f66                                                    equ 0x0f66    
DAT_16cc                                                    equ 0x16cc    
DAT_1800                                                    equ 0x1800    
DAT_1801                                                    equ 0x1801    
DAT_1812                                                    equ 0x1812    
DAT_1952                                                    equ 0x1952    
VideoMemory_Page1_0x1c00                                    equ 0x1c00    
SpriteData_ClonedDestination_0x3400                         equ 0x3400    ; This is where sprites are copied over four times, offset one bit per c
                                                                          ; To make it easier to draw sprites when moving along bits.
Player_CollisionMasks_InRam_0x3b80                          equ 0x3b80    
BouncyBall_ClonedInRam_0x3dd8                               equ 0x3dd8    
PlayerOne_PerRoomTimers_0x3e98                              equ 0x3e98    ; level timers start at 0x1000 (4096)
PlayerTwo_PerRoomTimers_0x3eac                              equ 0x3eac    ; level timers start at 0x1000 (4096)
Player_DoorStateData_0x3ec0                                 equ 0x3ec0    
BirdSprite_ClonedInRam_0x3ee2                               equ 0x3ee2    
;
; ROM
; RAM:c000-RAM:dfff
;
;**************************************************************
;* Game rom start and initial setup                           *
;**************************************************************

        org 0xc000
CartridgeRomStart:                                    
        NOP                                                               
        ORCC       #01010000b                                             
        LDS        #StackStart_0x019f                                     ; setup stack at address 415 019f
        LDX        #0x0                                                   

Clear_Memory_Loop:                                                       
        CLR        ,X+                                                    
        CMPX       #0x4000                                                
        BNE        Clear_Memory_Loop                                      

;Setup IRQ vector
        LDA        #0x7e                                                  ; JMP instruction number
        STA        InterruptJumpInstruction_0x10c                         
        LDX        #InterruptHandler                                      ; the address of the interrupt handler
        STX        InterruptHandlerAddress_0x10d                          

;init hardware register stuff
        LDA        #00110101b                                             ; bit 0 VSYNC IRQ ON
                                                                          ; bit 2 DATA DIRECTION NORMAL
                                                                          ; bit 4 1
                                                                          ; bit 5 1
                                                                          ; 
        STA        PIA0_B_CTRL_REG__FF03                                  
        LDA        #00100000b                                             ; bit 5: swap artifact colors
        STA        VMODE_REG__FF98                                        
        LDA        #11111110b                                             ; enable all columns except the first 
        STA        PIA0_B_DATA_REG__FF02                                  ; setup keyboard columns
        LDA        PIA0_A_DATA_REG__FF00                                  ; get keyboard/joystick button state
        ANDA       #00010000b                                             ; only keep bit 4, but never use it? ooookay.
        BNE        Jump_OverPaletteSetting                                ; just jump ahead
        LDD        #0x9                                                   ; black (0x00) and magenta (0x09) color index?
        STD        PALETTE_FFB4                                           
        LDD        #0x243f                                                ; low intensity green (0x02) and faded blue (0x43) ? 
        STD        PALETTE_FFB6                                           
        LDA        #0xe8                                                  
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0x86f8 which does nothing. 

Jump_OverPaletteSetting:                                                 
        LDA        #0xf8                                                  ; // 248

LAB_c043:                                                                
        STA        <SAM_SETUP_BITS_MAYBE_0x6a                             ; store at address 106
        JSR        WaitForVSync_Maybe                                     
        LDD        #VideoMemory_Page1_0x1c00                              
        JSR        SetupSAMPages                                          
        JSR        InitVideoRegisters                                     
        CLRA                                                              
        JSR        Clear512BytesInRamFrom_0x7e00_To_0x8000                
        JSR        SetupStringEndCharactersForDynamicStrings              
        STA        RomRam_MapType_FFDE                                    
        LDX        #CartridgeRomStart                                     ; Load the number c000 into X
        STX        <RomAddressCounter_0xc000to0xdf5a_0x61                 
        STX        <RomStartAddress_0xc000                                
        LDA        #01010101b                                             ; some mask, maybe?
        STA        <UnusedMask_Maybe_0x71                                 
        JSR        CopySpritesFromRomToRam                                
        INC        <SelectedNumberOfPlayers_0x51                          

LAB_c06b:                                                                
        LDX        #RoomsPlayersHaveVisited_0x36b                         
        LDA        #10                                                    ; setup a loop to
                                                                          ; clear 10 bytes from 0x36b

LOOP_Clear10Bytes_c070:                                                  
        CLR        ,X+                                                    
        DECA                                                              
        BNE        LOOP_Clear10Bytes_c070                                 
        JSR        EnableSound                                            
        LDA        #1                                                     ; store 1 to 0x3a. 
        STA        <GameCompletionCount_0x3a                              ; set this so that the title screen has 10 drops
        JSR        InitDrops                                              
        LDA        #0xa                                                   ; menu screen room number
        STA        <CurrentRoomNumber_0x39                                
        LDA        #01010101b                                             ; store the character drawing mask
        STA        <CharacterDrawingMask_0x69_Nice                        
        JSR        LoadPage1AddressToX                                    
        JSR        WaitForVSync_Maybe                                     
        LDD        #VideoMemory_Page1_0x1c00                              ; somewhere in video memory?
                                                                          ; get overriden  by SetupSAMPages
        JSR        SetupSAMPages                                          
        JSR        InitVideoRegisters                                     
        JSR        ClearVideoMemory_0x0400_to_0x3400                      
        LDX        #0x400                                                 ; likely page 0 location
        STX        <CurrentVideoMemLocation_0x4e                          ; store 0x400 to 0x4e
;**************************************************************
;* Draw Title Screen                                          *
;**************************************************************
        LDU        #TitleScreenBackground_DrawCommands                    
        JSR        DrawBackground                                         

;Print Intro Text To Screen
        LDU        #TextStrings                                           
        LDX        #TextScreenPositions                                   
        LDA        #13                                                    ; number of strings to process
        STA        <UtilityCounter_0x26                                   

Loop_PrintString:                                                        
        PSHS        X                                                     
        LDX        ,X                                                     ; load to X the address stored in X (c23d)
        JSR        PrintString                                            
        PULS        X                                                     
        LEAX       0x2,X                                                  ; move to next screen position
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_PrintString                                       

;print player one score
        LDU        #PlayerOneScoreString_0xbb                             
        JSR        CheckScoreStringAgainstHighScoreString                 
        LDU        #PlayerOneScoreString_0xbb                             
        LDX        #DAT_1812                                              ; screen location
        JSR        FindFirstNonZeroCharacterInString                      
        JSR        PrintString                                            

;print player two score
        LDU        #PlayerTwoScoreString_0xc3                             
        JSR        CheckScoreStringAgainstHighScoreString                 
        LDU        #PlayerTwoScoreString_0xc3                             
        LDX        #DAT_1952                                              ; screen location
        JSR        FindFirstNonZeroCharacterInString                      
        JSR        PrintString                                            

;print high score
        LDU        #HighScoreString_0xb3                                  
        LDX        #DAT_16cc                                              ; screen location
        JSR        FindFirstNonZeroCharacterInString                      
        JSR        PrintString                                            
        LDD        #VideoMemory_Page0_0x0400                              ; A = 0x04, B = 0x00. A is Sam Page setup bits
        JSR        SetupSAMPages                                          

;Done drawing. Copy from page 0 to page 1
        LDX        #VideoMemory_Page0_0x0400                              ; setup loop to copy page 0 to page 1

LOOP_Copy_TitleScreen_Page0_to_Page1:                                    
        LDD        ,X                                                     ; load to D from two bytes of the first video page
        STD        0x1800,X                                               ; store D to the first two bytes of the second video page
        LEAX       0x2,X                                                  ; move X to the next pair of bytes in video page 0
        CMPX       #VideoMemory_Page1_0x1c00                              
        BNE        LOOP_Copy_TitleScreen_Page0_to_Page1                   

;Some initial player setup
        ANDCC      #11101111b                                             ; disable interrupts, maybe
        LDA        <SelectedNumberOfPlayers_0x51                          
        STA        <CurrentNumberOfPlayers_0x50                           
        LDA        #0x1                                                   ; set to player one
        STA        <CurrentPlayer_0x52                                    ; store current player
;**************************************************************
;* Title Screen Handling Code                                 *
;**************************************************************

Loop_TitleScreenLoop:                                                    
        JSR        IncrementRomAddressCounter                             
        JSR        UpdateJoystick_Maybe                                   
        LDA        <Player_JoystickDirection_0x15                         
        CMPA       #0x4                                                   ; holding left on the joystick
        BNE        Jump_NotHoldingLeft                                    
        LDA        #0x1                                                   ; setup one player mode?
        STA        <CurrentNumberOfPlayers_0x50                           
        STA        <SelectedNumberOfPlayers_0x51                          
        BRA        Jump_NotHoldingRight                                   

Jump_NotHoldingLeft:                                                     
        CMPA       #0x2                                                   ; holding right on the joystick
        BNE        Jump_NotHoldingRight                                   
        LDA        #0x2                                                   ; setup two player mode?
        STA        <CurrentNumberOfPlayers_0x50                           
        STA        <SelectedNumberOfPlayers_0x51                          

Jump_NotHoldingRight:                                                    
        LDA        <CurrentNumberOfPlayers_0x50                           
        LDB        #0xff                                                  ; bit pattern for the line cursor choosing
                                                                          ; the number of players
        LSRA                                                              
        BEQ        Jump_DrawOnePlayerCursor                               ; in one player mode
        CLR        0x1364 ; clear the cursor next to one player           
        STB        0x1370 ; draw the cursor pos for two player mode       
        BRA        Jump_UpdateAndDrawDrops                                ; Jump_SkipDrawOnePlayerCursor

Jump_DrawOnePlayerCursor:                                                
        STB         0x1364 ; draw the cursor pos for one player mode      
        CLR         0x1370 ; clear the cursor pos for two player mode     

Jump_UpdateAndDrawDrops:                                                 
        JSR        UpdateAndDrawDrops                                     
        LDA        PIA0_A_DATA_REG__FF00                                  
        BITA       #0x1                                                   ; test for joystick button
        BNE        Loop_TitleScreenLoop                                   ; if not pressed, then loop back
;**************************************************************
;* Initialize game                                            *
;**************************************************************
        LDB        #0x3                                                   
        STB        <PlayerOne_Lives                                       
        STB        <PlayerTwo_Lives                                       
        JSR        ClearTimerAndScoreStrings                              
        CLR        <GameCompletionCount_0x3a                              ; init the completion count
        LDA        #0x1                                                   ; set player one
        STA        <CurrentPlayer_0x52                                    ; set current player
        LDU        #String_PL1                                            
        STU        <CurrentInGamePlayerStringPointer                      
        LDD        InitialPlayerPosition_0xd272                           
        STD        <StoredPlayerPosition_0x5e                             
        CLR        <TempRoomNumberHolder_0x60                             
        JSR        InitAllTimers                                          
        JSR        InitDrops                                              
        JSR        InitRoomKeysAndPickups                                 
        JSR        InitVideoAndSetupRoomAndGraphics                       
        JSR        InitKeyStateData                                       
        JSR        Init_PlayerLivesIconParameters                         
        JSR        LoadPlayerPhysicsToYAndRoomDataInfoX                   
        JSR        InitRoom_Maybe                                         
        JSR        InitPlayerSomething                                    
        LDY        #Player_PhysicsData_0x1aa                              
        JSR        BigInitFunction_Maybe                                  

Loop_MainGameLoop_Maybe:                                                 
        LDA        <Player_NeedsUpdate_Maybe_0x48                         
        BEQ        Jump_SkipPlayerUpdate                                  
        CLR        <Player_NeedsUpdate_Maybe_0x48                         
        LDY        #Player_PhysicsData_0x1aa                              
        JSR        EraseAndUpdateAndDrawObject                            

Jump_SkipPlayerUpdate:                                                   
        JSR        FUN_ccb1                                               
        JSR        UpdatePlayerSoundAndCollisionsAndPhysics               
        LDA        <Ball_IsActive_0x49                                    
        BEQ        Jump_SkipBallUpdate                                    
        CLR        <Ball_IsActive_0x49                                    
        LDY        #Ball_Physics_0x1bf                                    
        JSR        EraseAndUpdateAndDrawObject                            

Jump_SkipBallUpdate:                                                     
        LDX        #PIA0_A_DATA_REG__FF00                                 
        LDA        #0xfb                                                  
        STA        0x2,X                                                  
        LDA        ,X                                                     
        ANDA       #01000000b                                             
        BNE        LAB_c1c4                                               
        PSHS        CC                                                    
        ORCC       #0x50                                                  

LAB_c1b8:                                                                
        LDA        #0xfd                                                  
        STA        0x2,X                                                  
        LDB        ,X                                                     
        ANDB       #01000000b                                             
        BNE        LAB_c1b8                                               
        PULS        CC                                                    

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
        LDA        #00000010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        JSR        UpdateBall                                             
        JSR        UpdateRoomTimers                                       

Loop_WaitForInterrupt:                                                   
        LDA        <InterruptHasBeenHitCounter_0x14                       
        BEQ        Jump_InterruptNotHitYet                                
        CLR        <InterruptHasBeenHitCounter_0x14                       
        BRA        Loop_MainGameLoop_Maybe                                

Jump_InterruptNotHitYet:                                                 
        LDX        #0x23                                                  
        JSR        IncrementRomAddressCounter                             
        BRA        Loop_WaitForInterrupt                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

Clear512BytesInRamFrom_0x7e00_To_0x8000:                                 
        LDX        #0x7e00                                                

LAB_c1f9:                                                                
        STA        ,X+                                                    
        CMPX       #0x8000                                                
        BNE        LAB_c1f9                                               
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

WaitForVSync_Maybe:                                                      
        PSHS        CC                                                    
        CLR        <InterruptHasBeenHitCounter_0x14                       
        ANDCC      #11101111b                                             ; keep all except interrupt
                                                                          ; listen only to IRQ

LoopUntilInterruptChanges0x14:                                           
        LDA        <InterruptHasBeenHitCounter_0x14                       
        BEQ        LoopUntilInterruptChanges0x14                          
        PULS        CC,PC                                                 ; pop CC and PC, effectively return
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ClearTimerAndScoreStrings:                                               
        LDX        #PlayerOneScoreString_0xbb                             

Loop_ClearCharacter:                                                     
        CLR        ,X+                                                    
        CMPX       #0xd3                                                  
        BNE        Loop_ClearCharacter                                    
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

SetupStringEndCharactersForDynamicStrings:                               
        LDA        #0xff                                                  
        STA        <HighScoreStringEnd_0xba                               
        STA        <PlayerOneScoreStringEnd_0xc2                          
        STA        <PlayerTwoScoreStringEnd_0xca                          
        STA        <StringDataEnd_0xd2                                    

Jump_ToRTS:                                                              
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

CheckScoreStringAgainstHighScoreString:                                  
        LDX        #HighScoreString_0xb3                                  
        PSHS        U,X                                                   

Loop_SameCharacter:                                                      
        LDA        ,U+                                                    ; load letter from source string, advance U
        BMI        Jump_HitEndOfString                                    ; hit end of source string
        CMPA       ,X+                                                    ; compare the letter in the source string
                                                                          ; with the letter in the highscore string
        BEQ        Loop_SameCharacter                                     ; if equal, loop
        BHI        Jump_SourceCharacterIsHigher                           

Jump_HitEndOfString:                                                     
        PULS        X,U,PC                                                

Jump_SourceCharacterIsHigher:                                            
        PULS        X,U                                                   

Loop_NextCharacterToCopy:                                                
        LDA        ,U+                                                    ; load next character
        BMI        Jump_ToRTS                                             ; if at the end, jump so we can return
        STA        ,X+                                                    ; copy the character to the highscore string
        BRA        Loop_NextCharacterToCopy                               

TextScreenPositions:                                                     
        .dw        0x07C9                                                 ; Downland V1.1

WORD_c23f:                                                               
        .dw        0x090A                                                 ; Written By:
        .dw        0x0A47                                                 ; Micheal Aichlmayr
        .dw        0x0B89                                                 ; Copyright 1983
        .dw        0x0CC6                                                 ; Spectral Associates
        .dw        0x0E0A                                                 ; Licensed To
        .dw        0x0F47                                                 ; Tandy Corporation
        .dw        0x1086                                                 ; All rights reserved
        .dw        0x1305                                                 ; One Player
        .dw        0x1311                                                 ; Two Player
        .dw        0x158B                                                 ; High Score
        .dw        0x1806                                                 ; Player One
        .dw        0x1946                                                 ; Player Two

Jump_PerformObjectBoundingBoxCollisions:                                 
        PULS        Y                                                     
;**************************************************************
;* Test collisions with pick up items                         *
;**************************************************************
        LDY        <PerRoomPickupDataAddress_0x3d                         
        LDA        #0xa                                                   
        STA        <Object_CollisionHeight_0x43                           
        LDA        #0x8                                                   
        STA        <Object_CollisionWidth_0x44                            
        LDB        #0x5                                                   ; test against 5 items

Loop_CollisionTestPickup:                                                
        LDA        ,Y                                                     
        ANDA       <CurrentPlayer_0x52                                    ; pick up state byte also handles player 2?
                                                                          ; evidence suggests yes
        BEQ        Jump_PickupIsInactive                                  
        LDA        0x2,Y                                                  
        STD        <Object_CollisionY_0x41                                
        LDA        0x3,Y                                                  
        STA        <Object_CollisionX_0x42                                
        JSR        TestPlayerObjectCollision                              
        BNE        Jump_CollidesWithPickup                                

Jump_PickupIsInactive:                                                   
        LEAY       0x5,Y                                                  ; next pickup
        DECB                                                              
        BNE        Loop_CollisionTestPickup                               
;**************************************************************
;* Test collisions with drops                                 *
;**************************************************************
        LDY        #Drop0_CeilingWiggleTimer_0x1ef                        
        LDA        #0x6                                                   
        STA        <Object_CollisionHeight_0x43                           
        LDA        #0x4                                                   
        STA        <Object_CollisionWidth_0x44                            
        LDB        <NumberOfDropsToProcess_0x3f                           

Loop_ProcessCollisionWithDrop:                                           
        LDA        ,Y                                                     
        BEQ        Jump_NoCollisionOrCollisionIgnored                     ; the drop is inactive with wiggle timer of 0
        LDA        0x3,Y                                                  
        STA        <Object_CollisionY_0x41                                
        LDA        0x5,Y                                                  
        STA        <Object_CollisionX_0x42                                
        JSR        TestPlayerObjectCollision                              
        BEQ        Jump_NoCollisionOrCollisionIgnored                     ; no collision occured
        LDA        ,Y                                                     ; don't collide if the drop is still wiggling
        BMI        Jump_NoCollisionOrCollisionIgnored                     ; no collision because the drop is still wiggling
        BRA        Jump_CollidesWithObjectThatKills                       ; the drop collides with the player

Jump_NoCollisionOrCollisionIgnored:                                      
        LEAY       0xd,Y                                                  ; skip to next drop
        DECB                                                              
        BNE        Loop_ProcessCollisionWithDrop                          
;**************************************************************
;* Test player collision with the ball                        *
;**************************************************************
        LDA        #0x8                                                   
        STA        <Object_CollisionHeight_0x43                           
        LDA        #0x8                                                   
        STA        <Object_CollisionWidth_0x44                            
        LDA        Ball_Y_0x1c3                                           
        STA        <Object_CollisionY_0x41                                
        LDA        Ball_X_0x1c5                                           
        STA        <Object_CollisionX_0x42                                
        JSR        TestPlayerObjectCollision                              
        BNE        Jump_CollidesWithObjectThatKills                       
;**************************************************************
;* Test player collision with the bird                        *
;**************************************************************
        LDA        #0x6                                                   
        STA        <Object_CollisionHeight_0x43                           
        LDA        #0x8                                                   
        STA        <Object_CollisionWidth_0x44                            
        LDA        Bird_Y_0x1d8                                           
        STA        <Object_CollisionY_0x41                                
        LDA        Bird_X_0x1da                                           
        STA        <Object_CollisionX_0x42                                
        JSR        TestPlayerObjectCollision                              
        BNE        Jump_CollidesWithObjectThatKills                       
        LDY        #Player_PhysicsData_0x1aa                              
        JMP        Jump_HandlePlayerJumpAndRope                           

Jump_CollidesWithObjectThatKills:                                        
        LDY        #Player_PhysicsData_0x1aa                              
        JMP        Jump_PerformPlayerDeath                                

Jump_CollidesWithPickup:                                                 
        LDA        <CurrentPlayer_0x52                                    

;figure out which player bit to turn off for the picked up tre
        COMA                                                              
        ANDA       ,Y                                                     
        STA        ,Y                                                     
        LDB        0x4,Y                                                  
        BMI        Jump_SkipDoorActivation                                

;activate the door for the picked up key
        LDX        #Player_DoorStateData_0x3ec0                           
        LEAX       B,X                                                    
        LDA        ,X                                                     
        ORA        <CurrentPlayer_0x52                                    
        STA        ,X                                                     ; activate the door for the selected key for this player
                                                                          ; 
        JSR        LoadRoomDoorDataAddrIntoX                              

Loop_Doors:                                                              
        CMPB       0x5,X                                                  ; compare B with the room number of the door
        BEQ        Jump_DoneDoorSearch                                    ; if door index is the same as in B, we're done
        LEAX       >0x6,X                                                 
                                                                          ; jump to next door
        LDA        ,X                                                     ; get the first value of the door data block
        BNE        Loop_Doors                                             ; if the value isn't the zero sentinel value, loop
        BRA        Jump_SkipDoorActivation                                

Jump_DoneDoorSearch:                                                     
        LDU        #VideoMemory_Page1_0x1c00                              ; draw the unlocked door on both video memory pages
        STU        <CurrentVideoMemLocation_0x4e                          
        JSR        DrawDoorOrMultipleDoors_Maybe                          
        LDU        #VideoMemory_Page0_0x0400                              
        STU        <CurrentVideoMemLocation_0x4e                          
        JSR        DrawDoorOrMultipleDoors_Maybe                          

Jump_SkipDoorActivation:                                                 
        LDD        <ZeroValue                                             
        JSR        IncrementRomAddressCounter                             ; call this to get a "random" value in B
        ANDB       #0x7f                                                  ; keep only the first 7 bits
        LDA        0x1,Y                                                  ; get the pickup type 
                                                                          ; 0: diamond
                                                                          ; 1: money bag
                                                                          ; 2: key)
        BEQ        Jump_IsDiamond                                         
        DECA                                                              
        BEQ        Jump_IsMoneyBag                                        

;at this point, it's a key
        CLRA                                                              
        ADDD       #0xc8                                                  ; pick up points
        BRA        Jump_AddToScore                                        

Jump_IsMoneyBag:                                                         
        ADDD       #0x12c                                                 ; pick up points
        BRA        Jump_AddToScore                                        

Jump_IsDiamond:                                                          
        ADDD       #0x190                                                 ; pick up points

Jump_AddToScore:                                                         
        PSHS        Y                                                     
        JSR        UpdateAndPrintPlayerScore                              
        PULS        Y                                                     
        JSR        SetupPickupScreenLocationAndNumLinesToClear            
        STB        <UtilityCounter_0x26                                   
        BSR        ClearPickupFromScreen                                  
        LDD        #0x1280                                                ; setup A and B parameters for pickup sound
        BSR        PlaySound                                              
        LDY        #Player_PhysicsData_0x1aa                              
        JMP        EraseAndUpdateAndDrawObject                            
;**************************************************************
;* Clears the sprite graphics from page 0                     *
;* How: copies two bytes from page1 to page0 for              *
;* the number of lines specified in UtilityCounter_0x26       *
;**************************************************************

ClearPickupFromScreen:                                                   
        .db        0xEC                                                   ; load value to D on second page
                                                                          ; 
        .db        0x89                                                   
        .db        0x18                                                   
        .db        0x00                                                   
        STD        ,X                                                     ; store D to first page
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        ClearPickupFromScreen                                  
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

PlaySound:                                                               
        STA        <SecondUtilityCounter_0x4d                             
        STB        <UtilityCounter_0x26                                   

Loop_UpdateRegisters:                                                    
        LDA        #11111111b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        BSR        DoIdleLoopOnB                                          
        LDA        #00000010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        BSR        DoIdleLoopOnB                                          
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_UpdateRegisters                                   
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DoIdleLoopOnB:                                                           
        LDB        <SecondUtilityCounter_0x4d                             

Loop_DecrementB:                                                         
        DECB                                                              
        BNE        Loop_DecrementB                                        
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

TestPlayerObjectCollision:                                               
        LDX        #Player_PhysicsData_0x1aa                              
        LDA        0x4,X                                                  
        CMPA       <Object_CollisionY_0x41                                
        BLS        LAB_c38d                                               
        SUBA       <Object_CollisionY_0x41                                
        CMPA       <Object_CollisionHeight_0x43                           
        BLS        LAB_c395                                               
        BRA        Jump_NoCollision                                       

LAB_c38d:                                                                
        LDA        <Object_CollisionY_0x41                                
        SUBA       0x4,X                                                  
        CMPA       -0x1,X                                                 
        BHI        Jump_NoCollision                                       

LAB_c395:                                                                
        LDA        0x6,X                                                  
        CMPA       <Object_CollisionX_0x42                                
        BLS        LAB_c3a3                                               
        SUBA       <Object_CollisionX_0x42                                
        CMPA       <Object_CollisionWidth_0x44                            
        BLS        Jump_HasCollision                                      
        BRA        Jump_NoCollision                                       

LAB_c3a3:                                                                
        LDA        <Object_CollisionX_0x42                                
        SUBA       0x6,X                                                  
        CMPA       #0x8                                                   
        BLS        Jump_HasCollision                                      
        BRA        Jump_NoCollision                                       

Jump_NoCollision:                                                        
        CLRA                                                              
        RTS                                                               

Jump_HasCollision:                                                       
        LDA        #0xff                                                  
        RTS                                                               

Jump_Return_Helper:                                                      
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdatePlayerSoundAndCollisionsAndPhysics:                                
        LDY        #Player_PhysicsData_0x1aa                              
        LDA        -0x8,Y                                                 
        DECA                                                              
        BNE        Jump_SkipPlaySound                                     
        LDB        #00111111b                                             
        STB        PIA1_A_DATA_REG__FF20                                  ; play sound when animation frame is not 0?

Jump_SkipPlaySound:                                                      
        LDA        -0x5,Y                                                 
        BEQ        Jump_Return_Helper                                     ; inactive, so just return
        CMPA       #0x1                                                   ; check if the game is currently in a room transition
        LBEQ       Jump_HandlePlayerJumpAndRope                           ; it is in a screen transition
        LDA        <Player_DeathPauseInTheAirTimer                        ; are we in a death animation?
        LBNE       Jump_PlayerStillDyingInTheAir                          
        LDA        -0x2,Y                                                 
        LBMI       Jump_JoystickCheck                                     ; jump if player state is FF
        LBNE       Jump_PlayerIsDeadSoSkipStuff                           ; jump if the state is 1 or more
        INC        -0xa,Y                                                 

;The "mysterious sprites" located between the player and
;ball sprites in rom data are masks used to extract five
;lines across the player sprite on the screen. The extracted
;lines are then compared to a clean version of the player
;sprite overlaid a clean background. Any differences between
;the extracted pixels and the clean version triggers a
;jump to a bounding box collision check against all the
;moving objects.
        LDU        #Player_CollisionMasks_InRam_0x3b80                    ; location of the collision masks in RAM
        LDA        -0x8,Y                                                 
        LDB        #0x3c                                                  ; size of the four collision masks for a frame along 4 pixels
                                                                          ; (5 lines * 3 bytes * 4 frames)
        MUL                                                               
        LEAU         D,U ; compute the address of the set of collisio     
        LDA        0x6,Y                                                  
        ANDA       #0x3                                                   ; get the last two bits if player X. this gets 
                                                                          ; us which collision mask for the X position 
                                                                          ; to look for (0 - 3)
        LDB        #0xf                                                   ; the size of one collision mask (5 lines * 3 bytes)
        MUL                                                               
        LEAU         D,U ; compute the address of the                     
                                                                          ; collision mask to use for this particular X position
        LDA        -0x8,Y                                                 
        CMPA       #0x3                                                   ; compare the animation frame with 3. The run animation
                                                                          ; goes from 0 to 3.
        BHI        Jump_DontAdjustU                                       ; Jump if we're not running towards the right
        LDA        -0x4,Y                                                 
        BNE        Jump_DontAdjustU                                       ; Jump if we're still facing right, ie not facing left
        LEAU       0x168,U                                                ; otherwise, skip the right facing run frames and the
                                                                          ; two climbing frames to get to the left facing frames

Jump_DontAdjustU:                                                        
        LDX        0xc,Y                                                  
        LEAX       0x20,X                                                 ; get the position one pixel under the player location
                                                                          ; on screen
        PSHS        Y                                                     
        LDY        #Player_CollisionMaskBuffer_0x74                       
        LDA        #0x5                                                   ; five lines of the sprite
        STA        <UtilityCounter_0x26                                   

;X - video page location of player sprite on screen (1 pixel d
;Y - player sprite utility buffer
;U - player collision mask for current frame and
;x position
;Fill the buffer with the pixels around the player and the
;background. Then later it's compared with the player sprite
;in ram. Any differences means that there's a collision with

something.:                                                              

Loop_FillPlayerCollisionMaskBuffer:                                      
        PULU        A,B                                                   ; fill A and B, move U up two bytes
                                                                          ; they are masks that decide what pixels to keep 
                                                                          ; when extracting from the screen
;first byte of line
        ANDA       ,X                                                     ; keep only the screen pixel bits that correspond 
                                                                          ; to the mask bits
                                                                          ; screen: 01010101
                                                                          ; mask:   00011110
                                                                          ; result: 00010100 
        ORA        0x1800,X                                               ; blend with the clean background area. probably 
                                                                          ; in case some other drawing routine had erased some
                                                                          ; pixels.
        STA        ,Y+                                                    ; store in the the collision mask extraction buffer

;second byte of line
        ANDB       0x1,X                                                  ; do all the same for B
        ORB        0x1801,X                                               
        STB        ,Y+                                                    

;third byte of line
        PULU        A                                                     ; do the same for the third byte of the current line
        ANDA       0x2,X                                                  
        ORA        0x1802,X                                               
        STA        ,Y+                                                    
        LEAX       0x60,X                                                 ; move three pixels down on screen to get the next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_FillPlayerCollisionMaskBuffer                     

;get the current player animation frame
        PULS        Y                                                     
        LDU        #SpriteData_ClonedDestination_0x3400                   
        LDA        -0x8,Y                                                 
        LDB        #0xc0                                                  ; size of sprite for animation frame: 16 lines * 3 bytes * 4 positions o
        MUL                                                               
        LEAU         D,U ; set U to the current animation sprite          
        LDA        0x6,Y                                                  
        ANDA       #0x3                                                   
        LDB        #0x30                                                  
        MUL                                                               
        LEAU         D,U ; set U to the current animation sprite alon     
        LEAU       0x3,U                                                  ; move to the next line in the sprite
        LDA        -0x8,Y                                                 
        CMPA       #0x3                                                   ; check if we're running or standing
        BHI        Jump_DontAdjustUAgain                                  ; we're climbing
        LDA        -0x4,Y                                                 
        BNE        Jump_DontAdjustUAgain                                  
        LEAU       0x480,U                                                ; move to the left facing sprites

Jump_DontAdjustUAgain:                                                   
        LDX        0xc,Y                                                  
        LEAX       0x1820,X                                               ; set X to the clean video page, one pixel down
        PSHS        Y                                                     
        LDY        #Player_CollisionMaskBuffer_0x74                       
        LDA        #0x5                                                   ; num sprite collision mask rows
        STA        <UtilityCounter_0x26                                   

;U - player sprite
;X - second video memory page
;Y - sprite utility buffer
;The utility buffer contains the extracted player and
;background pixels for five lines. And then it tries to
;compare those lines with the ones from the player sprite
;in ram and the clean background.
;Any differences in pixels means that the player is
;overlapping an object and so it jumps to the bounding
;box collision functions.

Loop_CheckCollisionMaskLine:                                             
        PULU        A,B                                                   ; get the first two sprite bytes

;test first byte
        ORA        ,X                                                     ; blend with the byte from the clean background
        CMPA       ,Y+                                                    ; check against the collision mask buffer for differences
        LBNE       Jump_PerformObjectBoundingBoxCollisions                

;test second byte
        ORB        0x1,X                                                  
        CMPB       ,Y+                                                    
        LBNE       Jump_PerformObjectBoundingBoxCollisions                

;test third byte
        PULU        A                                                     
        ORA        0x2,X                                                  
        CMPA       ,Y+                                                    
        LBNE       Jump_PerformObjectBoundingBoxCollisions                
        LEAX       0x60,X                                                 ; go down three pixels
        LEAU       0x6,U                                                  ; skip two lines in the sprite frame
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_CheckCollisionMaskLine                            
        PULS        Y                                                     

;At this point, the player isn't colliding with any objects

Jump_HandlePlayerJumpAndRope:                                            
        LDA        <Player_JumpUpInTheAirCounter_0x2c                     
        LBNE       Jump_PlayerIsJumpingUpwards                            
        LDA        -0xb,Y                                                 
        LBNE       Jump_PlayerIsNotFalling                                ; 0 means not on rope
                                                                          ; 1 or FF means on rope

Jump_PlayerIsDeadSoSkipStuff:                                            
        BSR        ComputeSomeScreenOffset_Maybe                          ; char ComputeSomeScreenOffset_Maybe(void)

;At this point
;B -> 0 or 1
;X -> 0, 2, 4, 6
        LEAX       0x200,X                                                ; sixteen pixels down
        LDU        #PlayerFloorCollisionMask                              
        LDD        A,U                                                    ; A will contain offset into the array for the 
                                                                          ; x position
;detecting whether we're standing or not, maybe
        ANDA       0x1800,X                                               
        ANDB       0x1801,X                                               
        CMPD       <ZeroValue                                             ; check if A and B are empty. if they are
                                                                          ; then we need to fall.
        BEQ        Jump_HandleFall                                        
        PSHS        B                                                     
        JSR        TerrainCollisionTest                                   ; call the function but then do nothing about it?
        PULS        A                                                     
        BNE        Jump_PlayerIsNotFalling                                
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        BNE        Jump_PlayerIsNotFalling                                

Jump_HandleFall:                                                         
        LDA        #0xff                                                  
        STA        <Player_IsFalling_0x2d                                 
        LDD        ,Y                                                     
        ADDD       #0x6                                                   ; add falling speed
        CMPD       #0x100                                                 ; max falling speed, likely
        BLS        Jump_NotHitTerminalVelocity                            
        CLR        <Player_SafeLandingFromFalling_0x2e                    ; set to 0, will die when landing. maybe.
        LDD        #0x100                                                 ; clamp the falling speed

Jump_NotHitTerminalVelocity:                                             
        STD        ,Y                                                     
        LDA        <Player_SafeLandingFromFalling_0x2e                    
        BMI        Jump_PlayerLandingIsSafe                               
        LDA        -0x4,Y                                                 
        BMI        Jump_UpdateXGoingLeft                                  
        LDD        0x2,Y                                                  
        ADDD       #0x1                                                   
        BMI        Jump_SetPlayerYSpeed                                   
        LDD        <ZeroValue                                             
        BRA        Jump_SetPlayerYSpeed                                   
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ComputeSomeScreenOffset_Maybe:                                           
        LDX        #SomeKindOfHorizontalBitOffsetTable                    ; set X to this table
        LDB        0x6,Y                                                  ; get X position from object physics data
        ANDB       #0x3                                                   ; get the last two bits of the x position
        TFR        B,A                                                    ; give it to A
        LDB        B,X                                                    ; load into B one of the items in the table. 
                                                                          ; Will be either 0 or 1. 
                                                                          ; 
        LDX        0x8,Y                                                  ; load the video page destination of the object
        ABX                                                               ; add the offset in B to X
        LSLA                                                              ; double A
        RTS                                                               

Jump_UpdateXGoingLeft:                                                   
        LDD        0x2,Y                                                  
        ADDD       #0xffff                                                
        BPL        Jump_SetPlayerYSpeed                                   
        LDD        <ZeroValue                                             

Jump_SetPlayerYSpeed:                                                    
        STD        0x2,Y                                                  

Jump_PlayerLandingIsSafe:                                                
        LDA        -0x2,Y                                                 
        BNE        Jump_PlayerIsDead_Maybe                                

Jump_NotTouchingGround:                                                  
        JMP        Jump_JumpToClimbingRopeSubroutine                      

SomeKindOfHorizontalBitOffsetTable:                                      
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x1                                                    

PlayerFloorCollisionMask:                                                
        .dw        0000001111000000b                                      
        .dw        0000000011110000b                                      
        .dw        0000000000111100b                                      
        .dw        0000111100000000b                                      

Ball_WideCollisionMask:                                                  
        .dw        0011111111110000b                                      
        .dw        0000111111111100b                                      
        .dw        0000001111111111b                                      
        .dw        1111111111000000b                                      

RopeShapeLookupTable_Maybe_1:                                            

RopeShapeLookupTable_Maybe:                                              
        .dw        0000001100000000b                                      
        .dw        0000000011000000b                                      
        .dw        0000000000110000b                                      
        .dw        0000110000000000b                                      
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ClearSpeedToZero:                                                        
        LDD        <ZeroValue                                             
        STD        ,Y                                                     
        STD        0x2,Y                                                  
        RTS                                                               

Jump_PlayerIsNotFalling:                                                 
        CLR        <Player_IsFalling_0x2d                                 
        LDA        -0x2,Y                                                 
        BNE        Jump_PlayerIsDead_Maybe                                
        LDD        ,Y                                                     
        CMPD       #0x100                                                 
        LBNE       Jump_PlayerLanding_Maybe                               

Jump_PerformPlayerDeath:                                                 
        BSR        ClearSpeedToZero                                       
        CLR        -0xb,Y                                                 
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
        ANDA       #0x4                                                   ; use the timer to swap the player direction while
                                                                          ; hanging in the air, maybe
        BEQ        Jump_FaceLeftInTheAir                                  
        LDA        #0xff                                                  ; set facing right
        STA        -0x4,Y                                                 
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0x6f3c which does nothing. 

Jump_FaceLeftInTheAir:                                                   
        CLR        -0x4,Y                                                 ; set facing left

LAB_c55d:                                                                
        LDA        #0x2                                                   
        STA        -0x8,Y                                                 
        JMP        LAB_c97f                                               

Jump_PlayerStartDeathFallling:                                           
        LDA        #0xa                                                   
        STA        -0x3,Y                                                 
        LDA        #0x2                                                   ; set to the mid-air jump frame
        STA        -0x2,Y                                                 
        JMP        Jump_Return_Helper                                     

Jump_PlayerIsDead_Maybe:                                                 
        LDA        <Player_IsFalling_0x2d                                 
        BNE        Jump_NotTouchingGround                                 
        BSR        ClearSpeedToZero                                       
        LDA        -0x2,Y                                                 
        DECA                                                              
        BEQ        LAB_c5ac                                               

;clear from 0x83 to 0xb3 for the
;sprite drawing buffer
        LDX        #SpriteDrawingBuffer_0x83                              
        LDA        #0x30                                                  ; clean 48 bytes

Loop_ClearSpriteDrawingBuffer:                                           
        CLR        ,X+                                                    
        DECA                                                              
        BNE        Loop_ClearSpriteDrawingBuffer                          

;from 0x98 to 0xb3, load the splat sprite
        LDX        #PlayerSplatSpriteInRam_0x98                           
        LDU        #PlayerSplatSprite                                     
        LDA        #0x1b                                                  ; 27 bytes. 9 lines of 3 bytes each

Loop_LoadUndentifiedData:                                                
        LDB        ,U+                                                    
        STB        ,X+                                                    
        DECA                                                              
        BNE        Loop_LoadUndentifiedData                               ; 27 bytes
        LDA        0x6,Y                                                  ;         
        ANDA       #0x3                                                   ; get 0 to 3 offset
                                                                          ; so, for every four pixels...
        BEQ        Jump_PlaySplatSound                                    ; don't need to adjust if we are on pixel 0

;adjust the sprite to draw
        STA        <UtilityCounter_0x26                                   ; pixel offset
        LDB        #0x10                                                  ; 16 lines in the sprite
        JSR        ShiftBitsInSpriteDrawingBuffer                         

Jump_PlaySplatSound:                                                     
        LDD        #0x2508                                                ; setup A and B parameters for splat sound 
        JSR        PlaySound                                              ; play splat sound

;perform actual drawing of sprite
        LDU        #SpriteDrawingBuffer_0x83                              
        JSR        DrawLifeIconsAndPlayerRegeneration                     

LAB_c5ac:                                                                
        DEC        -0x3,Y                                                 
        LBNE       Jump_Return_Helper                                     
        DEC        -0x2,Y                                                 
        BEQ        ResetTimerTo2048IfAtZeroWhenDied_Maybe                 
        LDA        #0xc                                                   
        STA        -0x1,Y                                                 
        LBSR       EraseSpriteFromScreen                                  
        LDA        #0x10                                                  
        STA        -0x1,Y                                                 
        LDA        #0x46                                                  
        STA        -0x3,Y                                                 
        LBRA       Jump_Return_Helper                                     
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

GetPlayerLivesAddress:                                                   
        LDX        #PlayerLivesAddresses                                  
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        LDX        A,X                                                    
        RTS                                                               

PlayerLivesAddresses:                                                    
        .dw        PlayerOne_Lives                                        
        .dw        PlayerTwo_Lives                                        

AddressesToSomePlayerData:                                               
        .dw        Player1_SomeDataAddress_Always0Maybe                   
        .dw        Player2_SomeDataAddress_Always0Maybe                   

PTR_String_GetReadyPlayerOne_c5da:                                       
        .dw        String_GetReadyPlayerOne                               
        .dw        String_GetReadyPlayerTwo                               

ResetTimerTo2048IfAtZeroWhenDied_Maybe:                                  
        LDA        Bird_InitState_0x1cf                                   
        BEQ        Jump_SkipResettingTimerAndBird                         
        JSR        GetPlayerRoomTimerBuffer                               
        LDB        <CurrentRoomNumber_0x39                                
        LSLB                                                              ; double B to get relative address in buffer
        ABX                                                               ; get timer location in room timer buffer
        LDD        #0x800                                                 ; set timer to 2048
        STD        ,X                                                     
        LDA        #0xff                                                  
        STA        Bird_InitState_0x1cf                                   

Jump_SkipResettingTimerAndBird:                                          
        BSR        GetPlayerLivesAddress                                  
        LDA        ,X                                                     
        CMPA       #0x5                                                   
        BLS        Jump_SkipClampingLivesCount                            
        LDA        #0x5                                                   
        STA        ,X                                                     

Jump_SkipClampingLivesCount:                                             
        DEC        ,X                                                     
        LBMI       Jump_PlayerOutOfLives                                  ; lives is 0xff, less than 0, so gave over
        PSHS        Y                                                     
        LDA        <CurrentNumberOfPlayers_0x50                           
        ANDA       #00000010b                                             
        LBEQ       Jump_IncrementGameState                                

LAB_c610:                                                                
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        BNE        Jump_ToPlayerOneSetup                                  
        INC        <CurrentPlayer_0x52                                    
        LDU        #String_PL2                                            
        LDX        #Player1_SomeDataAddress_Always0Maybe                  
        BRA        DoneSetupPlayer_DrawGetReadyScreen                     

Jump_ToPlayerOneSetup:                                                   
        DEC        <CurrentPlayer_0x52                                    
        LDU        #String_PL1                                            
        LDX        #Player2_SomeDataAddress_Always0Maybe                  

DoneSetupPlayer_DrawGetReadyScreen:                                      
        STU        <CurrentInGamePlayerStringPointer                      
        LDA        0x4,Y                                                  
        LDB        0x6,Y                                                  
        STD        0x2,X                                                  
        LDA        <CurrentRoomNumber_0x39                                
        STA        0x4,X                                                  
        JSR        ClearVideoMemory_0x0400_to_0x3400                      
        LDD        #VideoMemory_Page1_0x1c00                              
        JSR        SetupSAMPages                                          
        LDU        #TitleScreenBackground_DrawCommands                    
        JSR        DrawBackground                                         
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        LDX        #PTR_String_GetReadyPlayerOne_c5da                     
        LDU        A,X                                                    
        LDX        #DAT_0f66                                              
        JSR        PrintString                                            
        JSR        WaitForVSync_Maybe                                     
        ANDCC      #0xef                                                  
        LDD        #VideoMemory_Page0_0x0400                              ; A = 0x04, B = 0x00. A is Sam Page setup bits
        JSR        SetupSAMPages                                          
        LDX        #VideoMemory_Page0_0x0400                              ; setup loop to copy page 0 to page 1

LOOP_Copy_Page0_to_Page1:                                                
        LDD        ,X++                                                   ; load D from X, advance X by 2
        STD        0x17fe,X                                               ; set D to Page 1.
        CMPX       #VideoMemory_Page1_0x1c00                              
        BNE        LOOP_Copy_Page0_to_Page1                               

;Init drops
        JSR        InitDrops                                              
        LDA        #10                                                    ; menu screen room number
        STA        <NumberOfDropsToProcess_0x3f                           ; set to 10 drops
        STA        <CurrentRoomNumber_0x39                                

Loop_ProcessGetReadyScreen:                                              
        JSR        UpdateAndDrawDrops                                     
        LDX        #PIA0_A_DATA_REG__FF00                                 
        LDA        #11111111b                                             
        STA        0x2,X                                                  
        LDA        ,X                                                     ; get joystick button state
        BITA       <CurrentPlayer_0x52                                    ; test button state against current player
        BEQ        Jump_PlayerPressedButtonAndIsReady                     ; button has been pressed
        BITA       #0x1                                                   
        BEQ        Loop_ProcessGetReadyScreen                             
        BITA       #0x2                                                   
        BEQ        Loop_ProcessGetReadyScreen                             
        CLR        0x2,X                                                  
        LDA        ,X                                                     
        ORA        #10000011b                                             
        CMPA       #11111111b                                             
        BEQ        Loop_ProcessGetReadyScreen                             

Jump_PlayerPressedButtonAndIsReady:                                      
        LDX        #AddressesToSomePlayerData                             
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        LDX        A,X                                                    
        LDY        ,S                                                     
        JSR        InitRoom_Maybe                                         

Jump_IncrementGameState:                                                 
        PULS        Y                                                     
        INC        -0x5,Y                                                 
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

BigInitFunction_Maybe:                                                   
        LDA        #0x28                                                  ; 40 frames for initial pause when the game starts
        STA        -0x3,Y                                                 
        LDD        #0x190                                                 ; 400
        STD        <Player_RegenerationTimer_0x4b                         
        LDA        #0xff                                                  
        STA        -0x2,Y                                                 
        CLR        -0x8,Y                                                 ; set back to standing
;**************************************************************
;* if the player has moved, then set the regen timer to 0     *
;**************************************************************

Jump_JoystickCheck:                                                      
        JSR        UpdateJoystick_Maybe                                   
        LDA        <Player_JoystickDirection_0x15                         
        BEQ        Jump_DecrementRegenTimer                               ; if player is moving, then set the
                                                                          ; regeneration timer to zero
        LDD        <ZeroValue                                             
        STD        <Player_RegenerationTimer_0x4b                         

Jump_DecrementRegenTimer:                                                
        CLRA                                                              
        LDD        <Player_RegenerationTimer_0x4b                         
        BEQ        Jump_RegenTimerIsZero                                  
        SUBD       #0x1                                                   ; decrement the regen timer
        STD        <Player_RegenerationTimer_0x4b                         
;**************************************************************
;* decrement the regen mini timer if it's not zero            *
;**************************************************************

Jump_RegenTimerIsZero:                                                   
        LDA        -0x3,Y                                                 
        BEQ        Jump_CheckActiveRegenTimers                            
        DECA                                                              
        STA        -0x3,Y                                                 

Jump_CheckActiveRegenTimers:                                             
        BNE        Jump_RegenTimersNotDone                                
        LDD        <Player_RegenerationTimer_0x4b                         
        BNE        Jump_RegenTimersNotDone                                
        PSHS        Y                                                     

;The player stopped regenerating, so erase the
;regenerating head icon for the current life.
        LDY        #CurrentPlayerSpritePointer_0x1e9                      
        JSR        GetPlayerLivesAddress                                  
        LDA        ,X                                                     
        LDB        -0x5,Y                                                 
        MUL                                                               
        LDX        0x2,Y                                                  
        LEAX        D,X ; X will contain the location on screen of the    
                                                                          ; current life head icon
        LDA        -0x1,Y                                                 
        STA        <UtilityCounter_0x26                                   
        LDD        <ZeroValue                                             ; The value to draw, which will blank out the pixels

Loop_ClearHeadIcon:                                                      
        STD        ,X                                                     ; clear line of the head icon
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_ClearHeadIcon                                     

;clear the screen for the area covered by the
;regenerating player
        PULS        Y                                                     
        CLR        -0x2,Y                                                 ; set to alive state
        LDX        0x8,Y                                                  
        LDB        -0x1,Y                                                 
        STB        <UtilityCounter_0x26                                   

Loop_ClearPlayerArea:                                                    
        LDD        0x1800,X                                               ; copy two bytes from second page
        STD        ,X                                                     ; paste two bytes to first page
        LDA        0x1802,X                                               ; copy byte 3 from second page
        STA        0x2,X                                                  ; paste byte 3 of first page
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_ClearPlayerArea                                   

Jump_PlayerLanding_Maybe:                                                
        LDA        -0xb,Y                                                 
        BMI        Jump_ProcessPlayerControls_Maybe                       
        LDD        ,Y                                                     
        BEQ        Jump_ProcessPlayerControls_Maybe                       
        LDA        #0x4                                                   
        STA        <Player_CantJumpAfterLandingCounter_Maybe_0x2f         
        CLR        -0x8,Y                                                 
        CLR        <Player_SafeLandingFromFalling_0x2e                    
        LDA        #01111111b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        JMP        Jump_ClearSpeedAndClimbingRopeFlag                     

Jump_RegenTimersNotDone:                                                 
        CLRA                                                              
        JMP        LAB_c85f                                               

Jump_ProcessPlayerControls_Maybe:                                        
        JSR        UpdateJoystick_Maybe                                   
        LDA        -0xb,Y                                                 
        BEQ        LAB_c763                                               
        CMPA       #0x1                                                   ; compare to going up?
        LBEQ       Jump_HandleRun                                         
        LDA        <Player_JoystickDirection_0x15                         
        CMPA       #0x2                                                   ; compare to going right
        BEQ        Jump_GoingRight                                        
        CMPA       #0x4                                                   ; compare to going left
        BEQ        Jump_PlayerGoingLeft                                   ; Jump_GoingLeft
        CLR        <Player_JumpUpInTheAirCounter_0x2c                     
        CLR        <Player_CantJumpAfterLandingCounter_Maybe_0x2f         
        CLR        <Player_SafeLandingFromFalling_0x2e                    
        BRA        Jump_HandleRun                                         

Jump_PlayerGoingLeft:                                                    
        CLR        -0x4,Y                                                 ; set the facing direction to 0
        LDD        #0xffca                                                ; speed -54
        BRA        Jump_UpdateSpeed_X                                     

Jump_GoingRight:                                                         
        LDA        #0xff                                                  
        STA        -0x4,Y                                                 ; set the facing direction to FF
        LDD        #0x36                                                  ; speed 54

Jump_UpdateSpeed_X:                                                      
        STD        0x2,Y                                                  

LAB_c763:                                                                
        LDA        <CurrentPlayer_0x52                                    
        BITA       PIA0_A_DATA_REG__FF00                                  
        BNE        Jump_HandleRun                                         
        LDA        <Player_IsJumping_0x31                                 
        BNE        Player_IsNotJumping                                    
        DEC        <Player_IsJumping_0x31                                 ; set to FF
        LDA        <Player_CantJumpAfterLandingCounter_Maybe_0x2f         
        BNE        Jump_HandleRun                                         
        LDD        #0xff61                                                ; jump up speed
        STD        ,Y                                                     
        LDA        #0x28                                                  
        STA        <Player_JumpUpInTheAirCounter_0x2c                     
        LDA        #0xff                                                  
        STA        <Player_SafeLandingFromFalling_0x2e                    
        STA        <Player_IsFalling_0x2d                                 

Jump_JumpToClimbingRopeSubroutine:                                       
        JMP        Jump_Player_IsClimbingRope_IsPositive                  

Jump_HandleGoingToOneHandedRope:                                         
        LDB        0x6,Y                                                  
        LDA        -0x4,Y                                                 
        BEQ        Jump_GoToLeftOfRope                                    
        ADDB       #0x4                                                   ; move by 4 pixels to the right
                                                                          ; going to the right side of the rope one handed
        BRA        Jump_HandledXPositionOfOneHandedRope                   

Jump_GoToLeftOfRope:                                                     
        SUBB       #0x4                                                   ; move by 4 pixels to the left
                                                                          ; going to the left side of the rope one handed

Jump_HandledXPositionOfOneHandedRope:                                    
        STB        0x6,Y                                                  
        JSR        ClearSpeedToZero                                       
        STA        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        -0xb,Y                                                 
        BMI        Jump_SetupHandingFromSideOfRope                        
        CLR        -0xb,Y                                                 ; let go of the rope because we were already holding it 
                                                                          ; from the side?
        JMP        LAB_c879                                               

Jump_SetupHandingFromSideOfRope:                                         
        LDA        #0x1                                                   
        STA        -0xb,Y                                                 
        JMP        LAB_c879                                               

Jump_PlayerIsJumpingUpwards:                                             
        LDA        <Player_JumpUpInTheAirCounter_0x2c                     
        LSLA                                                              
        ORA        #00000010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        LDD        ,Y                                                     
        ADDD       #0x3                                                   ; add gravity to jump speed, maybe
        STD        ,Y                                                     
        DEC        <Player_JumpUpInTheAirCounter_0x2c                     
        LBNE       LAB_c879                                               

Jump_ClearSpeedAndClimbingRopeFlag:                                      
        LDD        <ZeroValue                                             
        STD        ,Y                                                     
        STA        -0xb,Y                                                 
        JMP        LAB_c879                                               

Jump_HandleRun:                                                          
        CLR        <Player_IsJumping_0x31                                 

Player_IsNotJumping:                                                     
        LDA        <Player_JoystickDirection_0x15                         
        LBMI       Jump_SetRunRightAnimationFrame                         
        BEQ        Jump_NotMovingJoystick_Maybe                           
        CMPA       #0x2                                                   ; going right?
        BCS        Jump_ClimbingUp_Maybe                                  
        BEQ        Jump_MovingRight_Maybe                                 
        CMPA       #0x3                                                   ; going down?
        BEQ        Jump_MovingDown_Maybe                                  

;handling going left, maybe
        LDA        -0x4,Y                                                 
        BEQ        Jump_FacingLeft_Already                                
        CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        CLR        -0x4,Y                                                 

Jump_FacingLeft_Already:                                                 
        LDA        -0xb,Y                                                 
        BEQ        Jump_UpdateLeftSpeed                                   

;Pressing left while holding on to the rope to go one handed
        JSR        ClearSpeedToZero                                       
        INC        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        CMPA       #InterruptHasBeenHitCounter_0x14                       
        BHI        Jump_HandleGoingToOneHandedRope                        
        LDD        <ZeroValue                                             
        BRA        Jump_UpdateSpeed_Y                                     

Jump_UpdateLeftSpeed:                                                    
        LDD        #0xffca                                                ; speed going left

Jump_UpdateSpeed_Y:                                                      
        STD        0x2,Y                                                  
        BRA        Jump_SetRunRightAnimationFrame                         

Jump_ClimbingUp_Maybe:                                                   
        CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        -0xb,Y                                                 
        BPL        Jump_NotMovingJoystick_Maybe                           
        LDD        #0xffc0                                                ; climb up speed
        STD        ,Y                                                     
        BRA        Jump_SetClimbingAnimationFrame                         

Jump_NotMovingJoystick_Maybe:                                            
        CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        JSR        ClearSpeedToZero                                       
        LDB        -0xb,Y                                                 
        BPL        LAB_c85f                                               
        LDA        -0x8,Y                                                 
        CMPA       #0x3                                                   
        BHI        LAB_c81b                                               
        LDA        #0x4                                                   

LAB_c81b:                                                                
        BRA        Jump_SetCurrentAnimationFrame                          

Jump_MovingDown_Maybe:                                                   
        CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        -0xb,Y                                                 
        BPL        Jump_NotMovingJoystick_Maybe                           
        LDD        #0x70                                                  ; climb down speed, maybe
        STD        ,Y                                                     

Jump_SetClimbingAnimationFrame:                                          
        LDA        -0xa,Y                                                 ; the timer decides which frame to display
        LSRA                                                              
        LSRA                                                              
        LSRA                                                              
        ANDA       #0x1                                                   
        ADDA       #0x4                                                   

Jump_SetCurrentAnimationFrame:                                           
        STA        -0x8,Y                                                 
        BRA        LAB_c879                                               

Jump_MovingRight_Maybe:                                                  
        LDA        -0x4,Y                                                 
        BMI        LAB_c83f                                               
        CLR        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        #0xff                                                  
        STA        -0x4,Y                                                 

LAB_c83f:                                                                
        LDA        -0xb,Y                                                 
        BEQ        Jump_SetRightSpeed                                     

;Handle pressing right to go one handed while holding rope
        JSR        ClearSpeedToZero                                       
        INC        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        LDA        <Player_MoveLeftRightHoldingRopeCounter_0x36           
        CMPA       #InterruptHasBeenHitCounter_0x14                       
        LBHI       Jump_HandleGoingToOneHandedRope                        
        LDD        <ZeroValue                                             
        BRA        Jump_SetSpeed                                          

Jump_SetRightSpeed:                                                      
        LDD        #0x36                                                  ; speed 54

Jump_SetSpeed:                                                           
        STD        0x2,Y                                                  

Jump_SetRunRightAnimationFrame:                                          
        LDA        -0xa,Y                                                 
        LSRA                                                              
        LSRA                                                              
        ANDA       #0x3                                                   

LAB_c85f:                                                                
        LDB        -0xb,Y                                                 
        BEQ        Jump_AnimationFrameIsSet                               
        BPL        Jump_Player_IsClimbingRope_IsPositive                  ; Player_IsClimbingRope is positive. How?
        LDA        -0x8,Y                                                 
        CMPA       #0x3                                                   
        BHI        Jump_AnimationFrameIsSet                               
        LDA        #0x5                                                   ; climbing animation frame
        BRA        Jump_AnimationFrameIsSet                               

Jump_Player_IsClimbingRope_IsPositive:                                   
        LDA        #0x2                                                   

Jump_AnimationFrameIsSet:                                                
        STA        -0x8,Y                                                 
        LDB        <Player_CantJumpAfterLandingCounter_Maybe_0x2f         
        BEQ        LAB_c879                                               
        DEC        <Player_CantJumpAfterLandingCounter_Maybe_0x2f         

LAB_c879:                                                                
        LDA        -0xb,Y                                                 
        CMPA       #0x1                                                   
        BEQ        Jump_ApplyPlayerPhysics                                

;Check whether the player is touching a vine/rope
        JSR        ComputeSomeScreenOffset_Maybe                          ; char ComputeSomeScreenOffset_Maybe(void)
        LEAX       0x100,X                                                ; eight pixels underneath. midheight on player sprite?
        LDU        #RopeShapeLookupTable_Maybe                            
        LDD        A,U                                                    
        ANDA       0x1800,X                                               
        ANDB       0x1801,X                                               
        CMPD       <ZeroValue                                             
        BEQ        Jump_NotTouchingRope_Maybe                             
        PSHS        B                                                     
        BSR        RopeCollisionTest                                      ; byte RopeCollisionTest(byte param_1)
        PULS        A                                                     
        BNE        LAB_c8a4                                               
        BSR        RopeCollisionTest                                      ; byte RopeCollisionTest(byte param_1)
        BEQ        Jump_NotTouchingRope_Maybe                             

LAB_c8a4:                                                                
        LDA        -0xb,Y                                                 
        BMI        Jump_IsAlreadyClimbing                                 

;Set player as climbing
        LDA        #0xff                                                  
        STA        -0xb,Y                                                 
        JSR        ClearSpeedToZero                                       
        CLR        <Player_JumpUpInTheAirCounter_0x2c                     
        CLR        <Player_SafeLandingFromFalling_0x2e                    
        BRA        Jump_IsAlreadyClimbing                                 

Jump_NotTouchingRope_Maybe:                                              
        CLR        -0xb,Y                                                 
        BRA        Jump_ApplyPlayerPhysics                                
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

RopeCollisionTest:                                                       
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        LDA        <SecondUtilityCounter_0x4d                             
        COMA                                                              
        ANDA       <SomeValue_0x34                                        
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

Jump_IsAlreadyClimbing:                                                  
        LDA        <Player_JumpUpInTheAirCounter_0x2c                     
        BNE        Jump_ApplyPlayerPhysics                                
        LDD        ,Y                                                     
        BPL        Jump_ApplyPlayerPhysics                                
        JSR        ComputeSomeScreenOffset_Maybe                          ; char ComputeSomeScreenOffset_Maybe(void)
        LEAX       0xe0,X                                                 
        LDU        #RopeShapeLookupTable_Maybe                            
        LDD        A,U                                                    
        ANDA       0x1800,X                                               
        ANDB       0x1801,X                                               
        CMPD       <ZeroValue                                             
        BEQ        Loop_SkipRopeChecks                                    
        PSHS        B                                                     
        BSR        RopeCollisionTest                                      ; byte RopeCollisionTest(byte param_1)
        PULS        A                                                     
        BNE        Jump_ApplyPlayerPhysics                                
        BSR        RopeCollisionTest                                      ; byte RopeCollisionTest(byte param_1)
        BNE        Jump_ApplyPlayerPhysics                                

Loop_SkipRopeChecks:                                                     
        LDA        #0x4                                                   
        STA        -0x8,Y                                                 
        LDD        <ZeroValue                                             
        STD        ,Y                                                     

Jump_ApplyPlayerPhysics:                                                 
        LDD        0x4,Y                                                  
        ADDD       ,Y                                                     
        STD        0x4,Y                                                  
        LDD        0x6,Y                                                  
        ADDD       0x2,Y                                                  
        STD        0x6,Y                                                  
        LDA        -0xb,Y                                                 
        BEQ        Jump_NoClimbingRope                                    
        LDA        <PlayerY_AsSingleByte_0x23                             
        CMPA       0x4,Y                                                  
        BEQ        Jump_NoClimbingRope                                    
        LDA        -0xa,Y                                                 
        ANDA       #0x7                                                   
        LSLA                                                              
        LSLA                                                              
        LSLA                                                              
        ORA        #00011010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  

Jump_NoClimbingRope:                                                     
        LDA        0x4,Y                                                  
        STA        <PlayerY_AsSingleByte_0x23                             
        LDA        -0xb,Y                                                 
        BNE        Jump_ClimbingRope                                      
        LDX        #SomeKindOfHorizontalBitOffsetTable                    
        LDB        0x6,Y                                                  
        ANDB       #0x3                                                   
        TFR        B,A                                                    
        LDB        B,X                                                    
        PSHS        B,A                                                   
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  
        TFR        D,X                                                    
        PULS        A,B                                                   
        LEAX       0x1e0,X                                                
        ABX                                                               
        LSLA                                                              
        LDU        #PlayerFloorCollisionMask                              
        LDD        A,U                                                    
        ANDA       DAT_1800,X                                             
        ANDB       DAT_1801,X                                             
        CMPD       <ZeroValue                                             
        BEQ        LAB_c97f                                               
        PSHS        B                                                     
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        PULS        A                                                     
        BNE        LAB_c95d                                               
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        BEQ        LAB_c97f                                               

LAB_c95d:                                                                
        LDD        0x6,Y                                                  
        SUBD       0x2,Y                                                  
        STD        0x6,Y                                                  
        LDA        <Player_JumpUpInTheAirCounter_0x2c                     
        BNE        LAB_c96b                                               
        CLR        -0x8,Y                                                 
        BRA        Jump_ClimbingRope                                      

LAB_c96b:                                                                
        LDA        #0x1                                                   
        STA        <Player_JumpUpInTheAirCounter_0x2c                     
        LDD        0x2,Y                                                  
        COMA                                                              
        COMB                                                              
        ADDD       #0x1                                                   
        STD        0x2,Y                                                  
        COM        -0x4,Y                                                 

Jump_ClimbingRope:                                                       
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  

LAB_c97f:                                                                
        LDU        #SpriteData_ClonedDestination_0x3400                   
        LDA        -0x8,Y                                                 
        CMPA       #0x3                                                   
        BHI        LAB_c990                                               
        LDA        -0x4,Y                                                 
        BNE        LAB_c990                                               
        LEAU       0x480,U                                                

LAB_c990:                                                                
        LDA        -0x8,Y                                                 
        LDB        #0xc0                                                  
        MUL                                                               
        LEAU         D,U                                                  
        STU        <Player_CurrentSpriteFrame_Maybe_0x37                  
        LDA        0x6,Y                                                  
        ANDA       #0x3                                                   
        LDB        #0x30                                                  
        MUL                                                               
        LEAU         D,U                                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************
;Check whether we need to draw the player

DrawLifeIconsAndPlayerRegeneration:                                      
        STU        0xa,Y                                                  
        CMPU       0xe,Y                                                  
        BNE        Jump_ContinueDrawing                                   ; Are the sprite pointer and previous sprite pointer the same?
                                                                          ; If not, then skip to draw
        LDA        -0x2,Y                                                 
        BMI        Jump_ContinueDrawing                                   ; Is the player regenerating? 
                                                                          ; If so, then skip to draw
        LDU        0x8,Y                                                  
        CMPU       0xc,Y                                                  
        LBEQ       Jump_Return_Helper                                     ; Is the current draw position and the previous draw position
                                                                          ; the same?
                                                                          ; If so, then jump to return
        INC        <Player_NeedsUpdate_Maybe_0x48                         
        RTS                                                               

Jump_ContinueDrawing:                                                    
        LDA        -0x2,Y                                                 
        LBGT       Jump_PlayerIsDead                                      

;Reinits the player animations for regeneration
        LDB        -0x4,Y                                                 
        PSHS        Y                                                     
        LDY        #CurrentPlayerSpritePointer_0x1e9                      
        STA        -0x2,Y                                                 
        STB        -0x4,Y                                                 
        LDU        <Player_CurrentSpriteFrame_Maybe_0x37                  
        STU        ,Y                                                     
        LDU        0x2,Y                                                  
        STU        0x4,Y                                                  
        JSR        GetPlayerLivesAddress                                  
        LDA        ,X                                                     ; contains player lives
        LDB        -0x2,Y                                                 
        BPL        Jump_PlayerIsAlive                                     ; if plus, then player state is not generating
        INCA                                                              ; increment lives temporarily for displaying
                                                                          ; regenerating head icon

Jump_PlayerIsAlive:                                                      
        STA        -0x3,Y                                                 
        BRA        Jump_SkipDecrementLives                                

Loop_DrawHeadIcons:                                                      
        DEC        -0x3,Y                                                 

Jump_SkipDecrementLives:                                                 
        LBEQ       Jump_FinishedDrawingHeadIcons                          
        LDX        0x4,Y                                                  
        LDU        ,Y                                                     
        LDA        -0x1,Y                                                 
        STA        <UtilityCounter_0x26                                   
        LDA        -0x2,Y                                                 
        LBPL       Loop_DrawHeadLifeIcon                                  ; if the player is alive or dead (not regen)
                                                                          ; draw the head life icon
        LDA        -0x3,Y                                                 
        CMPA       #0x1                                                   
        LBNE       Loop_DrawHeadLifeIcon                                  ; if we're not at the last life icon, just draw it normally

;At this point I think it's the regenerating
;head life icon
        LDU        #SpriteData_ClonedDestination_0x3400                   ; address to the facing right player sprites
        LDA        -0x4,Y                                                 
        BNE        Jump_SkipGettingLeftFacingSprites                      
        LEAU       0x480,U                                                ; move to the facing left player sprites

Jump_SkipGettingLeftFacingSprites:                                       
        STU        <Player_SpriteFrameAddress_Temp_0x45                   
        JSR        IncrementRomAddressCounter                             
        TFR        PC,Y                                                   ; setup Y to become a random data generator
        LEAY       B,Y                                                    

Loop_DrawRegenHeadLifeIcon:                                              
        LDD        ,U                                                     ; get the first two bytes of the sprite

;mess around the two bytes of the sprite
        LSLA                                                              
        LSLB                                                              
        ORA        ,U+                                                    
        ORB        ,U+                                                    
        ANDA       ,Y+                                                    
        ANDB       ,Y+                                                    
        STD        ,X                                                     ; draw the messed up bytes to the address in the
                                                                          ; first page of video memory stored in X
;do the same to the third byte of the sprite's three
        LDA        ,U                                                     
        LSLA                                                              
        ORA        ,U+                                                    
        ANDA       ,Y+                                                    
        STA        0x2,X                                                  ; store two bytes to X
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_DrawRegenHeadLifeIcon                             

;draw player sprite in regeneration mode
        LDY        #Player_PhysicsData_0x1aa                              
        LDX        0x8,Y                                                  
        STX        0xc,Y                                                  
        LDA        -0x1,Y                                                 
        STA        <UtilityCounter_0x26                                   
        LDU        <Player_SpriteFrameAddress_Temp_0x45                   
        LDA        0x6,Y                                                  
        ANDA       #0x3                                                   ; which bit offset to draw on
        LDB        #0x30                                                  ; converted player sprite size 
                                                                          ; (2 bytes * 16 lines) + 1 byte extra 
                                                                          ; per line: 0x30
        MUL                                                               ; find which sprite to use
        LEAU         D,U ; move U to the sprite frame that depends on     
        CLR        0xe,Y                                                  
        JSR        IncrementRomAddressCounter                             
        TFR        PC,Y                                                   ; setup Y to become a random data generator
        LEAY       B,Y                                                    

;draw the player sprite but use random data and
;bit manipulation to generate the static effect

Loop_DrawRegenPlayerSprite:                                              
        LDD        ,U                                                     ; load the first two bytes of the player sprite

;mess around the pixel bytes
        LSLA                                                              
        LSLB                                                              
        ORA        ,U+                                                    
        ORB        ,U+                                                    
        ANDA       ,Y+                                                    
        ORA        0x1800,X                                               ; Binary Or with value at second page, store in A
        ANDB       ,Y+                                                    
        ORB        0x1801,X                                               
        STD        ,X                                                     ; draw the pixels to the first page of video memory

;do the same for the third byte
        LDA        ,U                                                     
        LSLA                                                              
        ORA        ,U+                                                    
        ANDA       ,Y+                                                    
        ORA        0x1802,X                                               ; get two bytes at X + 2 from page 1
        STA        0x2,X                                                  ; store to same location in page 0
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_DrawRegenPlayerSprite                             

;we're done, so return
        PULS        Y                                                     
        RTS                                                               

Loop_DrawHeadLifeIcon:                                                   
        PULU        A,B                                                   
        STD        ,X                                                     ; write two bytes to X
        PULU        A                                                     
        STA        0x2,X                                                  ; store A two bytes later in X
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   ; next sprite line
        BNE        Loop_DrawHeadLifeIcon                                  
        LDX        0x4,Y                                                  
        LDA        -0x5,Y                                                 
        LEAX       A,X                                                    
        STX        0x4,Y                                                  
        JMP        Loop_DrawHeadIcons                                     

Jump_FinishedDrawingHeadIcons:                                           
        PULS        Y                                                     

Jump_PlayerIsDead:                                                       
        INC        <Player_NeedsUpdate_Maybe_0x48                         
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

TerrainCollisionTest:                                                    
        STA        <SomeValue_0x34                                        ; store pixel from A here
        ANDA       #01010101b                                             ; apply mask to A
        LSLA                                                              ; double A, ie shift the pixels left
        STA        <SomeValue_0x35                                        ; store retult
        LDA        <SomeValue_0x34                                        ; load original value from A
        ANDA       #10101010b                                             ; apply another mask
        LSRA                                                              ; shift left
        ORA        <SomeValue_0x35                                        ; combine with 0x35
        EORA       <SomeValue_0x34                                        ; don't combine shared pixels
        STA        <SecondUtilityCounter_0x4d                             
        ANDA       <SomeValue_0x34                                        ; apply mask in 0x34
        ANDA       #01010101b                                             ; apply mask
        RTS                                                               

Jump_ToBallInit:                                                         
        JMP        InitBouncingBall                                       
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdateBall:                                                              
        LDY        #Ball_Physics_0x1bf                                    
        LDA        -0x5,Y                                                 ; needs to be initialized?
        BEQ        Jump_ToBallInit                                        ; it does
        LDA        <Ball_FallStateCounter_0x32                            
        BGT        Jump_BallJumpingUp                                     
        BMI        Jump_HandleBallOnGround                                

;ball is falling
        LDX        #SomeKindOfHorizontalBitOffsetTable                    
        LDB        0x6,Y                                                  
        ANDB       #0x3                                                   ; figure out which two bits on the byte it affects.
        TFR        B,A                                                    
        LDB        B,X                                                    
        LDX        0x8,Y                                                  
        LEAX       0x100,X                                                ; move X so that it's 8 pixels underneath
                                                                          ; the ball. This is the ground sensor
        ABX                                                               ; add the offset thingie to X. Sometimes 1,
                                                                          ; mostly 0.
        LSLA                                                              ; use A to find the right ball collsion mask in the table
                                                                          ; the table is two bytes per item
        LDU        #Ball_GroundCollisionMaskData                          
        LDD        A,U                                                    

;Binary and A & B with the terrain underneath
;the ball. If it's zero, then we haven't hit

anything.:                                                               
        ANDA       DAT_1800,X                                             
        ANDB       DAT_1801,X                                             
        CMPD       <ZeroValue                                             
        BEQ        Jump_NoBallGroundHit                                   
        PSHS        B                                                     
        BSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        PULS        A                                                     
        BNE        Jump_TheBallHasHitTheGround                            
        BSR        TerrainCollisionTest                                   ; unsure why we're testing twice here
        BNE        Jump_TheBallHasHitTheGround                            

Jump_NoBallGroundHit:                                                    
        LDD        ,Y                                                     
        ADDD       #0x12                                                  
        CMPD       #0x100                                                 ; 0x100 (256) maximum speed?
        BLS        Jump_SkipFallSpeedClamp                                
        LDD        #0x100                                                 
;**************************************************************
;* Increment 0x1bf until it reaches A for some reason         *
;**************************************************************

Jump_SkipFallSpeedClamp:                                                 
        STD        ,Y                                                     

;Increment a value up to A, but I don't know what
;this is for.
        LDA        -0x2,Y                                                 
        CMPA       #0xa                                                   
        BCC        Jump_SkipFallCounterIncrement                          
        INCA                                                              
        STA        -0x2,Y                                                 

Jump_SkipFallCounterIncrement:                                           
        BRA        Jump_UpdateBallPosition                                

Ball_GroundCollisionMaskData:                                            
        .dw        0000001100000000b                                      
        .dw        0000000011000000b                                      
        .dw        0000000000110000b                                      
        .dw        0000110000000000b                                      

Jump_TheBallHasHitTheGround:                                             
        LDD        #0xff00                                                
        STD        ,Y                                                     
        LDA        #0xfb                                                  ; set this value so that the ball sticks
                                                                          ; to the ground a little, while looking 
                                                                          ; squished
        STA        <Ball_FallStateCounter_0x32                            
        BRA        Jump_SetupBallSprite                                   

Jump_HandleBallOnGround:                                                 
        INC        <Ball_FallStateCounter_0x32                            ; the value will roll up to 0 and then will
                                                                          ; setup the ball to jump up
        BMI        Jump_SetupBallSprite                                   ; the counter is negative, so stay at this 
                                                                          ; position for now. don't update physics
;the fall state counter is now positive.
;setup the ball to jump up
        LDD        #0xff00                                                
        STD        ,Y                                                     
        LDA        #0xa                                                   
        STA        <Ball_FallStateCounter_0x32                            ; setup so we move up at least 0xA number of times
        BRA        Jump_UpdateBallPosition                                

Jump_BallJumpingUp:                                                      
        LDD        ,Y                                                     
        ADDD       #0xa                                                   ; add a bit of gravity
        STD        ,Y                                                     
        DEC        <Ball_FallStateCounter_0x32                            ; we're only falling for a limited number of steps

;if the fall state counter is 0, then stop going upwards.
        BNE        Jump_UpdateBallPosition                                
        LDD        <ZeroValue                                             
        STD        ,Y                                                     ; set speed y to 0

Jump_UpdateBallPosition:                                                 
        LDD        0x4,Y                                                  
        ADDD       ,Y                                                     
        STD        0x4,Y                                                  
        LDD        0x6,Y                                                  
        ADDD       0x2,Y                                                  
        STD        0x6,Y                                                  

;terrain collision checking
;possibly for when running into a wall
        LDX        #SomeKindOfHorizontalBitOffsetTable                    
        LDB        0x6,Y                                                  
        ANDB       #0x3                                                   
        TFR        B,A                                                    
        LDB        B,X                                                    
        PSHS        B,A                                                   
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  
        TFR        D,X                                                    
        PULS        A,B                                                   
        LEAX       0xa0,X                                                 ; sensor 5 pixels underneath
        ABX                                                               
        LSLA                                                              
        LDU        #Ball_WideCollisionMask                                
        LDD        A,U                                                    
        ANDA       0x1800,X                                               
        ANDB       0x1801,X                                               
        CMPD       <ZeroValue                                             
        BEQ        Jump_SetupBallSprite                                   ; no collision, so just draw the sprite
        PSHS        B                                                     
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        PULS        A                                                     
        BNE        Jump_ResetBallStateToFF                                
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        BEQ        Jump_SetupBallSprite                                   

Jump_ResetBallStateToFF:                                                 
        LDA        #0xff                                                  ; Set to FF. This will be reset by the next call
                                                                          ; to UpdateObjectPhysics for the ball.
        STA        -0x5,Y                                                 ; The ball will be reinitialized

Jump_SetupBallSprite:                                                    
        LDU        #0x3dd8                                                ; the address of the ball sprites in memory
        LDA        <Ball_FallStateCounter_0x32                            
        BPL        Jump_SkipSetSquishedBallSprite                         
        LEAU       0x60,U                                                 ; change to the squished ball sprite

Jump_SkipSetSquishedBallSprite:                                          
        LDA        0x6,Y                                                  

;figure out which ball sprite to use
;depending on x position
        ANDA       #0x3                                                   

;clamp X value from 0 to 3
        LDB        #0x18                                                  ; size of a ball sprite in ram (3 bytes for 8 lines)
        MUL                                                               
        LEAU       D,U                                                    ; Move U to the correct sprite for 
                                                                          ; the X position with the offset
                                                                          ; computed in D
        STU        0xa,Y                                                  ; store the sprite address to the ball data
        INC        <Ball_IsActive_0x49                                    ; indicate that we are definitely active
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitAllTimers:                                                           
        BSR        GetPlayerRoomTimerBuffer                               
        LDB        #20                                                    ; total number of player one and two timers
        STB        <UtilityCounter_0x26                                   
        LDD        #0x1000                                                ; aka 4096

LAB_cbae:                                                                
        STD        ,X++                                                   
        DEC        <UtilityCounter_0x26                                   ; next timer
        BNE        LAB_cbae                                               ; Loop_ClearTimer
        RTS                                                               

PlayerRoomTimerBufferPointers_0xccb5:                                    
        .dw        PlayerOne_PerRoomTimers_0x3e98                         
        .dw        PlayerTwo_PerRoomTimers_0x3eac                         
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

GetPlayerRoomTimerBuffer:                                                
        LDX        #PlayerRoomTimerBufferPointers_0xccb5                  
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        LDX        A,X                                                    
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdateRoomTimers:                                                        
        LDB        <CurrentRoomNumber_0x39                                
        LSLB                                                              
        BSR        GetPlayerRoomTimerBuffer                               
        LDD        B,X                                                    ; get current room timer in player room timer data
        LDX        #0x1b14                                                ; screen location
        JSR        PrintTimerStringToScreen                               
        BSR        GetPlayerRoomTimerBuffer                               
        CLR        <UtilityCounter_0x26                                   ; init room timer counter

;increment other room timers

Loop_NextRoomTimer:                                                      
        LDB        <UtilityCounter_0x26                                   ; current room timer counter
        CMPB       #0xa                                                   ; num room timers
        BEQ        Jump_DoneIncrementingOtherRoomTimers                   
        CMPB       <CurrentRoomNumber_0x39                                
        BEQ        Jump_IsCurrentRoomTimer                                
        LDD        ,X                                                     
        ADDD       #0x1                                                   ; increment timer that's not the current room's
        CMPD       #0x1000                                                ; are we at the 4096 limit?
        BLS        Jump_RoomTimerLimitNotHit                              
        LDD        #0x1000                                                ; reset room timer to 4096

Jump_RoomTimerLimitNotHit:                                               
        STD        ,X                                                     

Jump_IsCurrentRoomTimer:                                                 
        LEAX       0x2,X                                                  ; go to next room timer
        INC        <UtilityCounter_0x26                                   ; we're done with this room timer
        BRA        Loop_NextRoomTimer                                     

;update current room timer and activate bird
;if it hits zero.

Jump_DoneIncrementingOtherRoomTimers:                                    
        LDY        #Bird_PhysicsData                                      
        LDA        -0x5,Y                                                 
        BNE        Jump_BirdIsActive                                      ; bird is already active, so skip the init check
                                                                          ; don't update the room timer, either
        LDA        Player_State_AliveDeadRegenState_0x1a8                 
        BMI        Jump_PlayerIsRegenerating                              ; don't update the timer if the player is in the
                                                                          ; regeneration state
        BSR        GetPlayerRoomTimerBuffer                               
        LDB        <CurrentRoomNumber_0x39                                
        LSLB                                                              
        ABX                                                               
        LDD        ,X                                                     ; load timer value for current room
        BEQ        Jump_TimerOverInitTheBird                              ; if 0, then init the bird
        SUBD       #0x1                                                   ; count down the timer
        BEQ        Jump_StoreZeroTimerAndInitTheBird                      
        STD        ,X                                                     

Jump_PlayerIsRegenerating:                                               
        RTS                                                               

Jump_StoreZeroTimerAndInitTheBird:                                       
        STD        ,X                                                     

Jump_TimerOverInitTheBird:                                               
        LDD        #0x1a23                                                ; initial screen Y and X position
                                                                          ; y: 23 (0-191) x: 35 (0-127, maybe)
        STA        0x4,Y                                                  
        STB        0x6,Y                                                  
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  
        LDA        #0x1                                                   
        STA        -0x5,Y                                                 ; bird in active state
        LDA        #0x6                                                   
        STA        -0x1,Y                                                 
        LDA        #0x1                                                   
        JSR        IncrementRomAddressCounter                             ; use this to fill B with a random-ish value
                                                                          ; coming from the counter interating through the
                                                                          ; cart rom addresses
        STD        ,Y                                                     ; set Y speed to 0x1XX where XX comes from
                                                                          ; the value computed from IncrementRomAddressCounter
        JSR        IncrementRomAddressCounter                             
        STD        0x2,Y                                                  

Jump_BirdIsActive:                                                       
        INC        -0x3,Y                                                 ; increment and then shift three times to figure
                                                                          ; out the correct frame to display. Then store
                                                                          ; the frame.
        LDA        -0x3,Y                                                 
        LSRA                                                              
        LSRA                                                              
        LSRA                                                              
        ANDA       #0x1                                                   
        STA        -0x2,Y                                                 
        LDD        0x4,Y                                                  
        ADDD       ,Y                                                     
        CMPA       #0x10                                                  ; upper screen bound
        BLS        Jump_BirdYHitUpperScreenBound                          
        CMPA       #0xb1                                                  ; lower screen bound
        BCS        Jump_BirdYHasntHitScreenBounds                         

;the bird hit the bottom of the screen
        LDD        ,Y                                                     
        BMI        Jump_UpdateBirdYPosition                               ; if we were already going up, then skip
        BRA        Jump_FlipBirdYSpeed                                    ; the bird is currently going down, we'll need 
                                                                          ; to change that

Jump_BirdYHitUpperScreenBound:                                           
        LDD        ,Y                                                     ; get the current Y speed
        BPL        Jump_UpdateBirdYPosition                               ; if we were already going downwards, then just
                                                                          ; skip the next part
;we reach here if
;the bird hit the upper screen bound going up
;the bird hit the lower screen bound going down
;in that case, we invert the speed

Jump_FlipBirdYSpeed:                                                     
        COMA                                                              ; invert the Y speed
        COMB                                                              
        ADDD       #0x1                                                   
        STD        ,Y                                                     

Jump_UpdateBirdYPosition:                                                
        LDD        0x4,Y                                                  
        ADDD       ,Y                                                     

Jump_BirdYHasntHitScreenBounds:                                          
        STD        0x4,Y                                                  

;update X position and check bounds
        LDD        0x6,Y                                                  
        ADDD       0x2,Y                                                  
        CMPA       #0x7                                                   
        BLS        Jump_BirdHitLeftScreenBound                            
        CMPA       #0x73                                                  
        BCS        Jump_BirdUpdateAnimation                               ; jump if it hasn't hit the right screen bound
        LDD        0x2,Y                                                  
        BMI        Jump_UpdateBirdXPosition                               
        BRA        Jump_FlipBirdXSpeed                                    

Jump_BirdHitLeftScreenBound:                                             
        LDD        0x2,Y                                                  
        BPL        Jump_UpdateBirdXPosition                               

;we reach here if
;the bird hit the left screen bound going left
;the bird hit the right screen bound going right
;in that case, we invert the speed

Jump_FlipBirdXSpeed:                                                     
        COMA                                                              
        COMB                                                              
        ADDD       #0x1                                                   
        STD        0x2,Y                                                  

Jump_UpdateBirdXPosition:                                                
        LDD        0x6,Y                                                  
        ADDD       0x2,Y                                                  

Jump_BirdUpdateAnimation:                                                
        STD        0x6,Y                                                  
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  
        LDU        #BirdSprite_ClonedInRam_0x3ee2                         
        LDA        -0x2,Y                                                 
        BEQ        Jump_DontGoToFrame1OfAnimation                         ; if LDA is 1, move the sprite pointer to the
                                                                          ; next frame of the bird animation
        LEAU       0x48,U                                                 

;figure out which frame of the sprite
;to display depending on X position

Jump_DontGoToFrame1OfAnimation:                                          
        LDA        0x6,Y                                                  
        ANDA       #0x3                                                   
        LDB        #0x12                                                  
        MUL                                                               
        LEAU       D,U                                                    
        STU        0xa,Y                                                  
        JMP        EraseAndUpdateAndDrawObject                            
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

LoadPlayerPhysicsToYAndRoomDataInfoX:                                    
        LDY        #Player_PhysicsData_0x1aa                              
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

LoadRoomDoorDataAddrIntoX:                                               
        LDX        <RoomGraphicsAndDoorDataAddress_0x3b                   
        LDA        <CurrentRoomNumber_0x39                                
        LSLA                                                              
        LDX        A,X                                                    ; find the right room graphics and door data
        LEAX       0x2,X                                                  ; skip the graphics pointer?

LAB_ccb0:                                                                
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

FUN_ccb1:                                                                
        JSR        DrawPickups                                            
        BSR        LoadPlayerPhysicsToYAndRoomDataInfoX                   

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
        LDA        A,U                                                    
        ANDA       <CurrentPlayer_0x52                                    
        BEQ        LAB_ccb0                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitRoom_Maybe:                                                          
        LDA        0x5,X                                                  ; get the room number from the door data
        CMPA       #0x21                                                  ; touching the last door?
        BNE        Jump_NotTheLastDoor                                    
        PSHS        Y,X                                                   
        INC        <GameCompletionCount_0x3a                              ; we've completed a run of the game
                                                                          ; increase the difficulty
        JSR        InitRoomKeysAndPickups                                 ; reinit the rooms and keys for hard difficulty
        JSR        InitKeyStateData                                       
        LDD        #0x2710                                                
        JSR        UpdateAndPrintPlayerScore                              
        PULS        X,Y                                                   

Jump_NotTheLastDoor:                                                     
        LDD        0x2,X                                                  
        STA        0x4,Y                                                  
        STB        0x6,Y                                                  
        LDA        0x4,X                                                  
        STA        <CurrentRoomNumber_0x39                                
        LDA        #0x1                                                   
        STA        -0x5,Y                                                 
        JSR        ClearSpeedToZero                                       
        JSR        InitDrops                                              
        CLR        Ball_InitState_0x1ba                                   
        CLR        <Ball_FallStateCounter_0x32                            
        CLR        Bird_InitState_0x1cf                                   
        LDX        <RoomGraphicsAndDoorDataAddress_0x3b                   
        LDA        <CurrentRoomNumber_0x39                                
        LSLA                                                              
        LDU        [A,X]                                                  
        LDX        #VideoMemory_Page1_0x1c00                              
        STX        <CurrentVideoMemLocation_0x4e                          
        LBSR       LoadPage1AddressToX                                    
        JSR        DrawBackground                                         
        BSR        LoadRoomDoorDataAddrIntoX                              
        LDY        #Player_DoorStateData_0x3ec0                           ; address to room or door graphics?

;Draw the activated doors for this room
;X - Door Information (location, index, etc.)
;Y - Door State Data (has door at index been activated?)

Loop_DrawNextDoor:                                                       
        LDA        0x5,X                                                  ; get the door index
        LDA        A,Y                                                    
        ANDA       <CurrentPlayer_0x52                                    ; is it active for this player?
        BEQ        Jump_SkipDrawingDoor                                   ; skip if not
        BSR        DrawDoorOrMultipleDoors_Maybe                          

Jump_SkipDrawingDoor:                                                    
        .db 0x30,0x88,0x06 ; LEAX [0x6],X in 3 bytes                      
                                                                          ; Skip to next door information
        LDA        ,X                                                     ; get the first byte
        BNE        Loop_DrawNextDoor                                      ; loop if it's not 0, the sentinel value
        LDX        #0x400                                                 
        STX        <CurrentVideoMemLocation_0x4e                          
        LBSR       ScreenTransitionWipe                                   ; char ScreenTransitionWipe(void)
        LDX        PlayerLives_DrawLocationInPage_0x1eb                   
        LEAX       -0x4,X                                                 ; get the player sprite address? and then not use it?
        LDU        <CurrentInGamePlayerStringPointer                      
        JSR        PrintString                                            
        LDA        <CurrentRoomNumber_0x39                                
        BEQ        Jump_AlreadyVisitedThisRoom                            
        LDX        #RoomsPlayersHaveVisited_0x36b                         
        LDA        <CurrentRoomNumber_0x39                                
        LEAX       A,X                                                    
        LDA        ,X                                                     ; get 0 or 1
        ANDA       <CurrentPlayer_0x52                                    ; and with 0b01 or 0b10
        BNE        Jump_AlreadyVisitedThisRoom                            ; if result of AND is > 0 then jump
        LDA        ,X                                                     
        ORA        <CurrentPlayer_0x52                                    
        STA        ,X                                                     ; we've now visited this room
        LDD        #0x3e8                                                 
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xdc1b which does nothing. 

Jump_AlreadyVisitedThisRoom:                                             
        LDD        <ZeroValue                                             

LAB_cd5f:                                                                
        JSR        UpdateAndPrintPlayerScore                              
        LDX        #DAT_0455                                              
        LDU        #String_Chamber                                        
        JSR        PrintString                                            
        LDU        #0xd0                                                  
        LDA        #0x24                                                  
        LDB        <CurrentRoomNumber_0x39                                
        STD        ,U                                                     
        JSR        PrintString                                            
        JMP        GetRoomDataForCurrentRoom                              

LAB_cd7a:                                                                
        .db        0x30                                                   
        .db        0x88                                                   
        .db        0x06                                                   
        JMP        LAB_ccb6                                               
        .db        0x39                                                   
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawDoorOrMultipleDoors_Maybe:                                           
        PSHS        U,X                                                   
        LDD        ,X                                                     ; load the drawing address of the door
        CMPA       #0xff                                                  ; check if the address is for the start up door? (0xffff)
        BEQ        LOOP_AlreadyDone                                       
        CMPB       #0x40                                                  ; check against the door index?
        BCS        Jump_OffsetLeft                                        
        ADDB       #0x7                                                   ; otherwise offset to the right.
                                                                          ; for some reason
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xc004 which does nothing. 

Jump_OffsetLeft:                                                         
        SUBB       #0x4                                                   

LAB_cd92:                                                                
        PSHS        B                                                     ; save the X screen position
        JSR        ComputeScreenLocationFromAAndB                         

;save the drawing location into U
        TFR        D,U ;                                                  
        PULS        A                                                     ; retrieve the X screen position
        ANDA       #0x3                                                   
        STA        <UtilityCounter_0x26                                   ; pixel offset to draw door with?
        PSHS        U                                                     
        LDU        #SpriteDrawingBuffer_0x83                              ; destination to write the door sprite?
        LDX        #Data_DoorSprite_0xdf0a                                ; sprite source
        LDA        #16                                                    ; 16 lines of the door sprite
        STA        <SecondUtilityCounter_0x4d                             

LOOP_DrawOneLineOfDoorToBufferAt0x83:                                    
        LDD        ,X++                                                   ; copy two bytes from sprite
        STD        ,U++                                                   ; paste two bytes to U
        CLR        ,U+                                                    ; clear the nexte byte in U.
                                                                          ; this takes into account any shifting
                                                                          ; of the sprite in the buffer
        DEC        <SecondUtilityCounter_0x4d                             
        BNE        LOOP_DrawOneLineOfDoorToBufferAt0x83                   

;for the 1 to 3 offset in UtilityCounter, shift the graphics i
;by offset * 2 bits
        LDA        <UtilityCounter_0x26                                   
        BEQ        Jump_DoneWork_RTS_cde2                                 
        LDB        #0x10                                                  ; num lines in a sprite? 16
        BSR        ShiftBitsInSpriteDrawingBuffer                         
        PULS        U                                                     ; pull back the drawing location into U
        LDX        #SpriteDrawingBuffer_0x83                              
        LDA        #16                                                    ; 16 lines of a sprite
        JSR        DrawingFunctionFor3ByteWideSprites                     ; draw the sprite from the buffer in 0x83

LOOP_AlreadyDone:                                                        
        PULS        X,U,PC                                                
;**************************************************************
;* ShiftBitsInSpriteDrawingBuffer                             *
;* To maintain the CRT artifacts when drawing to the screen   *
;* we use this function to shift the graphics in a sprite     *
;* drawing buffer so that they land on the appropriate pix... *
;**************************************************************
;A: number of bits to shift by. the result will be A * 2
;B: number of lines of the sprite to process

ShiftBitsInSpriteDrawingBuffer:                                          
        LDX        #SpriteDrawingBuffer_0x83                              

Jump_ProcessThreeBytes:                                                  
        LDA        <UtilityCounter_0x26                                   ; values from 1 to 3

;shift by two bits at a time to the right
;because the screen is 256 pixels wide
;and graphics are treated as 128?

Jump_ShuffleBitsAround:                                                  
        LSR        ,X                                                     
        ROR        0x1,X                                                  
        ROR        0x2,X                                                  
        LSR        ,X                                                     
        ROR        0x1,X                                                  
        ROR        0x2,X                                                  
        DECA                                                              
        BNE        Jump_ShuffleBitsAround                                 
        LEAX       0x3,X                                                  
        DECB                                                              ; next three bytes
        BNE        Jump_ProcessThreeBytes                                 

Jump_DoneWork_RTS_cde2:                                                  
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitVideoRegisters:                                                      
        LDA        PIA1_B_DATA_REG__FF22                                  
        ANDA       #00000111b                                             ; bit 0: RS-232C DATA INPUT
                                                                          ; bit 1: SINGLE BIT SOUDN OUTPUT
                                                                          ; bit 2: RAM SIZE INPUT
        ORA        <SAM_SETUP_BITS_MAYBE_0x6a                             
        STA        PIA1_B_DATA_REG__FF22                                  
        STA        SAM_V0_FFC0                                            ; // turn off SAM V0 (because writing to FFC0 and not FFC1)
        STA        SAM_V1_FFC3                                            ; // turn on SAM V1 (because writing to FFC3 and not FFC2)
        STA        SAM_V2_FFC5                                            ; // turn on SAM V2 (because writing to FFC5 and not FFC4)
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

SetupSAMPages:                                                           
        LDX        #SAM_PAGE_SELECT_REG_SAM_F0_FFC6                       ; The first Sam Page Select Register Address
        LSRA                                                              ; shift right A (to skip the first bit?)
        LDB        #0x7                                                   ; go through the 7 flags of A to setup
                                                                          ; the pages which are cleared/set by
                                                                          ; 7 pairs of addresses starting at FFC6.
                                                                          ; Setting even address clears while setting
                                                                          ; odd addresses sets.

LAB_cdfd:                                                                
        LSRA                                                              ; shift right A
        BCS        LAB_ce03                                               ; was there a bit? If so, jump.
        STA        ,X                                                     ; there wasn't, set the bit to disable the page
        .db        0x8C                                                   ; now what? don't we want to skip this and the
                                                                          ; setting on the odd numbered address?
                                                                          ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xa701 which does nothing. 

LAB_ce03:                                                                
        STA        0x1,X                                                  ; set the value to the odd numbered SAM port at FFCX
                                                                          ; to enable the page

LAB_ce05:                                                                
        LEAX       0x2,X                                                  ; skip to the next pair
        DECB                                                              
        BNE        LAB_cdfd                                               ; loop if we're not done processing
                                                                          ; the 7 bits
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

LoadPage1AddressToX:                                                     
        LDX        #VideoMemory_Page1_0x1c00                              
        BRA        JUMP_Load0x1bToD_ce13                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ClearVideoMemory_0x0400_to_0x3400:                                       
        LDX        #0x400                                                 ; start of video memory?

JUMP_Load0x1bToD_ce13:                                                   
        LDD        <ZeroValue                                             ; this the value to set

LOOP_UntilReachingAddress0x3400:                                         
        STD        ,X++                                                   
        CMPX       #0x3400                                                
        BNE        LOOP_UntilReachingAddress0x3400                        
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ScreenTransitionWipe:                                                    
        CLR        ,-S                                                    ; save some space on the stack
        LDX        #0x400                                                 ; initial setup main screen video page

Loop_DrawTransitionSections:                                             
        TFR        X,D                                                    
        BITB       #00011111b                                             
        BNE        Jump_SkipSleep                                         ; pause when reaching the end of the line, maybe

;run an empty loop to serve as a delay
        LDY        #0x400                                                 ; start at the beginning of the first page

Loop_Sleep:                                                              
        LEAY       -0x1,Y                                                 
        BNE        Loop_Sleep                                             ; seems like just a delay

Jump_SkipSleep:                                                          
        LDB        #0x6                                                   ; devide the screen into 6 equal parts
                                                                          ; 1024 bytes each in video mem

Loop_NextSection:                                                        
        LDA        0x1800,X                                               ; get source pixel from second video page
        STA        ,X                                                     ; copy to first page
        LDA        ,S                                                     
        BNE        Jump_SkipDrawingDottedLine                             
        LDA        #01010101b                                             ; dotted line pattern
        STA        0x20,X                                                 ; draw dotted pattern on next line

Jump_SkipDrawingDottedLine:                                              
        LEAX       0x400,X                                                ; jump to next section 32 pixels down to wipe
        PSHS        B                                                     
        TFR        X,D                                                    ; use the A component of X to play the sound during the wipe
                                                                          ; A goes from 8->C->10->14->18->1c
        ORA        #00000010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  ; send the data to the sound generator
        PULS        B                                                     
        DECB                                                              
        BNE        Loop_NextSection                                       
        LEAX       -0x17ff,X                                              ; done with the six sections, jump back to the start
                                                                          ; but land one byte over
        CMPX       #0x7e0                                                 
        BCS        Jump_SkipSettingDrawDottedLineFlag                     ; if we reach the last line of the section, then set the
                                                                          ; stack value which will stop the dotted line to be
                                                                          ; drawn?
        LDA        #0xff                                                  ; we've reached the last line, set the value on the stack
        STA        ,S                                                     

Jump_SkipSettingDrawDottedLineFlag:                                      
        CMPX       #0x800                                                 
        BNE        Loop_DrawTransitionSections                            
        PULS        A                                                     
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitPlayerSomething:                                                     
        LDY        #Player_PhysicsData_0x1aa                              
        LDA        #0x2                                                   
        STA        -0x5,Y                                                 
        LDA        #0x10                                                  
        STA        -0x1,Y                                                 
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************
;Check whether we need to init the ball for the level.

InitBouncingBall:                                                        
        LDX        #RoomsWithBouncingBall                                 

Loop_SearchForRoomNumber:                                                
        LDA        ,X+                                                    
        BMI        Jump_NoBallForThisRoom                                 
        CMPA       <CurrentRoomNumber_0x39                                
        BNE        Loop_SearchForRoomNumber                               

;we found that the current room number
;uses the bouncing ball.
;start initializing it
        LDY        #Ball_Physics_0x1bf                                    

;Clear the ball data
        LDX        #Ball_InitState_0x1ba                                  

Loop_ClearBallData:                                                      
        CLR        ,X+                                                    
        CMPX       #EndOfBallData                                         ; end of ball data
        BNE        Loop_ClearBallData                                     

;Init the ball data
        LDA        #0x1                                                   
        STA        -0x5,Y                                                 ; init ball state to 1
        LDA        #0x8                                                   
        STA        -0x1,Y                                                 
        LDD        #0xffa8                                                ; horizontal speed, always go the left
        STD        0x2,Y                                                  
        LDD        <ZeroValue                                             
        STD        ,Y                                                     
        LDD        #0x7465                                                ; hardcoded init position -  Y: 116, X: 101
                                                                          ; same start position for every level
        STA        0x4,Y                                                  
        STB        0x6,Y                                                  
        JSR        LoadPosRelativeToYAndComputeScreenPos                  
        STD        0x8,Y                                                  

Jump_NoBallForThisRoom:                                                  
        RTS                                                               

RoomsWithBouncingBall:                                                   
        .db        0x0                                                    

BYTE_cead:                                                               
        .db        0x2                                                    
        .db        0x5                                                    
        .db        0x6                                                    
        .db        0xA                                                    ; this suggests the ball existing in rooms
                                                                          ; past the tenth. 
        .db        0xB                                                    
        .db        0xC                                                    
        .db        0xD                                                    
        .db        0xE                                                    
        .db        0xFF                                                   
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitVideoAndSetupRoomAndGraphics:                                        
        JSR        ClearVideoMemory_0x0400_to_0x3400                      
        JSR        InitVideoRegisters                                     
        LDX        #RoomGraphicsAndDoorData_0xd25a                        
        STX        <RoomGraphicsAndDoorDataAddress_0x3b                   
        CLR        <CurrentRoomNumber_0x39                                
        RTS                                                               

TitleScreenBackground_DrawCommands:                                      
        .db        0x80                                                   ; shape code: over 127 means that it repeats. stalactite
        .db        0xC                                                    ; repeat count for previous shape.
        .db        0x4                                                    ; top right hand corner piece
        .db        0x81                                                   ; repeatable wall, going down
        .db        0xA                                                    ; repeat 10 times
        .db        0x89                                                   ; repeatable floor piece going left
        .db        0xE                                                    ; repeat 15 times
        .db        0x87                                                   ; repeatable wall, going up
        .db        0xA                                                    ; do it 10 times
        .db        0x2                                                    ; left hand corner piece
        .db        0xFF                                                   ; end
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitKeyStateData:                                                        
        LDB        #0x22                                                  ; 34 bytes to clear
        LDX        #Player_DoorStateData_0x3ec0                           ; clear start address

Loop_ClearKeyStateData:                                                  
        CLR        ,X+                                                    
        DECB                                                              
        BNE        Loop_ClearKeyStateData                                 
        LDX        #Player_DoorStateData_0x3ec0                           
        LDU        #OffsetsToKeysAlreadyActivated_0xceea                  
        LDB        #0x3                                                   ; value to set, 0b00000011 to set the key as
                                                                          ; already enabled for both players

Loop_ContinueSetActiveKeyStates:                                         
        LDA        ,U+                                                    ; load value into A 
                                                                          ; 0, 2, 4, 5, 7, etc.
        BMI        Jump_HitEndOfActiveKeyOffsets                          ; loop until we hit FF
        STB        A,X                                                    ; store 3 to A + X
        BRA        Loop_ContinueSetActiveKeyStates                        

Jump_HitEndOfActiveKeyOffsets:                                           
        RTS                                                               

OffsetsToKeysAlreadyActivated_0xceea:                                    
        .db        0x0                                                    

BYTE_ceeb:                                                               
        .db        0x2                                                    
        .db        0x4                                                    
        .db        0x5                                                    
        .db        0x7                                                    
        .db        0x8                                                    
        .db        0x9                                                    
        .db        0xC                                                    
        .db        0xD                                                    
        .db        0xE                                                    
        .db        0xF                                                    
        .db        0x10                                                   
        .db        0x11                                                   
        .db        0x12                                                   
        .db        0x14                                                   
        .db        0xFF                                                   
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

Init_PlayerLivesIconParameters:                                          
        LDY        #CurrentPlayerSpritePointer_0x1e9                      
        LDD        #0x214                                                 
        JSR        ComputeScreenLocationFromAAndB                         
        STD        0x2,Y                                                  
        LDA        #0x7                                                   
        STA        -0x1,Y                                                 
        LDA        #0x3                                                   ; 3 bytes meaning 24 pixels (3 bytes * 8 pixels)
        STA        -0x5,Y                                                 
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

GetRoomDataForCurrentRoom:                                               
        LDY        #PerRoomPickupData_0x271                               
        LDA        <CurrentRoomNumber_0x39                                
        LDB        #0x19                                                  
        MUL                                                               
        LEAY        D,Y ;                                                 
        STY        <PerRoomPickupDataAddress_0x3d                         
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawPickups:                                                             
        LDA        #0x5                                                   
        STA        <SecondUtilityCounter_0x4d                             
        LDY        <PerRoomPickupDataAddress_0x3d                         

Jump_ProcessPickup:                                                      
        LDA        ,Y                                                     
        ANDA       <CurrentPlayer_0x52                                    ; is active for this player?
        BEQ        Jump_SkipToNextPickup                                  
        JSR        SetupPickupScreenLocationAndNumLinesToClear            
        LSLB                                                              
        LDA        0x1,Y                                                  
        MUL                                                               
        LDU        #PickupSpriteData                                      
        LEAU         D,U                                                  
        LDB        #10                                                    ; number of lines in the pickup sprite
        STB        <UtilityCounter_0x26                                   
        BSR        DrawSprite_16PixelsWide                                

Jump_SkipToNextPickup:                                                   
        LEAY       0x5,Y                                                  
        DEC        <SecondUtilityCounter_0x4d                             
        BNE        Jump_ProcessPickup                                     
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSprite_16PixelsWide:                                                 
        LDD        ,U++                                                   ; load two bytes of the sprite (one line)
        ORA        ,X                                                     ; Or A with the value stored at X on screen
        ORB        0x1,X                                                  ; Or B with the value stored at X+1 on screen
        STD        ,X                                                     ; write A&B to the X location on screen
                                                                          ; (combination sprite and the background)
        LEAX       0x20,X                                                 ; go to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        DrawSprite_16PixelsWide                                ; we're not done, go to next line in the sprite
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdateAndDrawDrops:                                                      
        LDY        #DropDataBlock_0x1ef                                   
        LDA        <Drop_TickTockBetweenFFto0andBack_0x40                 
        BEQ        Jump_TickTockIsZero                                    
        LEAY       0xd,Y                                                  ; If the value is not zero, skip to next drop?

Jump_TickTockIsZero:                                                     
        COM        <Drop_TickTockBetweenFFto0andBack_0x40                 

Jump_ProcessDrop:                                                        
        LDA        ,Y                                                     
        BEQ        Jump_DropInactive                                      
        BMI        Jump_DropIsWiggling                                    
        DECA                                                              ; If the drop wiggle timer was initialized to 1,
                                                                          ; this decrements to 0. And the branch will make
                                                                          ; it so it'll be initialized for the first time.
        BEQ        Jump_InitSingleDrop                                    ; Init the drop for the first time
        LDX        0xa,Y                                                  
        LEAX       0x18c0,X                                               ; get the position and move it so that it
                                                                          ; lands on the next page, where terrain collisions
                                                                          ; are tested against. The location is offseted by 
                                                                          ; 0xC0 (192) which is 6 lines underneath 
                                                                          ; (192 / 32 bytes pitch)
                                                                          ; 
        LDA        ,X                                                     ; load the byte from terrain in second video page 
        ANDA       0xc,Y                                                  
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        BNE        Jump_DropTouchedTerrain                                
        LDA        0x20,X                                                 ; load from the pixel underneath
        ANDA       0xc,Y                                                  
        JSR        TerrainCollisionTest                                   ; byte TerrainCollisionTest(byte A)
        BNE        Jump_DropTouchedTerrain                                

Jump_UpdateDropPosition:                                                 
        LDD        0x3,Y                                                  
        .db 0xe3,0x21 ; ADDD offset, Drop1_SpeedY_0x1fd,y                 
        STD        0x3,Y                                                  
        LDD        #0x200                                                 ; falling drop speed to this, even if 
                                                                          ; we were wiggling. 
        .db 0xed,0x21 ; STD offset, Drop1_SpeedY_0x1fd,y                  

;erase drop from screen
        LDA        0x3,Y                                                  
        LDB        0x5,Y                                                  
        JSR        ComputeScreenLocationFromAAndB                         
        STD        0x8,Y                                                  
        LBSR       EraseDropSpriteFromScreen                              ; byte EraseDropSpriteFromScreen(void)

;store previous video page draw location
        LDX        0x8,Y                                                  
        STX        0xa,Y                                                  

;draw the drop sprite at the new location
        LDU        0x6,Y                                                  
        LDB        #0x6                                                   ; number of lines in the sprite
        STB        <UtilityCounter_0x26                                   
        BSR        DrawSprite_16PixelsWide                                
        LEAY       0x1a,Y                                                 ; advance by two drops?
        CMPY       #EndOfDropDataBuffer_0x271                             
        BCS        Jump_ProcessDrop                                       ; continue processing drops

Jump_DropInactive:                                                       
        RTS                                                               

Jump_DropIsWiggling:                                                     
        DEC        ,Y                                                     
        LDA        ,Y                                                     
        ANDA       #0x2                                                   
        BEQ        Jump_WiggleUpwards                                     
        LDD        #0x80                                                  ; wiggle downwards
        BRA        Jump_StoreDropSpeedY                                   

Jump_WiggleUpwards:                                                      
        LDD        #0xff80                                                ; drop speed?

Jump_StoreDropSpeedY:                                                    
        .db 0xed,0x21 ; STD offset, Drop1_SpeedY_0x1fd,y                  
        BRA        Jump_UpdateDropPosition                                

Jump_DropTouchedTerrain:                                                 
        BSR        EraseDropSpriteFromScreen                              ; byte EraseDropSpriteFromScreen(void)

Jump_InitSingleDrop:                                                     
        LDB        #0xa8                                                  ; pre-drop wiggle countdown
        STB        ,Y                                                     
        LDX        #Drops_SpawnPositionsTable                             
        LDA        <CurrentRoomNumber_0x39                                ; figure out which pointer to room data to use
        LSLA                                                              
        LDX        A,X                                                    ; jump to the actual per-room data
        LDA        #0x3                                                   ; data size for each drops area
        LDB        ,X+                                                    ; store the number of drops areas into B
                                                                          ; move X to first drops area in the data
                                                                          ; The number in the data is one less than the actual count
                                                                          ; ie having one area means the value is 0, three areas makes 
                                                                          ; the value 2
        JSR        GenerateRandomNumberFrom0ToB                           
        MUL                                                               ; multiply A and B to figure out which drops area to use
        ABX                                                               ; move X to the selected drops area
        LDB        ,X                                                     ; load the number of drops positions in the area into B
        JSR        GenerateRandomNumberFrom0ToB                           
        LDA        #0x8                                                   ; spacing between drops
        MUL                                                               ; multiply the selected horizontal drops position by the 
                                                                          ; spacing in A
        ADDB       0x2,X                                                  ; add the horizontal position of the drop area
        LDA        <GameCompletionCount_0x3a                              
        CMPA       #0x3                                                   
        BCS        Jump_SkipPositionAdjustment                            ; when the player has completed the game less
                                                                          ; than 3 times, it adjusts horizontal positions 
                                                                          ; of drops to be even. Otherwise X positions are
                                                                          ; unaffected, which (I think) means that drops are 
                                                                          ; closer to the sides of vines.
        ANDB       #11111110b                                             ; ensure X position is even when in hard mode?
                                                                          ; 

Jump_SkipPositionAdjustment:                                             
        LDA        0x1,X                                                  ; get the vertical position of the drops area
        STA        0x3,Y                                                  ; store it in the drop data
        STB        0x5,Y                                                  
        ADDA       #0x6                                                   
        ADDB       #0x4                                                   
        JSR        ComputeScreenLocationFromAAndB                         
        TFR        D,X                                                    
        LDA        DAT_1800,X                                             ; load source pixel
        LDX        #Drawing_PixelBits_d84a                                
        LDB        0x5,Y                                                  
        ANDB       #0x3                                                   ; figure out which bits in the byte to draw
        ANDA       B,X                                                    
        JSR        RopeCollisionTest                                      ; byte RopeCollisionTest(byte param_1)
        BEQ        LAB_d00e                                               
        DEC        0x5,Y                                                  

LAB_d00e:                                                                
        LDA        0x3,Y                                                  
        LDB        0x5,Y                                                  
        JSR        ComputeScreenLocationFromAAndB                         
        STD        0x8,Y                                                  
        STD        0xa,Y                                                  
        LDU        #Data_DropSprites_0xdf2a                               
        LDA        0x5,Y                                                  
        ANDA       #0x3                                                   ; figure out which drop sprite frame to  use
        LDX        #Drop_CollisionMasks_0xd031                            
        LDB        A,X                                                    
        STB        0xc,Y                                                  ; store the offset into the drop sprite data
        LDB        #0xc                                                   ; this is the size of each frame of drop sprites
        MUL                                                               
        LEAU       D,U                                                    ; figure out the address of the drop sprite frame to use
        STU        0x6,Y                                                  ; store the drop sprite frame address
        LBRA       Jump_DropIsWiggling                                    

Drop_CollisionMasks_0xd031:                                              
        .db        11110000b                                              
        .db        00111100b                                              
        .db        00001111b                                              
        .db        00000011b                                              
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

EraseDropSpriteFromScreen:                                               
        LDX        0xa,Y                                                  ; previous position
        LDU        0x6,Y                                                  ; sprite data
        LDA        #0x6                                                   ; number of lines in a drop
        STA        <UtilityCounter_0x26                                   ; store progress at this memory location

Jump_DoSpriteLine:                                                       
        LDA        ,U+                                                    ; get the pixel data for the byte
        COMA                                                              ; invert the pixel data
        ANDA       ,X                                                     ; erase the pixel data from the location
        ORA        0x1800,X                                               ; add the pixel data from the second page
        STA        ,X                                                     ; store back to the first page, resetting it to 
                                                                          ; original value
        LDB        ,U+                                                    ; second byte of sprite data
        BEQ        Jump_NextLine                                          ; if it's empty, then skip
        COMB                                                              ; it's not empty so do the same as we did on A
        ANDB       0x1,X                                                  
        ORB        0x1801,X                                               
        STB        0x1,X                                                  

Jump_NextLine:                                                           
        LEAX       0x20,X                                                 ; move to next line
        DEC        <UtilityCounter_0x26                                   ; next sprite line
        BNE        Jump_DoSpriteLine                                      
        RTS                                                               

Drops_SpawnPositionsTable:                                               
        .dw        Room0_DropPositions                                    
        .dw        Room1_DropPositions                                    
        .dw        Room2_DropPositions                                    
        .dw        Room3_DropPositions                                    
        .dw        Room4_DropPositions                                    
        .dw        Room5_DropPositions                                    
        .dw        Room6_DropPositions                                    
        .dw        Room7_DropPositions                                    
        .dw        Room8_DropPositions                                    
        .dw        Room9_DropPositions                                    
        .dw        Room10_DropPositions                                   

;Drop Positions
;Format:
;for every area

Room0_DropPositions:                                                     
        .db        6                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        9                                                      
        .db        62                                                     
        .db        39                                                     
        .db        1                                                      
        .db        107                                                    
        .db        15                                                     
        .db        5                                                      
        .db        107                                                    
        .db        47                                                     
        .db        1                                                      
        .db        152                                                    
        .db        31                                                     
        .db        1                                                      
        .db        152                                                    
        .db        63                                                     
        .db        1                                                      
        .db        152                                                    
        .db        95                                                     

Room1_DropPositions:                                                     
        .db        5                                                      
        .db        5                                                      
        .db        17                                                     
        .db        15                                                     
        .db        4                                                      
        .db        17                                                     
        .db        79                                                     
        .db        5                                                      
        .db        62                                                     
        .db        15                                                     
        .db        1                                                      
        .db        62                                                     
        .db        79                                                     
        .db        1                                                      
        .db        107                                                    
        .db        103                                                    
        .db        2                                                      
        .db        152                                                    
        .db        71                                                     

Room2_DropPositions:                                                     
        .db        4                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        2                                                      
        .db        62                                                     
        .db        15                                                     
        .db        1                                                      
        .db        62                                                     
        .db        55                                                     
        .db        9                                                      
        .db        107                                                    
        .db        39                                                     
        .db        4                                                      
        .db        152                                                    
        .db        15                                                     

Room3_DropPositions:                                                     
        .db        5                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        3                                                      
        .db        62                                                     
        .db        15                                                     
        .db        6                                                      
        .db        62                                                     
        .db        63                                                     
        .db        3                                                      
        .db        107                                                    
        .db        15                                                     
        .db        0                                                      
        .db        152                                                    
        .db        15                                                     
        .db        1                                                      
        .db        152                                                    
        .db        47                                                     

Room4_DropPositions:                                                     
        .db        4                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        1                                                      
        .db        62                                                     
        .db        15                                                     
        .db        8                                                      
        .db        77                                                     
        .db        31                                                     
        .db        1                                                      
        .db        152                                                    
        .db        47                                                     
        .db        1                                                      
        .db        152                                                    
        .db        87                                                     

Room5_DropPositions:                                                     
        .db        4                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        1                                                      
        .db        62                                                     
        .db        103                                                    
        .db        10                                                     
        .db        107                                                    
        .db        31                                                     
        .db        1                                                      
        .db        152                                                    
        .db        15                                                     
        .db        2                                                      
        .db        152                                                    
        .db        71                                                     

Room6_DropPositions:                                                     
        .db        1                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        9                                                      
        .db        92                                                     
        .db        39                                                     

Room7_DropPositions:                                                     
        .db        6                                                      
        .db        5                                                      
        .db        17                                                     
        .db        15                                                     
        .db        1                                                      
        .db        32                                                     
        .db        63                                                     
        .db        4                                                      
        .db        17                                                     
        .db        79                                                     
        .db        0                                                      
        .db        92                                                     
        .db        39                                                     
        .db        0                                                      
        .db        92                                                     
        .db        87                                                     
        .db        0                                                      
        .db        107                                                    
        .db        47                                                     
        .db        0                                                      
        .db        107                                                    
        .db        79                                                     

Room8_DropPositions:                                                     
        .db        4                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        8                                                      
        .db        62                                                     
        .db        47                                                     
        .db        10                                                     
        .db        92                                                     
        .db        15                                                     
        .db        10                                                     
        .db        122                                                    
        .db        31                                                     
        .db        10                                                     
        .db        152                                                    
        .db        15                                                     

Room9_DropPositions:                                                     
        .db        2                                                      
        .db        12                                                     
        .db        17                                                     
        .db        15                                                     
        .db        3                                                      
        .db        62                                                     
        .db        15                                                     
        .db        5                                                      
        .db        92                                                     
        .db        55                                                     

Room10_DropPositions:                                                    
        .db        0                                                      ; count of drops areas
        .db        12                                                     ; number of drops
        .db        17                                                     ; vertical position in screen pixels
        .db        14                                                     ; horizontal position in screen pixels
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitDrops:                                                               
        CLRA                                                              ; Disable all the drops in memory
        LDB        #10                                                    ; num drops
        BSR        SetFirstByteOfEachDrop                                 

;determine how many drops to init
        LDA        <GameCompletionCount_0x3a                              
        BEQ        Jump_NormalDifficultyMode                              ; if completed the game at least once, we're 
                                                                          ; in hard mode. Init the full 10 drops 
                                                                          ; instead of 5. 
        LDB        #10                                                    ; if is zero, then do all 10 drops
        BRA        Jump_InitDrops                                         

Jump_NormalDifficultyMode:                                               
        LDB        <CurrentRoomNumber_0x39                                
        CMPB       #0x5                                                   
        BCC        Jump_IncrementDropCount                                ; if our room number is 5 or greater, use that as
                                                                          ; the base number of drops to update. Then jump and 
                                                                          ; increment it.
        LDB        #0x5                                                   ; Rooms 0 to 5 have 5 drops going max

Jump_IncrementDropCount:                                                 
        INCB                                                              ; always increment drop count by 1

Jump_InitDrops:                                                          
        STB        <NumberOfDropsToProcess_0x3f                           ; Store the current B count
        LDA        #0x1                                                   ; indicate that the drop needs to be initialized
        BSR        SetFirstByteOfEachDrop                                 
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

SetFirstByteOfEachDrop:                                                  
        LDX        #Drop0_CeilingWiggleTimer_0x1ef                        ; point X to this address. 
                                                                          ; Drop data block? 

Loop_NextDrop:                                                           
        STA        ,X                                                     ; store A to address in X
        LEAX       0xd,X                                                  ; move x by 13 bytes
        DECB                                                              ; b--
        BNE        Loop_NextDrop                                          ; loop while B is not zero
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

SetupPickupScreenLocationAndNumLinesToClear:                             
        LDD        0x2,Y                                                  
        JSR        ComputeScreenLocationFromAAndB                         
        TFR        D,X                                                    
        LDB        #0xa                                                   
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InitRoomKeysAndPickups:                                                  
        LDA        #0xff                                                  
        LDX        #PerRoomPickupData_0x271                               
        LDB        #0x32                                                  ; size of all buffer containing all the 
                                                                          ; pickups for all the rooms

LAB_d153:                                                                
        CLR        ,X                                                     
        CLR        0x1,X                                                  
        STA        0x4,X                                                  
        LEAX       0x5,X                                                  ; next pick up in the buffer
        DECB                                                              ; dec pick up counter
        BNE        LAB_d153                                               ; Loop_ClearNextPickUp
        LDX        #PerRoomPickupData_0x271                               
        LDU        #KeyPickUpDoorIndexes_EasyMode                         
        LDA        <GameCompletionCount_0x3a                              ; if the game hasn't been completed, use one
                                                                          ; set of keys data, otherwise use another.
        BEQ        Jump_OverHardMode                                      
        LDU        #KeyPickUpDoorIndexes_HardMode                         

Jump_OverHardMode:                                                       
        LDB        #0xa                                                   ; setup keys for all 10 rooms

Loop_InitKeyUnlockDoorIndexes:                                           
        LDA        #0x2                                                   ; pick up type for key is 2
        STA        0x1,X                                                  ; store pick up type for key one
        STA        0x6,X                                                  ; store pick up type for key two
        LDA        ,U+                                                    ; load the door unlock index for the first key
        STA        0x4,X                                                  ; store the door unlock index for the first key
        LDA        ,U+                                                    ; load the door unlock index for the second key
        STA        0x9,X                                                  ; store the door unlock index for the second key
        LEAX       0x19,X                                                 ; move to next room data
        DECB                                                              
        BNE        Loop_InitKeyUnlockDoorIndexes                          
        LDU        #PickUp_StartPositions                                 
        LDB        #10                                                    
        STB        <UtilityCounter_0x26                                   
        LDX        #PerRoomPickupData_0x271                               

Jump_ProcessRoomPickUps:                                                 
        LDB        #0x5                                                   ; for the five pickups in a room maybe
        STB        <SecondUtilityCounter_0x4d                             

Loop_ProcessRoomPickups:                                                 
        PSHS        X                                                     
        LDB        <SecondUtilityCounter_0x4d                             
        DECB                                                              ; going from 5 to 4
        LDA        #0x5                                                   ; find the correct pick up data
                                                                          ; key index (0 - 4) * key data size (5 bytes)
        MUL                                                               
        LEAX       D,X                                                    ; set X to the correct key data
        LDA        #0x3                                                   ; set the initial visible/enable state of the pick up
        STA        ,X                                                     
        LDB        <SecondUtilityCounter_0x4d                             
        DECB                                                              ; we've processed a pick up data
        TFR        B,A                                                    ; A now contains B (5 on the first loop)
        LSLA                                                              ; double A (5 -> 10 on the first loop)
                                                                          ; to find the correct position in the 
                                                                          ; PickUp_StartPositions buffer
        LDD        A,U                                                    
        STD        0x2,X                                                  ; store the YX position to bytes 3 and 4 
                                                                          ; of the pick up data
        LDB        0x1,X                                                  
        BNE        Jump_DontCreateTreasure                                
        JSR        IncrementRomAddressCounter                             ; use the IncrementRomAddressCounter as a
                                                                          ; way to randomly pick between diamonds
                                                                          ; (type 0) and money bags (type 1) for the 
                                                                          ; three remaining pick ups of the room.
        ANDB       #0x1                                                   
        STB        0x1,X                                                  

Jump_DontCreateTreasure:                                                 
        PULS        X                                                     
        DEC        <SecondUtilityCounter_0x4d                             
        BNE        Loop_ProcessRoomPickups                                
        LEAX       0x19,X                                                 ; move to next room's pick updata
        LEAU       0xa,U                                                  ; move U by 10 bytes in Pickup_StartPositions
        DEC        <UtilityCounter_0x26                                   
        BNE        Jump_ProcessRoomPickUps                                
        RTS                                                               

KeyPickUpDoorIndexes_EasyMode:                                           
        .db        0x01                                                   

DAT_d1c3:                                                                
        .db        0x03                                                   
        .db        0x1E                                                   
        .db        0x1C                                                   
        .db        0x13                                                   
        .db        0x06                                                   
        .db        0x0B                                                   
        .db        0x0A                                                   
        .db        0x15                                                   
        .db        0x1A                                                   
        .db        0x16                                                   
        .db        0x17                                                   
        .db        0x18                                                   
        .db        0x19                                                   
        .db        0x1B                                                   
        .db        0x21                                                   
        .db        0x1D                                                   
        .db        0xFF                                                   
        .db        0x1F                                                   
        .db        0x20                                                   

KeyPickUpDoorIndexes_HardMode:                                           
        .db        0x01                                                   

DAT_d1d7:                                                                
        .db        0x03                                                   

DAT_d1d8:                                                                
        .db        0x1E                                                   

DAT_d1d9:                                                                
        .db        0x1C                                                   
        .db        0x06                                                   
        .db        0x13                                                   
        .db        0x0A                                                   
        .db        0x0B                                                   
        .db        0x15                                                   
        .db        0x1A                                                   
        .db        0x17                                                   
        .db        0x16                                                   
        .db        0x19                                                   
        .db        0x18                                                   
        .db        0x21                                                   
        .db        0x1B                                                   
        .db        0x1D                                                   
        .db        0xFF                                                   
        .db        0x20                                                   
        .db        0x1F                                                   

PickUp_StartPositions:                                                   
        .db        0x3A                                                   
        .db        0x1C                                                   
        .db        0x69                                                   
        .db        0x5C                                                   
        .db        0x65                                                   
        .db        0x20                                                   
        .db        0x91                                                   
        .db        0x30                                                   
        .db        0x91                                                   
        .db        0x50                                                   

DAT_d1f4:                                                                
        .db        0x23                                                   
        .db        0x34                                                   
        .db        0x23                                                   
        .db        0x48                                                   
        .db        0x38                                                   
        .db        0x64                                                   
        .db        0x97                                                   
        .db        0x3C                                                   
        .db        0x97                                                   
        .db        0x5C                                                   
        .db        0x3A                                                   
        .db        0x60                                                   
        .db        0x44                                                   
        .db        0x1C                                                   
        .db        0x4D                                                   
        .db        0x34                                                   
        .db        0x69                                                   
        .db        0x64                                                   
        .db        0x78                                                   
        .db        0x40                                                   
        .db        0x41                                                   
        .db        0x70                                                   
        .db        0x4B                                                   
        .db        0x24                                                   
        .db        0x6C                                                   
        .db        0x50                                                   
        .db        0x6C                                                   
        .db        0x70                                                   
        .db        0x9D                                                   
        .db        0x0C                                                   
        .db        0x3F                                                   
        .db        0x0C                                                   
        .db        0x6C                                                   
        .db        0x0C                                                   
        .db        0x17                                                   
        .db        0x60                                                   
        .db        0x96                                                   
        .db        0x3C                                                   
        .db        0x96                                                   
        .db        0x64                                                   
        .db        0x14                                                   
        .db        0x6C                                                   
        .db        0x30                                                   
        .db        0x04                                                   
        .db        0x4B                                                   
        .db        0x1C                                                   
        .db        0x5D                                                   
        .db        0x04                                                   
        .db        0x9B                                                   
        .db        0x50                                                   
        .db        0x15                                                   
        .db        0x18                                                   
        .db        0x6A                                                   
        .db        0x6C                                                   
        .db        0x2B                                                   
        .db        0x40                                                   
        .db        0x5F                                                   
        .db        0x18                                                   
        .db        0x93                                                   
        .db        0x34                                                   
        .db        0x30                                                   
        .db        0x0C                                                   
        .db        0x9B                                                   
        .db        0x44                                                   
        .db        0x2C                                                   
        .db        0x3C                                                   
        .db        0x3D                                                   
        .db        0x6C                                                   
        .db        0x9B                                                   
        .db        0x2C                                                   
        .db        0x21                                                   
        .db        0x38                                                   
        .db        0x34                                                   
        .db        0x20                                                   
        .db        0x40                                                   
        .db        0x60                                                   
        .db        0x5D                                                   
        .db        0x1C                                                   
        .db        0x7C                                                   
        .db        0x60                                                   
        .db        0x13                                                   
        .db        0x30                                                   
        .db        0x3D                                                   
        .db        0x38                                                   
        .db        0x44                                                   
        .db        0x18                                                   
        .db        0x96                                                   
        .db        0x38                                                   
        .db        0x96                                                   
        .db        0x60                                                   
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************
;Each room has an array of draw commands.
;Each command defines a shape to draw.
;Commands with the highest bit set get repeated
;with the next byte in the buffer being the repeat count.
;Background Piece codes
;0: normal stalactite going right
;1: single wall piece going down
;2: left hand corner piece
;3: top right hand corner piece / bottom left side of
;4: top right hand corner piece
;5: bottom right side of floating platforms
;6: floor piece going right
;7: wall piece going up
;8: corner piece going down-left
;9: floor piece going left
;a: short line going down
;b: short line going up
;c: very short rope
;d: short rope
;e: mid-length rope
;f: long rope
;10: very long rope
;11: super long rope
;12: excessively long rope
;13: rediculously long rope
;14: horizontal rope start going right
;15: horizontal rope end going right
;16: horizontal rope going right
;17: blank area going right
;18: blank area going left, maybe
;19: blank area going down-right
;repeatable pieces (code + count)
;80: stalactite (80 + 0)
;81: wall going down (80 + 1)
;82: left hand corner piece going up-right (80 + 2)
;83: etc, etc.
;U contains the pointer to the room draw commands

DrawBackground:                                                          
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      ; store 1 at 0x20
        LDD        #0x100f                                                
        STD        <DrawSegment_CurrentScreenYXPosition_0x21              ; store draw start position 0x100f aka x: 15, y: 16
                                                                          ; X is in half resolution. 128 pixels wide instead of 
                                                                          ; the screen's 256 pixels.
        JMP        Jump_ProcessDrawCommands                               

RoomGraphicsAndDoorData_0xd25a:                                          
        .dw        Room0_GraphicsAndDoorData_0xd26e                       
        .dw        Room1_GraphicsAndDoorData                              
        .dw        Room2_GraphicsAndDoorData                              
        .dw        Room3_GraphicsAndDoorData                              
        .dw        Room4_GraphicsAndDoorData                              
        .dw        Room5_GraphicsAndDoorData                              
        .dw        Room6_GraphicsAndDoorData                              
        .dw        Room7_GraphicsAndDoorData                              
        .dw        Room8_GraphicsAndDoorData                              
        .dw        Room9_GraphicsAndDoorData                              

Room0_GraphicsAndDoorData_0xd26e:                                        
        .dw        Room0_DrawCommands                                     ; first level exit door?
        .dw        0xFFFF                                                 ; initial start up "door", maybe

InitialPlayerPosition_0xd272:                                            
        .dw        0xA570                                                 ; initial game start position
        .db        0x0                                                    ; room number, maybe
        .db        0x0                                                    ; global door index
        .dw        0x1E72                                                 ; door position
        .dw        0x8707                                                 ; spawn here in next room
        .db        0x1                                                    ; room index, maybe
        .db        0x1                                                    ; global door index
        .db        0x0                                                    ; end tag

Room1_GraphicsAndDoorData:                                               
        .dw        Room1_DrawCommands                                     
        .dw        0x8705                                                 ; first door spawn position
        .dw        0x1E70                                                 ; spawn here in next room
        .db        0x0                                                    ; room index, maybe
        .db        0x2                                                    ; global door index
        .dw        0x4B72                                                 
        .dw        0xA507                                                 
        .db        0x2                                                    ; room index
        .db        0x3                                                    
        .dw        0x1E72                                                 
        .dw        0x7807                                                 
        .db        0x2                                                    ; room index
        .db        0x4                                                    
        .dw        0x1E05                                                 
        .dw        0x7870                                                 
        .db        0x6                                                    ; room index
        .db        0x1A                                                   
        .db        0x0                                                    

Room2_GraphicsAndDoorData:                                               
        .dw        Room2_DrawCommands                                     
        .dw        0xA505                                                 
        .dw        0x4B70                                                 
        .db        0x1                                                    
        .db        0x5                                                    
        .dw        0x7805                                                 
        .dw        0x1E70                                                 ; position after entering room from second room door?
        .db        0x1                                                    
        .db        0x6                                                    
        .dw        0x7872                                                 
        .dw        0x7807                                                 
        .db        0x3                                                    
        .db        0x7                                                    
        .dw        0x4B72                                                 
        .dw        0x4B07                                                 
        .db        0x3                                                    
        .db        0x13                                                   
        .dw        0x1E72                                                 
        .dw        0x1E07                                                 
        .db        0x3                                                    
        .db        0x12                                                   
        .dw        0x1E05                                                 
        .dw        0x8770                                                 
        .db        0x5                                                    
        .db        0x15                                                   
        .db        0x0                                                    

Room3_GraphicsAndDoorData:                                               
        .dw        Room3_DrawCommands                                     
        .dw        0x7805                                                 
        .dw        0x7870                                                 
        .db        0x2                                                    
        .db        0x8                                                    
        .dw        0xA572                                                 
        .dw        0xA507                                                 
        .db        0x4                                                    
        .db        0x9                                                    
        .dw        0x7872                                                 
        .dw        0x7807                                                 
        .db        0x4                                                    
        .db        0xA                                                    
        .dw        0x4B05                                                 
        .dw        0x4B70                                                 
        .db        0x2                                                    
        .db        0x14                                                   
        .dw        0x4B72                                                 
        .dw        0x4B07                                                 
        .db        0x4                                                    
        .db        0xB                                                    
        .dw        0x1E05                                                 
        .dw        0x1E70                                                 
        .db        0x2                                                    
        .db        0x11                                                   
        .dw        0x1E72                                                 
        .dw        0x1E07                                                 
        .db        0x4                                                    
        .db        0x10                                                   
        .db        0x0                                                    

Room4_GraphicsAndDoorData:                                               
        .dw        Room4_DrawCommands                                     
        .dw        0xA505                                                 
        .dw        0xA570                                                 
        .db        0x3                                                    
        .db        0xC                                                    
        .dw        0x7805                                                 
        .dw        0x7870                                                 
        .db        0x3                                                    
        .db        0xD                                                    
        .dw        0x4B05                                                 
        .dw        0x4B70                                                 
        .db        0x3                                                    
        .db        0xE                                                    
        .dw        0x1E05                                                 
        .dw        0x1E70                                                 
        .db        0x3                                                    
        .db        0xF                                                    
        .db        0x0                                                    

Room5_GraphicsAndDoorData:                                               
        .dw        Room5_DrawCommands                                     
        .dw        0x8772                                                 
        .dw        0x1E07                                                 
        .db        0x2                                                    
        .db        0x16                                                   
        .dw        0xA505                                                 
        .dw        0x3C70                                                 
        .db        0x6                                                    
        .db        0x17                                                   
        .dw        0x4B72                                                 
        .dw        0xA507                                                 
        .db        0x7                                                    
        .db        0x1A                                                   
        .db        0x0                                                    

Room6_GraphicsAndDoorData:                                               
        .dw        Room6_DrawCommands                                     
        .dw        0x7872                                                 
        .dw        0x1E07                                                 
        .db        0x1                                                    
        .db        0x19                                                   
        .dw        0x3C72                                                 
        .dw        0xA507                                                 
        .db        0x5                                                    
        .db        0x18                                                   
        .db        0x0                                                    

Room7_GraphicsAndDoorData:                                               
        .dw        Room7_DrawCommands                                     
        .dw        0xA505                                                 
        .dw        0x4B70                                                 
        .db        0x5                                                    
        .db        0x1B                                                   
        .dw        0x4B72                                                 
        .dw        0xA507                                                 
        .db        0x8                                                    
        .db        0x1C                                                   
        .db        0x0                                                    

Room8_GraphicsAndDoorData:                                               
        .dw        Room8_DrawCommands                                     
        .dw        0xA505                                                 
        .dw        0x4B70                                                 
        .db        0x7                                                    
        .db        0x1D                                                   
        .dw        0x2D72                                                 
        .dw        0x1E07                                                 
        .db        0x9                                                    
        .db        0x1E                                                   
        .db        0x0                                                    

Room9_GraphicsAndDoorData:                                               
        .dw        Room9_DrawCommands                                     
        .dw        0x9605                                                 
        .dw        0xA570                                                 
        .db        0x8                                                    
        .db        0x20                                                   
        .dw        0x1E05                                                 
        .dw        0x2D70                                                 
        .db        0x8                                                    
        .db        0x1F                                                   
        .dw        0xA572                                                 
        .dw        0xA570                                                 
        .db        0x0                                                    
        .db        0x21                                                   
        .db        0x0                                                    

Room0_DrawCommands:                                                      
        .db        0xF                                                    
        .db        0x80                                                   
        .db        0x6                                                    
        .db        0xC                                                    
        .db        0x80                                                   
        .db        0x4                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0x3                                                    
        .db        0x80                                                   
        .db        0x8                                                    
        .db        0xF                                                    
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0xE                                                    
        .db        0x87                                                   
        .db        0x4                                                    
        .db        0x2                                                    
        .db        0xF                                                    
        .db        0x19                                                   
        .db        0x19                                                   
        .db        0x17                                                   
        .db        0x1                                                    
        .db        0xC                                                    
        .db        0x7                                                    
        .db        0x97                                                   
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xC                                                    
        .db        0x7                                                    
        .db        0x97                                                   
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xC                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x98                                                   
        .db        0x3                                                    
        .db        0x9                                                    
        .db        0x98                                                   
        .db        0x3                                                    
        .db        0x9                                                    
        .db        0x18                                                   
        .db        0x1A                                                   
        .db        0x1A                                                   
        .db        0x5                                                    
        .db        0x17                                                   
        .db        0x3                                                    
        .db        0xD                                                    
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0xD                                                    
        .db        0x5                                                    
        .db        0x89                                                   
        .db        0x7                                                    
        .db        0x18                                                   
        .db        0x89                                                   
        .db        0x3                                                    
        .db        0x87                                                   
        .db        0x4                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room1_DrawCommands:                                                      
        .db        0x80                                                   
        .db        0x5                                                    
        .db        0x4                                                    
        .db        0x17                                                   
        .db        0x2                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x3                                                    
        .db        0x3                                                    
        .db        0xF                                                    
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x4                                                    
        .db        0x89                                                   
        .db        0xA                                                    
        .db        0x87                                                   
        .db        0x6                                                    
        .db        0x9                                                    
        .db        0x81                                                   
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x87                                                   
        .db        0x4                                                    
        .db        0x2                                                    
        .db        0x10                                                   
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0x12                                                   
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x4                                                    
        .db        0x3                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x7                                                    
        .db        0x2                                                    
        .db        0xD                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x18                                                   
        .db        0x1                                                    
        .db        0x89                                                   
        .db        0x7                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room2_DrawCommands:                                                      
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0xC                                                    
        .db        0x80                                                   
        .db        0x4                                                    
        .db        0xF                                                    
        .db        0x0                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x9                                                    
        .db        0x19                                                   
        .db        0x0                                                    
        .db        0xF                                                    
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0xC                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x89                                                   
        .db        0x8                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x80                                                   
        .db        0x4                                                    
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0x5                                                    
        .db        0xB                                                    
        .db        0x87                                                   
        .db        0x3                                                    
        .db        0x2                                                    
        .db        0xF                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x0                                                    
        .db        0x1A                                                   
        .db        0x7                                                    
        .db        0x2                                                    
        .db        0xC                                                    
        .db        0x5                                                    
        .db        0x89                                                   
        .db        0x8                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room3_DrawCommands:                                                      
        .db        0x80                                                   
        .db        0xC                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xD                                                    
        .db        0x19                                                   
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0xF                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0x1                                                    
        .db        0x0                                                    
        .db        0x87                                                   
        .db        0x5                                                    
        .db        0x2                                                    
        .db        0x12                                                   
        .db        0x0                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x12                                                   
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x4                                                    
        .db        0x87                                                   
        .db        0x3                                                    
        .db        0x8                                                    
        .db        0x81                                                   
        .db        0x2                                                    
        .db        0x89                                                   
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x0                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x1A                                                   
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room4_DrawCommands:                                                      
        .db        0x80                                                   
        .db        0xB                                                    
        .db        0x12                                                   
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xE                                                    
        .db        0xB                                                    
        .db        0x7                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x7                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x11                                                   
        .db        0x0                                                    
        .db        0x14                                                   
        .db        0x96                                                   
        .db        0x4                                                    
        .db        0x15                                                   
        .db        0x98                                                   
        .db        0x6                                                    
        .db        0x80                                                   
        .db        0x6                                                    
        .db        0x19                                                   
        .db        0x19                                                   
        .db        0x9                                                    
        .db        0x98                                                   
        .db        0x4                                                    
        .db        0x9                                                    
        .db        0x81                                                   
        .db        0x3                                                    
        .db        0xC                                                    
        .db        0x87                                                   
        .db        0x3                                                    
        .db        0x97                                                   
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x3                                                    
        .db        0xC                                                    
        .db        0x87                                                   
        .db        0x3                                                    
        .db        0x1A                                                   
        .db        0x1A                                                   
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0x7                                                    
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0x4                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room5_DrawCommands:                                                      
        .db        0x12                                                   
        .db        0x80                                                   
        .db        0x7                                                    
        .db        0xD                                                    
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x3                                                    
        .db        0x3                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x4                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0x5                                                    
        .db        0x81                                                   
        .db        0x4                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0xF                                                    
        .db        0x80                                                   
        .db        0x7                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x89                                                   
        .db        0x5                                                    
        .db        0x3                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x0                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x87                                                   
        .db        0x7                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room6_DrawCommands:                                                      
        .db        0x13                                                   
        .db        0x80                                                   
        .db        0x9                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0x3                                                    
        .db        0x80                                                   
        .db        0x7                                                    
        .db        0x10                                                   
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x1                                                    
        .db        0x1                                                    
        .db        0x89                                                   
        .db        0xE                                                    
        .db        0x87                                                   
        .db        0xA                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room7_DrawCommands:                                                      
        .db        0x0                                                    
        .db        0x13                                                   
        .db        0x80                                                   
        .db        0x3                                                    
        .db        0x4                                                    
        .db        0x0                                                    
        .db        0x2                                                    
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x13                                                   
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x3                                                    
        .db        0xA                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x81                                                   
        .db        0x5                                                    
        .db        0x89                                                   
        .db        0x7                                                    
        .db        0x7                                                    
        .db        0x7                                                    
        .db        0x5                                                    
        .db        0x7                                                    
        .db        0x2                                                    
        .db        0x2                                                    
        .db        0x7                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x1                                                    
        .db        0x1                                                    
        .db        0x84                                                   
        .db        0x3                                                    
        .db        0x8                                                    
        .db        0x1                                                    
        .db        0x1                                                    
        .db        0x89                                                   
        .db        0x6                                                    
        .db        0x87                                                   
        .db        0x6                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0xB                                                    
        .db        0x87                                                   
        .db        0x2                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room8_DrawCommands:                                                      
        .db        0x14                                                   
        .db        0x96                                                   
        .db        0x9                                                    
        .db        0x15                                                   
        .db        0x98                                                   
        .db        0xB                                                    
        .db        0xF                                                    
        .db        0x80                                                   
        .db        0x9                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x1                                                    
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0x9                                                    
        .db        0x86                                                   
        .db        0x7                                                    
        .db        0xE                                                    
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x3                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0x86                                                   
        .db        0x9                                                    
        .db        0xE                                                    
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0x3                                                    
        .db        0x89                                                   
        .db        0xE                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0x86                                                   
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0x87                                                   
        .db        0x3                                                    
        .db        0x2                                                    
        .db        0xE                                                    
        .db        0x86                                                   
        .db        0x9                                                    
        .db        0x89                                                   
        .db        0xB                                                    
        .db        0x87                                                   
        .db        0x4                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Room9_DrawCommands:                                                      
        .db        0x80                                                   
        .db        0x5                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0xD                                                    
        .db        0x0                                                    
        .db        0x12                                                   
        .db        0x4                                                    
        .db        0x81                                                   
        .db        0xA                                                    
        .db        0x89                                                   
        .db        0xA                                                    
        .db        0x9A                                                   
        .db        0x3                                                    
        .db        0x5                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x3                                                    
        .db        0x99                                                   
        .db        0x3                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x9                                                    
        .db        0x87                                                   
        .db        0x6                                                    
        .db        0x2                                                    
        .db        0x11                                                   
        .db        0x0                                                    
        .db        0x0                                                    
        .db        0x19                                                   
        .db        0x17                                                   
        .db        0x17                                                   
        .db        0x1                                                    
        .db        0xD                                                    
        .db        0x7                                                    
        .db        0x17                                                   
        .db        0x1                                                    
        .db        0xD                                                    
        .db        0x7                                                    
        .db        0x17                                                   
        .db        0x1                                                    
        .db        0xD                                                    
        .db        0x7                                                    
        .db        0x9                                                    
        .db        0x18                                                   
        .db        0x9                                                    
        .db        0x18                                                   
        .db        0x9                                                    
        .db        0x18                                                   
        .db        0x18                                                   
        .db        0x1A                                                   
        .db        0x5                                                    
        .db        0x89                                                   
        .db        0x5                                                    
        .db        0xB                                                    
        .db        0x2                                                    
        .db        0xFF                                                   

Jump_ProcessDrawCommands:                                                
        LDX        #DrawCommandFunctions_d5bb                             ; load the address of a data block to X

;U will point to the room's draw commands

LOOP_GetNextDrawCommand:                                                 
        LDA        ,U+                                                    ; get next command, increment U
        BPL        Jump_SingleDrawCommand                                 
        INCA                                                              ; is not plus, so increment
        BEQ        Jump_EncounteredFFEndValue                             ; Ju
        DECA                                                              
        LDB        ,U+                                                    ; This is a repeatable command, get the count and store in B
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xc601 which does nothing. 

Jump_SingleDrawCommand:                                                  
        LDB        #0x1                                                   ; load 1 to B, overriding above. but why?

LAB_d5ae:                                                                
        LSLA                                                              ; double A to get the appropriate function address
                                                                          ; offset from the DrawCommandFunctions array

Loop_CallDrawCommand:                                                    
        PSHS        U,X,B,A                                               ; push to the stack
        JSR        [A,X]                                                  ; call function from DrawCommandFunctions_d5bb table 
                                                                          ; A is the offset into the table
        PULS        A,B,X,U                                               ; done calling the function
        DECB                                                              
        BNE        Loop_CallDrawCommand                                   ; are we done?
        BRA        LOOP_GetNextDrawCommand                                

Jump_EncounteredFFEndValue:                                              
        RTS                                                               

;there are more than two dozen different pieces
;these seem to be the function related to drawing
;each piece. maybe.

DrawCommandFunctions_d5bb:                                               
        .dw        DrawPiece_00_Stalactite                                
        .dw        DrawPiece_01_WallGoingDown                             
        .dw        DrawPiece_02_LeftHandCornerPiece                       
        .dw        DrawPiece_03_TopRightHandCornerPiece                   
        .dw        DrawPiece_04_TopRightHandCornerPiece2                  
        .dw        DrawPiece_05_BottomRightSideOfFloatingPlatforms        
        .dw        DrawPiece_06_FloorPieceGoingRight                      
        .dw        DrawPiece_07_WallPieceGoingUp                          
        .dw        DrawPiece_08_CornerPieceGoingDownLeft                  
        .dw        DrawPiece_09_FloorPieceGoingLeft                       ; DrawPiece_0_
        .dw        DrawPiece_0a_ShortLineGoingDown                        
        .dw        DrawPiece_0b_ShortLineGoingUp                          
        .dw        DrawPiece_0c_VeryShortRope                             
        .dw        DrawPiece_0d_ShortRope                                 
        .dw        DrawPiece_0e_MidLengthRope                             
        .dw        DrawPiece_0f_LongRope                                  
        .dw        DrawPiece_10_VeryLongRope                              
        .dw        DrawPiece_11_SuperLongRope                             
        .dw        DrawPiece_12_ExcessivelyLongRope                       
        .dw        DrawPiece_13_RediculouslyLongRope                      
        .dw        DrawPiece_14_HorizontalRopeStartGoingRight             
        .dw        DrawPiece_15_HorizontalRopeEndGoingRight               
        .dw        DrawPiece_16_HorizontalRopeGoingRight                  
        .dw        DrawPiece_17_BlankAreaGoingRight                       
        .dw        DrawPiece_18_BlankAreaGoingLeft                        
        .dw        DrawPiece_19_BlankAreaGoingDownRight                   
        .dw        DrawPiece_20_UnknownOrBuggy                            

DrawPiece_00_Stalactite:                                                 
        LDU        #DrawData_00_Stalactite                                
        JMP        DrawBackgroundPiece                                    

DrawData_00_Stalactite:                                                  
        .db        0x03                                                   ; num segments
                                                                          ; 
        .db        0x80                                                   ; subpixels to move along X
        .db        0x04                                                   ; number of pixels to move along Y 
        .db        0x00                                                   ; orientation 0, up and right
                                                                          ; 
        .db        0x80                                                   ; subpixels to move along X
        .db        0x0A                                                   ; number of pixels to move along Y 
        .db        0x03                                                   ; orientation 3, down and right
                                                                          ; 
        .db        0x80                                                   ; subpixels to move along X
        .db        0x07                                                   ; number of pixels to move along Y 
        .db        0x00                                                   ; orienation 0, up and right

DrawPiece_07_WallPieceGoingUp:                                           
        LDU        #DrawData_07_WallPieceGoingUp                          
        BRA        Jump_JumpToDrawBackgroundPiece                         

DrawPiece_01_WallGoingDown:                                              
        LDU        #DrawData_01_WallGoingDown                             

Jump_JumpToDrawBackgroundPiece:                                          
        JMP        DrawBackgroundPiece                                    

DrawData_01_WallGoingDown:                                               
        .db        0x03                                                   
        .db        0x40                                                   
        .db        0x08                                                   
        .db        0x04                                                   
        .db        0x40                                                   
        .db        0x05                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x05                                                   
        .db        0x04                                                   

DrawData_07_WallPieceGoingUp:                                            
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x05                                                   
        .db        0x00                                                   
        .db        0x40                                                   
        .db        0x05                                                   
        .db        0x07                                                   
        .db        0x40                                                   
        .db        0x08                                                   
        .db        0x00                                                   

DrawPiece_02_LeftHandCornerPiece:                                        
        LDU        #DrawData_02_LeftHandCornerPiece                       
        BRA        Jump_AnotherJumpToDrawBackgroundPiece                  

DrawData_02_LeftHandCornerPiece:                                         
        .db        0x3                                                    
        .db        0x0                                                    
        .db        0x4                                                    
        .db        0x7                                                    
        .db        0x80                                                   
        .db        0x7                                                    
        .db        0x0                                                    
        .db        0xFF                                                   
        .db        0x7                                                    
        .db        0x0                                                    

DrawPiece_08_CornerPieceGoingDownLeft:                                   
        LDU        #DrawData_08_CornerPieceGoingDownLeft                  

Jump_AnotherJumpToDrawBackgroundPiece:                                   
        JMP        DrawBackgroundPiece                                    

DrawData_08_CornerPieceGoingDownLeft:                                    
        .db        0x03                                                   
        .db        0xFF                                                   
        .db        0x07                                                   
        .db        0x04                                                   
        .db        0x80                                                   
        .db        0x07                                                   
        .db        0x04                                                   
        .db        0x00                                                   
        .db        0x04                                                   
        .db        0x03                                                   

DrawPiece_03_TopRightHandCornerPiece:                                    
        LDU        #DrawData_03_TopRightHandCornerPiece                   
        BRA        Jump_AgainAnotherJumpToDrawBackgroundPiece             

DrawData_03_TopRightHandCornerPiece:                                     
        .db        0x03                                                   
        .db        0x80                                                   
        .db        0x06                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x04                                                   
        .db        0x03                                                   
        .db        0xFF                                                   
        .db        0x08                                                   
        .db        0x03                                                   

DrawPiece_04_TopRightHandCornerPiece2:                                   
        LDU        #DrawData_04_TopRightHandCornerPiece2                  ; set a new U stack

Jump_AgainAnotherJumpToDrawBackgroundPiece:                              
        JMP        DrawBackgroundPiece                                    

DrawData_04_TopRightHandCornerPiece2:                                    
        .db        0x03                                                   
        .db        0x80                                                   
        .db        0x06                                                   
        .db        0x03                                                   
        .db        0xFF                                                   
        .db        0x05                                                   
        .db        0x03                                                   
        .db        0x80                                                   
        .db        0x07                                                   
        .db        0x03                                                   

DrawPiece_05_BottomRightSideOfFloatingPlatforms:                         
        LDU        #DrawData_05_BottomRightSideOfFloatingPlatforms        
        BRA        Jump_AgainAnotherJumpToDrawBackgroundPiece             

DrawData_05_BottomRightSideOfFloatingPlatforms:                          
        .db        0x03                                                   
        .db        0xFF                                                   
        .db        0x08                                                   
        .db        0x00                                                   
        .db        0x00                                                   
        .db        0x05                                                   
        .db        0x00                                                   
        .db        0x80                                                   
        .db        0x05                                                   
        .db        0x00                                                   

DrawPiece_14_HorizontalRopeStartGoingRight:                              
        LDU        #DrawData_14_HorizontalRopeStartGoingRight             
        LDA        #0x3                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        BSR        DrawBackgroundPieceWrapper                             
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        RTS                                                               

DrawData_14_HorizontalRopeStartGoingRight:                               
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x0A                                                   
        .db        0x03                                                   

DrawPiece_15_HorizontalRopeEndGoingRight:                                
        LDU        #DrawData_15_HorizontalRopeEndGoingRight               
        LDA        #0x3                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        BSR        DrawBackgroundPieceWrapper                             
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        RTS                                                               

DrawData_15_HorizontalRopeEndGoingRight:                                 
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x0A                                                   
        .db        0x00                                                   

DrawPiece_06_FloorPieceGoingRight:                                       
        LDU        #DrawData_17_BlankAreaGoingRight                       
;**************************************************************
;*                       THUNK FUNCTION                       *
;**************************************************************
;Thunked-Function: DrawBackgroundPiece

DrawBackgroundPieceWrapper:                                              
        JMP        DrawBackgroundPiece                                    

DrawData_17_BlankAreaGoingRight:                                         
        .db        0x01                                                   
        .db        0x00                                                   
        .db        0x09                                                   
        .db        0x02                                                   

DrawPiece_09_FloorPieceGoingLeft:                                        
        LDU        #DrawData_18_BlankAreaGoingLeft                        
        BRA        DrawBackgroundPieceWrapper                             

DrawData_18_BlankAreaGoingLeft:                                          
        .db        0x01                                                   
        .db        0x00                                                   
        .db        0x09                                                   
        .db        0x06                                                   

DrawPiece_0a_ShortLineGoingDown:                                         
        LDU        #DrawData_19_BlankAreaGoingDownRight                   
        BRA        DrawBackgroundPieceWrapper                             

DrawData_19_BlankAreaGoingDownRight:                                     
        .db        0x01                                                   
        .db        0x00                                                   
        .db        0x10                                                   
        .db        0x03                                                   

DrawPiece_0b_ShortLineGoingUp:                                           
        LDU        #DrawData_0b_ShortLineGoingUp                          
        BRA        DrawBackgroundPieceWrapper                             

DrawData_0b_ShortLineGoingUp:                                            
        .db        0x01                                                   
        .db        0x00                                                   
        .db        0x10                                                   
        .db        0x00                                                   

DrawPiece_17_BlankAreaGoingRight:                                        
        LDU        #DrawData_17_BlankAreaGoingRight                       

Jump_DrawBlankArea:                                                      
        LDA        #0xff                                                  
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        JSR        DrawBackgroundPiece                                    
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        RTS                                                               

DrawPiece_18_BlankAreaGoingLeft:                                         
        LDU        #DrawData_18_BlankAreaGoingLeft                        
        BRA        Jump_DrawBlankArea                                     

DrawPiece_19_BlankAreaGoingDownRight:                                    
        LDU        #DrawData_19_BlankAreaGoingDownRight                   
        BRA        Jump_DrawBlankArea                                     

DrawPiece_20_UnknownOrBuggy:                                             
        LDU        #DrawData_07_WallPieceGoingUp                          
        BRA        Jump_DrawBlankArea                                     

DrawPiece_0c_VeryShortRope:                                              
        LDX        #DrawData_0c_VeryShortRope                             
        BRA        Jump_DrawRope                                          

DrawData_0c_VeryShortRope:                                               
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x07                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x07                                                   
        .db        0x00                                                   

DrawPiece_0d_ShortRope:                                                  
        LDX        #DrawData_0d_ShortRope                                 
        BRA        Jump_DrawRope                                          

DrawData_0d_ShortRope:                                                   
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x16                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x16                                                   
        .db        0x00                                                   

DrawPiece_0e_MidLengthRope:                                              
        LDX        #DrawData_0e_MidLengthRope                             
        BRA        Jump_DrawRope                                          

DrawData_0e_MidLengthRope:                                               
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x25                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x25                                                   
        .db        0x00                                                   

DrawPiece_0f_LongRope:                                                   
        LDX        #DrawData_0f_LongRope                                  
        BRA        Jump_DrawRope                                          

DrawData_0f_LongRope:                                                    
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x34                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x34                                                   
        .db        0x00                                                   

DrawPiece_10_VeryLongRope:                                               
        LDX        #DrawData_10_VeryLongRope                              
        BRA        Jump_DrawRope                                          

DrawData_10_VeryLongRope:                                                
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x43                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x43                                                   
        .db        0x00                                                   

DrawPiece_11_SuperLongRope:                                              
        LDX        #DrawData_11_SuperLongRope                             
        BRA        Jump_DrawRope                                          

DrawData_11_SuperLongRope:                                               
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x52                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x52                                                   
        .db        0x00                                                   

DrawPiece_12_ExcessivelyLongRope:                                        
        LDX        #DrawData_12_ExcessivelyLongRope                       
        BRA        Jump_DrawRope                                          

DrawData_12_ExcessivelyLongRope:                                         
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x61                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x61                                                   
        .db        0x00                                                   

DrawPiece_13_RediculouslyLongRope:                                       
        LDX        #DrawData_13_RediculouslyLongRope                      
        BRA        Jump_DrawRope                                          

DrawData_13_RediculouslyLongRope:                                        
        .db        0x02                                                   
        .db        0x00                                                   
        .db        0x8E                                                   
        .db        0x03                                                   
        .db        0x00                                                   
        .db        0x8E                                                   
        .db        0x00                                                   

Jump_DrawRope:                                                           
        PSHS        X                                                     
        LDU        #DrawData_PreRope_Maybe                                
        BSR        DrawBackgroundPiece                                    
        LDA        #0x3                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        PULS        U                                                     
        BSR        DrawBackgroundPiece                                    
        LDU        #DrawData_PostRope_Maybe                               
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        BRA        DrawBackgroundPiece                                    

DrawData_PreRope_Maybe:                                                  
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x06                                                   
        .db        0x03                                                   

DrawData_PostRope_Maybe:                                                 
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x06                                                   
        .db        0x00                                                   

DrawPiece_16_HorizontalRopeGoingRight:                                   
        LDU        #DrawData_17_BlankAreaGoingRight                       
        LDA        #0x3                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        BSR        DrawBackgroundPiece                                    
        LDA        #0x1                                                   
        STA        <CrtArtifactDrawingMaskIndex_0x20                      
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawBackgroundPiece:                                                     
        LDA        ,U+                                                    ; get segment count
        STA        <CurrentSegmentCounter_0x24                            ; store segment count
        CLR        <DrawSegment_SecondaryAxisSubpixelInc_0x1e             

Loop_ProcessSegment:                                                     
        LDA        ,U+                                                    ; get first value from segment
        STA        <DrawSegmentLine_SubPixelOffset_0x1f                   
        LDA        ,U+                                                    ; get second value from segment
        STA        <DrawSegmentLine_Counter_0x1d                          
        LDA        ,U+                                                    ; get and compute the drawing function offset
        LSLA                                                              
        LDX        #LineDrawingFunctions_0xd77d                           
        JSR        [A,X]                                                  ; call the DrawSegment_MovePos function
        DEC        <CurrentSegmentCounter_0x24                            
        BNE        Loop_ProcessSegment                                    
        RTS                                                               

LineDrawingFunctions_0xd77d:                                             
        .dw        DrawSegment_Orientation0_UpAndRight                    
        .dw        DrawSegment_Orientation1_RightAndUp                    
        .dw        DrawSegment_Orientation2_RightAndDown                  
        .dw        DrawSegment_Orientation3_DownAndRight                  
        .dw        DrawSegment_Orientation4_DownAndLeft                   
        .dw        DrawSegment_Orientation5_LeftAndDown                   
        .dw        DrawSegment_Orientation6_LeftAndUp                     
        .dw        DrawSegment_Orientation7_UpAndLeft                     
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation0_UpAndRight:                                     
        LDX        #DrawSegment_MovePosUpAndRight                         
        CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawVerticalSegment                                    
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation1_RightAndUp:                                     
        LDX        #DrawSegment_MovePosRightAndUp                         
        LDA        #0xff                                                  
        STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawHorizontalSegment                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation2_RightAndDown:                                   
        LDX        #DrawSegment_MovePosRightAndDown                       
        CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawHorizontalSegment                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation3_DownAndRight:                                   
        LDX        #DrawSegment_MovePosDownAndRight                       
        CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawVerticalSegment                                    
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation4_DownAndLeft:                                    
        LDX        #DrawSegment_MovePosDownAndLeft                        
        LDA        #0xff                                                  
        STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawVerticalSegment                                    
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation5_LeftAndDown:                                    
        LDX        #DrawSegment_MovePosLeftAndDown                        
        CLR        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawHorizontalSegment                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation6_LeftAndUp_2:                                    

DrawSegment_Orientation6_LeftAndUp:                                      
        LDX        #DrawSegment_MovePosLeftAndUp                          
        LDA        #0xff                                                  
        STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawHorizontalSegment                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_Orientation7_UpAndLeft:                                      
        LDX        #DrawSegment_MovePosUpAndLeft                          
        LDA        #0xff                                                  
        STA        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         
        BRA        DrawVerticalSegment                                    
;**************************************************************
;* Draw a segment horizontally pixel by pixel, for            *
;* the number specified in DrawSegmentLine_Counter.           *
;* Also move along Y using a subpixel offset specified        *
;* in 0x1e and 0x1f                                           *
;* A DrawSegment_MovePos function determines whether          *
;* we're going left or first, then up or down.                *
;**************************************************************
;X contains a DrawSegment_MovePos function

DrawHorizontalSegment:                                                   
        LDA        <DrawSegment_CurrentScreenY_0x21                       
        LDB        <DrawSegmentLine_Counter_0x1d                          
        BEQ        Jump_DoneDrawingHorizontalPixels                       
        LDB        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         

Loop_DrawHorizontalPixels:                                               
        PSHS        U,X,B,A                                               
        BSR        DrawPixelWithCrtArtifacts                              
        PULS        A,B,X,U                                               
        DEC        <DrawSegmentLine_Counter_0x1d                          
        BEQ        Jump_DoneDrawingHorizontalPixels                       
        JSR        ,X                                                     ; call the DrawSegment_MovePos function
        STA        <DrawSegment_CurrentScreenY_0x21                       
        BRA        Loop_DrawHorizontalPixels                              

Jump_DoneDrawingHorizontalPixels:                                        
        RTS                                                               
;**************************************************************
;* Draw a segment vertically pixel by pixel,                  *
;* for the number specified in DrawSegmentLine_Counter.       *
;* Also move along X using a subpixel offset specified        *
;* in 0x1e and 0x1f                                           *
;* A DrawSegment_MovePos function determines whether          *
;* we're going up or down first, then left or right.          *
;**************************************************************
;X contains a DrawSegment_MovePos function

DrawVerticalSegment:                                                     
        LDA        <DrawSegment_CurrentScreenX_0x22                       
        LDB        <DrawSegmentLine_Counter_0x1d                          
        BEQ        Jump_DoneDrawingVerticalPixels                         

;setup loop
        LDB        <DrawSegmentLine_SubPixelStartValue_Maybe_0x25         

Loop_DrawVerticalPixels:                                                 
        PSHS        U,X,B,A                                               
        BSR        DrawPixelWithCrtArtifacts                              
        PULS        A,B,X,U                                               
        DEC        <DrawSegmentLine_Counter_0x1d                          
        BEQ        Jump_DoneDrawingVerticalPixels                         
        JSR        ,X                                                     ; call the DrawSegment_MovePos function
        STA        <DrawSegment_CurrentScreenX_0x22                       
        BRA        Loop_DrawVerticalPixels                                

Jump_DoneDrawingVerticalPixels:                                          
        RTS                                                               
;**************************************************************
;* These DrawSegment_MovePos functions work like this:        *
;* Take a primary axis and move along it one pixel at a time. *
;* For the secondary axis, subpixels are used.                *
;* Subpixel increment is specified in the shape's segment.    *
;* Shape:                                                     *
;*         Num Segments                                       *
;*         For each segment                                   *
;*                 subpixel increment along secondary axis    *
;*                 pixels along primary axis                  *
;*                 orientation (ie which DrawSegment_MoveP... *
;*                                                            *
;* The mem location used to modify the secondary axis's po... *
;* is 0x1e, but only 0x1f can have an actual value.           *
;**************************************************************

DrawSegment_MovePosUpAndRight:                                           
        DEC        <DrawSegment_CurrentScreenY_0x21                       
        ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosRightAndUp:                                           
        INC        <DrawSegment_CurrentScreenX_0x22                       
        SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosRightAndDown:                                         
        INC        <DrawSegment_CurrentScreenX_0x22                       
        ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosDownAndRight:                                         
        INC        <DrawSegment_CurrentScreenY_0x21                       
        ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosDownAndLeft:                                          
        INC        <DrawSegment_CurrentScreenY_0x21                       
        SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosLeftAndDown:                                          
        DEC        <DrawSegment_CurrentScreenX_0x22                       
        ADDD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosLeftAndUp:                                            
        DEC        <DrawSegment_CurrentScreenX_0x22                       
        SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawSegment_MovePosUpAndLeft:                                            
        DEC        <DrawSegment_CurrentScreenY_0x21                       
        SUBD       <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawPixelWithCrtArtifacts:                                               
        LDD        <DrawSegment_CurrentScreenYXPosition_0x21              
        BSR        ComputeScreenLocationFromAAndB                         
        TFR        D,Y                                                    ; move screen position to Y
        LDB        <DrawSegment_CurrentScreenX_0x22                       ; which pair of bits will it draw on?
        ANDB       #0x3                                                   ; get the last two bits of the x position
        LDU        #Drawing_PixelBits_d84a                                
        LEAX       0x4,U                                                  ; load the address of the CRT artfiact mask
                                                                          ; table into X
        LDA        <CrtArtifactDrawingMaskIndex_0x20                      
        BMI        Jump_DoneDrawingReturn                                 
        LDA        A,X                                                    ; load the mask into A
        ANDA       B,U                                                    ; blend the pixel we want to draw with the
                                                                          ; CRT artifact mask
        STA        ,-S                                                    ; manipulate the stack to store
                                                                          ; the value temporarily
        LDA        B,U                                                    
        COMA                                                              
        ANDA       ,Y                                                     
        ORA        ,S+                                                    
        STA        ,Y                                                     ; write the final pixel

Jump_DoneDrawingReturn:                                                  
        RTS                                                               

;there are eight pixels for a given byte.
;use this table to set a pair of bits for a
;given x screen position. The game treats the
;256 wide screen as 128 so it draws two bits
;at a time.

Drawing_PixelBits_d84a:                                                  
        .db        11000000b                                              
        .db        00110000b                                              
        .db        00001100b                                              
        .db        00000011b                                              

;objects choose which CRT artifacting mask to use

CrtArtifactDrawing_LineDrawingMask:                                      
        .db        00000000b                                              ; invisible. doesn't draw any pixels
        .db        01010101b                                              ; only draw odd pixels. If used to draw platform, then can walk on
        .db        10101010b                                              ; only draw even pixels. if used to draw platform, can't walk on
        .db        11111111b                                              ; draw all pixels. if drawn as horizontal line, 
                                                                          ; treated as horziontal rope
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

LoadPosRelativeToYAndComputeScreenPos:                                   
        LDA        0x4,Y                                                  
        LDB        0x6,Y                                                  
;**************************************************************
;* Generates a memory location in a video page for            *
;* the given X and Y.                                         *
;*                                                            *
;* A register holds the Y position (0 - 191)                  *
;* B register holds the X position (0 - 127)                  *
;*                                                            *
;* Note that X works in half resolution, not 256              *
;* pixels like the current screen mode. The function          *
;* scales X up so that it maps to the screen res.             *
;*                                                            *
;* To find the correct byte along the X axis, it first        *
;* doubles X to map its position to 256 pixels. Then it       *
;* divides by 8 (bits) to find the corresponding byte in      *
;* video memory.                                              *
;*                                                            *
;* Formula:                                                   *
;* offset = (Y * screen_width_in_bytes) + (X * 2 / 8)         *
;* final pos = offset + video_memory_location                 *
;*                                                            *
;* example:                                                   *
;* (0x24 * 0x20) + (0x4f * 2 / 8) + 0x400 = 0x893 (893.C)     *
;*                                                            *
;* background draw origin point: Y:0x10, X:0xF                *
;* (0x10 * 0x20) + (0xf * 2 / 8) + 0x400 = 0x603 (603.C)      *
;**************************************************************

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
;**************************************************************
;* Used by the player, the ball, and the bird                 *
;**************************************************************

EraseAndUpdateAndDrawObject:                                             
        LDA        -0x5,Y                                                 
        BEQ        Jump_SkipUpdate                                        
        BMI        Jump_StateIsFFAndUninitialized                         
        DECA                                                              
        BEQ        Jump_StateIsNowZero                                    
        BSR        EraseSpriteFromScreen                                  
        .db        0x8C                                                   

Jump_StateIsNowZero:                                                     
        INC        -0x5,Y                                                 
        CMPY       #Player_SpeedY_0x1aa                                   ; check if we're updating the player physics
        BNE        Jump_SkipRopeHandling                                  
        LDA        -0xb,Y                                                 
        BEQ        Jump_SkipRopeHandling                                  
        LDB        0x6,Y                                                  
        ADDB       #0x3                                                   
        LDA        0x4,Y                                                  
        STD        <DrawSegment_CurrentScreenYXPosition_0x21              
        CLR        <CrtArtifactDrawingMaskIndex_0x20                      ; draw nothing?
        LDD        <ZeroValue                                             
        STD        <DrawSegment_SecondaryAxisSubpixelInc_0x1e             
        LDA        #12                                                    ; a length or a count of some kind
                                                                          ; or the short rope? (draw object 12)
        STA        <DrawSegmentLine_Counter_0x1d                          
        JSR        DrawSegment_Orientation3_DownAndRight                  
        LDY        #Player_PhysicsData_0x1aa                              

Jump_SkipRopeHandling:                                                   
        LDU        0x8,Y                                                  
        STU        0xc,Y                                                  
        LDX        0xa,Y                                                  
        STX        0xe,Y                                                  
        LDA        -0x1,Y                                                 
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DrawingFunctionFor3ByteWideSprites:                                      
        STA        <UtilityCounter_0x26                                   

Loop_NextLine:                                                           
        LDD        ,U                                                     ; load from page to D
        ORA        ,X+                                                    ; binary or A with sprite data
        ORB        ,X+                                                    ; binary or B with sprite data
        STD        ,U                                                     ; store to page
        LDA        0x2,U                                                  ; load the third byte from the page
        ORA        ,X+                                                    ; or A with the sprite data
        STA        0x2,U                                                  ; store third byte into page
        LEAU       0x20,U                                                 ; move to next line in page
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_NextLine                                          ; Lo

Jump_SkipUpdate:                                                         
        RTS                                                               

Jump_StateIsFFAndUninitialized:                                          
        CLR        -0x5,Y                                                 
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

EraseSpriteFromScreen:                                                   
        LDU        0xc,Y                                                  
        LDX        0xe,Y                                                  
        LDA        -0x1,Y                                                 
        STA        <UtilityCounter_0x26                                   

Loop_ClearNextRow:                                                       
        LDD        ,X++                                                   ; get the first byte of the sprite
        COMA                                                              ; inverse it
        ANDA       ,U                                                     ; and with the byte in the first video page. 
                                                                          ; this should remove the sprite pixels from
                                                                          ; the screen
        ORA        0x1800,U                                               ; in case we've taken too many bytes from the
                                                                          ; background, bitwise or with the clean background
;second byte of the line
        COMB                                                              
        ANDB       0x1,U                                                  
        ORB        0x1801,U                                               

;store to the screen
        STD        ,U                                                     

;third byte of the line
        LDA        ,X+                                                    
        COMA                                                              
        ANDA       0x2,U                                                  
        ORA        0x1802,U                                               

;store third byte to the screen
        STA        0x2,U                                                  
        LEAU       0x20,U                                                 ; go to next line
        DEC        <UtilityCounter_0x26                                   
        BNE        Loop_ClearNextRow                                      
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

PrintString:                                                             
        LDY        #CharacterFont                                         
        LDB        #0x7                                                   ; number of lines in a character. Redundant because
                                                                          ; it's set again below?
        LDA        ,U+                                                    ; U points to the text strings
        BMI        Loop_HitEndOfString                                    ; last character was 0xff
        MUL                                                               
        LEAY         D,Y ; Jump to the specified character in rom         
        LDB        #0x7                                                   ; number of lines in a character

Loop_DrawCharacter:                                                      
        LDA        ,Y+                                                    ; get the character row
        ANDA       <CharacterDrawingMask_0x69_Nice                        ; apply the character row draw mask
        ORA        0x1800,X                                               ; blend into second page. 
                                                                          ; X contains the screen location
        STA        ,X                                                     ; draw blended value to first page
        LEAX       0x20,X                                                 ; Go to next line
        DECB                                                              
        BNE        Loop_DrawCharacter                                     
        LEAX       -0xdf,X                                                ; backup by 223 bytes
        BRA        PrintString                                            

Loop_HitEndOfString:                                                     
        RTS                                                               

CharacterFont:                                                           
        .db        00110000b                                              ; Number 0

BYTE_d909:                                                               
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Number_1:                                                                
        .db        00110000b                                              
        .db        11110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11111100b                                              

Number_2:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        00001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11000000b                                              
        .db        11111100b                                              

Number_3:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        00001100b                                              
        .db        00111100b                                              
        .db        00001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Number_4:                                                                
        .db        00001100b                                              
        .db        00111100b                                              
        .db        11001100b                                              
        .db        11111100b                                              
        .db        00001100b                                              
        .db        00001100b                                              
        .db        00001100b                                              

Number_5:                                                                
        .db        11111100b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11111100b                                              
        .db        00001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Number_6:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11000000b                                              
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Number_7:                                                                
        .db        11111100b                                              
        .db        00001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11000000b                                              
        .db        11000000b                                              

Number_8:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Number_9:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00111100b                                              
        .db        00001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_A:                                                                
        .db        00110000b                                              ; Index 10
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11111100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_B:                                                                
        .db        11110000b                                              ; index 11
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              

Letter_C:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_D:                                                                
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              

Letter_E:                                                                
        .db        11111100b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11110000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11111100b                                              

Letter_F:                                                                
        .db        11111100b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11110000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              

Letter_G:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11000000b                                              
        .db        00111100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_H:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11111100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_I:                                                                
        .db        11111100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11111100b                                              

Letter_J:                                                                
        .db        00001100b                                              
        .db        00001100b                                              
        .db        00001100b                                              
        .db        00001100b                                              
        .db        00001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_K:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              
        .db        11000000b                                              
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_L:                                                                
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11111100b                                              

Letter_M:                                                                
        .db        11001100b                                              
        .db        11111100b                                              
        .db        11111100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_N:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              
        .db        11111100b                                              
        .db        11111100b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_O:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_P:                                                                
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              

Letter_Q:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11111100b                                              
        .db        00111100b                                              

Letter_R:                                                                
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11110000b                                              
        .db        11110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_S:                                                                
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11000000b                                              
        .db        00110000b                                              
        .db        00001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_T:                                                                
        .db        11111100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              

Letter_U:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              

Letter_V:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              

Letter_W:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11111100b                                              
        .db        11111100b                                              
        .db        11001100b                                              

Letter_X:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11001100b                                              
        .db        11001100b                                              

Letter_Y:                                                                
        .db        11001100b                                              
        .db        11001100b                                              
        .db        11001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              

Letter_Z:                                                                
        .db        11111100b                                              
        .db        00001100b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        00110000b                                              
        .db        11000000b                                              
        .db        11111100b                                              

Letter_Space:                                                            
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              

Letter_Colon:                                                            
        .db        00000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        00000000b                                              
        .db        11000000b                                              
        .db        11000000b                                              
        .db        00000000b                                              

Letter_Period:                                                           
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00000000b                                              
        .db        00110000b                                              
        .db        00110000b                                              

TextStrings:                                                             
        .db        13                                                     ; D
        .db        24                                                     ; O
        .db        32                                                     ; W
        .db        23                                                     ; N
        .db        21                                                     ; L
        .db        10                                                     ; A
        .db        23                                                     ; N
        .db        13                                                     ; D
        .db        36                                                     ; space
        .db        31                                                     ; V
        .db        1                                                      ; 1
        .db        38                                                     ; .
        .db        1                                                      ; 1
        .db        255                                                    ; EOS

String_WrittenBy:                                                        
        .db        32                                                     ; W
        .db        27                                                     ; R
        .db        18                                                     ; I
        .db        29                                                     ; T
        .db        29                                                     ; T
        .db        14                                                     ; E
        .db        23                                                     ; N
        .db        36                                                     ; ' '
        .db        11                                                     ; B
        .db        34                                                     ; Y
        .db        37                                                     ; :
        .db        255                                                    

String_MichaelAichlmayer:                                                
        .db        22                                                     ; Michael Aichlmayr
        .db        18                                                     
        .db        12                                                     
        .db        17                                                     
        .db        10                                                     
        .db        14                                                     
        .db        21                                                     
        .db        36                                                     
        .db        10                                                     
        .db        18                                                     
        .db        12                                                     
        .db        17                                                     
        .db        21                                                     
        .db        22                                                     
        .db        10                                                     
        .db        34                                                     
        .db        27                                                     
        .db        255                                                    

String_Copyright1983:                                                    
        .db        12                                                     
        .db        24                                                     
        .db        25                                                     
        .db        34                                                     
        .db        27                                                     
        .db        18                                                     
        .db        16                                                     
        .db        17                                                     
        .db        29                                                     
        .db        36                                                     
        .db        1                                                      
        .db        9                                                      
        .db        8                                                      
        .db        3                                                      
        .db        255                                                    

String_SpectralAssociates:                                               
        .db        28                                                     
        .db        25                                                     
        .db        14                                                     
        .db        12                                                     
        .db        29                                                     
        .db        27                                                     
        .db        10                                                     
        .db        21                                                     
        .db        36                                                     
        .db        10                                                     
        .db        28                                                     
        .db        28                                                     
        .db        24                                                     
        .db        12                                                     
        .db        18                                                     
        .db        10                                                     
        .db        29                                                     
        .db        14                                                     
        .db        28                                                     
        .db        255                                                    

String_LicensedTo:                                                       
        .db        21                                                     
        .db        18                                                     
        .db        12                                                     
        .db        14                                                     
        .db        23                                                     
        .db        28                                                     
        .db        14                                                     
        .db        13                                                     
        .db        36                                                     
        .db        29                                                     
        .db        24                                                     
        .db        36                                                     
        .db        255                                                    

String_TandyCorporation:                                                 
        .db        29                                                     
        .db        10                                                     
        .db        23                                                     
        .db        13                                                     
        .db        34                                                     
        .db        36                                                     
        .db        12                                                     
        .db        24                                                     
        .db        27                                                     
        .db        25                                                     
        .db        24                                                     
        .db        27                                                     
        .db        10                                                     
        .db        29                                                     
        .db        18                                                     
        .db        24                                                     
        .db        23                                                     
        .db        255                                                    

String_AllRightsReserved:                                                
        .db        10                                                     
        .db        21                                                     
        .db        21                                                     
        .db        36                                                     
        .db        27                                                     
        .db        18                                                     
        .db        16                                                     
        .db        17                                                     
        .db        29                                                     
        .db        28                                                     
        .db        36                                                     
        .db        27                                                     
        .db        14                                                     
        .db        28                                                     
        .db        14                                                     
        .db        27                                                     
        .db        31                                                     
        .db        14                                                     
        .db        13                                                     
        .db        255                                                    

String_OnePlayer:                                                        
        .db        24                                                     
        .db        23                                                     
        .db        14                                                     
        .db        36                                                     
        .db        25                                                     
        .db        21                                                     
        .db        10                                                     
        .db        34                                                     
        .db        14                                                     
        .db        27                                                     
        .db        255                                                    

String_TwoPlayer:                                                        
        .db        29                                                     
        .db        32                                                     
        .db        24                                                     
        .db        36                                                     
        .db        25                                                     
        .db        21                                                     
        .db        10                                                     
        .db        34                                                     
        .db        14                                                     
        .db        27                                                     
        .db        255                                                    

String_HighScore:                                                        
        .db        17                                                     
        .db        18                                                     
        .db        16                                                     
        .db        17                                                     
        .db        36                                                     
        .db        28                                                     
        .db        12                                                     
        .db        24                                                     
        .db        27                                                     
        .db        14                                                     
        .db        255                                                    

String_PlayerOne:                                                        
        .db        25                                                     
        .db        21                                                     
        .db        10                                                     
        .db        34                                                     
        .db        14                                                     
        .db        27                                                     
        .db        36                                                     
        .db        24                                                     
        .db        23                                                     
        .db        14                                                     
        .db        255                                                    

String_PlayerTwo:                                                        
        .db        25                                                     
        .db        21                                                     
        .db        10                                                     
        .db        34                                                     
        .db        14                                                     
        .db        27                                                     
        .db        36                                                     
        .db        29                                                     
        .db        32                                                     
        .db        24                                                     
        .db        255                                                    

String_PL1:                                                              
        .db        25                                                     ; P
        .db        21                                                     ; L
        .db        1                                                      ; 1
        .db        255                                                    

String_PL2:                                                              
        .db        25                                                     ; P
        .db        21                                                     ; L
        .db        2                                                      ; 2
        .db        255                                                    

String_GetReadyPlayerOne:                                                
        .db        16                                                     ; G
        .db        14                                                     ; E
        .db        29                                                     ; T
        .db        36                                                     ; ' '
        .db        27                                                     ; R
        .db        14                                                     ; E
        .db        10                                                     ; A
        .db        13                                                     ; D
        .db        34                                                     ; Y
        .db        36                                                     ; ' '
        .db        25                                                     ; P
        .db        21                                                     ; L
        .db        10                                                     ; A
        .db        34                                                     ; Y
        .db        14                                                     ; E
        .db        27                                                     ; R
        .db        36                                                     ; ' '
        .db        24                                                     ; O
        .db        23                                                     ; N
        .db        14                                                     ; E
        .db        255                                                    

String_GetReadyPlayerTwo:                                                
        .db        16                                                     ; G
        .db        14                                                     ; E
        .db        29                                                     ; T
        .db        36                                                     ; ' '
        .db        27                                                     ; R
        .db        14                                                     ; E
        .db        10                                                     ; A
        .db        13                                                     ; D
        .db        34                                                     ; Y
        .db        36                                                     ; ' '
        .db        25                                                     ; P
        .db        21                                                     ; L
        .db        10                                                     ; A
        .db        34                                                     ; Y
        .db        14                                                     ; E
        .db        27                                                     ; R
        .db        36                                                     ; ' '
        .db        29                                                     ; T
        .db        32                                                     ; W
        .db        24                                                     ; O
        .db        255                                                    

String_Chamber:                                                          
        .db        12                                                     ; C
        .db        17                                                     ; H
        .db        10                                                     ; A
        .db        22                                                     ; M
        .db        11                                                     ; B
        .db        14                                                     ; E
        .db        27                                                     ; R
        .db        255                                                    
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdateAndPrintPlayerScore:                                               
        BSR        ConvertDRegisterToString                               
        LDU        #PlayerScoreStringLocationPointers                     
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        LDU        A,U                                                    
        BSR        AddPickupPointsToScore                                 
        LDX        #0x1b03                                                ; screen position
        BSR        FindFirstNonZeroCharacterInString                      
        JMP        PrintString                                            
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

FindFirstNonZeroCharacterInString:                                       
        LDA        ,U                                                     ; get character
        BMI        Jump_FoundEndOfString                                  ; Jump_IfAtEndOfString
        BNE        Jump_FoundNonZeroCharacter                             
        LEAU       0x1,U                                                  ; advance U by 1
        LEAX       0x1,X                                                  ; advance X by 1
        BRA        FindFirstNonZeroCharacterInString                      

Jump_FoundEndOfString:                                                   
        LEAU       -0x1,U                                                 
        LEAX       -0x1,X                                                 

Jump_FoundNonZeroCharacter:                                              
        RTS                                                               

PlayerScoreStringLocationPointers:                                       
        .dw        PlayerOneScoreString_0xbb                              
        .dw        PlayerTwoScoreString_0xc3                              
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

PrintTimerStringToScreen:                                                
        PSHS        X                                                     
        BSR        ConvertDRegisterToString                               
        PULS        X                                                     
        LDU        #GameTimerString_0xcb                                  
        BSR        ReplaceZerosToSpaces_Maybe                             
        JMP        PrintString                                            
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ReplaceZerosToSpaces_Maybe:                                              
        TFR        U,Y                                                    

Loop_NextCharacter:                                                      
        LDA        ,Y+                                                    
        BMI        Jump_EndOfString                                       
        BNE        Jump_ToExit                                            
        LDA        #0x24                                                  ; store a space at the character location in the string
        STA        -0x1,Y                                                 
        BRA        Loop_NextCharacter                                     

Jump_EndOfString:                                                        
        CLR        -0x2,Y                                                 

Jump_ToExit:                                                             
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ConvertDRegisterToString:                                                
        STD        <GameTimerLastDigit_0x6e                               ; store the timer here

;clear game timer string
        LDB        #0x7                                                   
        LDX        #GameTimerString_0xcb                                  

Loop_ClearGameTimerString:                                               
        CLR        ,X+                                                    
        DECB                                                              
        BNE        Loop_ClearGameTimerString                              
        LDX        #DAT_0xcd                                              
        LDD        #10000                                                 
        BSR        ConvertNumberAtPlaceToCharacter                        
        LDD        #1000                                                  
        BSR        ConvertNumberAtPlaceToCharacter                        
        LDD        #100                                                   
        BSR        ConvertNumberAtPlaceToCharacter                        
        LDD        #10                                                    
        BSR        ConvertNumberAtPlaceToCharacter                        
        LDB        <SomeStringConversionValue_0x6f                        ; store to 0x6f, but why? it's unused.
        STB        ,X                                                     
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ConvertNumberAtPlaceToCharacter:                                         
        CLR        <GameTimerSecondDigit_0x6b                             
        STD        <DividerForNumberToStringConversion_0x6c               ; store the divider here
        LDD        <GameTimerLastDigit_0x6e                               

Loop_ContinueSub:                                                        
        STD        <GameTimerLastDigit_0x6e                               
        SUBD       <DividerForNumberToStringConversion_0x6c               
        BCS        Jump_DoneFindingCharacter                              
        INC        <GameTimerSecondDigit_0x6b                             
        BRA        Loop_ContinueSub                                       

Jump_DoneFindingCharacter:                                               
        LDA        <GameTimerSecondDigit_0x6b                             
        STA        ,X+                                                    ; move to next character in timer string
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************
;The area in memory used to contain
;the timer now contains the score of
;the pick up the player touched. Add
;it to the player's score.

AddPickupPointsToScore:                                                  
        CLRB                                                              ; set to 0
        LDX        #StringDataEnd_0xd2                                    
        LEAU       0x7,U                                                  ; the string is stored in U.
                                                                          ; jump to the end of the string

Loop_NextCharacterInString:                                              
        LDA        ,-U                                                    ; load number from string
                                                                          ; go backwards
        ADDB       #0xf0                                                  ; increase B by 15
        ADCA       ,-X                                                    
        DAA                                                               
        TFR        A,B                                                    
        ANDA       #0xf                                                   
        STA        ,U                                                     
        CMPX       #GameTimerString_0xcb                                  
        BNE        Loop_NextCharacterInString                             
        ADDB       #0xf0                                                  
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

CopySpritesFromRomToRam:                                                 
        LDU        #SpriteCopyInfo                                        ; set U to start of data block

Jump_CopyNextAnimation:                                                  
        LDD        ,U++                                                   ; a size counter?
        BMI        Loop_FinishedCopyingSpritesToRam                       
        LDX        ,U++                                                   ; source address
        LDY        ,U++                                                   ; destination address

Jump_CopySpriteToRam:                                                    
        BSR        CopySpritesFromRomToRamHelper                          
        DECA                                                              
        BNE        Jump_CopySpriteToRam                                   
        BRA        Jump_CopyNextAnimation                                 

Loop_FinishedCopyingSpritesToRam:                                        
        RTS                                                               

SpriteCopyInfo:                                                          
        .db        0xA                                                    ; The number of sprites to copy
        .db        0x10                                                   ; the number of lines per sprite

PTR_PlayerSprite_Right_Stand_0xdcd6_dbc3:                                
        .dw        PlayerSprite_Right_Stand_0xdcd6                        ; address to player sprite data

PTR_SpriteData_ClonedDestination_0x3400_dbc5:                            
        .dw        SpriteData_ClonedDestination_0x3400                    ; copies of sprites along 4 bits

NextSpriteToCopy_Size:                                                   
        .db        0xA                                                    ; the number of sprites to copy
        .db        0x5                                                    ; the number of lines per sprite
        .dw        Player_CollisionMasks_0xde17                           ; unidentified sprite location
        .dw        Player_CollisionMasks_InRam_0x3b80                     ; copy destination
        .db        0x2                                                    ; the number of sprites to copy
        .db        0x8                                                    ; the number of lines per sprite
        .dw        BouncyBallSprite1_0xde7b                               
        .dw        BouncyBall_ClonedInRam_0x3dd8                          ; copy destination
        .db        0x2                                                    ; the number of sprites to copy
        .db        0x6                                                    ; the number of lines per sprite
        .dw        BirdSprite1_0xde9b                                     
        .dw        BirdSprite_ClonedInRam_0x3ee2                          ; copy destination
        .db        0xFF                                                   ; end marker
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

CopySpritesFromRomToRamHelper:                                           
        PSHS        U,B,A                                                 ; D -> 0x0a10
                                                                          ; X -> 0xdcd7
                                                                          ; Y -> 0x3400
        CLRA                                                              

LAB_dbdd:                                                                
        STD        ,--S                                                   
        PSHS        X,B,A                                                 

LAB_dbe1:                                                                
        CLR        0x2,Y                                                  
        LDD        ,X++                                                   

LAB_dbe5:                                                                
        TST        0x4,S                                                  
        BEQ        LAB_dbf5                                               
        LSRA                                                              
        RORB                                                              
        ROR        0x2,Y                                                  
        LSRA                                                              
        RORB                                                              
        ROR        0x2,Y                                                  
        DEC        0x4,S                                                  
        BRA        LAB_dbe5                                               

LAB_dbf5:                                                                
        STD        ,Y                                                     
        LEAY       0x3,Y                                                  
        LDA        ,S                                                     
        STA        0x4,S                                                  
        DEC        0x5,S                                                  
        BNE        LAB_dbe1                                               
        PULS        A,B,X,U                                               
        INCA                                                              
        CMPA       #0x4                                                   
        BNE        LAB_dbdd                                               
        LSLB                                                              
        ABX                                                               
        PULS        A,B,U,PC                                              

Jump_PlayerOutOfLives:                                                   
        PULS        X                                                     
        LDA        <CurrentNumberOfPlayers_0x50                           
        ANDA       #0x2                                                   
        LBEQ       LAB_c06b                                               
        DEC        <CurrentNumberOfPlayers_0x50                           ; one of the players lost all their lives
        TFR         Y,D                                                   
        PSHS        X,B,A                                                 
        JMP        LAB_c610                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

GenerateRandomNumberFrom0ToB:                                            
        PSHS        X,A                                                   
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

LAB_dc2f:                                                                
        BSR        IncrementRomAddressCounter                             
        ANDB       <SomeValue_RelatedToDrops_0x64                         
        CMPB       <SomeValue_AlsoRelatedToDrops_0x65                     
        BHI        LAB_dc2f                                               
        PULS        A,X,PC                                                
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

IncrementRomAddressCounter:                                              
        PSHS        X                                                     
        LDX        <RomAddressCounter_0xc000to0xdf5a_0x61                 
        LEAX       0x1,X                                                  
        CMPX       #EndOfGameRom                                          ; count until this address
        BCS        Jump_NotReachedLimit                                   
        LDX        #CartridgeRomStart                                     

Jump_NotReachedLimit:                                                    
        STX        <RomAddressCounter_0xc000to0xdf5a_0x61                 
        LDB        ,X                                                     
        PULS        X,PC                                                  
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

InterruptHandler:                                                        
        LDA        PIA0_B_DATA_REG__FF02                                  ; get keyboard state
        INC        <InterruptHasBeenHitCounter_0x14                       
        INC        <InterruptHitCount                                     
        RTI                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

SetupJoystickBits_Maybe:                                                 
        LDU        #PIA0_A_CONTROL_REG__FF01                              ; setup left joystick maybe
        BSR        ResetJoystickAxisBit_Maybe                             
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

ResetJoystickAxisBit_Maybe:                                              
        LDA        ,U                                                     
        ANDA       #11110111b                                             ; reset bit for joystick X
        LSRB                                                              
        BCC        Jump_StoreToA                                          
        ORA        #00001000b                                             ; actually we want Joystick Y

Jump_StoreToA:                                                           
        STA        ,U++                                                   ; store the value and
                                                                          ; move to the right joystick register at FF03
        RTS                                                               
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

UpdateJoystick_Maybe:                                                    
        BSR        DisableSound                                           
        LDX        #InterruptHasBeenHitCounter_0x14                       
        LDB        #0x1                                                   

LAB_dc6d:                                                                
        STB        <SomeTickTockValue_0x10                                
        LDA        <CurrentPlayer_0x52                                    
        ANDA       #0x2                                                   
        PSHS        A                                                     
        ADDB       ,S+                                                    
        BSR        SetupJoystickBits_Maybe                                
        LDD        #0x4080                                                

LAB_dc7c:                                                                
        STA        <SomeCounter_0x11                                      
        ORB        #00000010b                                             
        STB        PIA1_A_DATA_REG__FF20                                  
        EORB       #00000010b                                             
        LDA        PIA0_A_DATA_REG__FF00                                  
        BMI        LAB_dc8d                                               
        SUBB       <SomeCounter_0x11                                      
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xdb11 which does nothing. 

LAB_dc8d:                                                                
        ADDB       <0x11                                                  

LAB_dc8f:                                                                
        LDA        <SomeCounter_0x11                                      
        LSRA                                                              
        CMPA       #0x1                                                   
        BNE        LAB_dc7c                                               
        STB        ,-X                                                    
        LDB        <SomeTickTockValue_0x10                                
        DECB                                                              
        BPL        LAB_dc6d                                               
        LDD        ,X                                                     
        CLR        <Player_JoystickDirection_0x15                         
        LSRB                                                              
        LSRB                                                              
        BEQ        Jump_GoingUp                                           
        CMPB       #0x3f                                                  
        BNE        LAB_dcb0                                               
        LDB        #0x3                                                   
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0xc601 which does nothing. 

Jump_GoingUp:                                                            
        LDB        #0x1                                                   

LAB_dcae:                                                                
        STB        <Player_JoystickDirection_0x15                         

LAB_dcb0:                                                                
        LSRA                                                              
        LSRA                                                              
        BEQ        Jump_JoystickGoingLeft                                 
        CMPA       #0x3f                                                  
        BNE        LAB_dcbf                                               
        LDA        #0x2                                                   
        .db        0x8C                                                   ; When PC reaches here this byte and the next two are 
                                                                          ; interpeted as CMPX #0x8604 which does nothing. 

Jump_JoystickGoingLeft:                                                  
        LDA        #0x4                                                   

LAB_dcbd:                                                                
        STA        <Player_JoystickDirection_0x15                         

LAB_dcbf:                                                                
        LDA        #00000010b                                             
        STA        PIA1_A_DATA_REG__FF20                                  
        CLRB                                                              
        BSR        SetupJoystickBits_Maybe                                
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

EnableSound:                                                             
        LDA        PIA1_B_CONTROL_REG__FF23                               
        ORA        #00001000b                                             
        BRA        JUMP_dcd3_Set_PIA1_B_CONTROL_REG                       
;**************************************************************
;*                          FUNCTION                          *
;**************************************************************

DisableSound:                                                            
        LDA        PIA1_B_CONTROL_REG__FF23                               
        ANDA       #11110111b                                             

JUMP_dcd3_Set_PIA1_B_CONTROL_REG:                                        
        STA        PIA1_B_CONTROL_REG__FF23                               
        RTS                                                               

PlayerSprite_Right_Stand_0xdcd6:                                         
        .dw        0000101010000000b                                      ; 0000101010000000b
        .dw        0010101010100000b                                      ; 0010101010100000b
        .dw        0001010111000000b                                      
        .dw        0010110110100000b                                      
        .dw        0010110111010000b                                      
        .dw        0001011110100000b                                      
        .dw        0000111111100000b                                      
        .dw        0001101010000000b                                      
        .dw        0001101011000000b                                      
        .dw        0001101010000000b                                      
        .dw        0001111110000000b                                      
        .dw        0000111110000000b                                      
        .dw        0000101011000000b                                      
        .dw        0000101010000000b                                      
        .dw        0000111111000000b                                      
        .dw        0000111111100000b                                      

PlayerSprite_Right_Run0_0xdcf7:                                          
        .dw        0000101010000000b                                      
        .dw        0010101010100000b                                      
        .dw        0001010111000000b                                      
        .dw        0010110110100000b                                      
        .dw        0010110111010000b                                      
        .dw        0001011110100000b                                      
        .dw        0000111111100000b                                      
        .dw        0000101010000000b                                      
        .dw        0011101011011000b                                      
        .dw        0111101011111000b                                      
        .dw        0110101011111000b                                      
        .dw        0000101010101000b                                      
        .dw        0000101010101000b                                      
        .dw        0010101000111000b                                      
        .dw        0110101000111000b                                      
        .dw        0110000000000000b                                      

PlayerSprite_Right_Run1_Jump_0xdd17:                                     
        .dw        0000000000000000b                                      
        .dw        0000101010000000b                                      
        .dw        0010101010100000b                                      
        .dw        0001010111000000b                                      
        .dw        0010110110100000b                                      
        .dw        0010110111010000b                                      
        .dw        0001011110100000b                                      
        .dw        0000111111100110b                                      
        .dw        1111101011111110b                                      
        .dw        1111101011111110b                                      
        .dw        0000101010100000b                                      
        .dw        0000101010101010b                                      
        .dw        0011101010101110b                                      
        .dw        0110101000001110b                                      
        .dw        0110000000000000b                                      
        .dw        0000000000000000b                                      

PlayerSprite_Right_Run2_0xdd37:                                          
        .dw        0000101010000000b                                      
        .dw        0010101010100000b                                      
        .dw        0001010111000000b                                      
        .dw        0010110110100000b                                      
        .dw        0010110111010000b                                      
        .dw        0001011110100000b                                      
        .dw        0000111111100000b                                      
        .dw        0000101010000000b                                      
        .dw        0111101011011000b                                      
        .dw        0111101011111000b                                      
        .dw        0110101011110000b                                      
        .dw        0000101010100000b                                      
        .dw        0110101010100000b                                      
        .dw        0110100001010000b                                      
        .dw        0110000001110000b                                      
        .dw        0000000000111000b                                      

PlayerSprite_Right_Climb_0xdd57:                                         
        .dw        0000101011000000b                                      
        .dw        0001101010110000b                                      
        .dw        0001010101011000b                                      
        .dw        0011010101011000b                                      
        .dw        0011010101011000b                                      
        .dw        0001010101011000b                                      
        .dw        0011010110111000b                                      
        .dw        0110101010110000b                                      
        .dw        1110101010100000b                                      
        .dw        0110101010100000b                                      
        .dw        0010101010100000b                                      
        .dw        0010101010100000b                                      
        .dw        0010100010100000b                                      
        .dw        0001110010100000b                                      
        .dw        0000000010100000b                                      
        .dw        0000000111000000b                                      

PlayerSprite_Left_Climb_0xdd77:                                          
        .dw        0001101010000000b                                      
        .dw        0110101011000000b                                      
        .dw        1101010101000000b                                      
        .dw        1101010101100000b                                      
        .dw        1101010101100000b                                      
        .dw        1101010101000000b                                      
        .dw        1110101011100000b                                      
        .dw        0110101010110000b                                      
        .dw        0010101010111000b                                      
        .dw        0010101010110000b                                      
        .dw        0010101010100000b                                      
        .dw        0010101010100000b                                      
        .dw        0010100010100000b                                      
        .dw        0010100111000000b                                      
        .dw        0010100000000000b                                      
        .dw        0001110000000000b                                      

PlayerSprite_Left_Stand_0xdd97:                                          
        .dw        0000001010100000b                                      
        .dw        0000101010101000b                                      
        .dw        0000011101010000b                                      
        .dw        0000101101101000b                                      
        .dw        0001011101101000b                                      
        .dw        0000101111010000b                                      
        .dw        0000111111100000b                                      
        .dw        0000001010110000b                                      
        .dw        0000011010110000b                                      
        .dw        0000001010110000b                                      
        .dw        0000001111110000b                                      
        .dw        0000001111100000b                                      
        .dw        0000011010100000b                                      
        .dw        0000001010100000b                                      
        .dw        0000011111100000b                                      
        .dw        0000111111100000b                                      

PlayerSprite_Left_Run0_0xddb7:                                           
        .dw        0000001010100000b                                      
        .dw        0000101010101000b                                      
        .dw        0000011101010000b                                      
        .dw        0000101101101000b                                      
        .dw        0001011101101000b                                      
        .dw        0000101111010000b                                      
        .dw        0000111111110000b                                      
        .dw        0000001010100000b                                      
        .dw        0001101010111100b                                      
        .dw        0001111010110111b                                      
        .dw        0001111010100110b                                      
        .dw        0000101010100000b                                      
        .dw        0000101010100000b                                      
        .dw        0001110010101110b                                      
        .dw        0001110010101110b                                      
        .dw        0000000000000110b                                      

PlayerSprite_Left_Run1_Jump_0xddd7:                                      
        .dw        0000000000000000b                                      
        .dw        0000001010100000b                                      
        .dw        0000101010101000b                                      
        .dw        0000011101010000b                                      
        .dw        0000101101101000b                                      
        .dw        0001011101101000b                                      
        .dw        0000101111010000b                                      
        .dw        0110111111100000b                                      
        .dw        0111111010111111b                                      
        .dw        0111111010111111b                                      
        .dw        0000101010100000b                                      
        .dw        0110101010100000b                                      
        .dw        0111101010101110b                                      
        .dw        0111100010101110b                                      
        .dw        0000000000000110b                                      
        .dw        0000000000000000b                                      

PlayerSprite_Left_Run2_0xddf7:                                           
        .dw        0000001010100000b                                      
        .dw        0000101010101000b                                      
        .dw        0000011101010000b                                      
        .dw        0000101101101000b                                      
        .dw        0001011101101000b                                      
        .dw        0000101111010000b                                      
        .dw        0000111111100000b                                      
        .dw        0000001010100000b                                      
        .dw        0001101010111110b                                      
        .dw        0001111010111110b                                      
        .dw        0001111010100110b                                      
        .dw        0000101010100000b                                      
        .dw        0000101010101110b                                      
        .dw        0000100010101110b                                      
        .dw        0001110000000110b                                      
        .dw        0001110000000000b                                      

;There is one collision mask per player sprite
;each collision mask sprite is 5 pixels tall
;player facing right

Player_CollisionMasks_0xde17:                                            
        .dw        0011111111110000b                                      
        .dw        0011111111110000b                                      
        .dw        0011111111000000b                                      
        .dw        0011111111000000b                                      
        .dw        0000111111000000b                                      
        .dw        0011111111110000b                                      
        .dw        0011111111110000b                                      
        .dw        0000111111000000b                                      
        .dw        0110111111111000b                                      
        .dw        0011111100111000b                                      
        .dw        0000111111000000b                                      
        .dw        0011111111110000b                                      
        .dw        0000111111110110b                                      
        .dw        0000111111110000b                                      
        .dw        0111111100001110b                                      
        .dw        0011111111110000b                                      
        .dw        0011111111110000b                                      
        .dw        0000111111000000b                                      
        .dw        0110111111110000b                                      
        .dw        0110110001110000b                                      

;player climbing
        .dw        0011111111110000b                                      
        .dw        0011111111111100b                                      
        .dw        1111111111110000b                                      
        .dw        0011111111110000b                                      
        .dw        0011110011110000b                                      
        .dw        1111111111000000b                                      
        .dw        1111111111110000b                                      
        .dw        1111111111110000b                                      
        .dw        0011111111110000b                                      
        .dw        0011111111000000b                                      

;player facing left
        .dw        0000111111111100b                                      
        .dw        0001111111111000b                                      
        .dw        0000001111110000b                                      
        .dw        0000001111110000b                                      
        .dw        0000001111110000b                                      
        .dw        0000111111111000b                                      
        .dw        0001111111111000b                                      
        .dw        0000001111110000b                                      
        .dw        0001111111110110b                                      
        .dw        0001110011111110b                                      
        .dw        0000001111110000b                                      
        .dw        0000111111111000b                                      
        .dw        0110111111110000b                                      
        .dw        0000111111110000b                                      
        .dw        0111110011111110b                                      
        .dw        0000111111111000b                                      
        .dw        0001111111111000b                                      
        .dw        0000001111110000b                                      
        .dw        0001111111110110b                                      
        .dw        0000110011111110b                                      

BouncyBallSprite1_0xde7b:                                                
        .dw        0000000100000000b                                      
        .dw        0000010101000000b                                      
        .dw        0000110101100000b                                      
        .dw        0001010101010000b                                      
        .dw        0001010101010000b                                      
        .dw        0000110101100000b                                      
        .dw        0000010101000000b                                      
        .dw        0000000100000000b                                      

BouncyBallSprite2_0xde8b:                                                
        .dw        0000000000000000b                                      
        .dw        0000000000000000b                                      
        .dw        0000010101000000b                                      
        .dw        0011010101011000b                                      
        .dw        0101010101010100b                                      
        .dw        0101010101010100b                                      
        .dw        0011010101011000b                                      
        .dw        0000010101000000b                                      

BirdSprite1_0xde9b:                                                      
        .dw        1100000110000011b                                      
        .dw        1111001111001111b                                      
        .dw        0011111111111100b                                      
        .dw        0000111111110000b                                      
        .dw        0000001111000000b                                      
        .dw        0000000110000000b                                      

BirdSprite2:                                                             
        .dw        0000000110000000b                                      
        .dw        0000001111000000b                                      
        .dw        0000111111110000b                                      
        .dw        0011111111111100b                                      
        .dw        1111001111001111b                                      
        .dw        1100000110000011b                                      

PickupSpriteData:                                                        

MoneyBagSprite:                                                          
        .dw        0001000100010000b                                      
        .dw        0001111011100100b                                      
        .dw        0000101011011000b                                      
        .dw        0000011111110000b                                      
        .dw        0000110101101100b                                      
        .dw        0001101010110010b                                      
        .dw        0011101010111000b                                      
        .dw        0011101010111000b                                      
        .dw        0011101010111000b                                      
        .dw        0001111111110000b                                      

DiamondSprite:                                                           
        .dw        0000001010000000b                                      
        .dw        0010101010101000b                                      
        .dw        1010101010101010b                                      
        .dw        1010101010101010b                                      
        .dw        0010101010101000b                                      
        .dw        0010101010101000b                                      
        .dw        0000101010100000b                                      
        .dw        0000101010100000b                                      
        .dw        0000001010000000b                                      
        .dw        0000001010000000b                                      

KeySprite:                                                               
        .dw        0000000000000000b                                      
        .dw        0010000000000000b                                      
        .dw        0010100000000000b                                      
        .dw        1000100000000000b                                      
        .dw        1000101101010101b                                      
        .dw        1000101010101010b                                      
        .dw        1000101101010101b                                      
        .dw        1000100000110011b                                      
        .dw        0010100000110011b                                      
        .dw        0010000000000000b                                      

;Unlike the other sprites, this is 3 bytes per line
;for 9 lines.

PlayerSplatSprite_1:                                                     

PlayerSplatSprite:                                                       
        .dw        0000010000000000b                                      
        .dw        0000000000000011b                                      
        .dw        0000011100000000b                                      
        .dw        0011000100000110b                                      
        .dw        0000000000011000b                                      
        .dw        0000010011000000b                                      
        .dw        0000100101010000b                                      
        .dw        1000000000000101b                                      
        .dw        0101010000000000b                                      
        .dw        0001011001011100b                                      
        .dw        0000000000111001b                                      
        .dw        0101010100000000b                                      
        .dw        1101101010101011b                                      
        .db        11000000b                                              

Data_DoorSprite_0xdf0a:                                                  
        .dw        0010101010000000b                                      

WORD_df0c:                                                               
        .dw        1010101010100000b                                      
        .dw        1010111110100000b                                      
        .dw        1011010111100000b                                      
        .dw        1010111110100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010010110100000b                                      
        .dw        1001101001100000b                                      
        .dw        1001101001100000b                                      
        .dw        1010010110100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010101010100000b                                      
        .dw        1010101010100000b                                      

Data_DropSprites_0xdf2a:                                                 
        .dw        0000000000000000b                                      ; why four different drops?
        .dw        0100000000000000b                                      
        .dw        0110000000000000b                                      
        .dw        1111000000000000b                                      
        .dw        1111000000000000b                                      
        .dw        0110000000000000b                                      
        .dw        0000000000000000b                                      
        .dw        0001000000000000b                                      
        .dw        0001100000000000b                                      
        .dw        0011110000000000b                                      
        .dw        0011110000000000b                                      
        .dw        0001100000000000b                                      
        .dw        0000000000000000b                                      
        .dw        0000010000000000b                                      
        .dw        0000011000000000b                                      
        .dw        0000111100000000b                                      
        .dw        0000111100000000b                                      
        .dw        0000011000000000b                                      
        .dw        0000000000000000b                                      
        .dw        0000000100000000b                                      
        .dw        0000000110000000b                                      
        .dw        0000001111000000b                                      
        .dw        0000001111000000b                                      
        .dw        0000000110000000b                                      

EndOfGameRom:                                                            
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x00                                                   
        .db        0xFE                                                   
        .db        0x01                                                   
        .db        0xFF                                                   
        .db        0xF7                                                   
        .db        0xFF                                                   
