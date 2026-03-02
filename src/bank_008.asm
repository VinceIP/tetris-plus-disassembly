; Disassembly of "Tetris Plus (USA, Europe) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v3.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

    ld d, b
    ld b, c

    db $50, $41, $5d, $41, $61, $41, $6d, $41

    ld [hl], b
    ld b, c
    ld [hl], h
    ld b, c
    ld a, b
    ld b, c
    ld a, b
    ld b, c
    add e
    ld b, c
    adc [hl]
    ld b, c
    sbc c
    ld b, c
    and h
    ld b, c
    pop bc
    ld b, c
    adc $41
    sub h
    ld b, d

    db $e5, $42, $ef, $42, $f9, $42, $03, $43, $0d, $43, $17, $43, $4e, $43, $51, $43

    ld d, h
    ld b, e
    ld d, a
    ld b, e
    ld e, d
    ld b, e
    ld e, l
    ld b, e

    db $60, $43, $63, $43

    ld h, [hl]
    ld b, e
    ld l, c
    ld b, e

    db $6c, $43, $11, $44, $24, $45, $0f, $46, $68, $47

    adc h
    ld c, b

    db $b3, $49, $bf, $4a, $13, $4c

    bit 1, h
    pop de
    ld c, l
    ld d, b
    ld c, [hl]

    db $88, $4e

    ld b, a
    ld c, a
    rlca
    ld d, b

    db $30, $51

    sub h
    ld d, c
    nop
    ld d, d
    adc [hl]
    ld d, d
    add hl, de
    ld d, e
    sub b
    ld d, e
    ld l, e
    ld d, h
    ldh a, [rHDMA4]
    ld [hl], e
    ld d, l

    db $83, $56

    ld c, $57
    adc c
    ld d, a
    rlca
    ld e, b
    add e
    ld e, b
    or $58

    db $70, $59

    push bc
    ld e, d
    db $db
    ld e, d
    ld hl, sp+$5a
    dec d
    ld e, e
    ld [hl-], a
    ld e, e

    db $3f, $5b, $07, $5c

    xor c
    ld e, h

    db $e0, $5c, $14, $5d

    jr nz, jr_008_40f1

    inc l
    ld e, l
    jr c, jr_008_40f5

    ld b, h
    ld e, l
    ld d, b
    ld e, l
    halt
    ld e, l
    db $dd
    ld e, l

    db $f6, $5e, $fe, $5e, $06, $5f, $0e, $5f, $16, $5f, $1e, $5f, $26, $5f, $2e, $5f
    db $36, $5f, $3e, $5f, $46, $5f

    ld c, e
    ld e, a

    db $50, $5f

    sub c
    ld h, b
    cp c
    ld h, b
    cp c
    ld h, b

    db $b9, $60, $cf, $60, $d4, $60, $d9, $60, $de, $60, $e3, $60, $e8, $60, $ed, $60
    db $f2, $60, $f7, $60, $fc, $60

    ld bc, $0161
    ld h, c
    ld bc, $0161
    ld h, c
    ld bc, $0161
    ld h, c
    ld b, l
    ld h, c
    ld l, b
    ld h, c
    ld l, a
    ld h, c
    halt
    ld h, c
    ld a, l
    ld h, c
    add h
    ld h, c
    sbc l
    ld h, c
    xor b

jr_008_40f1:
    ld h, c
    xor a
    ld h, c
    cp c

jr_008_40f5:
    ld h, c
    add $61
    db $e3
    ld h, c
    ldh a, [$ff61]
    ldh a, [$ff61]
    ldh a, [$ff61]

    db $f0, $61

    db $fd
    ld h, c

    db $02, $62

    rlca
    ld h, d
    inc c
    ld h, d
    ld de, $1662
    ld h, d
    dec de
    ld h, d
    jr nz, jr_008_4174

    dec h
    ld h, d
    ld a, [hl+]
    ld h, d

    db $2f, $62

    ld a, $62
    ld a, $62
    ld a, $62
    ld a, $62
    ld a, $62
    rst $10
    ld h, d
    ld [hl], b
    ld h, e
    ld de, $aa64
    ld h, h
    ld b, e
    ld h, l
    call c, Call_008_7565
    ld h, [hl]
    ld c, $67
    and a
    ld h, a
    ld b, b
    ld l, b
    reti


    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b

    db $db, $68, $e7, $68, $f3, $68, $ff, $68, $0b, $69, $17, $69

    inc hl
    ld l, c
    inc hl
    ld l, c

    db $00, $9a, $9c, $8f, $9d, $9d, $00, $9d, $9e, $8b, $9c, $9e, $ff, $02, $0b, $00
    db $ff, $00, $91, $8b, $97, $8f, $fe, $99, $a0, $8f, $9c, $fe, $ff, $00, $f4, $ff

    ld [bc], a
    inc d
    nop
    rst $38

