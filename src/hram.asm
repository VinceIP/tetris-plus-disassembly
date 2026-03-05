SECTION "HRAM", hram[$FF80]

SECTION "Input", hram[$FF8C]

; Keeps track of inputs being held down. Inputs correspond to the following values: \
; RIGHT - $10   A   - $01 \
; LEFT  - $20   B   - $02 \
; UP    - $40   SEL - $04 \
; DOWN  - $80   START - $08 \
; Input values are additive. \
; ex: Right and left held down = $30 \
;     A and B held down = $03
hInputHeld:: ds 1

; Same as hInputHeld, but value is only tracked on the frame the input was pressed. \
; Gets cleared to 0 on the next frame
hInputPressed:: ds 1 