; wram.asm
SECTION "WRAM", wram0[$C000]

;$C000 through C087 - holds high score data at high score screen?

; $c0c0 through $c09f
; stores a buffer of OAM objects (sprites) and their attributes
SECTION "wOamBuffer", wram0[$c0c0]
; tetris block data struct?

SECTION "Block", wram0[$C0C2]

; c0c2 \
; Column (X) position of the current active block \
; From 01 to 08, left to right \
; Starts at 5
wBlockColumnIndex:: ds 1

; c0c3 \
; Row (Y) position of the current active block \
; From 01 to 0F, top to bottom \
; Starts at 1
wBlockRowIndex:: ds 1

; c0c4 \
; 1 of possible 4 block orientations, 00 through 03. \
; Each block type always has 4 separate indexes, even if it has\
; less than 4 possible orientations. Even square blocks.
wBlockRotationindex: ds 1

SECTION "Unknown_C0FD", wram0[$C0FD]
; c0fd \
; Current level (observed on classic tetris mode)
wCurrentLevel:: ds 1

; c0fe \
; Value of the level ticker that determines when level increases \
; Has a visual representation of left/right of play field in classic tetris
wLevelTicker:: ds 1

; Ticks up and overflows in a loop during classic tetris mode
wUnknown_C0FF:: ds 1


SECTION "Unkown_C5A0", wram0[$C5A0] ; Looks like a block of game state trackers
                                    ; in order from main state to sub states
wUnknown_c5a0:: ds 1 ; ?

; Main game engine state - \
; 0 on credits screen \
; 1 on title screen \
; 2 on select mode \
; 3 while playing classic tetris \
; 4 during high score screen \
; 5 during puzzle mode \
; 6 during puzzle mode game over \
; 7 during vs mode \
; 8 during edit mode
wGameState:: ds 1

wUnknown_c5a2:: ds 1 ; probably a sub-state (state of current wGameState)
wUnknown_c5a3:: ds 1 ; ? Loops from 0 to overflow infinitely at title screen
                     ; tracks which page you're on while scrolling the high score screen

SECTION "Unknown_C5A8", wram0[$C5A8]
wUnknown_c5a8:: ds 1 ; changes value depending on game mode highlighted on select screen
                     ; 0 - classic
                     ; 1 - puzzle
                     ; 2 - vs
                     ; 3 - edit
                     ; 4 - option
                     ; needs a good name. is it used elsewhere?

SECTION "Unknown_C5C9", wram0[$c5c9]
wDMAReady:: ds 1 ; c5c9 is likely a half-byte flag signifying if the DMA routine has been
                 ; copied to wram

SECTION "Unknown_C5F0", wram0[$C5F0]

SECTION "Score", wram0[$C5F3]

; c5f3
; Current score in bas 10 (in classic tetris) - up to 100,000s place \
; Caps out a 999,999 and stops counting there
wScore_HundredThousandsPlace:: ds 1

; c5f4
; Current score in base 10 (in classic tetris) - up to 1000s place
wScore_HundredsPlace:: ds 1

; c5f5
; Current score in base 10 (in classic tetris) - up to 10s place
wScore_TensPlace:: ds 1