jr_008_4174:
    inc bc
    ld [$ff00], sp
    nop
    add b
    add b
    adc a
    adc e
    sbc l
    and e
    add b
    add b
    add b
    rst $38
    nop
    add b
    sbc b
    sbc c
    sbc h
    sub a
    adc e
    sub [hl]
    add b
    add b
    rst $38
    nop
    add b
    add b
    sub d
    adc e
    sbc h
    adc [hl]
    add b
    add b
    add b
    rst $38
    nop
    and b
    adc a
    sbc h
    and e
    add b
    sub d
    adc e
    sbc h
    adc [hl]
    rst $38
    nop
    cp h
    cp l
    cp l
    cp l
    cp l
    cp [hl]
    cp $bf
    sbc [hl]
    adc a
    sbc l
    sbc [hl]
    ret nz

    cp $bf
    sbc d
    sub [hl]
    adc e
    and e
    ret nz

    cp $c1
    jp nz, $c2c2

    jp nz, $ffc3

    ld [bc], a
    inc b
    nop
    cp $04
    nop
    cp $04
    nop
    cp $04
    nop
    rst $38
    ld bc, $b180
    ld c, a
    or d
    nop
    or e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    ld bc, $80b4
    add b
    or l
    ld c, e
    or [hl]
    ld [bc], a
    ld hl, sp-$80
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld c, $b4
    add b
    cp h
    add b
    adc a
    sbc h
    adc e
    sbc l
    adc a
    add b
    adc [hl]
    adc e
    sbc [hl]
    adc e
    rst $30
    ld b, b
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld b, c
    add b
    ld [bc], a
    and e
    adc a
    sbc l
    ld b, c
    add b
    add b
    sbc b
    ld b, c
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld bc, $80b4
    add b
    adc $4b
    rst $08
    ld [bc], a
    ld sp, hl
    add b
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    add b
    add sp, $4f
    jp hl


    nop
    ld [$004a], a
    rst $38
    ld bc, $007f
    ld a, a
    nop
    ld a, l
    nop
    add b
    ld b, b
    ld c, l
    ld b, c
    nop
    ld b, d
    ld c, h
    nop
    inc c
    ld b, e
    adc [hl]
    adc e
    sbc [hl]
    adc e
    nop
    sbc a
    sbc b
    adc e
    and b
    adc e
    sub e
    sub [hl]
    add b
    adc e
    ld [bc], a
    sub [hl]
    adc a
    ld b, h
    ld c, h
    nop
    nop
    ld b, e
    ld c, [hl]
    nop
    nop
    ld b, h
    ld c, h
    nop
    dec c
    ld b, e
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    sub e
    sbc b
    sub c
    nop
    adc [hl]
    adc e
    sbc [hl]
    adc e
    ld b, c
    nop
    nop
    ld b, h
    ld c, h
    nop
    add b
    ld h, a
    ld c, l
    ld l, b
    nop
    ld l, c
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld l, b
    nop
    rst $38

    db $00, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ff, $00, $af, $9a, $9f, $a4, $a4
    db $96, $8f, $af, $ff, $00, $af, $af, $af, $a0, $9d, $af, $af, $af, $ff, $00, $af
    db $af, $8f, $8e, $93, $9e, $af, $af, $ff, $00, $af, $99, $9a, $9e, $93, $99, $98
    db $af, $ff, $02, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14
    db $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00
    db $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe, $14, $00, $fe
    db $14, $00, $fe, $14, $00, $fe, $14, $00, $ff, $00, $eb, $ff, $00, $80, $ff

    nop
    add d
    rst $38
    nop
    add h
    rst $38
    nop
    add [hl]
    rst $38
    nop
    adc b
    rst $38

    db $00, $8b, $ff, $00, $8c, $ff

    nop
    xor [hl]
    rst $38
    nop
    db $dc
    rst $38

    db $01, $61, $00, $8a, $01, $52, $00, $8a, $0d, $52, $00, $87, $19, $00, $20, $80
    db $22, $4f, $00, $80, $24, $43, $25, $83, $26, $00, $00, $83, $2b, $01, $24, $30
    db $4a, $00, $80, $31, $43, $32, $8b, $33, $5b, $00, $80, $f2, $4b, $00, $80, $40
    db $4f, $41, $00, $42, $4a, $00, $00, $43, $48, $00, $83, $45, $41, $00, $00, $44
    db $4a, $00, $00, $43, $42, $00, $81, $4a, $41, $00, $82, $4d, $42, $00, $00, $44
    db $4a, $00, $00, $43, $42, $00, $82, $51, $41, $00, $81, $55, $42, $00, $00, $44
    db $4a, $00, $00, $43, $42, $00, $82, $58, $41, $00, $81, $5c, $42, $00, $00, $44
    db $4a, $00, $00, $43, $42, $5f, $82, $60, $41, $5f, $81, $64, $42, $5f, $00, $44
    db $4a, $00, $80, $67, $4f, $68, $00, $69, $7f, $00, $49, $00, $05, $96, $93, $8d
    db $8f, $98, $9d, $c0, $8f, $0b, $00, $9e, $99, $00, $98, $93, $98, $9e, $8f, $98
    db $8e, $99, $6a, $00, $ff, $01, $80, $b1, $4f, $b2, $00, $b3, $4a, $b0, $00, $b4
    db $41, $b0, $80, $b5, $47, $b6, $83, $b7, $4a, $b0, $00, $b4, $41, $b0, $82, $bc
    db $00, $be, $80, $c0, $42, $b0, $82, $c2, $00, $bb, $4a, $b0, $00, $b4, $41, $b0
    db $00, $bc, $80, $c6, $40, $c7, $80, $c8, $01, $97, $99, $80, $8e, $82, $ca, $00
    db $bb, $4a, $b0, $00, $b4, $41, $b0, $80, $ce, $47, $cf, $82, $d0, $00, $bb, $4a
    db $b0, $00, $b4, $40, $b0, $80, $b5, $48, $b6, $81, $d4, $01, $b0, $bb, $4a, $b0
    db $00, $b4, $40, $b0, $00, $bc, $8a, $00, $00, $d7, $40, $b0, $00, $bb, $4a, $b0
    db $00, $b4, $40, $b0, $00, $bc, $8a, $0c, $00, $d7, $40, $b0, $00, $bb, $4a, $b0
    db $03, $b4, $b0, $d8, $bc, $8a, $18, $03, $d7, $d9, $b0, $bb, $4a, $b0, $03, $b4
    db $b0, $da, $bc, $8a, $24, $03, $d7, $db, $b0, $bb, $4a, $b0, $03, $b4, $b0, $dc
    db $bc, $8a, $30, $03, $d7, $dd, $b0, $bb, $4a, $b0, $00, $b4, $40, $b0, $00, $bc
    db $8a, $3c, $00, $d7, $40, $b0, $00, $bb, $4a, $b0, $00, $b4, $40, $b0, $00, $bc
    db $8a, $48, $00, $d7, $40, $b0, $00, $bb, $4a, $b0, $00, $b4, $40, $b0, $80, $ce
    db $49, $cf, $00, $d0, $40, $b0, $00, $bb, $4a, $b0, $00, $b4, $81, $de, $00, $b0
    db $80, $b5, $45, $b6, $00, $e1, $42, $b0, $00, $bb, $4a, $b0, $00, $b4, $81, $e2
    db $01, $b0, $bc, $46, $b0, $00, $d7, $42, $b0, $00, $bb, $4a, $b0, $00, $b4, $81
    db $e5, $00, $b0, $80, $ce, $45, $cf, $00, $d0, $42, $b0, $00, $bb, $4a, $b0, $80
    db $e8, $4f, $e9, $00, $ea, $4a, $b0, $ff, $01, $c0, $01, $47, $00, $81, $01, $41
    db $03, $00, $04, $4c, $00, $c0, $01, $47, $00, $01, $01, $05, $42, $00, $00, $06
    db $4c, $00, $c0, $01, $47, $00, $01, $01, $05, $42, $00, $00, $07, $80, $03, $4a
    db $00, $c0, $01, $47, $00, $01, $01, $05, $44, $00, $00, $06, $4a, $00, $c0, $01
    db $47, $00, $01, $01, $05, $44, $00, $00, $06, $4a, $00, $c0, $01, $47, $00, $00
    db $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $c0, $01, $47, $00, $80, $01, $04
    db $9d, $8d, $99, $9c, $8f, $80, $03, $4a, $00, $c0, $01, $47, $00, $01, $01, $05
    db $44, $00, $00, $06, $4a, $00, $c0, $01, $47, $00, $00, $01, $80, $08, $43, $09
    db $00, $0a, $4a, $00, $c0, $01, $47, $00, $80, $01, $04, $96, $8f, $a0, $8f, $96
    db $80, $03, $4a, $00, $c0, $01, $47, $00, $01, $01, $05, $44, $00, $00, $06, $4a
    db $00, $c0, $01, $47, $00, $00, $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $c0
    db $01, $47, $00, $80, $01, $04, $96, $93, $98, $8f, $9d, $80, $03, $4a, $00, $c0
    db $01, $47, $00, $01, $01, $05, $44, $00, $00, $06, $4a, $00, $c0, $01, $47, $00
    db $00, $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $c0, $01, $47, $00, $c0, $01
    db $51, $00, $c0, $01, $47, $00, $c0, $01, $51, $00, $00, $01, $48, $0b, $c0, $01
    db $51, $00, $ff, $01, $c0, $01, $47, $00, $81, $01, $41, $03, $00, $04, $4c, $00
    db $c0, $01, $47, $00, $01, $01, $05, $42, $00, $00, $06, $4c, $00, $c0, $01, $47
    db $00, $01, $01, $05, $42, $00, $00, $07, $80, $03, $4a, $00, $c0, $01, $47, $00
    db $01, $01, $05, $44, $00, $00, $06, $4a, $00, $c0, $01, $47, $00, $01, $01, $05
    db $44, $00, $00, $06, $4a, $00, $c0, $01, $47, $00, $00, $01, $80, $08, $43, $09
    db $00, $0a, $4a, $00, $c0, $01, $47, $00, $c0, $01, $51, $00, $c0, $01, $47, $00
    db $06, $01, $03, $9d, $8d, $99, $9c, $8f, $40, $03, $4a, $00, $c0, $01, $47, $00
    db $c0, $01, $51, $00, $c0, $01, $47, $00, $00, $01, $46, $09, $4a, $00, $c0, $01
    db $47, $00, $c0, $01, $51, $00, $c0, $01, $47, $00, $c0, $01, $01, $8c, $8f, $80
    db $9d, $4d, $00, $c0, $01, $47, $00, $81, $01, $03, $9e, $93, $97, $8f, $80, $03
    db $4a, $00, $c0, $01, $47, $00, $01, $01, $05, $44, $00, $00, $06, $4a, $00, $c0
    db $01, $47, $00, $00, $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $c0, $01, $47
    db $00, $81, $01, $03, $9e, $93, $97, $8f, $80, $03, $4a, $00, $c0, $01, $47, $00
    db $01, $01, $05, $44, $00, $00, $06, $4a, $00, $00, $01, $41, $0b, $82, $0c, $41
    db $0b, $00, $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $c0, $01, $47, $00, $c0
    db $01, $51, $00, $c0, $01, $40, $00, $80, $02, $01, $03, $10, $41, $00, $81, $01
    db $43, $03, $00, $04, $4a, $00, $c0, $01, $40, $00, $00, $05, $81, $11, $41, $00
    db $01, $01, $05, $80, $9d, $04, $8b, $91, $8f, $00, $06, $4a, $00, $c0, $01, $40
    db $00, $00, $05, $80, $14, $00, $13, $41, $00, $08, $01, $05, $00, $8d, $96, $8f
    db $8b, $9c, $06, $4a, $00, $c0, $01, $40, $00, $00, $05, $80, $14, $00, $13, $41
    db $00, $00, $01, $80, $08, $43, $09, $00, $0a, $4a, $00, $00, $01, $48, $0b, $c0
    db $01, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $4d, $00, $ff, $01, $80, $02, $4f
    db $03, $00, $04, $4a, $00, $00, $05, $41, $00, $80, $02, $47, $03, $00, $04, $41
    db $00, $00, $06, $4a, $00, $00, $05, $41, $00, $02, $05, $a9, $ab, $40, $ad, $01
    db $af, $b1, $42, $00, $00, $06, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00
    db $02, $05, $aa, $ac, $40, $ae, $03, $b0, $b2, $97, $99, $80, $8e, $00, $06, $41
    db $00, $00, $06, $4a, $00, $00, $05, $41, $00, $80, $08, $47, $09, $00, $0a, $41
    db $00, $00, $06, $4a, $00, $00, $05, $43, $00, $80, $02, $43, $03, $00, $04, $43
    db $00, $00, $06, $4a, $00, $00, $05, $43, $00, $07, $05, $9d, $8f, $96, $8f, $8d
    db $9e, $06, $43, $00, $00, $06, $4a, $00, $00, $05, $43, $00, $80, $08, $43, $09
    db $00, $0a, $43, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $80, $02, $47, $03
    db $00, $04, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $00, $05, $48, $00
    db $00, $06, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $0b, $05, $00, $98
    db $8f, $a1, $00, $91, $8b, $97, $8f, $00, $06, $41, $00, $00, $06, $4a, $00, $00
    db $05, $41, $00, $00, $05, $48, $00, $00, $06, $41, $00, $00, $06, $4a, $00, $00
    db $05, $41, $00, $02, $05, $00, $8d, $c0, $99, $06, $9e, $93, $98, $9f, $8f, $00
    db $06, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $00, $05, $48, $00, $00
    db $06, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $80, $08, $47, $09, $00
    db $0a, $41, $00, $00, $06, $4a, $00, $00, $05, $50, $00, $00, $06, $4a, $00, $00
    db $05, $50, $00, $00, $06, $4a, $00, $80, $08, $4f, $09, $00, $0a, $4a, $00, $ff

    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [bc], a
    ld b, l
    inc bc
    nop
    inc b
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add hl, bc
    dec b
    sbc b
    adc a
    and c
    nop
    sub c
    adc e
    sub a
    adc a
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [$0945], sp
    nop
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    sbc l
    ld [bc], a
    adc e
    sub c
    adc a
    ld b, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld a, [bc]
    adc a
    sbc h
    adc e
    sbc l
    adc a
    nop
    adc [hl]
    adc e
    sbc [hl]
    adc e
    and [hl]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    ld [bc], a
    and e
    adc a
    sbc l
    ld b, d
    nop
    add b
    sbc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38

    db $01, $80, $b1, $4f, $b2, $00, $b3, $4a, $80, $00, $b4, $41, $80, $8a, $55, $41
    db $80, $00, $bb, $4a, $80, $00, $b4, $41, $80, $8a, $61, $41, $80, $00, $bb, $4a
    db $80, $00, $b4, $41, $80, $8a, $6d, $41, $80, $00, $bb, $4a, $80, $00, $b4, $40
    db $80, $03, $8c, $91, $97, $ad, $4a, $80, $00, $bb, $4a, $80, $00, $b4, $50, $80
    db $00, $bb, $4a, $80, $00, $b4, $40, $80, $00, $8c, $c0, $9f, $00, $9e, $c0, $99
    db $01, $80, $8d, $c0, $99, $02, $90, $93, $91, $41, $80, $00, $bb, $4a, $80, $00
    db $b4, $41, $80, $01, $9c, $93, $80, $91, $01, $9e, $80, $80, $9e, $02, $9c, $98
    db $ad, $42, $80, $00, $bb, $4a, $80, $00, $b4, $41, $80, $00, $96, $80, $8f, $01
    db $9e, $80, $80, $9e, $03, $9c, $98, $80, $ad, $42, $80, $00, $bb, $4a, $80, $00
    db $b4, $50, $80, $00, $bb, $4a, $80, $00, $b4, $40, $80, $07, $9d, $99, $9f, $98
    db $8e, $80, $9e, $8f, $80, $9d, $44, $80, $00, $bb, $4a, $80, $00, $b4, $46, $80
    db $03, $8c, $91, $97, $ad, $44, $80, $00, $bb, $4a, $80, $00, $b4, $46, $80, $03
    db $9d, $8f, $80, $ad, $44, $80, $00, $bb, $4a, $80, $00, $b4, $50, $80, $00, $bb
    db $4a, $80, $00, $b4, $40, $80, $06, $8d, $96, $8f, $8b, $9c, $80, $8b, $40, $96
    db $04, $80, $8e, $8b, $9e, $8b, $40, $80, $00, $bb, $4a, $80, $00, $b4, $50, $80
    db $00, $bb, $4a, $80, $00, $b4, $40, $80, $03, $8f, $a2, $93, $9e, $4a, $80, $00
    db $bb, $4a, $80, $80, $e8, $4f, $e9, $00, $ea, $4a, $80, $ff, $01, $80, $02, $4f
    db $03, $00, $04, $4a, $00, $00, $05, $42, $00, $80, $02, $45, $03, $00, $04, $42
    db $00, $00, $06, $4a, $00, $00, $05, $42, $00, $09, $05, $b3, $b5, $b1, $b7, $b9
    db $ab, $b5, $b1, $06, $42, $00, $00, $06, $4a, $00, $00, $05, $42, $00, $09, $05
    db $b4, $b6, $b2, $b8, $ba, $ac, $b6, $b2, $06, $42, $00, $00, $06, $4a, $00, $00
    db $05, $42, $00, $80, $08, $45, $09, $00, $0a, $42, $00, $00, $06, $4a, $00, $01
    db $05, $00, $80, $02, $80, $03, $80, $02, $80, $03, $80, $02, $80, $03, $80, $02
    db $80, $03, $01, $00, $06, $4a, $00, $02, $05, $00, $05, $40, $00, $c0, $06, $40
    db $00, $c0, $06, $40, $00, $c0, $06, $40, $00, $02, $06, $00, $06, $4a, $00, $02
    db $05, $00, $05, $40, $00, $c0, $06, $40, $00, $c0, $06, $40, $00, $c0, $06, $40
    db $00, $02, $06, $00, $06, $4a, $00, $01, $05, $00, $80, $08, $80, $09, $80, $08
    db $80, $09, $80, $08, $80, $09, $80, $08, $80, $09, $01, $00, $06, $4a, $00, $01
    db $05, $00, $80, $02, $80, $03, $80, $02, $80, $03, $80, $02, $80, $03, $43, $00
    db $00, $06, $4a, $00, $02, $05, $00, $05, $40, $00, $c0, $06, $40, $00, $c0, $06
    db $40, $00, $00, $06, $43, $00, $00, $06, $4a, $00, $02, $05, $00, $05, $40, $00
    db $c0, $06, $40, $00, $c0, $06, $40, $00, $00, $06, $43, $00, $00, $06, $4a, $00
    db $01, $05, $00, $80, $08, $80, $09, $80, $08, $80, $09, $80, $08, $80, $09, $43
    db $00, $00, $06, $4a, $00, $00, $05, $44, $00, $80, $02, $41, $03, $00, $04, $44
    db $00, $00, $06, $4a, $00, $00, $05, $44, $00, $05, $05, $91, $8b, $97, $8f, $06
    db $44, $00, $00, $06, $4a, $00, $00, $05, $44, $00, $05, $05, $99, $a0, $8f, $9c
    db $06, $44, $00, $00, $06, $4a, $00, $00, $05, $44, $00, $80, $08, $41, $09, $00
    db $0a, $44, $00, $00, $06, $4a, $00, $80, $08, $4f, $09, $00, $0a, $4a, $00, $ff
    db $01, $7f, $00, $7d, $00, $80, $02, $44, $03, $00, $04, $55, $00, $03, $05, $8d
    db $96, $8b, $40, $9d, $02, $93, $8d, $06, $55, $00, $80, $08, $44, $09, $00, $0a
    db $56, $00, $00, $82, $4c, $00, $00, $9a, $c0, $9e, $4d, $00, $04, $96, $8f, $a0
    db $8f, $96, $43, $00, $03, $96, $93, $98, $8f, $6f, $00, $00, $83, $4c, $00, $00
    db $9a, $c0, $9e, $4d, $00, $04, $96, $8f, $a0, $8f, $96, $43, $00, $03, $96, $93
    db $98, $8f, $6f, $00, $00, $84, $4c, $00, $00, $9a, $c0, $9e, $4d, $00, $04, $96
    db $8f, $a0, $8f, $96, $43, $00, $03, $96, $93, $98, $8f, $7f, $00, $7f, $00, $6c
    db $00, $80, $02, $43, $03, $00, $04, $56, $00, $02, $05, $9a, $9f, $40, $a4, $02
    db $96, $8f, $06, $56, $00, $80, $08, $43, $09, $00, $0a, $57, $00, $00, $82, $4c
    db $00, $00, $9a, $c0, $9e, $59, $00, $80, $9d, $6f, $00, $00, $83, $4c, $00, $00
    db $9a, $c0, $9e, $59, $00, $80, $9d, $6f, $00, $00, $84, $4c, $00, $00, $9a, $c0
    db $9e, $59, $00, $80, $9d, $6e, $00, $ff

    ld bc, $01c0
    ld b, a
    nop
    add c
    ld bc, $0341
    nop
    inc b
    ld c, h
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    ld b, $4c
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    rlca
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld [$a101], sp
    sub e
    sbc b
    nop
    sub [hl]
    sbc c
    sbc l
    adc a
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ld [$a101], sp
    sub e
    sbc b
    nop
    sub [hl]
    sbc c
    sbc l
    adc a
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $0e48
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $1082
    ld b, b
    nop
    add d
    inc d
    ret nz

    ld bc, $0051
    nop
    ld bc, $0e48
    ret nz

    ld bc, $007f
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld c, l
    nop
    rst $38
    ld bc, $0061
    adc d
    ld bc, $0052
    adc d
    dec c
    ld d, d
    nop
    add a
    add hl, de
    nop
    jr nz, @-$7e

    ld [hl+], a
    ld c, a
    nop
    add b
    inc h
    ld b, e
    dec h
    add e
    ld h, $00
    nop
    add e
    dec hl
    ld bc, $3024
    ld c, d
    nop
    add b
    ld sp, $3243
    adc e
    inc sp
    ld e, e
    nop
    add b
    ldh a, [c]
    ld l, e
    nop
    add b
    ld b, b
    ld c, a
    ld b, c
    nop
    ld b, d
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    add b
    ld h, a
    ld c, a
    ld l, b
    nop
    ld l, c
    ld c, d
    nop
    rst $38
    ld bc, $b07f
    ld a, a
    or b
    ld a, a
    or b
    add e
    or b
    nop
    or e
    add b
    or l
    ld [bc], a
    or e
    or a
    or b
    add b
    cp b
    ld [hl], e
    or b
    add c
    cp d
    ld e, d
    or b
    adc e
    cp l
    ld d, c
    or b
    nop
    jp z, $bf40

    adc b
    bit 2, c
    or b
    nop
    push de
    add b
    cp [hl]
    add a
    sub $00
    rst $10
    ld d, d
    or b
    add c
    rst $18
    ld a, a
    or b
    ld a, a
    or b
    ld [hl], h
    or b
    rst $38

    db $01, $80, $01, $46, $02, $00, $03, $53, $00, $84, $04, $00, $00, $80, $0a, $01
    db $07, $0c, $53, $00, $00, $04, $83, $0d, $00, $00, $81, $12, $00, $0c, $53, $00
    db $80, $15, $46, $16, $00, $17, $55, $00, $80, $18, $4b, $19, $00, $1a, $4e, $00
    db $85, $1b, $46, $21, $00, $22, $4e, $00, $84, $23, $00, $21, $87, $29, $4e, $00
    db $83, $32, $00, $21, $81, $37, $42, $33, $81, $3a, $4e, $00, $82, $3d, $40, $21
    db $87, $41, $00, $22, $4e, $00, $00, $1b, $82, $4a, $00, $21, $86, $4e, $80, $21
    db $4e, $00, $01, $1b, $21, $8b, $56, $00, $22, $4e, $00, $01, $1b, $21, $82, $63
    db $00, $21, $81, $67, $40, $21, $81, $6a, $00, $22, $4e, $00, $00, $1b, $40, $21
    db $80, $6d, $40, $21, $80, $6f, $00, $21, $83, $71, $00, $22, $4e, $00, $00, $1b
    db $40, $21, $00, $76, $44, $21, $80, $77, $41, $21, $00, $22, $4e, $00, $80, $79
    db $4b, $7a, $00, $7b, $50, $00, $80, $01, $47, $02, $00, $03, $52, $00, $00, $04
    db $48, $00, $00, $0c, $52, $00, $80, $15, $47, $16, $00, $17, $4e, $00, $ff

    ld bc, $01c0
    ld b, a
    nop
    ret nz

    ld bc, $0280
    ld b, c
    inc bc
    nop
    inc b
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0500
    ret nz

    adc a
    ld [bc], a
    sub e
    sbc [hl]
    ld b, $4b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0780
    ld b, c
    ld [$0900], sp
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0a84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1084
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1684
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1c84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2284
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2884
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2e84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $3483
    nop
    ld [hl], $4b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    nop
    ld bc, $0346
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $3941
    add d
    ld a, [hl-]
    ld b, c
    add hl, sp
    nop
    ld bc, $0846
    ld c, d
    nop
    rst $38
    ld bc, $d480
    ld c, a
    push de
    nop
    sub $4a
    nop
    nop
    rst $10
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    ld bc, $0005
    add d
    db $f4
    ld b, e
    nop
    nop
    ld b, $41
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    ld bc, $0005
    add d
    ld hl, sp+$01
    sub a
    sbc c
    add b
    adc [hl]
    ld bc, $0600
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    add b
    rlca
    ld b, a
    ld [$0900], sp
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    rlca
    ld b, e
    ld [$0900], sp
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    ld bc, $0005
    ret nz

    adc a
    inc bc
    sub e
    sbc [hl]
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    nop
    sbc d
    sub [hl]
    adc e
    and e
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    nop
    adc a
    and d
    sub e
    sbc [hl]
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    rlca
    ld b, e
    ld [$0900], sp
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    add b
    reti


    ld c, a
    jp c, $db00

    ld c, d
    nop
    rst $38

    db $01, $7f, $80, $61, $80, $80, $e0, $47, $e1, $00, $e2, $52, $80, $00, $e3, $88
    db $81, $00, $e4, $52, $80, $00, $e3, $88, $8b, $00, $e4, $52, $80, $00, $e3, $88
    db $95, $00, $e4, $52, $80, $00, $e3, $88, $9f, $00, $e4, $52, $80, $00, $e3, $88
    db $a9, $00, $e4, $52, $80, $00, $e3, $88, $b3, $00, $e4, $52, $80, $00, $e3, $88
    db $bd, $00, $e4, $52, $80, $00, $e3, $88, $c7, $00, $e4, $52, $80, $80, $e5, $47
    db $e6, $00, $e7, $73, $80, $08, $dc, $d5, $ec, $f6, $eb, $80, $d7, $df, $f5, $7f
    db $80, $6f, $80, $ff

    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, h
    nop
    inc bc
    pop de
    nop
    db $dd
    db $ed
    ld b, b
    db $dd
    ld bc, $f5f1
    halt
    nop
    nop
    pop de
    ld b, d
    ret c

    nop
    push af
    ld a, a
    nop
    ld d, c
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld c, $ef
    rst $18
    rst $28
    rst $30
    nop
    reti


    db $ec
    or $eb
    nop
    ret c

    db $ed
    rst $10
    push de
    push af
    ld l, a
    nop
    ld [bc], a
    reti


    nop
    rst $28
    ret nz

    rst $18
    add b
    call nc, $ea09
    nop
    reti


    sub $00
    reti


    nop
    db $d3
    pop de
    sbc $4d
    nop
    dec bc
    db $ec
    pop de
    db $db
    push de
    nop
    reti


    db $ec
    nop
    ret c

    rst $18
    db $dd
    push de
    ld b, c
    di
    ld l, [hl]
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld de, $d8ec
    push de
    nop
    db $ec
    ld [$d1d5], a
    db $eb
    db $ed
    ld [$00d5], a
    rst $28
    push de
    or $ee
    push de
    ld c, h
    nop
    nop
    jp nc, $d540

    ld [bc], a
    sbc $00
    call c, $df40
    ld [$d9db], sp
    sbc $d7
    nop
    sub $df
    ld [$6df5], a
    nop
    ld [bc], a
    pop af
    pop de
    ret c

    ld b, b
    rst $18
    nop
    push af
    ld [hl], a
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    ld b, $d9
    db $ec
    or $eb
    nop
    db $d3
    rst $18
    ld b, b
    call c, $d106
    add sp, -$15
    reti


    sbc $d7
    push af
    ld l, [hl]
    nop
    inc bc
    rst $18
    ret c

    rst $30
    nop
    add b
    sbc $00
    push af
    ld a, a
    nop
    ld d, h
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    add b
    ld [bc], a
    ld c, l
    inc bc
    ld bc, $0604
    ld c, d
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    add b
    sbc b
    add hl, bc
    and c
    nop
    and e
    sbc c
    sbc a
    nop
    adc a
    adc e
    sbc h
    sbc b
    ret nz

    adc a
    ld b, b
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    rrca
    adc e
    nop
    adc l
    sub d
    adc e
    sbc b
    adc l
    adc a
    nop
    sbc [hl]
    sbc c
    nop
    sbc d
    sub [hl]
    adc e
    and e
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    inc c
    and e
    sbc c
    sbc a
    sbc h
    nop
    sub b
    adc e
    and b
    sbc c
    sbc h
    sub e
    sbc [hl]
    adc a
    ld b, c
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    add b
    sbc l
    ld [$918b], sp
    adc a
    nop
    sbc c
    sub b
    nop
    sbc d
    sbc a
    ld b, b
    and h
    ld [bc], a
    sub [hl]
    adc a
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld bc, $9997
    add b
    adc [hl]
    nop
    and a
    ld c, c
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    nop
    dec b
    add b
    ld [$094d], sp
    ld bc, $060a
    ld c, d
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $807f
    ld h, c
    add b
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    add b
    nop
    db $e3
    adc b
    add c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    adc e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sub l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sbc a
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    xor c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    or e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    cp l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    rst $00
    nop
    db $e4
    ld d, d
    add b
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    add b
    rlca
    rst $28
    ret c

    pop de
    db $ec
    or $eb
    add b
    db $ec
    add b
    ret c

    rlca
    db $eb
    add b
    db $eb
    rst $28
    reti


    db $ec
    db $d3
    ret c

    ld c, h
    add b
    inc bc
    sub $df
    ld [$7bf4], a
    add b
    dec b
    ld [$dded], a
    jp nc, $d5dc

    ld b, c
    di
    dec b
    ld [$dded], a
    jp nc, $d5dc

    ld l, l
    add b
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld de, $ecd9
    or $eb
    nop
    pop de
    nop
    db $eb
    add sp, -$2f
    db $d3
    push de
    db $d3
    ld [$d6d1], a
    db $ec
    push af
    ld l, h
    nop
    add hl, bc
    db $eb
    rst $18
    db $dd
    push de
    jp nc, $d4df

    pop af
    rst $30
    nop
    add b
    db $eb
    dec b
    rst $18
    add sp, $00
    reti


    db $ec
    push af
    ld a, a
    nop
    ld c, d
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [bc], a
    ld b, l
    inc bc
    nop
    inc b
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    ld bc, $8d05
    ret nz

    sbc c
    dec b
    sbc [hl]
    sub e
    sbc b
    xor h
    adc a
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [$0945], sp
    nop
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    sbc l
    ld [bc], a
    adc e
    sub c
    adc a
    ld b, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38

    db $01, $7f, $00, $61, $00, $80, $e0, $47, $e1, $00, $e2, $52, $00, $00, $e3, $88
    db $01, $00, $e4, $52, $00, $00, $e3, $88, $0b, $00, $e4, $52, $00, $00, $e3, $88
    db $15, $00, $e4, $52, $00, $00, $e3, $88, $1f, $00, $e4, $52, $00, $00, $e3, $88
    db $29, $00, $e4, $52, $00, $00, $e3, $88, $33, $00, $e4, $52, $00, $00, $e3, $88
    db $3d, $00, $e4, $52, $00, $00, $e3, $88, $47, $00, $e4, $52, $00, $80, $e5, $47
    db $e6, $00, $e7, $4f, $00, $02, $e8, $ea, $df, $c0, $d6, $40, $eb, $09, $df, $ea
    db $f7, $00, $f1, $df, $ed, $f6, $ea, $d5, $4d, $00, $03, $d1, $00, $dd, $ed, $40
    db $dd, $00, $f1, $41, $f3, $74, $00, $00, $d3, $40, $df, $0b, $dc, $f7, $00, $d9
    db $eb, $de, $f6, $ec, $00, $d9, $ec, $f4, $6e, $00, $ff

    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    rlca
    db $eb
    rst $18
    nop
    db $dd
    pop de
    sbc $f1
    nop
    add b
    db $eb
    nop
    pop de
    add b
    db $ec
    ld [bc], a
    push de
    db $eb
    push af
    ld l, [hl]
    nop
    ld a, [bc]
    reti


    sbc $ec
    ld [$d7d9], a
    db $ed
    reti


    sbc $d7
    push af
    ld a, a
    nop
    ld d, b
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    rrca
    reti


    nop
    sub $df
    db $ed
    sbc $d4
    nop
    pop de
    nop
    db $eb
    push de
    db $d3
    ld [$ecd5], a
    ld c, [hl]
    nop
    inc b
    add sp, -$2f
    db $ec
    ret c

    push af
    ld a, c
    nop
    nop
    rst $10
    ld b, b
    rst $18
    dec b
    call nc, $da00
    rst $18
    jp nc, Jump_008_73f5

    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, e
    nop
    inc b
    ret c

    pop de
    nop
    ret c

    pop de
    ld b, c
    di
    ld bc, $f1dd
    ld d, h
    nop
    rlca
    db $ec
    ld [$d1d5], a
    db $eb
    db $ed
    ld [$41d5], a
    di
    ld [hl], e
    nop
    nop
    rst $28
    ld b, c
    di
    inc b
    rst $28
    pop de
    reti


    db $ec
    push af
    ld [hl], b
    nop
    rst $38
    ld bc, $807f
    ld h, c
    add b
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    add b
    nop
    db $e3
    adc b
    add c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    adc e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sub l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sbc a
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    xor c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    or e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    cp l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    rst $00
    nop
    db $e4
    ld d, d
    add b
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, c
    add b
    inc c
    reti


    db $ec
    or $eb
    add b
    rst $10
    call c, $efdf
    reti


    sbc $d7
    push af
    ld [hl], h
    add b
    nop
    db $db
    add b
    pop de
    ld b, b
    rst $18
    ld bc, $f5dd
    ld a, a
    add b
    ld d, b
    add b
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    inc c
    rst $28
    ret c

    push de
    ld [$00d5], a
    pop de
    ld [$00d5], a
    rst $28
    push de
    db $f4
    ld [hl], c
    nop
    ld c, $d9
    db $ec
    or $eb
    nop
    pop de
    sbc $00
    reti


    db $eb
    call c, $ded1
    call nc, Call_008_7ff4
    nop
    ld c, h
    nop
    rst $38

    db $01, $7f, $00, $08, $9e, $8f, $9e, $9c, $93, $9d, $ae, $00, $82, $c1, $8a, $06
    db $00, $8f, $96, $99, $9c, $91, $a5, $4b, $00, $09, $99, $9c, $93, $91, $93, $98
    db $8b, $96, $00, $8d, $c0, $99, $05, $8d, $8f, $9a, $9e, $00, $ad, $4c, $00, $80
    db $8e, $06, $9d, $93, $91, $98, $00, $8c, $a3, $57, $00, $08, $8b, $96, $8f, $a2
    db $8f, $a3, $00, $9a, $8b, $c0, $94, $00, $9e, $80, $98, $01, $a0, $a5, $4c, $00
    db $0c, $9e, $8f, $9e, $9c, $93, $9d, $00, $96, $93, $8d, $8f, $98, $9d, $c0, $8f
    db $02, $00, $9e, $99, $4c, $00, $11, $9e, $92, $8f, $00, $9e, $8f, $9e, $9c, $93
    db $9d, $00, $8d, $99, $97, $9a, $8b, $98, $a3, $4c, $00, $0e, $8b, $98, $8e, $00
    db $9e, $8f, $9e, $9c, $93, $9d, $00, $9a, $96, $9f, $9d, $4f, $00, $08, $9d, $9f
    db $8c, $96, $93, $8d, $8f, $98, $9d, $c0, $8f, $02, $00, $9e, $99, $57, $00, $0a
    db $94, $8b, $96, $8f, $8d, $99, $00, $96, $9e, $8e, $a5, $4c, $00, $0d, $9e, $8f
    db $9e, $9c, $93, $9d, $00, $9a, $96, $9f, $9d, $ae, $00, $82, $40, $8a, $00, $87
    db $4d, $00, $12, $9e, $92, $8f, $00, $9e, $8f, $9e, $9c, $93, $9d, $00, $8d, $99
    db $97, $9a, $8b, $98, $a3, $a5, $7f, $00, $7f, $00, $7f, $00, $48, $00, $08, $9e
    db $8f, $9e, $9c, $93, $9d, $af, $00, $ad, $5b, $00, $0a, $9e, $8f, $9e, $9c, $93
    db $9d, $00, $9a, $96, $9f, $9d, $80, $f2, $4b, $00, $08, $9d, $9f, $8c, $96, $93
    db $8d, $8f, $98, $9d, $c0, $8f, $02, $00, $9e, $99, $58, $00, $0a, $94, $8b, $96
    db $8f, $8d, $99, $00, $96, $9e, $8e, $a5, $4b, $00, $01, $8c, $a3, $5c, $00, $12
    db $9e, $92, $8f, $00, $9e, $8f, $9e, $9c, $93, $9d, $00, $8d, $99, $97, $9a, $8b
    db $98, $a3, $a5, $4b, $00, $00, $8b, $40, $96, $02, $00, $9c, $93, $80, $91, $c0
    db $9e, $5d, $00, $05, $9c, $8f, $9d, $8f, $9c, $a0, $c0, $8f, $00, $a5, $7f, $00
    db $7f, $00, $69, $00, $ff

    nop
    nop
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    nop
    nop
    cp h
    cp l
    cp l
    cp [hl]
    nop
    cp $c7
    cp a
    nop
    nop
    ret nz

    call nz, $c6fe
    cp a
    nop
    nop
    ret nz

    push bc
    cp $00
    pop bc
    jp nz, $c3c2

    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    ld [bc], a
    ld [$fe00], sp
    ld [$fe00], sp
    ld [$fe00], sp
    ld [$ff00], sp

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $fe, $9d, $93, $98, $91, $96, $8f, $00, $00, $00
    db $00, $fe, $00, $00, $00, $00, $00, $a8, $00, $00, $00, $00, $fe, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $fe, $8e, $99, $9f, $8c, $96, $8f, $00, $00
    db $00, $00, $fe, $00, $00, $00, $00, $00, $a8, $00, $00, $00, $00, $fe, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $fe, $9e, $9c, $93, $9a, $96, $8f, $00
    db $00, $00, $00, $fe, $00, $00, $00, $00, $00, $a8, $00, $00, $00, $00, $fe, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $9e, $8f, $9e, $9c, $93, $9d
    db $00, $00, $00, $00, $fe, $00, $00, $00, $00, $00, $a8, $00, $00, $00, $00, $fe
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $fe, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $fe, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $fe, $ff, $01, $80, $81, $4f, $82, $00, $83, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $42, $80, $81, $89, $00
    db $80, $84, $8c, $42, $80, $00, $85, $4a, $80, $00, $84, $42, $80, $81, $92, $00
    db $80, $84, $95, $42, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $00, $84, $50, $80, $00, $85, $4a, $80, $00, $84, $50, $80, $00, $85, $4a
    db $80, $80, $86, $4f, $87, $00, $88, $4a, $80, $ff

    ld [bc], a
    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38

    db $02, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe
    db $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a
    db $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00, $fe, $0a, $00
    db $fe, $0a, $00, $ff, $00, $00, $00, $8f, $91, $a3, $9a, $9e, $00, $00, $00, $ff

    nop
    adc e
    sbc b
    sub c
    sub l
    sbc c
    sbc h
    nop
    and c
    adc e
    sbc [hl]
    rst $38
    nop
    nop
    nop
    nop
    sub a
    adc e
    and e
    adc e
    nop
    nop
    nop
    rst $38
    nop
    nop
    sub l
    sbc b
    sbc c
    sbc l
    sbc l
    sbc c
    sbc l
    nop
    nop
    rst $38
    nop
    nop
    adc e
    sbc [hl]
    sub [hl]
    adc e
    sbc b
    sbc [hl]
    sub e
    sbc l
    nop
    rst $38
    nop
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    cp $05
    sub c
    adc e
    sub a
    adc a
    ld b, $fe
    dec b
    sbc c
    and b
    adc a
    sbc h
    ld b, $fe
    ld [$0909], sp
    add hl, bc
    add hl, bc
    ld a, [bc]
    cp $fe
    sbc d
    sbc h
    adc a
    sbc l
    sbc l
    nop
    adc e
    rst $38
    nop
    nop
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    nop
    cp $00
    dec b
    nop
    call z, $cecd
    rst $08
    call c, $0006
    cp $00
    dec b
    db $dd
    sbc $df
    push af
    or $f7
    ld b, $00
    cp $00
    dec b
    ld hl, sp-$07
    ld a, [$fcfb]
    ld c, [hl]
    ld b, $00
    cp $00
    dec b
    ld c, a
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld a, c
    ld b, $00
    cp $00
    dec b
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    ld b, $00
    cp $00
    ld [$0909], sp
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    ld a, [bc]
    nop
    cp $fe
    add d
    add c
    nop
    sbc l
    sbc [hl]
    adc e
    sub c
    adc a
    sbc l
    nop
    cp $fe
    nop
    nop
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    adc a
    adc [hl]
    and a
    cp $ff
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b
    add e
    jr nz, jr_008_5dff

