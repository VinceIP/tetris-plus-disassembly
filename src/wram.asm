; wram.asm
SECTION "WRAM", wram0[$C000]

SECTION "Unkown_C5A0", wram0[$C5A0] ; Looks like a block of game state trackers
                                    ; in order from main state to sub states
wUnknown_c5a0:: ds 1 ; ?

wUnknown_c5a1:: ds 1 ; 0 on credits screen
                     ; 1 on title screen
                     ; 2 on select mode
                     ; 3 while playing classic tetris
                     ; 4 during classic tetris high score screen

wUnknown_c5a2:: ds 1 ; ?
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