jr_008_5dff:
    nop
    add d
    ld l, h
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b

jr_008_5e10:
    add e
    dec h
    nop
    nop
    add d
    ld a, c
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [$0943], sp
    nop
    ld a, [bc]
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    rst $00
    add b
    rst $08
    add b
    jr jr_008_5e10

    inc e
    ld b, b
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ret


    add b
    pop de
    add b
    ld a, [de]
    add b
    ld e, $40
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38

    db $00, $9b, $9c, $fe, $9d, $9e, $fe, $ff, $00, $9f, $a0, $fe, $a1, $a2, $fe, $ff
    db $00, $a3, $a4, $fe, $a5, $a6, $fe, $ff, $00, $a7, $a8, $fe, $a9, $aa, $fe, $ff
    db $00, $ab, $ac, $fe, $ad, $ae, $fe, $ff, $00, $af, $b0, $fe, $b1, $b2, $fe, $ff
    db $00, $b3, $b4, $fe, $b5, $b6, $fe, $ff, $00, $b7, $b8, $fe, $b9, $ba, $fe, $ff
    db $00, $bb, $bc, $fe, $bd, $be, $fe, $ff, $00, $bf, $c0, $fe, $c1, $c2, $fe, $ff
    db $00, $80, $99, $98, $ff

    nop
    sbc c
    sub b
    sub b
    rst $38

    db $01, $80, $02, $4f, $03, $00, $04, $4a, $00, $00, $05, $41, $00, $80, $02, $47
    db $03, $00, $04, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $02, $05, $a9
    db $ab, $40, $ad, $01, $af, $b1, $42, $00, $00, $06, $41, $00, $00, $06, $4a, $00
    db $00, $05, $41, $00, $02, $05, $aa, $ac, $40, $ae, $03, $b0, $b2, $97, $99, $80
    db $8e, $00, $06, $41, $00, $00, $06, $4a, $00, $00, $05, $41, $00, $80, $08, $47
    db $09, $00, $0a, $41, $00, $00, $06, $4a, $00, $00, $05, $43, $00, $80, $02, $43
    db $03, $00, $04, $43, $00, $00, $06, $4a, $00, $00, $05, $43, $00, $07, $05, $9d
    db $8f, $96, $8f, $8d, $9e, $06, $43, $00, $00, $06, $4a, $00, $00, $05, $43, $00
    db $80, $08, $43, $09, $00, $0a, $43, $00, $00, $06, $4a, $00, $00, $05, $40, $00
    db $80, $02, $49, $03, $00, $04, $40, $00, $00, $06, $4a, $00, $00, $05, $40, $00
    db $05, $05, $00, $8f, $8b, $9d, $a3, $45, $00, $00, $06, $40, $00, $00, $06, $4a
    db $00, $00, $05, $40, $00, $00, $05, $4a, $00, $00, $06, $40, $00, $00, $06, $4a
    db $00, $00, $05, $40, $00, $01, $05, $00, $80, $98, $03, $9c, $97, $8b, $96, $43
    db $00, $00, $06, $40, $00, $00, $06, $4a, $00, $00, $05, $40, $00, $00, $05, $4a
    db $00, $00, $06, $40, $00, $00, $06, $4a, $00, $00, $05, $40, $00, $05, $05, $00
    db $92, $8b, $9c, $8e, $45, $00, $00, $06, $40, $00, $00, $06, $4a, $00, $00, $05
    db $40, $00, $00, $05, $4a, $00, $00, $06, $40, $00, $00, $06, $4a, $00, $00, $05
    db $40, $00, $0a, $05, $00, $a0, $8f, $9c, $a3, $00, $92, $8b, $9c, $8e, $40, $00
    db $00, $06, $40, $00, $00, $06, $4a, $00, $00, $05, $40, $00, $80, $08, $49, $09
    db $00, $0a, $40, $00, $00, $06, $4a, $00, $80, $08, $4f, $09, $00, $0a, $4a, $00
    db $ff

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $9d
    sbc [hl]
    adc e
    sub c
    adc a
    nop
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38

    db $00, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $00, $fe, $32, $33, $34, $35, $36
    db $37, $38, $39, $00, $fe, $ff, $00, $3a, $fe, $3b, $ff, $00, $3c, $fe, $3d, $ff
    db $00, $3e, $fe, $3f, $ff, $00, $40, $fe, $41, $ff, $00, $42, $fe, $43, $ff, $00
    db $44, $fe, $45, $ff, $00, $46, $fe, $47, $ff, $00, $48, $fe, $49, $ff, $00, $4a
    db $fe, $4b, $ff, $00, $4c, $fe, $4d, $ff

    nop
    sbc b
    adc a
    and c
    nop
    sbc h
    adc a
    adc l
    sbc c
    sbc h
    adc [hl]
    cp $9e
    sub e
    sub a
    adc a
    nop
    adc h
    sbc c
    sbc b
    sbc a
    sbc l
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    sbc l
    adc a
    adc l
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    sbc d
    sbc [hl]
    sbc l
    cp $ff
    nop
    nop
    and e
    sbc c
    sbc a
    ld [hl], l
    halt
    nop
    nop
    nop
    nop
    cp $74
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    cp $70
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    cp $ff
    nop
    sbc h
    sub e
    and b
    adc e
    sub [hl]
    rst $38
    nop
    rst $00
    ret z

    cp $c9
    jp z, Jump_000_00ff

    set 1, h
    cp $cd
    adc $ff
    nop
    rst $08
    ret nc

    cp $d1
    jp nc, $02ff

    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    nop
    sbc l
    adc a
    sbc [hl]
    nop
    sub a
    adc e
    sbc [hl]
    adc l
    sub d
    rst $38
    nop
    sbc h
    sbc c
    sbc a
    sbc b
    adc [hl]
    rst $38
    ld [bc], a
    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    ld [bc], a
    ld b, $00
    cp $06
    nop
    cp $06
    nop
    cp $06
    nop
    rst $38
    nop
    xor l
    xor [hl]
    xor a
    or b
    or c
    or d
    cp $b3
    or h
    or l
    or [hl]
    or a
    cp b
    cp $b9
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp $bf
    ret nz

    pop bc
    jp nz, $c4c3

    rst $38
    ld [bc], a
    inc b
    nop
    cp $04
    nop
    cp $04
    nop
    cp $04
    nop
    rst $38

    db $00, $b9, $b3, $b7, $bb, $b1, $fe, $ba, $b4, $b8, $bc, $b2, $ff

    nop
    ld d, $fe
    rla
    rst $38

    db $00, $18, $fe, $19, $ff

    nop
    ld a, [de]
    cp $1b
    rst $38
    nop
    inc e
    cp $1d
    rst $38
    nop
    ld e, $fe
    rra
    rst $38
    nop

jr_008_6217:
    jr nz, jr_008_6217

    ld hl, $00ff
    ld [hl+], a
    cp $23
    rst $38
    nop
    inc h
    cp $25
    rst $38
    nop
    ld h, $fe
    daa
    rst $38
    nop

jr_008_622b:
    jr z, jr_008_622b

    add hl, hl
    rst $38

    db $00, $9d, $8f, $96, $8f, $8d, $9e, $fe, $fe, $96, $8f, $a0, $8f, $96, $ff

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sub c
    adc e
    sub a
    adc a
    nop
    adc h
    sbc c
    and e
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    sbc l
    sbc [hl]
    adc e
    sub b
    sub b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sbc d
    sbc h
    sbc c
    adc [hl]
    sbc a
    adc l
    adc a
    sbc h
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc [hl]
    sbc c
    sbc l
    sub d
    sub e
    sub l
    adc e
    and h
    sbc a
    nop
    sub e
    and c
    adc e
    sbc l
    adc e
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    adc [hl]
    sub e
    sbc h
    adc a
    adc l
    sbc [hl]
    sbc c
    sbc h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    sub l
    adc e
    sbc b
    adc e
    nop
    sub d
    sub e
    sbc h
    adc e
    sbc b
    sbc c
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sbc d
    sbc h
    sbc c
    sub c
    sbc h
    adc e
    sub a
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    and c
    adc e
    sbc [hl]
    adc e
    sbc h
    sbc a
    nop
    sub l
    sub e
    sbc [hl]
    adc e
    sub a
    sbc a
    sbc h
    adc e
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc [hl]
    sbc c
    sbc l
    sub d
    sub e
    sub l
    adc e
    and h
    sbc a
    nop
    sub e
    and c
    adc e
    sbc l
    adc e
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sub c
    sbc h
    adc e
    sbc d
    sub d
    sub e
    adc l
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    sub l
    adc e
    sbc b
    adc e
    nop
    sub d
    sub e
    sbc h
    adc e
    sbc b
    sbc c
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    adc e
    sbc [hl]
    sbc l
    sbc a
    sub a
    sub e
    nop
    sbc [hl]
    adc e
    sub l
    sub e
    sbc b
    sbc c
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    sbc l
    sbc c
    sbc a
    sbc b
    adc [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    sub e
    sub l
    sbc a
    nop
    sub a
    sub e
    and h
    sbc a
    sbc [hl]
    adc e
    sbc b
    sub e
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    adc e
    sbc h
    adc l
    adc e
    adc [hl]
    adc a
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    sbc l
    sbc [hl]
    adc e
    sub b
    sub b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    sub c
    adc e
    sub a
    adc a
    nop
    adc [hl]
    adc a
    sbc l
    sub e
    sub c
    sbc b
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    sbc [hl]
    adc e
    sbc h
    sbc c
    nop
    sbc l
    adc e
    sbc l
    adc e
    sub d
    adc e
    sbc h
    adc e
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sbc d
    sbc h
    sbc c
    sub c
    sbc h
    adc e
    sub a
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    sbc h
    adc a
    sbc h
    sbc c
    sbc h
    adc a
    sbc h
    sbc c
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    and a
    sub a
    and a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    sub c
    sbc h
    adc e
    sbc d
    sub d
    sub e
    adc l
    nop
    adc [hl]
    adc a
    sbc l
    sub e
    sub c
    sbc b
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc l
    sbc a
    and h
    sbc a
    sub l
    sub e
    nop
    sbc [hl]
    adc e
    sbc [hl]
    sbc l
    sbc a
    sub d
    sub e
    sbc h
    sbc c
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    sbc d
    and e
    sbc c
    sbc b
    sub l
    adc a
    and e
    nop
    sub a
    adc e
    sbc [hl]
    sbc l
    sbc a
    sbc c
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc l
    sub d
    sub e
    sub c
    adc a
    sbc l
    adc e
    and c
    adc e
    nop
    sub d
    sub e
    sbc h
    sbc c
    sbc l
    sub d
    sub e
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    sbc l
    sbc c
    sbc a
    sbc b
    adc [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    sbc b
    nop
    sub e
    nop
    sbc l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    sub l
    adc e
    and h
    sbc a
    sbc c
    nop
    sbc l
    adc e
    and c
    adc e
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38

    db $00, $27, $0c, $0d, $24, $fe, $26, $0e, $0f, $25, $fe, $ff, $00, $27, $10, $11
    db $24, $fe, $26, $12, $13, $25, $fe, $ff, $00, $27, $14, $15, $24, $fe, $26, $16
    db $17, $25, $fe, $ff, $00, $27, $18, $19, $24, $fe, $26, $1a, $1b, $25, $fe, $ff
    db $00, $27, $1c, $1d, $24, $fe, $26, $1e, $1f, $25, $fe, $ff, $00, $27, $20, $21
    db $24, $fe, $26, $22, $23, $25, $fe, $ff

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_008_73f5:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_008_7565:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_008_7ff4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
