; Disassembly of "Tetris Plus (USA, Europe) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v3.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0150]

Enter:          ; Entry point
    jp Start


; likely start of API table from here through $0201
; handles bank switching to call subroutines from non-loaded ROM banks?
Call_000_0153:
Jump_000_0153:
    jp Jump_000_0351


Call_000_0156:
Jump_000_0156:
    jp Jump_000_035b


Call_000_0159:
    jp Jump_000_0367


Call_000_015c:
    jp Jump_000_036e


    jp Jump_000_0375


Call_000_0162:
    jp Jump_000_038d


Call_000_0165:
Jump_000_0165:
    jp Jump_000_0399


Call_000_0168:
    jp Jump_000_03a3


Call_000_016b:
    jp Jump_000_0381


Call_000_016e:
    jp Jump_000_03b1


Call_000_0171:
    jp Jump_000_03b8


Call_000_0174:
    jp Jump_000_03bf


Call_000_0177:
    jp Jump_000_03c6


Call_000_017a:
    jp Jump_000_03d0


Call_000_017d:
    jp Jump_000_03da


Call_000_0180:
    jp Jump_000_03e4


Call_000_0183:
    jp Jump_000_03ee


Call_000_0186:
    jp Jump_000_03f8


Call_000_0189:
    jp Jump_000_0402


Call_000_018c:
    jp Jump_000_040c


Call_000_018f:
    jp Jump_000_0416


Call_000_0192:
    jp Jump_000_0420


Call_000_0195:
    jp Jump_000_042a


Call_000_0198:
    jp Jump_DisableLCD


Call_000_019b:
    jp Jump_000_0436


Call_000_019e:
    jp Jump_000_0440


Call_000_01a1:
    jp Jump_000_044a


Call_000_01a4:
    jp Jump_000_0454


Call_000_01a7:
    jp Jump_000_0460


    jp Jump_000_046c


Call_000_01ad:
    jp Jump_000_0476


Call_000_01b0:
    jp Jump_000_0480


Call_000_01b3:
    jp Jump_000_048a


Call_000_01b6:
    jp Jump_000_0494


Call_000_01b9:
    jp Jump_000_049e


Call_000_01bc:
    jp Jump_000_04a8


Call_000_01bf:
    jp Jump_000_04b2


Call_000_01c2:
    jp Jump_000_04bc


Call_000_01c5:
    jp Jump_000_04c6


Call_000_01c8:
    jp Jump_000_04d0


Call_000_01cb:
    jp Jump_000_04da


Call_000_01ce:
    jp Jump_000_04e4


Call_000_01d1:
    jp Jump_000_04ee


Call_000_01d4:
    jp Jump_000_04f8


Call_000_01d7:
    jp Jump_000_0502


Call_000_01da:
    jp Jump_000_050c


Call_000_01dd:
    jp Jump_000_0516


Call_000_01e0:
    jp Jump_000_0520


Call_000_01e3:
    jp Jump_000_052a


Call_000_01e6:
    jp Jump_000_0534


Call_000_01e9:
    jp Jump_000_053e


Call_000_01ec:
    jp Jump_000_0548


Call_000_01ef:
    jp Jump_000_0552


Call_000_01f2:
    jp Jump_000_055c


Call_000_01f5:
    jp Jump_000_0566


Call_000_01f8:
    jp Jump_000_056d


Call_000_01fb:
    jp Jump_000_0574


Call_000_01fe:
    jp Jump_000_057e


Call_000_0201:
    jp Jump_000_0588


Start:
    call DisableLCD ; Turns off LCD when VBLANK occurs
    di  ; Disable interrupts
    xor a ; clear register A
    ldh [rIF], a ; clear IF

    ; todo - track down what calls this
Call_000_020b: ; soft reset entry point?? setup before main game loop?
    ldh [rIE], a ; load A into IE
    ld sp, $fffe ; load literal $fffe into SP
    ld a, $0a
    ld [$0000], a ; writes $a to MBC1 register to enable SRAM
    ld a, $01
    ld [$2000], a ; selects rom bank 1
    ld a, $00
    ld [$4000], a ; selects ram bank 0
    call ClearBGTileMap ; clear out vram from 97ff to 9bff
    call ClearOAMBuffer ; clear out oam buffer
    call Call_000_1b00 ; clear remaining wram from c0a0 to e000
    ld hl, $fe00 ; store start address of OAM into HL
    ld c, $00 ; loop counter

    ; clear out OAM
    .clear_oam:
        ld [hl+], a
        dec c
        jr nz, .clear_oam

        ld hl, $ff80 ; hram start address
        ld c, $7f

    .clear_hram:
        ; clear out hram
        ld [hl+], a
        dec c
        jr nz, .clear_hram

    call CopyDMARoutineToHRAM
    call Call_000_0321
    ld a, $01
    ld [$c5c9], a
    call $67f8
    ld a, $83
    ldh [rLCDC], a
    xor a
    ldh [rIF], a
    ld a, $0d
    ldh [rIE], a
    ei
    call Call_000_21d0
    ld a, $07
    rst $10
    ld a, $00
    ld [$c67f], a
    call $434e
    jp nc, Jump_000_026d

    ld a, $01
    ld [$c67f], a
    call $4000

Jump_000_026d:
    ld a, $01
    rst $18

Jump_000_0270:
    ld a, [$c5db]
    inc a
    ld [$c5db], a
    ldh a, [hInputHeld]
    and $0f
    cp $0f
    jp nz, Jump_000_0298

    ld a, [wGameState]
    cp $00
    jr z, jr_000_0298

    cp $01
    jr z, jr_000_0298

    cp $0a
    jr z, jr_000_0298

    ld a, $0a
    ld [wGameState], a
    xor a
    ld [$c5a2], a

Jump_000_0298:
jr_000_0298:
    ld a, [$c5de]
    or a
    jr nz, jr_000_02c1

    call Call_000_22df
    call Call_000_2236
    call Call_000_221f
    call Call_000_1971
    call Call_000_0592
    call Call_000_20e3
    call Call_000_1e17
    call Call_000_1a5c
    call $7690
    call $504d
    ld a, $01
    ld [$c5de], a

jr_000_02c1:
    call Call_000_0343

jr_000_02c4:
    ldh a, [$ff92]
    and a
    jr z, jr_000_02c4

    xor a
    ldh [$ff92], a
    xor a
    ld [$c5de], a
    jp Jump_000_0270


Call_000_02d3:
    ld a, [$c5ec]
    ldh [rSCX], a
    ld a, [$c5ed]
    ldh [rSCY], a
    ld a, [$c5f0]
    ldh [rBGP], a
    ld a, [$c5f1]
    ldh [rOBP0], a
    ld a, [$c5f2]
    ldh [rOBP1], a
    ret


Jump_000_02ed:
    push af
    push bc
    push de

Jump_000_02f0:
    push hl
    ldh a, [$ff92]
    or a
    jr z, jr_000_02f8

    ld a, $00

jr_000_02f8:
    call Call_000_02d3
    ldh a, [$ff92]
    or a
    jr nz, jr_000_030c

    ld a, [$c5c9]
    or a
    call nz, $ff80
    ei
    xor a
    ld [$c5c9], a

jr_000_030c:
    ld a, $01
    ldh [$ff92], a
    call Call_000_2105
    pop hl
    pop de
    pop bc
    pop af
    reti


Call_000_0318:
jr_000_0318:
    ld a, $00
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0318

    ret


Call_000_0321:
    ld hl, $ca00
    ld bc, $0200
    call Call_000_0318
    ld a, $ff
    ldh [rNR51], a
    ld [$cb95], a
    ld a, $8f
    ldh [rNR52], a
    xor a
    ldh [rNR12], a
    ldh [rNR22], a
    ldh [rNR32], a
    ldh [rNR42], a
    ld a, $77
    ldh [rNR50], a
    ret


Call_000_0343:
    ld a, $03
    ld [$2000], a
    call $4000
    ld a, $01
    ld [$2000], a
    ret


Jump_000_0351:
    ld a, $01
    rst $10
    call $541a
    ld a, $05

Jump_000_0359:
    rst $18
    ret


Jump_000_035b:
    push af
    ld a, $01
    rst $10
    pop af
    call Call_000_1b27
    ld a, $05
    rst $18
    ret


Jump_000_0367:
    call Call_000_1c56
    ld a, $05
    rst $18
    ret


Jump_000_036e:
    call Call_000_1904
    ld a, $05
    rst $18
    ret


Jump_000_0375:
    push af
    ld a, $01
    rst $10
    pop af
    call $6804
    ld a, $05
    rst $18
    ret


Jump_000_0381:
    push af
    ld a, $01
    rst $10
    pop af
    call $67f8
    ld a, $05
    rst $18
    ret


Jump_000_038d:
    push af
    ld a, $01
    rst $10
    pop af
    call $681e
    ld a, $05
    rst $18
    ret


Jump_000_0399:
    ld a, $01
    rst $10
    call Call_000_2041
    ld a, $05
    rst $18
    ret


Jump_000_03a3:
    push af
    ld a, $01
    rst $10
    pop af
    call $682a
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_03b1:
    call ClearOAMBuffer
    ld a, $05
    rst $18
    ret


Jump_000_03b8:
    call Call_000_1b00
    ld a, $05
    rst $18
    ret


Jump_000_03bf:
    call Call_000_1b0f
    ld a, $05
    rst $18
    ret


Jump_000_03c6:
    ld a, $0e
    rst $10
    call Call_000_1a50
    ld a, $05
    rst $18
    ret


Jump_000_03d0:
    ld a, $01
    rst $10
    call Call_000_1919
    ld a, $05
    rst $18
    ret


Jump_000_03da:
    ld a, $01
    rst $10
    call $6fcd
    ld a, $05
    rst $18
    ret


Jump_000_03e4:
    ld a, $01
    rst $10
    call $6727
    ld a, $05
    rst $18
    ret


Jump_000_03ee:
    ld a, $01

Call_000_03f0:
    rst $10
    call Call_000_2321
    ld a, $05
    rst $18
    ret


Jump_000_03f8:
    ld a, $01
    rst $10
    call $70a4
    ld a, $05
    rst $18
    ret


Jump_000_0402:
    ld a, $01
    rst $10
    call $5ac2
    ld a, $05
    rst $18
    ret


Jump_000_040c:
    ld a, $01
    rst $10
    call $5c08
    ld a, $05
    rst $18
    ret


Jump_000_0416:
    ld a, $01
    rst $10
    call $5ca1
    ld a, $05
    rst $18
    ret


Jump_000_0420:
    ld a, $01
    rst $10
    call $5ef2
    ld a, $05
    rst $18
    ret


Jump_000_042a:
    ld a, $01
    rst $10
    call $547f
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_0436:
    ld a, $01
    rst $10
    call $5ac2
    ld a, $02
    rst $18
    ret


Jump_000_0440:
    ld a, $02
    rst $10
    call $4b72
    ld a, $05
    rst $18
    ret


Jump_000_044a:
    ld a, $02
    rst $10
    call $4bdf
    ld a, $05
    rst $18
    ret


Jump_000_0454:
    ld a, $02
    rst $10
    call $4f26
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_0460:
    ld a, $02
    rst $10
    call $50a7
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_046c:
    ld a, $07
    rst $10
    call $40b2
    ld a, $05
    rst $18
    ret


Jump_000_0476:
    ld a, $07
    rst $10
    call $4118
    ld a, $05
    rst $18
    ret


Jump_000_0480:
    ld a, $07
    rst $10
    call $4131
    ld a, $05
    rst $18
    ret


Jump_000_048a:
    ld a, $07
    rst $10
    call $40ff
    ld a, $05
    rst $18
    ret


Jump_000_0494:
    ld a, $07
    rst $10
    call $40e6
    ld a, $05
    rst $18
    ret


Jump_000_049e:
    ld a, $07
    rst $10
    call $4163
    ld a, $05
    rst $18
    ret


Jump_000_04a8:
    ld a, $07
    rst $10
    call $417c
    ld a, $05
    rst $18
    ret


Jump_000_04b2:
    ld a, $07
    rst $10
    call $4195
    ld a, $05
    rst $18
    ret


Jump_000_04bc:
    ld a, $07
    rst $10
    call $41ae

Jump_000_04c2:
    ld a, $05
    rst $18
    ret


Jump_000_04c6:
    ld a, $07
    rst $10
    call $41c7
    ld a, $05
    rst $18
    ret


Jump_000_04d0:
    ld a, $07
    rst $10
    call $41e0
    ld a, $05
    rst $18
    ret


Jump_000_04da:
    ld a, $05
    rst $10
    call $61c4
    ld a, $02
    rst $18
    ret


Jump_000_04e4:
    ld a, $07
    rst $10
    call $414a
    ld a, $05
    rst $18
    ret


Jump_000_04ee:
    ld a, $07

Call_000_04f0:
    rst $10
    call $41f9
    ld a, $05
    rst $18
    ret


Jump_000_04f8:
    ld a, $07
    rst $10
    call $4212
    ld a, $05
    rst $18
    ret


Jump_000_0502:
    ld a, $07
    rst $10
    call $422b
    ld a, $05
    rst $18
    ret


Jump_000_050c:
    ld a, $07
    rst $10
    call $4244
    ld a, $05
    rst $18
    ret


Jump_000_0516:
    ld a, $07
    rst $10
    call $425d
    ld a, $05
    rst $18
    ret


Jump_000_0520:
    ld a, $07
    rst $10
    call $4276
    ld a, $05
    rst $18
    ret


Jump_000_052a:
    ld a, $01
    rst $10
    call Call_000_205e
    ld a, $02
    rst $18
    ret


Jump_000_0534:
    ld a, $01
    rst $10
    call $5453
    ld a, $02
    rst $18
    ret


Jump_000_053e:
    ld a, $01
    rst $10
    call $6985
    ld a, $02
    rst $18
    ret


Jump_000_0548:
    ld a, $01
    rst $10
    call $5d3a
    ld a, $02
    rst $18
    ret


Jump_000_0552:
    ld a, $01
    rst $10
    call $7881
    ld a, $05
    rst $18
    ret


Jump_000_055c:
    ld a, $01
    rst $10
    call Call_000_06de
    ld a, $05
    rst $18
    ret


Jump_000_0566:
    call ClearBGTileMap
    ld a, $05
    rst $18
    ret


Jump_000_056d:
    call Call_000_21d0
    ld a, $05
    rst $18
    ret


Jump_000_0574:
    ld a, $02
    rst $10
    call $5232
    ld a, $01
    rst $18
    ret


Jump_000_057e:
    ld a, $07
    rst $10
    call $428f
    ld a, $05
    rst $18
    ret


Jump_000_0588:
    ld a, $07
    rst $10
    call $42a8
    ld a, $05
    rst $18
    ret


Call_000_0592:
    ld a, [wGameState]
    ld hl, $05a5
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    db $bb, $05, $c5, $05, $cf, $05, $01, $06, $fa, $18, $e3, $05, $93, $08

    ld l, l
    rrca
    reti


    dec b
    db $ed
    dec b
    rst $30
    dec b

    ld a, $05
    rst $10
    call $4000
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $4154
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $5580
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $491f
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $42b6
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $58c6
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $5a28
    ld a, $01
    rst $18

Jump_000_0600:
    ret


    ld a, [$c5a2]
    ld hl, $0614
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    db $26, $06, $68, $06, $bb, $06, $f8, $06, $4e, $07, $8d, $07, $d8, $07, $12, $08
    db $5f, $08

    ld a, [$c67f]
    or a
    jr z, jr_000_062f

    call Call_000_01c5

jr_000_062f:
    ld a, $01
    ld [$c5a7], a
    ld a, $09
    call Call_000_1c56
    ld a, $02
    call Call_000_1c56
    ld a, $01
    rst $18
    ld e, $22
    call Call_000_1904
    ld b, $03
    ld c, $04
    ld e, $8b
    call Call_000_1b27
    xor a
    ld [$c83d], a
    ld [$c83e], a
    call Call_000_06de
    call Call_000_1b0f
    ld a, $04
    ldh [$ffa0], a
    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $00
    call $682a
    or a
    ret z

    ldh a, [hInputPressed]
    and $20
    jr z, jr_000_0688

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c83e]
    sub $01
    jr nc, jr_000_0682

    ld a, $05

jr_000_0682:
    ld [$c83e], a
    jp Jump_000_069f


jr_000_0688:
    ldh a, [hInputPressed]
    and $10
    jr z, jr_000_069f

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c83e]
    add $01
    cp $06
    jr nz, jr_000_069c

    xor a

jr_000_069c:
    ld [$c83e], a

Jump_000_069f:
jr_000_069f:
    call Call_000_06de
    ldh a, [hInputPressed]
    and $01
    ret z

    call $781d
    ld a, $04
    ldh [$ffa1], a
    ld a, $04
    call $681e
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call $541a
    ld a, $04
    call $681e
    jp Jump_000_2041


Call_000_06de:
    ld a, [$c83e]
    ld b, $a0
    add b
    ld b, $04
    ld c, $09
    ld e, a
    call Call_000_1b27
    ld h, $01
    ld l, $24
    ld b, $04
    ld c, $02
    call $541a
    ret


    ld a, $00
    call $682a
    or a
    ret z

    xor a

Call_000_0700:
    ld [$c5ac], a
    ld hl, wScore_HundredThousandsPlace
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $c60a
    ld [hl+], a
    ld [hl], a
    ld hl, $c60c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $ff
    ld hl, $c647
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $c610
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [$c64a], a
    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e2
    ld a, $24
    ld [hl], a
    ld hl, $c1e3
    ld a, $38
    ld [hl], a
    ld hl, $c1e4
    ld a, $61
    ld [hl], a
    ld a, $02

Jump_000_0745:
    ld de, $c1e0
    call Call_000_1ddb
    jp Jump_000_2041


    ld hl, $c1ea
    ld a, [hl]
    cp $ff
    ret nz

    ld hl, $c1e0
    call $5453
    ld hl, $c0a5
    ld a, $01
    ld [hl], a
    ld hl, $c0e5
    ld a, $20
    ld [hl], a
    ld a, [$c83d]
    ld [wCurrentLevel], a
    ld a, $ff
    ld [$c83f], a
    call $59c1

Jump_000_0775:
    call $7828
    call $5d3a
    call $5d87
    call $5ef2
    xor a
    ld [$c73d], a
    ld a, $ff
    ld [$c840], a
    jp Jump_000_2041


    call $547f
    or a
    ret nz

    call Call_000_2321
    call $783d
    ld hl, $c0bc
    ld a, [hl]
    or a
    ret z

    xor a
    ld [$c5a3], a
    ld hl, $d02d
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d04d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d06d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d08d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld h, $00
    ld l, $2d

Jump_000_07c7:
    ld b, $06
    ld c, $04
    call $5e20
    ld a, $15
    ldh [$ffa0], a
    call Call_000_1b0f
    jp Jump_000_2041


    ld a, [$c5a3]
    cp $b4
    jr z, jr_000_07f7

    inc a
    ld [$c5a3], a
    ld b, $04
    ld c, $06
    ld e, $03
    call Call_000_1b27
    ld h, $00
    ld l, $01

Call_000_07f0:
    ld b, $0a
    ld c, $12
    jp $541a


jr_000_07f7:
    xor a
    ld [$c5a3], a
    ld b, $01
    ld c, $00
    ld e, $44
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    jp Jump_000_2041


    ldh a, [hInputPressed]
    and $0f
    jr nz, jr_000_0852

    ld a, [$c5a3]
    cp $b4
    jr z, jr_000_0852

    inc a
    ld [$c5a3], a
    ld hl, $c610
    ld de, $d067
    call $599c
    ld hl, $c611
    ld de, $d0c7
    call $599c
    ld hl, $c612
    ld de, $d127
    call $599c
    ld hl, $c613
    ld de, $d187
    call $599c
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    jp $541a


jr_000_0852:
    ld a, $02
    ld [$cb96], a
    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld a, $02
    rst $10
    call $49f0
    push af
    ld a, $01
    rst $18
    pop af
    or a
    jr nz, jr_000_0884

    ld e, $15
    call Call_000_1904
    ld a, $04
    ld [wGameState], a
    ld a, $09
    ld [$c5a2], a
    ret


jr_000_0884:
    ld e, $15
    call Call_000_1904
    ld a, $04
    ld [wGameState], a
    xor a
    ld [$c5a2], a
    ret


    ld a, [$c5a2]
    ld hl, $08a6
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    db $ec, $08, $21, $09, $48, $09, $4c, $0a, $8a, $0a, $d5, $0a, $f6, $0a

    ld [hl], b
    dec bc

    db $a0, $0b, $08, $0c, $20, $0c, $61, $0c

    add d
    inc c
    and $0e

Jump_000_08c2:
    and $0e
    and $0e
    or h
    inc c
    pop bc
    inc c
    dec a
    dec c
    and l
    dec c
    or h
    dec c
    pop de
    dec c
    ld a, [bc]
    ld c, $19
    ld c, $2b
    ld c, $3f
    ld c, $4e
    ld c, $65
    ld c, $e6
    ld c, $e6
    ld c, $e6
    ld c, $e6
    ld c, $76
    ld c, $bd
    ld c, $d6
    db $0e

    ld a, [$c67f]
    or a

Call_000_08f0:
    jr z, jr_000_08f5

    call Call_000_01bf

jr_000_08f5:
    ld a, $01
    ld [$c5a7], a
    ld a, $09
    call Call_000_1c56
    ld a, $03
    call Call_000_1c56
    ld a, $01
    rst $18
    ld b, $00
    ld c, $00
    ld e, $23
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $20
    call $541a
    call Call_000_1b0f
    jp Jump_000_2041


    xor a
    ld hl, $c736
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [$c72d], a
    ld hl, $a010
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jp Jump_000_2041


    ld hl, $a010
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [$c72d]
    or a
    jr nz, jr_000_0969

    ld a, $08
    call $681e

jr_000_0969:
    ld a, [$c6db]
    add $0a
    ldh [$ffa0], a
    ld [$c840], a
    call $6727
    call Call_000_1b0f
    call $5ac2
    call $5c08
    call $5ca1
    call $5ef2
    call Call_000_2041
    xor a
    ld [$c5a3], a
    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $10
    ld c, $11
    call $541a
    ld a, [$a459]
    cp $1f
    jp z, Jump_000_09f4

    ld a, [$c6dc]
    add $01
    ld c, $00

jr_000_09af:
    ld b, a
    sub $0a
    jr c, jr_000_09b7

    inc c
    jr jr_000_09af

jr_000_09b7:
    ld a, c
    or a
    jr nz, jr_000_09d1

    push bc
    ld b, $03
    ld c, $07
    ld e, $80
    call Call_000_1b27
    pop bc
    ld a, b
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    jp Jump_000_1b27


jr_000_09d1:
    push bc
    ld b, $02
    ld c, $07
    ld e, $80
    call Call_000_1b27
    pop bc
    push bc
    ld a, c
    add $81
    ld b, $08
    ld c, $07
    ld e, a
    call Call_000_1b27
    pop bc
    ld a, b
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    jp Jump_000_1b27


Jump_000_09f4:
    ld b, $02
    ld c, $07
    ld e, $80
    call Call_000_1b27
    ld a, [$c5c4]
    inc a
    ld b, $64
    ld c, $00

jr_000_0a05:
    ld d, a
    sub b
    jr c, jr_000_0a0c

    inc c
    jr jr_000_0a05

jr_000_0a0c:
    ld a, c
    or a
    jr z, jr_000_0a1c

    add $81
    push de
    ld b, $07

Jump_000_0a15:
    ld c, $07
    ld e, a
    call Call_000_1b27
    pop de

jr_000_0a1c:
    ld a, d
    ld b, $0a
    ld c, $00

jr_000_0a21:
    ld d, a
    sub b
    jr c, jr_000_0a28

    inc c
    jr jr_000_0a21

jr_000_0a28:
    ld a, c
    add $81
    push de
    ld b, $08
    ld c, $07
    ld e, a
    call Call_000_1b27
    pop de
    ld a, d
    ld b, $01
    ld c, $00

jr_000_0a3a:
    ld d, a
    sub b
    jr c, jr_000_0a41

    inc c
    jr jr_000_0a3a

jr_000_0a41:
    ld a, c
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    jp Jump_000_1b27


    ld a, $01
    ld [$c5c9], a
    ld a, [$c72d]
    or a
    jr nz, jr_000_0a5e

    ld a, $00
    call $682a
    or a
    ret z

jr_000_0a5e:
    ld a, [$c5a3]
    cp $78

Jump_000_0a63:
    jr z, jr_000_0a6a

    inc a
    ld [$c5a3], a
    ret


jr_000_0a6a:
    call Call_000_0ee7
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    xor a
    ld [$c72d], a
    ld a, $01
    ld [$c73d], a
    jp Jump_000_2041


    call $547f
    or a
    ret nz

    call Call_000_2321
    ld a, [$c116]
    or a
    call z, $6fcd
    call $70a4
    call $7881
    ld a, [$c69a]
    or a
    jr z, jr_000_0ab2

    ldh a, [hInputHeld]
    and $44
    cp $44
    jr nz, jr_000_0ab2

    ld a, $02
    ld [$c0bc], a

jr_000_0ab2:
    ld hl, $c0bc
    ld a, [hl]
    or a
    ret z

    cp $02
    jr z, jr_000_0acf

    xor a
    ld [$c5a3], a
    ld a, $01
    ld [$c72d], a
    call Call_000_1b0f
    ld a, $13
    ldh [$ffa0], a
    jp Jump_000_2041


jr_000_0acf:
    ld a, $10
    ld [$c5a2], a
    ret


    ld a, $3c
    ld [$c5a3], a
    ld a, $0a
    ld [$c5a5], a
    ld b, $01
    ld c, $04
    ld e, $60
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call $541a
    jp Jump_000_2041


    ld a, $01
    ld [$c5c9], a
    ldh a, [hInputPressed]
    and $08
    jr z, jr_000_0b20

    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call $541a
    ld a, $01
    ldh [$ffa0], a
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


jr_000_0b20:
    ldh a, [hInputPressed]
    and $01
    jr z, jr_000_0b2b

    ld a, $3c
    ld [$c5a3], a

jr_000_0b2b:
    ld a, [$c5a3]
    cp $3c
    jr z, jr_000_0b37

    inc a
    ld [$c5a3], a
    ret


jr_000_0b37:
    xor a
    ld [$c5a3], a
    ld a, [$c5a5]
    sub $01
    jr c, jr_000_0b5f

    ld [$c5a5], a
    add $61
    ld b, $0a
    ld c, $04
    ld e, a
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    ld a, $17
    ldh [$ffa1], a
    ret


jr_000_0b5f:
    xor a
    ld [$c5a3], a
    ld [$c5a5], a
    ld a, $01
    ldh [$ffa0], a
    call Call_000_2041
    jp Jump_000_2041


    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $05
    ret nz

    ld a, $09
    call Call_000_1c56
    ld a, $03
    call Call_000_1c56
    ld a, $01
    rst $18
    ld a, [$c5fc]
    cp $99
    jr z, jr_000_0b9a

    ld hl, $c5fd
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], $01
    call $5ac2

jr_000_0b9a:
    ld a, $02
    ld [$c5a2], a
    ret


    ld de, $c0a0
    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_0be3

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $27af
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld [hl], $d0
    inc hl
    ld [hl], $d1
    pop hl
    ld b, $00
    ld c, $20
    add hl, bc
    ld [hl], $d2
    inc hl
    ld [hl], $d3
    ld hl, $0014
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    jp $5e20


Jump_000_0be3:
    ld a, $15
    ldh [$ffa0], a
    ld hl, $c0a0
    call $5453
    ld b, $04
    ld c, $06
    ld e, $03
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    ld a, [$c5a3]
    cp $b4
    jr z, jr_000_0c14

    inc a
    ld [$c5a3], a
    ret


jr_000_0c14:
    xor a
    ld [$c5a3], a
    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld a, [$c67f]
    or a
    jr z, jr_000_0c30

    call Call_000_01c2

jr_000_0c30:
    ld b, $00
    ld c, $00
    ld e, $27
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call $541a
    call Call_000_1b0f
    ld a, $02
    rst $10
    call $46fd
    ld a, $01
    rst $18
    ld a, $08
    call $681e
    ld a, $05

Call_000_0c57:
    rst $10
    call $6254
    ld a, $01
    rst $18
    jp Jump_000_2041


    ld a, [$a459]
    cp $1f
    jp z, Jump_000_2041

    ld a, $00
    call $682a
    or a
    ret z

    ldh a, [hInputPressed]
    and $0f
    ret z

    ld a, $08
    call $681e
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    ld a, [$a459]
    cp $1f
    jp z, Jump_000_0c91

    ld a, $01
    call $682a
    or a
    ret z

Jump_000_0c91:
    ld a, $02
    rst $10
    call $4a84
    push af
    ld a, $01
    rst $18
    pop af
    or a
    jr nz, jr_000_0caa

    ld a, $04
    ld [wGameState], a
    ld a, $09
    ld [$c5a2], a
    ret


jr_000_0caa:
    ld a, $04
    ld [wGameState], a
    xor a
    ld [$c5a2], a
    ret


    ld a, $08
    call $681e
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld hl, $a010
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, $05
    rst $10
    call $61c4
    ld a, $01
    rst $18
    ld a, [$c6dc]
    inc a
    ld [$c6dc], a
    ld a, [$c5c4]
    inc a
    ld [$c5c4], a
    ld a, [$c6dc]
    cp $14
    jr z, jr_000_0d0b

    ld a, $05
    rst $10

Jump_000_0cff:
    call $628d
    ld a, $01
    rst $18
    ld a, $02
    ld [$c5a2], a
    ret


jr_000_0d0b:
    ld a, [$a459]
    cp $1f
    jp z, Jump_000_0d19

    ld a, $20
    ld [$c5a2], a
    ret


Jump_000_0d19:
    ld a, [$c5c4]
    cp $64
    jr z, jr_000_0d3a

    ld a, [$c6db]
    inc a
    ld [$c6db], a
    xor a
    ld [$c6dc], a
    ld a, $05
    rst $10
    call $628d
    ld a, $01
    rst $18
    ld a, $02
    ld [$c5a2], a
    ret


jr_000_0d3a:
    jp Jump_000_2041


    ld a, [$c6db]
    cp $04
    jr z, jr_000_0d79

    ld a, [$c67f]
    or a
    jr z, jr_000_0d4d

    call Call_000_01bc

jr_000_0d4d:
    ld a, $0a
    call Call_000_1c56
    ld a, [$c6db]
    add $0b
    call Call_000_1c56
    ld a, $01
    rst $18
    ld a, [$c6db]
    add $30
    ld e, a
    call Call_000_1904
    call Call_000_1b0f
    ld a, $17
    ldh [$ffa0], a
    ld a, $08
    call $681e
    xor a
    ld [$c5ed], a
    jp Jump_000_2041


jr_000_0d79:
    ld a, [$c67f]
    or a
    jr z, jr_000_0d82

    call Call_000_01e0

jr_000_0d82:
    ld a, $10
    call Call_000_1c56
    ld a, $01
    rst $18
    ld e, $35
    call Call_000_1904
    call Call_000_1b0f
    ld a, $18
    ldh [$ffa0], a
    ld a, $08
    call $681e
    xor a
    ld [$c5ed], a
    ld a, $16
    ld [$c5a2], a
    ret


    ld a, $00
    call $682a
    or a
    ret z

    ld a, $90
    ld [$c5ab], a
    jp Jump_000_2041


    ldh a, [hInputPressed]
    and $01
    jr nz, jr_000_0dc4

    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

jr_000_0dc4:
    ld a, $08
    call $681e
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld hl, $0e02
    ld a, [$c6db]
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, [$c67e]
    or b
    ld [$c67e], a
    ld [$a459], a
    ld a, $05
    rst $10
    call $61c4
    ld a, $01
    rst $18
    ld a, $05
    ld [wGameState], a
    ld a, $0a
    ld [$c5a2], a
    ret


    ld bc, $0402
    ld [$2010], sp
    ld b, b
    add b
    ld a, $00
    call $682a
    or a
    ret z

    ld a, $d8
    ld [$c5ab], a
    jp Jump_000_2041


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld e, $36
    call Call_000_1904
    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $00
    call $682a
    or a
    ret z

    ld a, $d8
    ld [$c5ab], a
    jp Jump_000_2041


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, $08
    call $681e
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    ld a, $09
    ld [wGameState], a
    xor a
    ld [$c5a2], a
    ret


    ld a, [$c67f]
    or a
    jr z, jr_000_0e7f

    call Call_000_01c2

jr_000_0e7f:
    xor a
    ld [$c5ed], a
    ld b, $00
    ld c, $00
    ld e, $27
    call Call_000_1b27
    ld b, $07
    ld c, $0d
    ld e, $0d
    call Call_000_1b27
    ld b, $0a
    ld c, $0d
    ld e, $0d
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call $541a
    call Call_000_1b0f
    ld a, $02
    rst $10
    call $46fd
    ld a, $01
    rst $18
    ld a, $08
    call $681e
    jp Jump_000_2041


    ld a, $00
    call $682a
    or a
    ret z

    ldh a, [hInputPressed]
    and $0f
    ret z

    ld a, $08
    call $681e
    ld a, $02
    ld [$cb96], a

Call_000_0ed3:
    jp Jump_000_2041


    ld a, $01
    call $682a
    or a
    ret z

    call Call_000_1b0f
    ld a, $12
    ld [$c5a2], a
    ret


    ret


Call_000_0ee7:
    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld a, $09
    rst $10
    ld a, [$c6db]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $4000
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld d, $00
    ld e, a
    sla e

Jump_000_0f0c:
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, h
    ld e, l
    ld hl, $d041
    ld c, $0f

jr_000_0f19:
    push hl
    ld b, $05

jr_000_0f1c:
    ld a, [de]

Jump_000_0f1d:
    and $f0
    jr z, jr_000_0f32

    push hl
    push de
    swap a
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_0f32:
    ld [hl+], a
    ld a, [de]
    and $0f
    jr z, jr_000_0f47

    push hl
    push de
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_0f47:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_0f1c

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_0f19

    ld a, $01
    rst $18
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    ret


    ldh [$ffe1], a
    ldh [c], a
    db $e3

    db $e4

    push hl
    and $e0
    call $73bc
    call $73c2
    ld a, [$c5a2]

Jump_000_0f76:
    ld hl, $0f86
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    jp z, $d00f

    rrca
    db $e4
    rrca
    rst $28
    rrca
    ld a, [de]
    db $10
    ld b, c
    db $10
    sbc l
    db $10
    jp $fc10


    db $10
    ld e, $11
    ld l, b
    ld de, $11ae
    ret


    ld de, $11fe
    inc d
    ld [de], a
    ld a, [hl-]
    ld [de], a
    or l
    ld [de], a
    rst $30
    ld [de], a
    ld l, l
    inc de
    and e
    inc de
    push bc
    inc de
    rrca
    inc d
    ld a, h
    inc d
    sub c
    inc d
    rst $30
    inc d
    ld a, [de]
    dec d
    ld d, c
    dec d
    ld l, d
    dec d
    ld a, a
    dec d
    and a
    dec d
    cp a
    ld d, $fb
    ld d, $31

Call_000_0fc7:
    rla
    ld l, c
    rla
    call Call_000_2216
    jp Jump_000_2041


    ld a, [$d605]
    or a
    jr nz, jr_000_0fd9

    jp Jump_000_2041


jr_000_0fd9:
    ld a, $fe
    ld [$d62d], a
    call Call_000_2041
    jp Jump_000_2041


    ld a, $02
    ld [wGameState], a
    ld a, $01
    ld [$c5a2], a
    ret


    call Call_000_1868
    or a
    ret nz

    call $67f8
    ld a, $15
    call Call_000_1c56
    ld a, $16
    call Call_000_1c56

Jump_000_1001:
    ld a, $01
    rst $18
    xor a
    ld [$c5ed], a
    ld [$c5a3], a
    call Call_000_1b0f
    ld a, [$c67f]
    or a
    jr z, jr_000_1017

    call Call_000_01fe

jr_000_1017:
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $0a
    ret nz

    ld a, $04
    call Call_000_1c56
    ld a, $01
    rst $18
    ld a, $05
    rst $10
    call $61eb
    ld a, $01
    rst $18
    xor a
    ld [$cb90], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $00
    ld [$c7a1], a
    ld [$c7a2], a
    ld [$c7a5], a
    ld [$c7a6], a
    ld b, $00
    ld c, $00
    ld e, $4f
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call $541a
    ld a, $03
    call $681e
    xor a
    ld [$c7d3], a
    ld a, $01
    ld [$c7d2], a
    ld hl, $c240
    ld a, $01
    ld [hl], a
    ld hl, $c242
    ld a, $30
    ld [hl], a
    ld hl, $c243
    ld a, $58
    ld [hl], a
    ld hl, $c244
    ld a, $c0
    ld [hl], a
    ld a, $01
    ld de, $c240
    call Call_000_1ddb
    ld a, $04
    ldh [$ffa0], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld a, $00
    call $682a
    or a
    ret z

    call $76e0
    or a
    ret z

    ld a, $04
    ldh [$ffa1], a
    ld a, $03
    call $681e
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    inc a
    cp $5a
    jp z, Jump_000_10f4

    ld [$c5a3], a
    ld a, [$d601]
    or a
    jr z, jr_000_10e6

    ld a, [$c7d3]
    or $80
    ld [$d62d], a
    call $773e
    ret


jr_000_10e6:
    ld a, [$c7af]
    or a
    ret z

    and $0f
    ld [$c7d3], a
    call $773e
    ret


Jump_000_10f4:
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld a, $01
    call $682a
    or a
    ret z

    xor a
    ld [$c5a3], a

Jump_000_1111:
    ld hl, $c240
    call $5453
    xor a
    ld [$c5c4], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c67f]
    or a
    jr z, jr_000_112c

    call Call_000_0201

jr_000_112c:
    ld b, $00
    ld c, $00
    ld e, $29
    call Call_000_1b27
    xor a
    ld [$c7a9], a
    ld [$c7aa], a
    ld [$c7ca], a
    ld [$c7cb], a
    ld [$c7cc], a
    ld [$c7cd], a
    ld [$c7ce], a
    ld [$c7cf], a
    ld [$c7d0], a
    ld [$c7d1], a
    ld [$c7a3], a
    ld [$c7a4], a
    ld [$c7a7], a
    ld [$c7a8], a
    ld a, $01
    ld [$c7a0], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c7af]
    cp $11
    jr jr_000_117a

    ld a, $11
    ld [$d62d], a
    ret


jr_000_117a:
    ld a, $03
    call $681e
    call $7253
    call Call_000_1b0f
    call $7343
    call $7454
    call $74cd
    ld a, $00
    ld [$c5a3], a
    ld b, $01
    ld c, $00
    ld e, $71
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $0a
    ld c, $18
    call $541a
    ld a, $04
    ldh [$ffa0], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld h, $00
    ld l, $0a
    ld b, $0a
    ld c, $18
    call $541a
    ld a, $01
    ld [$d62d], a
    ld [$c7ac], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $02
    rst $10
    call $54c5
    ld a, $01
    rst $18
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $28
    ld [hl], a
    ld hl, $c1e3
    ld a, $18
    ld [hl], a
    ld hl, $c1e4
    ld a, $c0
    ld [hl], a
    ld a, $01
    ld de, $c1e0
    call Call_000_1ddb
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a

Jump_000_1202:
    ret nz

    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $14
    ret nz

    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    cp $0a
    jr z, jr_000_1230

    inc a
    ld [$c5a3], a
    ld a, $01
    ld [$d62d], a
    call Call_000_1787
    call $17dc
    ret


jr_000_1230:
    xor a
    ld [$c7d4], a
    ld [$c7d5], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld a, $00
    call $682a
    or a
    jp z, Jump_000_12b1

    ldh a, [hInputPressed]
    and $01
    jr z, jr_000_1264

    ld a, $04
    ldh [$ffa1], a
    ld a, $04
    ld [$d62d], a
    ld a, $00
    ld [$c5a3], a
    jp Jump_000_2041


jr_000_1264:
    ldh a, [hInputPressed]
    and $40
    jr z, jr_000_1288

    ld a, $13
    ldh [$ffa1], a
    ld a, [$c7ac]
    cp $01
    jr z, jr_000_127e

    dec a
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_127e:
    ld a, $03
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_1288:
    ldh a, [hInputPressed]
    and $80
    jr z, jr_000_12b1

    ld a, $13
    ldh [$ffa1], a
    ld a, [$c7ac]
    cp $03
    jr z, jr_000_12a2

    inc a
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_12a2:
    ld a, $01
    ld [$c7ac], a
    ld [$d62d], a

jr_000_12aa:
    call Call_000_1787
    call $17dc
    ret


Jump_000_12b1:
jr_000_12b1:
    call $17dc
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    call $17dc
    ld a, $04
    ld [$d62d], a
    ld a, [$c7af]
    cp $04
    jr z, jr_000_12e5

    ld a, [$c5a3]

Jump_000_12d1:
    inc a
    ld [$c5a3], a
    and $08
    jr z, jr_000_12df

    ld hl, $c1e0

Call_000_12dc:
    ld [hl], $00
    ret


jr_000_12df:
    ld hl, $c1e0
    ld [hl], $01
    ret


jr_000_12e5:
    ld a, $03
    call $681e
    ld a, $00
    ld [$c5a3], a
    ld a, $02
    ld [$cb96], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    call $682a
    or a
    ret z

    ld a, [$d601]
    or a
    jr z, jr_000_1320

    call $5e0c
    ld a, [$c5c5]
    and $01
    ld [$d62d], a
    ld [$c7ad], a
    call $5e0c
    ld a, [$c5c5]
    ld [$c7ae], a

jr_000_1320:
    call Call_000_1b0f
    ld a, $03
    call $681e
    call Call_000_2041
    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld a, $02
    rst $10
    call $47c4
    ld a, $01
    rst $18
    ld a, [$c7d2]
    add $81
    ld hl, $d0c1
    ld [hl], a

Jump_000_1346:
    ld b, $02
    ld c, $06
    ld e, $77
    call Call_000_1b27
    ld b, $03
    ld c, $08
    ld e, $78
    call Call_000_1b27
    ld a, [$c7a0]
    add $81

Jump_000_135d:
    ld hl, $d109
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call $541a
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, [$d601]
    or a
    jr nz, jr_000_1383

    ld a, [$c7af]
    or a
    jr z, jr_000_1389

    ld [$c7ad], a
    jr jr_000_1389

jr_000_1383:
    ld a, [$c7ad]
    ld [$d62d], a

jr_000_1389:
    ld a, $00
    call $682a
    or a
    ret z

    ld a, [$c5a3]
    cp $78
    jr z, jr_000_139c

    inc a
    ld [$c5a3], a
    ret


jr_000_139c:
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $05
    ret nz

    ld a, [$d601]
    or a
    jr z, jr_000_13be

    ld a, [$c7ae]
    ld [$d62d], a

jr_000_13be:
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$d601]
    or a
    jr nz, jr_000_13de

    ld a, [$c7af]
    or a
    jr z, jr_000_13e4

    ld a, [$c7af]
    ld [$c7ae], a
    jr jr_000_13e4

jr_000_13de:
    ld a, [$c7ae]
    ld [$d62d], a

jr_000_13e4:
    ld a, [$c5a3]
    cp $0a
    jr z, jr_000_13f0

    inc a
    ld [$c5a3], a
    ret


jr_000_13f0:
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $24
    ld [hl], a
    ld hl, $c1e3
    ld a, $98
    ld [hl], a
    ld hl, $c1e4
    ld a, $c4
    ld [hl], a
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld de, $c1e0
    ld hl, $0003
    add hl, de
    ld a, [hl]
    cp $48
    jr z, jr_000_1430

    sub $04
    ld [hl], a
    cp $48
    ret nz

    ld a, $18
    ldh [$ffa1], a
    ret


jr_000_1430:
    ld b, $01
    ld c, $06
    ld e, $79
    call Call_000_1b27
    ld h, $00
    ld l, $c1
    ld b, $0a
    ld c, $03
    call $541a
    ld a, [$c5a3]
    cp $78
    jr z, jr_000_1450

    inc a
    ld [$c5a3], a
    ret


jr_000_1450:
    xor a
    ld [$c5a3], a
    ld hl, $c1e0
    call $5453
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    call $73cb
    ld a, $11
    ldh [$ffa0], a
    ld [$c840], a
    xor a
    ld [$c5a3], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $0a
    ret nz

    call Call_000_188a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    call $77f2
    call $7763
    call $73d5
    call Call_000_180a
    ld a, [$c7ab]
    ld [$c7c4], a
    call $760e
    ld a, [$c6da]
    or a
    jp nz, Jump_000_14c7

    call $58c2
    ld a, [$c64a]
    or a
    ret nz

    call Call_000_2321
    call $6fcd
    call $70a4
    call $7881
    ret


Jump_000_14c7:
    ld a, [$c64a]
    or a
    jr z, jr_000_14d8

    ld a, [$c7af]
    or $d0
    ld [$c7af], a
    call $58c2

jr_000_14d8:
    ld hl, $c1e0
    call $5453
    ld hl, $c200
    call $5453
    call $666a
    call $6fcd
    call Call_000_2041
    ld a, $0a
    ld [$c5a3], a
    xor a
    ld [$c5a5], a
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5db]
    and $03
    jr z, jr_000_1509

    ld a, [$c7d6]
    ld [$d62d], a

jr_000_1509:
    call $760e
    ld a, [$c5a3]
    dec a
    ld [$c5a3], a
    ret nz

    call $7629
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $14
    ldh [$ffa0], a
    ld de, $c100
    ld hl, $0005
    add hl, de
    ld [hl], $01
    xor a
    ld [$c7d4], a
    ld [$c7d5], a
    xor a
    ld [$c7ab], a
    call $7544
    ld b, $0e
    ld c, $09
    ld e, $7a
    call Call_000_1b27
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call $541a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    call $7927
    ld a, [$c7c8]
    or a
    ret z

    xor a
    ld [$c5c9], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $40
    ld [$d62d], a
    ld a, [$c7af]
    and $40
    cp $40
    ret nz

    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, [$c7af]
    and $80
    cp $80
    jr z, jr_000_1597

    ldh a, [hInputPressed]
    and $01
    ret z

    ld a, $80
    ld [$d62d], a

jr_000_1597:
    call Call_000_1b0f
    xor a
    ld [$c5ed], a
    ld [$c5a3], a
    ld [$c5a5], a
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld a, [$c5a3]
    or a
    jp nz, Jump_000_1614

    ld a, [$c5db]
    and $03
    jr z, jr_000_15c4

    ld a, $f0
    ld [$d62d], a

jr_000_15c4:
    ld de, $c0a0
    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_1608

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $27af
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld [hl], $d3
    inc hl
    ld [hl], $d4
    pop hl
    ld b, $00
    ld c, $20
    add hl, bc
    ld [hl], $d5
    inc hl
    ld [hl], $d6
    ld hl, $0014
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $5e20
    ret


Jump_000_1608:
    ld hl, $c0a0
    call $5453
    ld a, $01
    ld [$c5a3], a
    ret


Jump_000_1614:
    ld a, [$c5a5]
    inc a
    ld [$c5a5], a
    cp $78
    ret nz

    ld a, [$c7c7]
    cp $02
    jp z, Jump_000_16ad

    or a
    jr nz, jr_000_1654

    ld hl, $c7a9
    inc [hl]
    ld a, [hl]
    ld b, a
    ld a, $04
    sub b
    ld b, $00
    ld c, a
    ld hl, $c7ca
    add hl, bc
    ld a, [$c7c9]
    ld [hl], a
    ld a, [$c7d2]
    srl a
    inc a
    ld b, a
    ld a, [$c7a9]
    cp b
    jr nz, jr_000_16ad

    ld hl, $c7a3
    ld [hl], $00
    inc hl
    ld [hl], $01
    jr jr_000_167d

jr_000_1654:
    ld hl, $c7aa
    inc [hl]
    ld a, [hl]
    ld b, a
    ld a, $04
    sub b
    ld b, $00
    ld c, a
    ld hl, $c7ce
    add hl, bc
    ld a, [$c7c9]
    ld [hl], a
    ld a, [$c7d2]
    srl a
    inc a
    ld b, a
    ld a, [$c7aa]
    cp b
    jr nz, jr_000_16ad

    ld hl, $c7a7
    ld [hl], $00
    inc hl
    ld [hl], $01

jr_000_167d:
    ld b, $01
    ld c, $00
    ld e, $46
    call Call_000_1b27
    ld b, $03
    ld c, $05
    ld e, $4d
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    call $7343
    call $7454
    call $74cd
    xor a
    ld [$c5a3], a
    ld [$c5a5], a
    jp Jump_000_2041


Jump_000_16ad:
jr_000_16ad:
    xor a
    ld [$c5a3], a
    ld [$c5a5], a
    ld a, $03
    call $681e
    call Call_000_2041
    jp Jump_000_2041


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    ld [$c5c9], a
    ld a, [$c7af]
    and $20
    jr nz, jr_000_16da

Call_000_16d0:
    ldh a, [hInputPressed]
    and $01
    ret z

    ld a, $20
    ld [$d62d], a

jr_000_16da:
    ld a, $04
    ldh [$ffa1], a
    call $67f8
    ld a, [$c5c4]
    inc a
    cp $0a
    jr nz, jr_000_16ea

    xor a

jr_000_16ea:
    ld [$c5c4], a
    xor a
    ld [$c5a3], a
    call Call_000_2041
    call Call_000_2041
    call Call_000_2041
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, $01
    call $682a
    or a
    ret z

    ld b, $00
    ld c, $00
    ld e, $29
    call Call_000_1b27
    xor a
    ld [$c5a3], a
    call Call_000_2041
    ld a, [$c7c7]
    cp $02
    ret z

    ld a, [$c7a0]
    inc a
    ld [$c7a0], a
    ld a, [$c5c4]
    inc a
    cp $0a
    jr nz, jr_000_172d

    xor a

jr_000_172d:
    ld [$c5c4], a
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $0a
    ret nz

    ld b, $00
    ld c, $00
    ld e, $29
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $541a
    call $7253
    call Call_000_1b0f
    call $7343
    call $7454
    call $74cd
    ld a, $11
    ld [$c5a2], a
    ret


    call Call_000_1868
    or a
    ret nz

    ld a, $20
    ld [$d62d], a
    ld a, [$c5a3]
    inc a
    ld [$c5a3], a
    cp $0a
    ret nz

    xor a
    ld [$c5a3], a
    ld a, $09
    ld [$c5a2], a
    ret


Call_000_1787:
    ld b, $01
    ld c, $00
    ld e, $76
    call Call_000_1b27
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $08
    call $541a
    ld a, [$c7ac]
    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $17d4
    add hl, bc
    ld a, [hl]
    ld b, $01
    ld c, a
    ld e, $71
    call Call_000_1b27
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $28
    ld [hl], a
    ld a, [$c7ac]
    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $17d4
    add hl, bc
    inc hl
    ld a, [hl]
    ld [$c1e3], a
    ret


    ld bc, $0318

jr_000_17d7:
    jr z, jr_000_17de

    jr c, jr_000_17e0

    jr c, jr_000_17d7

    xor a

jr_000_17de:
    rst $00
    or a

jr_000_17e0:
    ret z

    cp $04
    ret z

    ld b, $02
    ld c, $0c
    ld e, $72
    call Call_000_1b27
    ld a, [$c7af]
    and $07
    dec a
    ld b, $73
    add b
    ld b, $05
    ld c, $0e
    ld e, a
    call Call_000_1b27
    ld h, $01
    ld l, $80
    ld b, $0a
    ld c, $04
    call $541a
    ret


Call_000_180a:
    ld a, [$c7ab]
    or a
    jr nz, jr_000_182e

    ld a, [$c7ab]
    ld b, a
    ld a, [$c7c4]
    xor b
    ret z

    ld b, $0e
    ld c, $09
    ld e, $7a
    call Call_000_1b27
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call $541a
    ret


jr_000_182e:
    ld a, [$c5ac]
    and $07
    ret nz

    ld a, [$c7c5]
    xor $01
    ld [$c7c5], a
    jr nz, jr_000_1853

    ld b, $0e
    ld c, $09
    ld e, $7b
    call Call_000_1b27
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call $541a
    ret


jr_000_1853:
    ld b, $0e
    ld c, $09
    ld e, $7a
    call Call_000_1b27
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call $541a
    ret


Call_000_1868:
    ld a, [$c7af]
    cp $ff
    jp z, Jump_000_187e

    ld a, [$d607]
    cp $0f
    jp z, Jump_000_187e

    inc a
    ld [$d607], a
    xor a
    ret


Jump_000_187e:
    ld a, $0a
    ld [wGameState], a
    xor a
    ld [$c5a2], a
    ld a, $01
    ret


Call_000_188a:
    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_1b27
    ld a, $09
    rst $10
    ld a, [$c5c4]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $5f5f
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, h
    ld e, l
    ld hl, $d041
    ld c, $0f

jr_000_18ae:
    push hl
    ld b, $05

jr_000_18b1:
    ld a, [de]
    and $f0
    jr z, jr_000_18c7

    push hl
    push de
    swap a
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_18c7:
    ld [hl+], a
    ld a, [de]
    and $0f
    jr z, jr_000_18dc

    push hl
    push de
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_18dc:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_18b1

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_18ae

    ld a, $01
    rst $18
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call $541a
    ret


    ld a, $05
    rst $10
    call $663e
    ld a, $01
    rst $18
    ret


Call_000_1904:
    ld a, $01
    rst $18
    ld b, $00
    ld c, $00
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    jp $541a


Call_000_1919:
    ld a, [$c66d]
    or a
    ret z

    ld a, $0e
    rst $10
    ld hl, $c66e
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld de, $c670
    ld a, [de]
    inc de
    ld b, a
    ld a, [de]
    ld d, b
    ld e, a
    ld bc, $00c0
    call Call_000_1a50
    ld a, $01
    rst $18
    ld a, [$c672]
    inc a
    cp $07
    jr z, jr_000_1969

    ld [$c672], a
    ld hl, $c66e
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld bc, $00c0
    add hl, bc
    ld a, h
    ld [$c66e], a
    ld a, l
    ld [$c66f], a
    ld hl, $c670
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld bc, $00c0
    add hl, bc
    ld a, h
    ld [$c670], a
    ld a, l
    ld [$c671], a
    ret


jr_000_1969:
    xor a
    ld [$c66d], a
    ld [$c672], a
    ret


Call_000_1971:
    ld c, $00
    ld a, $20
    ldh [c], a
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ld b, a
    ld a, $10
    ldh [c], a
    ld a, b
    and $0f
    swap a
    ld b, a
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    and $0f
    or b
    cpl
    ld b, a
    ld a, $30
    ldh [c], a
    ldh a, [hInputHeld]
    xor b
    and b
    ldh [hInputPressed], a
    ld a, b
    ldh [hInputHeld], a
    ret


    ; copy an OAM DMA transfer routine from program rom to hram
CopyDMARoutineToHRAM:
    ld c, $80 ; hram start offset ($ff80)
    ld b, $0a ; loop counter
    ld hl, $19b1 ; rom data start index

jr_000_19aa:
    ld a, [hl+] ; get data from rom index, increase i
    ldh [c], a ; store data in hram offset
    inc c ; move to next hram offset
    dec b ; dec counter
    jr nz, jr_000_19aa

    ret

    ; OAM DMA routine
    ; starts DMA transfer from ROM to RAM
    ; $3e, $c0  ld a, $c0
    ; $e0, $46  ldh [rDMA], a
    ; $3e, $28  ld a, $28
    ; $3d       dec a
    ; $20, $fd  jr nz, -3 (back to dec a)
    ; $c9       ret
    db $3e, $c0, $e0, $46, $3e, $28, $3d, $20, $fd, $c9

Call_000_19bb:
    ldh a, [$ff8e]
    sub $10
    srl a
    srl a
    srl a
    ld de, $0000
    ld e, a
    ld hl, $9800
    ld b, $20

jr_000_19ce:
    add hl, de
    dec b
    jr nz, jr_000_19ce

    ldh a, [$ff8f]
    sub $08
    srl a
    srl a
    srl a
    ld de, $0000
    ld e, a
    add hl, de
    ld a, h
    ldh [$ff90], a
    ld a, l
    ldh [$ff91], a
    ret


    ldh a, [$ff90]
    ld d, a
    ldh a, [$ff91]
    ld e, a
    ld b, $04

jr_000_19f0:
    rr d
    rr e
    dec b
    jr nz, jr_000_19f0

    ld a, e
    sub $84
    and $fe
    rlca
    rlca
    add $08
    ldh [$ff8e], a
    ldh a, [$ff91]
    and $1f
    rla
    rla
    rla
    add $08
    ldh [$ff8f], a
    ret


    add a
    pop hl
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    pop hl
    jp hl


DisableLCD:
Jump_DisableLCD:
    ldh a, [rIE]    ; get which interrupts are enabled
    ldh [$ff93], a  ; store current IE state in $ff93
    res 0, a        ; turn off bit 0 of A
jr_000_1a20:        ; start of loop
    ldh a, [rLY]    ; get current scanline (LCDC Y)
    cp $91          ; is current scanline 145?
    jr nz, jr_000_1a20 ; wait until it is

    ; turn off the LCD
    ldh a, [rLCDC] ; get LCD control value
    and $7f        ; clear bit 7
    ldh [rLCDC], a ; copy result back to LCDC
    ldh a, [$ff93] ; get back original IE state
    ldh [rIE], a   ; restore it
    ret            ;return

    ; unreachable??
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ret


jr_000_1a38:
    ld a, $00
    ld [hl+], a
    dec bc
    ld a, c
    or b
    jr nz, jr_000_1a38

    ret

; Clears BG Tilemap from VRAM (words backwards from $9bff to $9800)
ClearBGTileMap:
    ld hl, $9bff ; start address
    ld bc, $0400 ; loop counter

jr_000_1a47:
    ; zero out VRAM starting at 9bff and work backwards
    ld a, $00
    ld [hl-], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1a47

    ret


Call_000_1a50:
jr_000_1a50:
    ld a, [hl+]
    call Call_000_20da
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1a50

    ret


Call_000_1a5c:
    ld a, [$c5c9]
    or a
    ret z

    ld a, $0b
    rst $10
    ld a, $19
    ld [$c5a0], a
    ld hl, $c0a0
    ld bc, $c000

jr_000_1a6f:
    ld a, [hl]
    and $01
    call nz, Call_000_1a91
    ld d, $00
    ld e, $20
    add hl, de
    ld a, [$c5a0]
    dec a
    ld [$c5a0], a
    jr nz, jr_000_1a6f

jr_000_1a83:
    ld a, c
    cp $a0
    jr z, jr_000_1a8d

    xor a
    ld [bc], a
    inc bc
    jr jr_000_1a83

jr_000_1a8d:
    ld a, $01
    rst $18
    ret


Call_000_1a91:
    push hl
    ld de, $0004
    add hl, de
    ld a, [hl]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $4000
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld d, h
    ld e, l
    pop hl

Jump_000_1aa9:
    push af
    push hl
    push de
    ld de, $0003
    add hl, de
    ld a, [hl]
    pop de
    push bc
    ld b, a
    ld a, [de]
    add b
    pop bc
    ld [bc], a
    inc bc
    inc de
    pop hl
    push hl
    push de
    ld de, $0002
    add hl, de
    ld a, [hl]
    pop de
    push bc
    ld b, a
    ld a, [de]
    add b
    pop bc
    ld [bc], a
    inc bc
    inc de
    pop hl
    ld a, [de]
    ld [bc], a
    inc bc
    inc de
    ld a, [de]
    or a
    jr nz, jr_000_1ae5

    push hl
    push de
    ld de, $0000
    add hl, de
    ld a, [hl]
    and $f0
    ld [bc], a
    pop de
    inc bc
    inc de
    inc de
    pop hl
    jr jr_000_1aee

jr_000_1ae5:
    push hl
    inc de
    ld a, [de]
    and $f0
    ld [bc], a
    inc bc
    inc de
    pop hl

jr_000_1aee:
    pop af
    dec a
    jp nz, Jump_000_1aa9

    ret


; clear out the OAM buffer in work ram
ClearOAMBuffer:
    
    ld b, $a0 ; loop counter - 160
    ld a, $00
    ld hl, $c000 ; start address of buffer

    .loop:
        ld [hl+], a
        dec b
        jr nz, .loop

        ret


    ; clear wram from $c0a0 to $e000
Call_000_1b00:
    ld bc, $1f60 ; counter
    ld hl, $c0a0 ; start address

    .loop:
        ld a, $00
        ld [hl+], a
        dec bc
        ld a, b
        or c
        jr nz, .loop

    ret


Call_000_1b0f:
    ld a, $01
    ld [$c5c9], a
    ld bc, $0320
    ld hl, $c0a0

jr_000_1b1a:
    xor a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1b1a

    ld a, $01
    ld [$c5c9], a
    ret


Call_000_1b27:
Jump_000_1b27:
    ld a, $08
    rst $10
    push de
    ld a, b
    and $1f
    ld b, a
    ld a, c
    and $1f
    ld c, a
    ld d, $00
    ld e, c
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, $d000
    ld c, b
    ld b, $00
    add hl, bc
    add hl, de
    pop de
    push hl
    ld hl, $4000
    ld d, $00
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    pop hl
    ld b, h
    ld c, l
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    and $03
    jr z, jr_000_1b78

    dec a
    jr z, jr_000_1b99

    dec a
    jp z, Jump_000_1bf9

    jp Jump_000_1c25


jr_000_1b78:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1b8a

    cp $fd
    jr z, jr_000_1b96

    ld [hl+], a
    jr jr_000_1b78

jr_000_1b8a:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h
    ld c, l
    pop de
    jr jr_000_1b78

jr_000_1b96:
    inc hl
    jr jr_000_1b78

Jump_000_1b99:
jr_000_1b99:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    ld a, [de]
    and $c0
    cp $c0
    jp z, Jump_000_1be6

    cp $80
    jp z, Jump_000_1bd3

    cp $40
    jp z, Jump_000_1bc1

    push bc
    ld a, [de]
    inc a
    ld b, a

Jump_000_1bb6:
    inc de
    ld a, [de]
    ld [hl+], a
    dec b
    jp nz, Jump_000_1bb6

    pop bc
    jp Jump_000_1b99


Jump_000_1bc1:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bca:
    ld [hl+], a
    dec b
    jp nz, Jump_000_1bca

    pop bc
    jp Jump_000_1b99


Jump_000_1bd3:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bdc:
    ld [hl+], a
    inc a
    dec b
    jp nz, Jump_000_1bdc

    pop bc
    jp Jump_000_1b99


Jump_000_1be6:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bef:
    ld [hl+], a
    dec a
    dec b
    jp nz, Jump_000_1bef

    pop bc
    jp Jump_000_1b99


Jump_000_1bf9:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1c14

    cp $fd
    jr z, jr_000_1c21

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_000_1c0c:
    ld [hl+], a
    dec b
    jr nz, jr_000_1c0c

    pop bc
    jp Jump_000_1bf9


jr_000_1c14:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h

Call_000_1c1c:
    ld c, l
    pop de
    jp Jump_000_1bf9


jr_000_1c21:
    inc hl
    jp Jump_000_1bf9


Jump_000_1c25:
jr_000_1c25:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1c45

    cp $fd
    jr z, jr_000_1c4a

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_000_1c38:
    ld [hl], a
    push de
    ld de, $0020
    add hl, de
    pop de
    dec b
    jr nz, jr_000_1c38

    pop bc
    jr jr_000_1c25

jr_000_1c45:
    inc bc
    ld h, b
    ld l, c
    jr jr_000_1c25

jr_000_1c4a:
    push de
    ld de, $0020
    add hl, de
    pop de
    jr jr_000_1c25

Jump_000_1c52:
    ld a, $01
    rst $18
    ret


Call_000_1c56:
    ld hl, $1c73
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    rst $10
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    inc de
    jp Jump_000_1d14


    ret


    db $a1, $1c, $a6, $1c, $ab, $1c, $b0, $1c

    or l
    inc e
    cp d
    inc e
    cp a
    inc e

    db $c4, $1c, $c9, $1c, $ce, $1c, $d3, $1c

    ret c

    inc e
    db $dd
    inc e
    ldh [c], a
    inc e
    rst $20
    inc e
    db $ec
    inc e
    pop af
    inc e

    db $f6, $1c

    ei
    inc e
    nop
    dec e
    dec b
    dec e
    ld a, [bc]
    dec e
    rrca
    dec e

    db $0d, $00, $40, $00, $88, $0d, $9d, $48, $00, $88, $0e, $40, $5a, $00, $88, $0e
    db $02, $62, $00, $88

    ld c, $ac
    ld l, d
    nop
    add b
    dec c
    ld a, b
    ld c, [hl]
    nop
    adc b
    ld c, $40
    ld e, d
    nop
    add b

    db $0e, $9f, $5f, $00, $88, $0e, $95, $75, $00, $88, $0e, $a4, $74, $c0, $86, $0d
    db $48, $68, $00, $88

    dec c
    ld [hl], l
    ld d, l
    nop
    sub b
    dec c
    and b
    ld e, c
    nop
    sub b
    dec c
    ld l, h
    ld e, [hl]
    nop
    sub b
    dec c
    ld l, e
    ld h, e
    nop
    sub b
    dec c
    call Call_000_006b
    adc b
    dec c
    or h
    ld [hl], h
    nop
    adc b

    db $0c, $00, $40, $00, $90

    rrca
    ldh [$ff57], a
    nop
    sub b
    inc c
    or [hl]
    ld c, c
    nop
    sub b
    inc c
    ei
    ld b, h
    nop
    sub b
    ld c, $5f
    ld l, h
    nop
    adc b
    ld c, $93
    ld [hl], b
    nop
    sub b

Jump_000_1d14:
    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc de

Jump_000_1d22:
    ld a, b
    or c
    jp z, Jump_000_1dc7

    ld a, [de]
    ld [$c679], a
    inc de
    ld a, [de]
    ld [$c678], a
    inc de
    ld a, $11
    ld [$c677], a

Jump_000_1d36:
    ld a, b
    or c
    jp z, Jump_000_1dc7

    ld a, [$c677]
    dec a
    jp z, Jump_000_1d22

    ld [$c677], a
    push de
    ld a, [$c678]
    ld d, a
    ld a, [$c679]
    ld e, a
    srl d
    ld a, d
    ld [$c678], a
    rr e
    ld a, e
    ld [$c679], a
    jp c, Jump_000_1d78

    pop de
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a
    ld a, [de]
    call Call_000_20da
    ld [hl+], a
    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    dec bc
    inc de
    jp Jump_000_1d36


Jump_000_1d78:
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    and $07
    ld h, a
    ld a, [de]
    srl a
    srl a
    srl a
    and $1f
    add $03
    ld [$c676], a
    ld a, h
    cpl
    ld d, a
    ld a, l
    cpl
    ld e, a
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a
    add hl, de
    push hl
    pop de
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a

Jump_000_1da8:
    call Call_000_20da
    ld a, [de]
    ld [hl+], a
    dec bc
    inc de
    ld a, [$c676]
    dec a
    ld [$c676], a
    jp nz, Jump_000_1da8

    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    pop de
    inc de

Jump_000_1dc3:
    inc de
    jp Jump_000_1d36


Jump_000_1dc7:
    ret


    ld a, [$c5c5]
    ld b, a
    ld c, $06

jr_000_1dce:
    add b
    dec c
    jr nz, jr_000_1dce

    ld c, a
    ld a, [$c5db]
    add c
    ld [$c5c5], a
    ret


Call_000_1ddb:
    ld hl, $0008
    add hl, de
    ld [hl], $00
    ld hl, $0009
    add hl, de
    ld [hl], $00
    ld hl, $000a
    add hl, de
    ld [hl], $00
    ld hl, $000b
    add hl, de
    ld [hl], $00
    ld hl, $000c
    add hl, de
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $000e
    add hl, de
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $0010
    add hl, de
    ld [hl], $00
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0006
    add hl, de
    ld [hl], $01
    ret


Call_000_1e17:
    ld a, $0b
    rst $10
    ld a, $19
    ld [$c5a0], a
    ld de, $c0a0

jr_000_1e22:
    ld hl, $0006
    add hl, de
    ld a, [hl]
    or a
    call nz, Call_000_1e44
    ld h, $00
    ld l, $20
    add hl, de
    ld d, h
    ld e, l
    ld a, [$c5a0]
    dec a
    ld [$c5a0], a
    jr nz, jr_000_1e22

    ld a, $00
    ld [$c63f], a
    ld a, $01
    rst $18
    ret


Call_000_1e44:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    ret z

    ld hl, $000b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_1e64

    ld a, [$c63f]
    or a
    ret nz

    ld a, $01
    ld [$c63f], a
    push de
    call Call_000_1fa0
    pop de
    ret


jr_000_1e64:
    ld hl, $0008
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_1e6f

    dec a
    ld [hl], a
    ret


jr_000_1e6f:
    ld hl, $0006
    add hl, de
    ld a, [hl]
    cp $01
    jr z, jr_000_1e7d

    ld a, [$c63f]
    or a
    ret nz

jr_000_1e7d:
    ld [hl], $02
    ld a, $01
    ld [$c63f], a
    ld hl, $0007
    add hl, de
    ld a, [hl]
    ld hl, $52b0
    ld c, a
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a

Jump_000_1e97:
    ld hl, $0009
    add hl, de
    ld a, [hl]
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl]
    cp $00
    jp z, Jump_000_1eb8

    cp $fe
    jp z, Jump_000_1f18

    ld hl, $000a
    add hl, de
    ld [hl], $ff
    ld hl, $0006
    add hl, de
    ld [hl], $00
    ret


Jump_000_1eb8:
    inc hl
    push hl
    ld a, [hl]
    ld hl, $0008
    add hl, de
    ld [hl], a
    pop hl
    push de
    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    push hl
    push bc
    call Call_000_1f2a
    pop bc
    pop hl
    pop de
    ld a, [$c659]
    or a
    jr nz, jr_000_1ee9

    ld a, [hl]
    ld hl, $0004
    add hl, de
    ld [hl], a
    ld hl, $0009
    add hl, de
    ld a, [hl]
    add $05
    ld [hl], a
    ld a, $01
    ld [$c5c9], a
    ret


jr_000_1ee9:
    ld a, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], a
    ld hl, $0009
    add hl, de
    ld a, [hl]
    add $05
    ld [hl], a
    ld a, [$c659]
    ld hl, $000b
    add hl, de
    ld [hl], a
    ld bc, $c64b
    ld a, [bc]
    ld hl, $000c
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ld bc, $c64d
    ld a, [bc]
    ld hl, $000e
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ret


Jump_000_1f18:
    inc hl
    ld a, [hl]
    push bc
    ld b, a
    add b
    add b
    add b
    add b
    pop bc
    ld hl, $0009
    add hl, de
    ld [hl], a
    jp Jump_000_1e97


    ret


Call_000_1f2a:
    ld a, $0a
    rst $10
    ld hl, $4000
    ld c, d
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a
    ld hl, $8000
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [bc]
    push bc
    ld c, a
    ld b, $0a
    sub b
    jr c, jr_000_1f60

    ld [$c659], a
    ld a, $0a
    jr jr_000_1f66

jr_000_1f60:
    ld a, $00
    ld [$c659], a
    ld a, c

jr_000_1f66:
    pop bc
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    inc bc

jr_000_1f7b:
    ld a, [bc]
    call Call_000_20da
    ld [hl+], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_1f7b

    ld a, [$c659]
    or a
    jr z, jr_000_1f9c

    ld de, $c64b
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    ld de, $c64d
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a

jr_000_1f9c:
    ld a, $0b
    rst $18
    ret


Call_000_1fa0:
    ld a, $0a
    rst $10
    push de
    ld hl, $000c
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $000e
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld hl, $000b
    add hl, de
    ld a, [hl]
    pop hl
    push bc
    ld c, a
    ld b, $0a
    sub b
    jr c, jr_000_1fc8

    ld [$c659], a
    ld a, $0a
    jr jr_000_1fce

jr_000_1fc8:
    ld a, $00
    ld [$c659], a
    ld a, c

jr_000_1fce:
    pop bc
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d

jr_000_1fe2:
    ld a, [bc]
    call Call_000_20da
    ld [hl+], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_1fe2

    ld a, [$c659]
    or a
    jr nz, jr_000_200c

    pop de
    ld hl, $0010
    add hl, de
    ld a, [hl]
    ld hl, $0004

Jump_000_1ffc:
    add hl, de
    ld [hl], a
    ld hl, $000b
    add hl, de
    ld [hl], $00
    ld a, $01
    ld [$c5c9], a
    jp Jump_000_203d


jr_000_200c:
    ld de, $c64b
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    ld de, $c64d
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    pop de
    ld a, [$c659]
    ld hl, $000b
    add hl, de
    ld [hl], a
    ld bc, $c64b
    ld a, [bc]
    ld hl, $000c
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ld bc, $c64d
    ld a, [bc]
    ld hl, $000e
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a

Jump_000_203d:
    ld a, $0b
    rst $18
    ret


Call_000_2041:
Jump_000_2041:
    ld a, [$c5a2]
    inc a
    ld [$c5a2], a
    ret


    ld b, $00
    ld c, $00
    ld e, $15
    call Call_000_1b27
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call $541a
    ret


Call_000_205e:
    ld a, $0b
    rst $10
    ld hl, $0012
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_20d6

    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $5893
    add hl, bc
    push hl
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    pop hl
    add hl, bc
    push hl
    ld hl, $0013
    add hl, de
    ld a, [hl]
    and $03
    ld b, $00
    ld c, a
    sla c
    rl b
    pop hl
    add hl, bc
    push hl
    ld a, [hl]
    ld b, a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    pop hl
    inc hl
    ld a, [hl]
    ld b, a
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    ld hl, $0013
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a

Jump_000_20d6:
    ld a, $01
    rst $18
    ret


Call_000_20da:
    push af

jr_000_20db:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_20db

    pop af
    ret


Call_000_20e3:
    ld a, [$d605]
    ld b, a
    ld a, [$d63d]
    xor b
    ret z

    ld a, b
    ld [$d63d], a
    ld a, [$d601]
    or a
    ret nz

    ld a, $07
    ld [wGameState], a
    ld a, $03

Call_000_20fc:
    ld [$c5a2], a
    ld a, $02
    ld [$c5a8], a
    ret


Call_000_2105:
    ld a, [$d605]
    and a
    ret z

    ld a, [$d604]
    and a
    ret nz

    ld a, [$d600]
    and a
    ret z

    ld a, [$d604]
    and a
    ret nz

    ld a, $81
    ldh [rSC], a
    ret


Jump_000_211e:
    push af
    push bc
    push de

Jump_000_2121:
    push hl
    xor a
    ld [$d607], a
    ld a, [$d605]
    and a
    jr nz, jr_000_2169

    ld a, [$d606]
    and a
    jr z, jr_000_215f

    ldh a, [rSB]
    cp $dd
    jr z, jr_000_214b

    cp $fe
    jr z, jr_000_2153

    xor a
    ld [$d600], a
    ld a, $dd
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    jp Jump_000_21bc


jr_000_214b:
    ld a, $01
    ld [$d600], a
    ld [$d601], a

jr_000_2153:
    ld a, $01
    ld [$d605], a
    ld a, [$d602]
    inc a
    ld [$d602], a

jr_000_215f:
    xor a
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    jp Jump_000_21bc


jr_000_2169:
    ld a, $01
    ld [$d604], a
    ld a, [$d600]
    xor $01
    ld [$d600], a
    ld hl, $d611
    ld a, [$d603]
    ld e, a
    xor a
    ld d, a
    add hl, de
    ldh a, [rSB]
    ld [hl], a
    ld hl, $d620
    add hl, de
    ld a, [hl]
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    ld a, [$d603]
    inc a
    ld [$d603], a
    ld b, a
    ld a, [$d602]
    cp b
    jp nz, Jump_000_21ac

    xor a
    ld [$d603], a
    ld [$d604], a
    call Call_000_22af
    call Call_000_2271
    jr jr_000_21bc

Jump_000_21ac:
    ld a, [$d600]
    and a
    jr z, jr_000_21bc

    ld bc, $001a
    call Call_000_2230
    ld a, $81
    ldh [rSC], a

Jump_000_21bc:
jr_000_21bc:
    pop hl
    pop de
    pop bc
    pop af
    reti


Jump_000_21c1:
    push af
    ld a, $02
    ldh [rTAC], a
    ld a, $eb
    ldh [rTIMA], a
    ld a, $81
    ldh [rSC], a
    pop af
    reti


Call_000_21d0:
    ld a, $00
    ld [$d602], a
    ld a, $dd
    ldh [rSB], a
    ld [$d606], a
    ld a, $80
    ldh [rSC], a
    xor a
    ld [$d600], a
    ld [$d605], a
    ld [$d63d], a
    ld [$d601], a
    ld [$d604], a
    ld [$d603], a
    ld [$d607], a
    ld [$c7d8], a
    ld [$d633], a
    ld [$d638], a
    ld [$d635], a
    ld [$d63a], a
    ld [$d637], a
    ld [$d63c], a
    ret


    xor a
    ldh [rSB], a
    ld [$d606], a
    ld [$d601], a
    ret


Call_000_2216:
    ld a, $fe
    ldh [rSB], a
    ld a, $81
    ldh [rSC], a
    ret


Call_000_221f:
    ld a, [$d605]
    and a
    ret nz

    ld a, $dd
    ldh [rSB], a
    ld [$d606], a
    ld a, $80
    ldh [rSC], a
    ret


Call_000_2230:
jr_000_2230:
    dec bc
    ld a, b
    or c
    jr nz, jr_000_2230

    ret


Call_000_2236:
    di
    ld a, $01
    ld [$d637], a
    ld a, [$d633]
    ld l, a
    ld h, $d4
    ld b, $00
    ld de, $d62d
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    jr nz, jr_000_2263

    jr c, jr_000_2263

    ei
    ret


jr_000_2263:
    ld a, l
    ld [$d633], a
    xor a
    ld hl, $d62d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ei
    ret


Call_000_2271:
    ld a, [$d637]
    and a
    jr z, jr_000_22a6

    xor a
    ld [$d637], a
    ld a, [$d635]
    ld l, a
    ld h, $d4
    ld b, $00
    ld de, $d620
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    jr nz, jr_000_22a1

    jr c, jr_000_22a1

    ret


jr_000_22a1:
    ld a, l
    ld [$d635], a
    ret


jr_000_22a6:
    xor a
    ld hl, $d620
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret


Call_000_22af:
    ld a, $01
    ld [$d63c], a
    ld a, [$d638]
    ld l, a
    ld h, $d5
    ld b, $00
    ld de, $d611
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    jr nz, jr_000_22da

    jr c, jr_000_22da

    ret


jr_000_22da:
    ld a, l
    ld [$d638], a
    ret


Call_000_22df:
    di
    ld a, [$d63c]
    and a
    jr z, jr_000_2317

    xor a
    ld [$d63c], a
    ld a, [$d63a]
    ld l, a
    ld h, $d5
    ld b, $00
    ld de, $d627
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    jr nz, jr_000_2311

    jr c, jr_000_2311

    ei
    ret


jr_000_2311:
    ld a, l
    ld [$d63a], a
    ei
    ret


jr_000_2317:
    xor a
    ld hl, $d627
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ei
    ret


    ; game object update/render dispatcher
    ; iterates over 25 game objects, each 32 bytes ($20) long from $c0a0 - $c39f
    ; notes -
    ; object struct probably looks like this -
    ; offset + 2 = x pos
    ; offset + 3 = y pos
    ; offset + 5 = type id
Call_000_2321:
    ld de, $c0a0 ; base of object array
    ld b, $19 ; b = 25. loop counter

jr_000_2326:
    ld hl, $0005
    add hl, de ; HL = array base + 5 - read offset 5 of current object
    ld a, [hl] ; get object type byte
    ld hl, $2353 ; $2535 = dispatch table base
    push de
    ld d, $00
    ld e, a
    sla e
    rl d ; DE = A * 2
    add hl, de ; HL = address of table
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    push de
    push bc
    jp hl ; dispatch to handler


Jump_000_233e:
    pop bc
    pop de
    ld h, d
    ld l, e
    ld de, $0020
    add hl, de
    ld d, h
    ld e, l
    dec b
    jr nz, jr_000_2326

    ld a, [$c5ac]
    inc a
    ld [$c5ac], a
    ret

    ; what is this data?
    ; it's a jump table
    ; $2433 seems to be "do nothing"/skip
    db $33, $24, $37, $24, $6d, $24, $b1, $24, $59, $25, $a2, $25, $30, $26, $5b, $26
    db $78, $26, $f2, $26, $64, $27

    db $33, $24, $33, $24, $33, $24, $33, $24, $33, $24

    db $09, $28, $2f, $28, $45, $28

    db $33, $24, $33, $24, $33, $24, $33, $24, $33, $24, $33, $24, $33, $24, $33, $24
    db $33

jr_000_238a:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

Call_000_2391:
    inc sp
    inc h

    db $d8, $28, $e4, $28

    db $e4
    db $28

    db $f0, $28

    db $fc
    jr z, jr_000_23a6

    add hl, hl
    inc d
    add hl, hl

    db $20, $29

    inc sp
    inc h
    inc sp

jr_000_23a6:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

    db $2c, $29, $7a, $29, $de, $29

    and e
    ld a, [hl+]
    rst $30
    ld a, [hl+]
    ld a, a
    dec hl
    or c
    dec hl
    ld a, b
    ld h, $f2
    ld h, $64
    daa
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

    db $cd, $2c, $e2, $2c, $f8, $2c

    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    adc e
    dec l

    db $10, $2e, $d2, $2e, $ad, $30, $3c, $30, $d1, $2f

    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    ld [$342b], a
    inc l
    ld a, [hl]
    inc l
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

    jp Jump_000_233e


    ret


    push de
    call $5e50
    call $5ec6
    call $5eeb
    call $5e50
    call $5ec6
    call $5e50
    pop de
    ld a, $81
    ld [$c120], a
    ld a, $08
    ld [$c122], a
    ld a, $98
    ld [$c123], a
    ld a, $a5
    ld [$c124], a
    ld a, $27
    ld [$c125], a
    ld hl, $0005
    add hl, de
    ld [hl], $02
    jp Jump_000_233e


    push de
    call $5eeb
    call $5ec6
    call $5e50
    pop de
    call $6985
    call $6938
    call $6960
    call $5ef2
    call $696e
    ld hl, $c0c0
    call $5453
    ld hl, $c0c5
    ld [hl], $10
    ld hl, $c0d4
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $c0d6
    ld [hl], $02
    ld hl, $c0d8
    ld [hl], $02
    ld a, $01
    ld [$c136], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


    call $5ef2
    ld h, $d2
    ld l, $01
    ld b, $00
    ld c, $00
    push de
    ld e, $11

Jump_000_24bf:
    push hl
    ld d, $0a

Jump_000_24c2:
    ld a, [hl]
    or a
    jp nz, Jump_000_24d5

    pop hl
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_24bf

    jp Jump_000_24fd


Jump_000_24d5:
    inc hl
    dec d
    jp nz, Jump_000_24c2

    pop hl
    push de
    push bc
    ld d, h
    ld e, l
    ld hl, $c5e1
    sla c
    rl b
    add hl, bc
    ld b, h
    ld c, l
    ld a, d
    ld [bc], a
    inc bc
    ld a, e
    ld [bc], a
    ld h, d
    ld l, e
    pop bc
    pop de
    inc c
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_24bf

Jump_000_24fd:
    ld a, $00
    ld [$c5e9], a
    ld hl, $c5e1
    ld a, [hl]
    or a
    jp z, Jump_000_254f

    ld a, $01
    ld [$c5e9], a
    ld hl, $c5e3
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $02
    ld [$c5e9], a
    ld hl, $c5e5
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $03
    ld [$c5e9], a
    ld hl, $c5e7
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $04
    ld [$c5e9], a

Jump_000_2536:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $04
    ld hl, $001b
    add hl, de
    ld [hl], $00
    call $69ba
    call $69f9
    call $6a48
    jp Jump_000_233e


Jump_000_254f:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $02
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_258c

    add $01
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2574:
    ld a, [hl+]
    or a
    jp z, Jump_000_259e

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $e7

jr_000_257f:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_257f

    inc hl
    dec c
    jp nz, Jump_000_2574

    jp Jump_000_259e


Jump_000_258c:
    ld hl, $0005
    add hl, de
    ld [hl], $05
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_259e:
    pop de
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_25b8

    dec a
    ld [hl], a
    jr jr_000_2626

Jump_000_25b8:
    ld hl, $001a
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    ld hl, $262a
    add hl, bc
    ld a, [hl]
    cp $ff
    jp z, Jump_000_25f8

    ld [$c659], a
    ld hl, $001b
    add hl, de
    ld [hl], $02
    ld hl, $001a
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_25df:
    ld a, [hl+]
    or a
    jp z, Jump_000_2626

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, [$c659]

jr_000_25eb:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_25eb

    inc hl
    dec c
    jp nz, Jump_000_25df

    jp Jump_000_2626


Jump_000_25f8:
    ld hl, $c5e1
    ld c, $04

Jump_000_25fd:
    ld a, [hl+]
    or a
    jp z, Jump_000_2612

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $00

jr_000_2608:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2608

    inc hl
    dec c
    jp nz, Jump_000_25fd

Jump_000_2612:
    pop de
    push de
    ld hl, $0005
    add hl, de
    ld [hl], $06
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_2626:
jr_000_2626:
    pop de
    jp Jump_000_233e


    db $e7, $e8, $e9, $ea, $00, $ff

    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2640

    add $01
    ld [hl], a
    jp Jump_000_233e


Jump_000_2640:
    call $68b8
    push de
    ld hl, $c5e1
    ld d, h
    ld e, l
    ld hl, $c5ea
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $07
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld hl, $0005
    add hl, de
    ld [hl], $02
    call $6a95
    jp Jump_000_233e


    ld a, $01
    ld [$c73d], a
    ld a, $00
    ld [$c0e5], a
    ld [$c125], a
    push de
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld h, $d0
    ld l, $01
    ld b, $0a
    ld c, $11

jr_000_2694:
    push hl

jr_000_2695:
    ld a, [hl]
    or a
    jr z, jr_000_269b

    ld [hl], $ec

jr_000_269b:
    inc hl
    dec b
    jr nz, jr_000_2695

    pop hl
    ld d, $00
    ld e, $20
    add hl, de
    ld b, $0a
    dec c
    jr nz, jr_000_2694

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $5e20
    ld d, $d0
    ld e, $04
    ld hl, $c5b0
    ld b, $05
    ld c, $04

jr_000_26c0:
    push de

jr_000_26c1:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_26c1

    pop de
    push hl
    ld hl, $0020
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld b, $05
    dec c
    jr nz, jr_000_26c0

    pop de
    ld hl, $0005
    add hl, de
    ld a, $09
    ld [hl], a
    ld hl, $0005
    add hl, de
    ld a, $09
    ld [hl], a
    ld hl, $001d
    add hl, de
    ld [hl], $00
    ld a, $02
    ld [$cb96], a
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $c4
    jp z, Jump_000_274f

    push af
    call $6cde
    pop af
    inc a
    ld [hl], a
    and $10
    jp z, Jump_000_2734

    ld hl, $001d
    add hl, de
    ld [hl], $00
    push de
    ld d, $d0
    ld e, $04
    ld hl, $c5b0
    ld b, $05
    ld c, $04

jr_000_271a:
    push de

jr_000_271b:
    ld a, [hl]
    ld [de], a
    inc hl
    inc de
    dec b
    jr nz, jr_000_271b

    pop de
    push hl
    ld hl, $0020

Call_000_2727:
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld b, $05
    dec c
    jr nz, jr_000_271a

    pop de
    jp Jump_000_233e


Jump_000_2734:
    ld hl, $001d
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_2742

    ld [hl], $01
    ld a, $17
    ldh [$ffa1], a

jr_000_2742:
    push de
    ld hl, $c0c0
    ld d, h
    ld e, l
    call $6ae9
    pop de
    jp Jump_000_233e


Jump_000_274f:
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $0a
    jp Jump_000_233e


    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_27a7

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $27af
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld [hl], $d0
    inc hl
    ld [hl], $d1
    pop hl
    ld b, $00
    ld c, $20
    add hl, bc
    ld [hl], $d2
    inc hl
    ld [hl], $d3
    ld hl, $0014
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call $5e20
    jp Jump_000_233e


Jump_000_27a7:
    ld hl, $c0bc
    ld [hl], $01
    jp Jump_000_233e


    db $01, $d2, $03, $d2, $05, $d2, $07, $d2, $09, $d2, $c9, $d1, $c7, $d1, $c5, $d1
    db $c3, $d1, $c1, $d1, $81, $d1, $83, $d1, $85, $d1, $87, $d1, $89, $d1, $49, $d1
    db $47, $d1, $45, $d1, $43, $d1, $41, $d1, $01, $d1, $03, $d1, $05, $d1, $07, $d1
    db $09, $d1, $c9, $d0, $c7, $d0, $c5, $d0, $c3, $d0, $c1, $d0, $81, $d0, $83, $d0
    db $85, $d0, $87, $d0, $89, $d0, $49, $d0, $47, $d0, $45, $d0, $43, $d0, $41, $d0
    db $01, $d0, $03, $d0, $05, $d0, $07, $d0, $09, $d0

    call $6acb
    call $6b65
    or a
    jr z, jr_000_281d

    call $6f0b
    ld hl, $c0a5
    ld [hl], $08
    jp Jump_000_233e


jr_000_281d:
    call $6ae9
    ld hl, $001b
    add hl, de
    ld [hl], $12
    ld hl, $0005
    add hl, de
    ld [hl], $11
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_283c

    dec a
    ld [hl], a
    jp Jump_000_233e


jr_000_283c:
    ld hl, $0005
    add hl, de
    ld [hl], $12
    jp Jump_000_233e


    call $6e65
    ldh a, [hInputPressed]
    and $30
    jp z, Jump_000_2852

    call $6d48

Jump_000_2852:
    ldh a, [hInputHeld]
    and $30
    jp z, Jump_000_285c

    call $6cf7

Jump_000_285c:
    ldh a, [hInputPressed]
    and $80
    jp z, Jump_000_2869

    call $6e10
    jp Jump_000_233e


Jump_000_2869:
    ldh a, [hInputHeld]
    and $80
    jp z, Jump_000_2873

    call $6d92

Jump_000_2873:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_233e

    ld hl, $0014
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_288a

    dec a
    ld [hl], a
    jp Jump_000_233e


Jump_000_288a:
    ld a, $00
    call $6c54
    or a
    jr z, jr_000_28b6

    ld hl, $0019
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_28a7

    ld [hl], $01
    ld hl, $0014
    add hl, de
    ld a, [$c5af]
    ld [hl], a
    jp Jump_000_233e


jr_000_28a7:
    ld a, $07
    ldh [$ffa1], a
    call $6f0b
    ld hl, $c0a5
    ld [hl], $03
    jp Jump_000_233e


jr_000_28b6:
    ld hl, $0014
    add hl, de
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $0019
    add hl, de
    ld [hl], $00
    call $6bea
    ld bc, $0020
    call $6ce7
    ld a, $00
    call $6ee9
    call $6ae9
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $4000
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $401b
    ld a, $01
    rst $18
    jp Jump_000_233e


Call_000_28f0:
    ld a, $02
    rst $10
    call $4073
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $411f
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $41e0
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $42d5
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $4364
    ld a, $01
    rst $18
    jp Jump_000_233e


    push de
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    call $5ec6
    call $5eeb
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    call $5ec6
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    pop de
    ld a, $32
    ld [$c5ae], a
    ld a, $0a
    ld [$c5af], a
    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


    ld a, [$c5a8]
    cp $01
    call z, $6f12
    ld a, [$c734]
    cp $02
    call z, $6f12
    call $5ef2
    ld a, [$c6da]
    or a
    jr z, jr_000_299c

    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


jr_000_299c:
    push de
    call $5eeb
    call $5ec6
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    pop de
    ld hl, $c0c0
    call $5453
    ld hl, $c0c5
    ld [hl], $40
    ld hl, $c0d4
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $c0d6
    ld [hl], $02
    ld hl, $c0d8
    ld [hl], $03
    ld a, $00
    ld [$c0f6], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


    ld a, [$c735]
    inc a
    ld [$c735], a
    ld a, $01
    ld [$c0f6], a
    call $5ef2
    ld h, $d2
    ld l, $01
    ld b, $00
    ld c, $00
    push de
    ld e, $11

Jump_000_29f8:
    push hl
    ld d, $0a

Jump_000_29fb:
    ld a, [hl]
    or a
    jr z, jr_000_2a06

    and $f0
    cp $70
    jp nz, Jump_000_2a14

jr_000_2a06:
    pop hl
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_29f8

    jp Jump_000_2a3c


Jump_000_2a14:
    inc hl
    dec d
    jp nz, Jump_000_29fb

    pop hl
    push de
    push bc
    ld d, h
    ld e, l
    ld hl, $c5e1
    sla c
    rl b
    add hl, bc
    ld b, h
    ld c, l
    ld a, d
    ld [bc], a
    inc bc
    ld a, e
    ld [bc], a
    ld h, d
    ld l, e
    pop bc
    pop de
    inc c
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_29f8

Jump_000_2a3c:
    ld a, $00
    ld [$c5e9], a
    ld hl, $c5e1
    ld a, [hl]
    or a
    jp z, Jump_000_2a8d

    ld a, $01
    ld [$c5e9], a
    ld hl, $c5e3
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $02
    ld [$c5e9], a
    ld hl, $c5e5
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $03
    ld [$c5e9], a
    ld hl, $c5e7
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $04
    ld [$c5e9], a

Jump_000_2a75:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $34
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld a, [$c5a8]
    cp $02
    call nz, $6f40
    jp Jump_000_233e


Jump_000_2a8d:
    pop de
    ld hl, $0005
    add hl, de
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2a9e

    ld [hl], $32
    jp Jump_000_233e


jr_000_2a9e:
    ld [hl], $68
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2ad6

    add $01
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2abe:
    ld a, [hl+]
    or a
    jp z, Jump_000_2af3

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $e7

jr_000_2ac9:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2ac9

    inc hl
    dec c
    jp nz, Jump_000_2abe

    jp Jump_000_2af3


Jump_000_2ad6:
    ld hl, $0005
    add hl, de
    ld [hl], $35
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00
    ld a, [$c5a8]
    cp $02
    jr nz, jr_000_2af3

    ld a, $0b
    ldh [$ffa1], a

Jump_000_2af3:
jr_000_2af3:
    pop de
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_2b0d

    dec a
    ld [hl], a
    jr jr_000_2b7b

Jump_000_2b0d:
    ld hl, $001a
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    ld hl, $262a
    add hl, bc
    ld a, [hl]
    cp $ff
    jp z, Jump_000_2b4d

    ld [$c659], a
    ld hl, $001b
    add hl, de
    ld [hl], $02
    ld hl, $001a
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2b34:
    ld a, [hl+]
    or a
    jp z, Jump_000_2b7b

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, [$c659]

jr_000_2b40:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2b40

    inc hl
    dec c
    jp nz, Jump_000_2b34

    jp Jump_000_2b7b


Jump_000_2b4d:
    ld hl, $c5e1
    ld c, $04

Jump_000_2b52:
    ld a, [hl+]
    or a
    jp z, Jump_000_2b67

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $00

jr_000_2b5d:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2b5d

    inc hl
    dec c
    jp nz, Jump_000_2b52

Jump_000_2b67:
    pop de
    push de
    ld hl, $0005
    add hl, de
    ld [hl], $36
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_2b7b:
jr_000_2b7b:
    pop de
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2b8f

    add $01
    ld [hl], a
    jp Jump_000_233e


Jump_000_2b8f:
    call $68b8
    push de
    ld hl, $c5e1
    ld d, h
    ld e, l
    ld hl, $c5ea
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $37
    ld a, $09
    ldh [$ffa1], a
    call $78d1
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2bd2

    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


jr_000_2bd2:
    ld hl, $0005
    add hl, de
    ld [hl], $68
    ld a, [$c5e9]
    dec a
    or a
    jp z, Jump_000_233e

    ld b, a
    ld a, $c0
    or b
    ld [$d62d], a
    jp Jump_000_233e


    ld a, [$c7ab]
    or a
    jr nz, jr_000_2bf9

    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


jr_000_2bf9:
    push de
    ld [$c7ba], a
    ld bc, $c7b2
    ld hl, $c7bb
    ld d, $08

jr_000_2c05:
    ld a, [bc]
    ld [hl+], a
    inc bc
    dec d
    jr nz, jr_000_2c05

    pop de
    xor a
    ld [$c7c3], a
    ld [$c7ab], a
    ld [$c7b2], a
    ld [$c7b3], a
    ld [$c7b4], a
    ld [$c7b5], a
    ld [$c7b6], a
    ld [$c7b7], a
    ld [$c7b8], a
    ld [$c7b9], a
    ld hl, $0005
    add hl, de
    ld [hl], $69
    jp Jump_000_233e


    call $75e4
    ld a, [$c7c3]
    ld hl, $c7bb
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld b, a
    ld hl, $d201
    ld c, $00

jr_000_2c48:
    ld a, c
    cp $0a
    jr z, jr_000_2c60

    ld a, b
    cp c
    jr nz, jr_000_2c57

    ld a, $00
    ld [hl+], a
    inc c
    jr jr_000_2c48

jr_000_2c57:
    ld a, [$c7c6]
    add $e0
    ld [hl+], a
    inc c
    jr jr_000_2c48

jr_000_2c60:
    ld a, [$c7c6]
    inc a
    cp $07
    jr nz, jr_000_2c6a

    ld a, $00

jr_000_2c6a:
    ld [$c7c6], a
    ld hl, $c5ea
    ld [hl], $d2
    inc hl
    ld [hl], $01
    ld hl, $0005
    add hl, de
    ld [hl], $6a
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld a, [$c6c9]
    or a
    jr nz, jr_000_2cad

    ld a, [$c6ca]
    or a
    jr nz, jr_000_2cad

    push de
    ld de, $c100
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $08
    ld [hl], a
    pop de
    ld a, $01
    ld [$c5c9], a

jr_000_2cad:
    ld a, [$c7c3]
    inc a
    ld [$c7c3], a
    ld b, a
    ld a, [$c7ba]
    cp b
    jr z, jr_000_2cc4

    ld hl, $0005
    add hl, de
    ld [hl], $69
    jp Jump_000_233e


jr_000_2cc4:
    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


    call $6acb
    call $6ae9
    ld hl, $001b
    add hl, de
    ld [hl], $12
    ld hl, $0005
    add hl, de
    ld [hl], $41
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_2cef

    dec a
    ld [hl], a
    jp Jump_000_233e


jr_000_2cef:
    ld hl, $0005
    add hl, de
    ld [hl], $42
    jp Jump_000_233e


    call $6e65
    ldh a, [hInputPressed]
    and $30
    jp z, Jump_000_2d05

    call $6d48

Jump_000_2d05:
    ldh a, [hInputHeld]
    and $30
    jp z, Jump_000_2d0f

    call $6cf7

Jump_000_2d0f:
    ldh a, [hInputPressed]
    and $80
    jp z, Jump_000_2d1c

    call $6e10
    jp Jump_000_233e


Jump_000_2d1c:
    ldh a, [hInputHeld]
    and $80
    jp z, Jump_000_2d26

    call $6d92

Jump_000_2d26:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_233e

    ld hl, $0014
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_2d3d

    dec a
    ld [hl], a
    jp Jump_000_233e


Jump_000_2d3d:
    ld a, $00
    call $6c54
    or a
    jr z, jr_000_2d69

    ld hl, $0019
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_2d5a

    ld [hl], $01
    ld hl, $0014
    add hl, de
    ld a, [$c5af]
    ld [hl], a
    jp Jump_000_233e


jr_000_2d5a:
    ld a, $07
    ldh [$ffa1], a
    call $6f0b
    ld hl, $c0a5
    ld [hl], $33
    jp Jump_000_233e


jr_000_2d69:
    ld hl, $0014
    add hl, de
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $0019
    add hl, de
    ld [hl], $00
    call $6bea
    ld bc, $0020
    call $6ce7
    ld a, $00
    call $6ee9
    call $6ae9
    jp Jump_000_233e


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2da4
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_000_2da0:
    pop de
    jp Jump_000_233e


    xor b
    dec l
    sra l
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    cp $0f
    jr z, jr_000_2db6

    ld [hl], a
    jp Jump_000_2da0


jr_000_2db6:
    ld hl, $001b
    add hl, de
    ld [hl], $1e
    ld hl, $0015
    add hl, de
    ld [hl], $08
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_2da0


    ld a, $01
    ld [$c5c9], a
    ld a, $01
    ld [de], a
    ld a, [$c5ac]
    and $01
    jr z, jr_000_2de5

    ld hl, $0003
    add hl, de
    dec [hl]
    ld a, [hl]
    cp $24
    jp z, Jump_000_2e08

jr_000_2de5:
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_2df2

    dec a
    ld [hl], a
    jp Jump_000_2da0


jr_000_2df2:
    ld a, $00
    ld [de], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    cp $01
    jr z, jr_000_2e00

    dec a
    ld [hl], a

jr_000_2e00:
    ld hl, $001b
    add hl, de
    ld [hl], a
    jp Jump_000_2da0


Jump_000_2e08:
    ld h, d
    ld l, e
    call $5453
    jp Jump_000_2da0


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2e29
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_000_2e25:
    pop de
    jp Jump_000_233e


    db $2d, $2e, $51, $2e

    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0017
    add hl, de
    ld [hl], $00
    ld hl, $001c
    add hl, de
    ld [hl], $00
    ld a, $02
    rst $10
    call $47d8
    ld a, $01
    rst $18
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_2e25


    ld a, [$c6da]
    or a
    jp nz, Jump_000_2e25

    ld hl, $0017
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0019
    add hl, de
    ld a, [hl+]
    sub b
    jr c, jr_000_2e6e

    jr nz, jr_000_2e9d

    ld a, [hl]
    sub c
    jr nc, jr_000_2e9d

jr_000_2e6e:
    ld hl, $0016
    add hl, de
    ld a, [hl]
    or a
    jp nz, Jump_000_2e25

    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld a, $02
    rst $10
    call $47d8
    ld a, $01
    rst $18
    ld hl, $0017
    add hl, de
    ld a, $00
    ld [hl+], a
    ld [hl], a
    ld a, [$c6c6]
    inc a
    ld [$c6c6], a
    ld a, $13
    ldh [$ffa1], a
    jp Jump_000_2e25


jr_000_2e9d:
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2eb0

    ld a, [$c735]
    ld b, a
    ld hl, $001c
    add hl, de
    ld a, [hl]
    sub b
    jr nz, jr_000_2ec0

jr_000_2eb0:
    ld hl, $0018
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    dec hl
    ld a, [hl]
    adc $00
    ld [hl], a
    jp Jump_000_2e25


jr_000_2ec0:
    ld a, b
    ld [hl], a
    ld hl, $0018
    add hl, de
    ld a, [hl]
    add $3c
    ld [hl], a
    dec hl
    ld a, [hl]
    adc $00
    ld [hl], a
    jp Jump_000_2e25


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2eeb
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_000_2ee7:
    pop de
    jp Jump_000_233e


    db $f4, $2e, $fd, $2e

    pop af
    ld l, $c3
    rst $20
    db $2e

    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_2ee7


    call Call_000_205e

Jump_000_2f00:
    ld hl, $0003

Jump_000_2f03:
    add hl, de
    ld a, [hl]
    sub $a0
    jp nc, Jump_000_2f51

    ld hl, $0011
    add hl, de
    ld a, [hl]
    cp $11
    jp z, Jump_000_2ee7

    cp $0f
    jp z, Jump_000_2ee7

    ld hl, $0016
    add hl, de
    ld a, [hl]
    ld hl, $2f59
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl

Jump_000_2f2d:
    ld hl, $0015
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    sla c
    rl b
    pop hl
    add hl, bc
    ld a, [hl+]

Jump_000_2f3c:
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0011
    add hl, de
    ld [hl], b
    ld hl, $0012
    add hl, de
    ld [hl], c
    ld hl, $0015
    add hl, de
    inc [hl]
    jp Jump_000_2ee7


Jump_000_2f51:
    ld h, d
    ld l, e
    call $5453
    jp Jump_000_2ee7


    db $61, $2f, $b7, $2f, $7b, $2f, $99, $2f, $1c, $06, $1b, $05, $1a, $04, $19, $03
    db $18, $02, $17, $03, $16, $04, $15, $05, $14, $06, $13, $07, $12, $08, $11, $0a

    db $10
    ld a, [bc]

    db $1e, $08, $1d, $07, $1c, $06, $1b, $05, $1a, $04, $19, $03, $18, $02, $17, $03
    db $16, $04, $15, $05, $14, $06, $13, $07, $12, $08, $11, $0a

    db $10
    ld a, [bc]

    db $02, $08, $03, $07, $04, $06, $05, $05, $06, $04, $07, $03, $08, $02, $09, $03
    db $0a, $04, $0b, $05, $0c, $06, $0d, $07, $0e, $08, $0f, $0a

    db $10
    ld a, [bc]

    db $04, $06, $05, $05, $06, $04, $07, $03, $08, $02, $09, $03, $0a, $04, $0b, $05
    db $0c, $06, $0d, $07, $0e, $08, $0f, $0a

    db $10
    ld a, [bc]

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2fea
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_000_2fe6:
    pop de
    jp Jump_000_233e


    db $ee, $2f, $03, $30

    ld hl, $0015
    add hl, de
    ld [hl], $00
    ld hl, $0013
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $01

Jump_000_3000:
    jp Jump_000_2fe6


    ld hl, $0013
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    cp $06
    jp nz, Jump_000_2fe6

    ld [hl], $00
    ld hl, $0015
    add hl, de
    ld a, [hl]
    inc a

Call_000_3017:
    ld [hl], a
    cp $0a
    jr nz, jr_000_302e

    xor a
    ld [hl], a
    ld a, [$c72f]
    add $0a
    ld [$c72f], a
    ld a, [$c72e]
    adc $00
    ld [$c72e], a

jr_000_302e:
    ld hl, $c607
    ld [hl], $00
    inc hl
    ld [hl], $01
    call $5ca1
    jp Jump_000_2fe6


    ld hl, $0014
    add hl, de
    ld a, [hl]

Jump_000_3041:
    ld hl, $3053
    ld b, $00
    ld c, a

Call_000_3047:
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


Jump_000_3050:
jr_000_3050:
    jp Jump_000_233e


    db $57, $30, $79, $30

    ld hl, $0000
    add hl, de
    ld [hl], $01
    call Call_000_3c88
    ld a, $20
    call Call_000_1ddb
    ld hl, $c105
    ld a, $53
    ld [hl], a
    ld a, $01
    ld [$c6c9], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_3050


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jr nz, jr_000_3050

    ld a, $02
    ld [$c6cb], a

Call_000_3087:
    ld a, $03
    ld [$c6cc], a
    ld a, $31
    ld [$c0a5], a
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_30a5

    ld a, [$c734]
    cp $01
    jr z, jr_000_30a5

    ld hl, $c125
    ld a, $55
    ld [hl], a

jr_000_30a5:
    ld h, d
    ld l, e
    call $5453
    jp Jump_000_3050


    ld a, [$c6c9]
    or a
    jr nz, jr_000_30c6

    ld a, [$c6ca]
    or a
    jr nz, jr_000_30c6

    ld a, [$c6cb]
    or a
    jr nz, jr_000_30c6

    ld a, [$c6cc]
    or a
    jp z, Jump_000_233e

jr_000_30c6:
    push af
    call Call_000_3d56
    call $6584
    pop af
    ld hl, $30e2
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_000_30de:
    pop de
    jp Jump_000_233e


    db $fc
    db $30

    db $ff, $30, $63, $31, $a3, $31, $a1, $32

    add h

jr_000_30ed:
    inc sp
    add d
    inc [hl]
    dec sp
    dec [hl]

    db $09, $36

    di
    ld [hl], $25
    db $38

    db $f4, $38

    srl c

Jump_000_30fc:
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3113
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $17, $31, $35, $31

    xor a
    ld [$c73d], a
    ld hl, $0000
    add hl, de
    ld [hl], $01

Jump_000_3121:
    call Call_000_3c88
    call Call_000_3d0d
    ld a, $22
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $01
    ld [$c1b4], a
    push de
    ld de, $c1a0
    ld a, $21
    call Call_000_1ddb
    pop de
    ld a, $00
    ld [$c6c9], a
    call $61a7
    ld a, $10
    ldh [$ffa1], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3177
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $7b, $31, $89, $31

    ld a, $23
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, $01
    ld [$c5c9], a
    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $31b7
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $bb, $31, $d6, $31

    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $24
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $64a9
    ld a, [$c65d]
    or a
    jr z, jr_000_31f2

    ld a, $0c
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


jr_000_31f2:
    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_3207

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_3207:
    call $64c8
    ld a, [$c65d]
    or a
    jp z, Jump_000_321c

    ld a, $08
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_321c:
    call $62bb
    ld a, [$c65d]
    or a
    jp z, Jump_000_3240

    cp $02
    jr z, jr_000_3235

    ld a, $06
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


jr_000_3235:
    ld a, $07
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


Jump_000_3240:
    call $61ae
    ld a, [$c65d]
    or a
    jp z, Jump_000_325d

    ld hl, $0011
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    ld a, $04
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_325d:
    call $6229
    ld a, [$c65d]
    or a
    jp z, Jump_000_3272

    ld a, $05
    ld [$c6cc], a
    call $61a7
    jp Jump_000_30de


Jump_000_3272:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $05
    jr z, jr_000_3280

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3280:
    ld [hl], $00
    call $6663
    ld a, $01
    ld [$c5c9], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3297

    ld b, $ff

Jump_000_3297:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $32b5
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $b9, $32, $e6, $32

    call $6229
    ld a, [$c65d]
    or a
    jp nz, Jump_000_32d1

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $26

Jump_000_32cb:
    add b
    call Call_000_1ddb
    jr jr_000_32dd

Jump_000_32d1:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $36
    add b
    call Call_000_1ddb

jr_000_32dd:
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $64a9
    ld a, [$c65d]
    or a
    jr z, jr_000_3302

    ld a, $0c
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


jr_000_3302:
    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_3317

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_3317:
    call $62bb
    ld a, [$c65d]
    or a
    jp z, Jump_000_3345

    cp $02
    jr z, jr_000_3335

    ld a, $06
    ld [$c6ca], a
    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


jr_000_3335:
    ld a, $07
    ld [$c6ca], a
    ld a, $00
    ld [$c6cb], a

Call_000_333f:
    call $61a7
    jp Jump_000_30de


Jump_000_3345:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0013
    add hl, de
    inc [hl]
    ld a, [hl]
    sub $07
    jr c, jr_000_3379

    call $6229
    ld a, [$c65d]
    or a
    jp nz, Jump_000_336e

    ld a, $09
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_336e:
    ld a, $0a
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


jr_000_3379:
    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3398
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    sbc h
    inc sp
    or a
    inc sp
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $28
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $64a9
    ld a, [$c65d]
    or a
    jr z, jr_000_33d3

    ld a, $0c
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


jr_000_33d3:
    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_33e8

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_33e8:
    call $64c8
    ld a, [$c65d]
    or a
    jp z, Jump_000_33fd

    ld a, $08
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_33fd:
    call $62bb
    ld a, [$c65d]
    or a
    jp z, Jump_000_3421

    cp $02
    jr z, jr_000_3416

    ld a, $06
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


jr_000_3416:
    ld a, $07
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


Jump_000_3421:
    call $61ae
    ld a, [$c65d]
    or a
    jp z, Jump_000_343e

    ld hl, $0011
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    ld a, $04
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Call_000_343e:
Jump_000_343e:
    call $6272
    ld a, [$c65d]
    or a
    jp z, Jump_000_3453

    ld a, $03
    ld [$c6cc], a
    call $61a7
    jp Jump_000_30de


Jump_000_3453:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $02
    jr z, jr_000_3461

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3461:
    ld [hl], $00
    call $6663
    ld a, $01
    ld [$c5c9], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3478

    ld b, $ff

Jump_000_3478:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3496
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    sbc h
    inc [hl]
    cp d
    inc [hl]
    dec c
    dec [hl]
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2a
    add b
    call Call_000_1ddb
    call $6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    call $6435
    ld a, [$c65d]
    or a
    jp z, Jump_000_34d9

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2e
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de

Call_000_34d4:
    ld [hl], $02
    jp Jump_000_30de


Jump_000_34d9:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_34f1

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_34f1:
    ld [hl], $00
    ld a, $01
    ld [$c5c9], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_30de

    dec [hl]
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call $64a9
    ld a, [$c65d]
    or a
    jr z, jr_000_3530

    ld a, $00
    ld [$c6ca], a
    ld a, $0c
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


jr_000_3530:
    ld a, $00
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $354f
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld d, l
    dec [hl]
    ld a, c
    dec [hl]
    db $db
    dec [hl]
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2c
    add b
    call Call_000_1ddb
    call $6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    ld hl, $001b
    add hl, de
    ld [hl], $00
    jp Jump_000_30de


    call $6435
    ld a, [$c65d]
    or a
    jp z, Jump_000_3598

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $30
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


Jump_000_3598:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_35b1

    ld a, $01
    ld [hl], a
    ld a, $19
    ldh [$ffa1], a

jr_000_35b1:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_35bf

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_35bf:
    ld [hl], $00
    ld a, $01
    ld [$c5c9], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_30de

    dec [hl]
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call $64a9
    ld a, [$c65d]
    or a
    jr z, jr_000_35fe

    ld a, $00
    ld [$c6ca], a
    ld a, $0c
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


jr_000_35fe:
    ld a, $00
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $361d
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $23, $36, $3b, $36, $aa, $36

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $32
    add b
    call Call_000_1ddb
    call $6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_3658

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_3658:
    call $64c8
    ld a, [$c65d]
    or a
    jr nz, jr_000_366c

    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


jr_000_366c:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $08
    ld [hl], a
    call Call_000_3d56
    call $64c8
    ld a, [$c65d]
    or a
    jr z, jr_000_3695

    ld a, $08
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


jr_000_3695:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $34
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_36c7

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_36c7:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call Call_000_3d56
    call $64c8
    ld a, [$c65d]
    or a
    jr z, jr_000_36e8

    ld a, $08
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


jr_000_36e8:
    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3707
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    dec c
    scf
    dec h
    scf
    xor $37
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $38
    add b
    call Call_000_1ddb
    call $6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_3742

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_3742:
    call $62bb
    ld a, [$c65d]
    or a
    jp z, Jump_000_375f

    cp $02
    jr z, jr_000_3754

    ld a, $06
    jr jr_000_3756

jr_000_3754:
    ld a, $07

jr_000_3756:
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


Jump_000_375f:
    call $64c8
    ld a, [$c65d]
    or a
    jp z, Jump_000_377c

    ld a, $08
    ld [$c6d7], a
    ld hl, $c6cb
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a
    jp Jump_000_37d9


Jump_000_377c:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $00
    call $61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [$c65d]
    or a
    jp z, Jump_000_37ac

    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $01
    call $61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [$c65d]
    or a
    jp nz, Jump_000_37bf

Jump_000_37ac:
    ld a, $00
    ld [$c6d7], a
    ld hl, $c6cb
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a
    jp Jump_000_37d9


Jump_000_37bf:
    call $6229
    ld a, [$c65d]
    or a
    jp z, Jump_000_30de

    ld a, $0a
    ld [$c6d7], a
    ld hl, $c6cb
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a

Jump_000_37d9:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $3a
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_380b

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_380b:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c6d8
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, [$c6d7]
    ld [hl], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3839
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    dec a
    jr c, @+$57

    jr c, @+$23

    ld de, $1900
    ld a, [hl]
    ld b, a
    ld a, $3c
    add b
    call Call_000_1ddb
    call $6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call $653b
    ld a, [$c65d]
    or a
    jp z, Jump_000_3872

    ld a, $0b
    ld [$c6c9], a
    call $61a7
    jp Jump_000_30de


Jump_000_3872:
    call $62bb
    ld a, [$c65d]
    or a
    jp z, Jump_000_388f

    cp $02
    jr z, jr_000_3884

    ld a, $06
    jr jr_000_3886

jr_000_3884:
    ld a, $07

jr_000_3886:
    ld [$c6ca], a
    call $61a7
    jp Jump_000_30de


Jump_000_388f:
    call $64c8
    ld a, [$c65d]
    or a
    jp z, Jump_000_38a4

    ld a, $08
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_38a4:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $00
    call $61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [$c65d]
    or a
    jp z, Jump_000_38d4

    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $01
    call $61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [$c65d]
    or a
    jp nz, Jump_000_38df

Jump_000_38d4:
    ld a, $00
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


Jump_000_38df:
    call $6272
    ld a, [$c65d]
    or a
    jp z, Jump_000_30de

    ld a, $09
    ld [$c6cb], a
    call $61a7
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3908
    ld b, $00
    ld c, a

Call_000_38ff:
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $10, $39, $57, $39, $85, $39, $b9, $39

    ld a, $01
    ld [$c73d], a
    ld a, $02
    ld [$cb96], a
    ld a, $01
    ld [$c6da], a
    ld a, $c4
    ld [$d62d], a
    ld [$c7d6], a
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_30de

    ld a, $05
    ldh [$ffa1], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $3e
    add b
    call Call_000_1ddb
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $c120
    call $5453
    ld hl, $0014
    add hl, de
    ld [hl], $01
    call $666a
    jp Jump_000_30de


    ld a, $01
    ld [$c5c9], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $08
    jr z, jr_000_3972

    inc a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $02
    ld [hl], a
    jp Jump_000_30de


jr_000_3972:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, $01
    ld [$c5c9], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_39a0

    dec a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $02
    ld [hl], a
    jp Jump_000_30de


jr_000_39a0:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $40
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $03
    ld a, $15
    ldh [$ffa1], a
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, $01
    ld [$c0bc], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $39df
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    pop af
    add hl, sp
    inc sp
    ld a, [hl-]
    ld a, e
    ld a, [hl-]
    or b
    ld a, [hl-]
    ret c

    ld a, [hl-]
    cpl
    dec sp
    ld l, c
    dec sp
    ld b, $3c
    dec e
    inc a
    ld a, $01
    ld [$c73d], a
    ld a, $02
    ld [$c6da], a
    ld a, $c8
    ld [$d62d], a
    ld [$c7d6], a
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_30de

    ld a, $14
    ldh [$ffa0], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $42
    add b
    call Call_000_1ddb
    ld hl, $c120
    call $5453
    ld hl, $0014
    add hl, de
    ld [hl], $01
    call $666a
    ld hl, $0016
    add hl, de
    ld [hl], $00
    jp Jump_000_30de


    ld hl, $0016
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_3a48

    ld [hl], $01
    ld a, [$c734]
    cp $01
    jp z, Jump_000_3a48

    call Call_000_3d79

Jump_000_3a48:
jr_000_3a48:
    ld a, $01
    ld [$c5c9], a
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, [$c734]
    cp $01
    jr nz, jr_000_3a66

    ld a, $01
    ld [$c0bc], a
    jp Jump_000_30de


jr_000_3a66:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a

Call_000_3a6c:
    ld a, $48
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, [$c5ed]
    add $08
    ld [$c5ed], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $44
    add b
    call Call_000_1ddb
    ld a, $02
    rst $10
    ld a, [$c5a8]
    cp $01
    call z, $4464
    ld a, $01
    rst $18
    ld hl, $0014
    add hl, de
    ld [hl], $03
    jp Jump_000_30de


    ld a, $01
    ld [$c5c9], a
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $46
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $04
    ld a, $19
    ldh [$ffa1], a
    jp Jump_000_30de


    ld a, [$c5ac]
    and $01
    jp nz, Jump_000_30de

    ld a, $01
    ld [$c5c9], a
    ld a, [$c1c0]
    or a
    jr z, jr_000_3af2

    ld a, [$c1c3]
    dec a
    ld [$c1c3], a

Jump_000_3af2:
jr_000_3af2:
    ld a, [$c5ed]
    add $01
    ld [$c5ed], a
    cp $18
    jr nz, jr_000_3b0d

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4c
    add b
    call Call_000_1ddb
    jp Jump_000_30de


jr_000_3b0d:
    cp $30
    jp nz, Jump_000_30de

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4a
    add b
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $05
    ld a, $1a
    ldh [$ffa1], a
    ld a, $04
    ldh [$ffa0], a
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jr c, jr_000_3b55

    ld hl, $0011
    add hl, de
    ld [hl], $00
    ld a, $4e
    call Call_000_1ddb
    jr jr_000_3b60

jr_000_3b55:
    ld hl, $0011
    add hl, de
    ld [hl], $01
    ld a, $4f
    call Call_000_1ddb

jr_000_3b60:
    ld hl, $0014
    add hl, de
    ld [hl], $06
    jp Jump_000_30de


    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jp z, Jump_000_3bd1

    ldh a, [hInputHeld]
    and $01
    jr z, jr_000_3b96

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $51
    add b
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    sub $01
    jr nc, jr_000_3bb3

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3b96:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4e
    add b
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    sub $05
    jr nc, jr_000_3bb3

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3bb3:
    ld [hl], $00
    ld a, $01
    ld [$c5c9], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3bc7

    ld b, $ff

Jump_000_3bc7:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


Jump_000_3bd1:
    ld a, [$c1c0]
    or a
    jr z, jr_000_3bf4

    ld a, $02
    rst $10
    call $44bd
    ld a, $01
    rst $18
    ld a, $5b
    call Call_000_1ddb
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $08
    jp Jump_000_30de


jr_000_3bf4:
    ld a, $11
    ldh [$ffa1], a
    ld a, $50
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $07
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld h, d
    ld l, e
    call $5453
    ld a, $02
    ld [$c0bc], a
    jp Jump_000_30de


    ld a, $01
    ld [$c5c9], a
    ldh a, [hInputHeld]
    and $01
    jr nz, jr_000_3c47

    ld hl, $0007
    add hl, de
    ld a, $5b
    ld [hl], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $03
    jr nz, jr_000_3c64

    ld a, [$c223]
    cp $80
    jr z, jr_000_3c64

    dec a
    ld [$c223], a
    jr jr_000_3c64

jr_000_3c47:
    ld hl, $0007
    add hl, de
    ld a, $5c
    ld [hl], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $01
    jr nz, jr_000_3c64

    ld a, [$c223]
    cp $80
    jr z, jr_000_3c64

    dec a
    ld [$c223], a

jr_000_3c64:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c1c0
    call $5453
    ld hl, $c220
    call $5453
    ld a, $50
    call Call_000_1ddb
    ld hl, $0014
    add hl, de
    ld [hl], $07
    jp Jump_000_30de


Call_000_3c88:
    ld a, $09
    rst $10
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_3cbb

    ld a, [$c5a8]
    cp $03
    jp z, Jump_000_3ccd

    ld a, [$c6db]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $5e1e
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3cbb:
    ld a, [$c5c4]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $6261
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3ccd:
    ld hl, $c688
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3cd4:
    push hl
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $0010
    add hl, bc
    ld a, l
    ld hl, $0002
    add hl, de
    ld [hl], a
    pop hl
    ld a, [hl]
    ld b, $00

Call_000_3cf2:
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $0020
    add hl, bc
    ld a, l
    ld hl, $0003
    add hl, de
    ld [hl], a
    ld a, $01
    rst $18
    ret


Call_000_3d0d:
    ld a, $09
    rst $10
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_3d3c

    ld a, [$c5a8]
    cp $03
    jp z, Jump_000_3d4a

    ld a, [$c6db]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $5ef0
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3d4d


Jump_000_3d3c:
    ld a, [$c5c4]
    ld b, $00
    ld c, a
    ld hl, $6275
    add hl, bc
    ld a, [hl]
    jp Jump_000_3d4d


Jump_000_3d4a:
    ld a, [$c68a]

Jump_000_3d4d:
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, $01
    rst $18
    ret


Call_000_3d56:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    ldh [$ff8f], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    dec a
    ldh [$ff8e], a
    push de
    call Call_000_19bb
    pop de
    ld a, h
    and $0f
    sub $08
    or $d0
    ld [$c6cd], a
    ld a, l
    ld [$c6ce], a
    ret


Call_000_3d79:
    push hl
    push de
    push bc
    ld b, $01
    ld c, $09
    ld e, $70
    call Call_000_1b27
    ld hl, $0000
    ld b, $14
    ld c, $12
    call $541a
    ld hl, $c601
    ld de, $c605
    ld c, $02

jr_000_3d97:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_000_3db3

    cp $00
    jr nz, jr_000_3da5

    inc de
    dec c
    jr nz, jr_000_3d97

jr_000_3da5:
    ld hl, $d121
    ld b, $0a
    ld a, $00

jr_000_3dac:
    ld [hl+], a
    dec b
    jr nz, jr_000_3dac

    jp Jump_000_3dc1


jr_000_3db3:
    ld hl, $c601
    ld de, $c605
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    call $5c08

Jump_000_3dc1:
    ld hl, $d182
    ld de, $d20e
    ld b, $05

jr_000_3dc9:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_3dc9

    ld a, [$c72e]
    sub $02
    jr c, jr_000_3e00

    or a
    jr nz, jr_000_3de0

    ld a, [$c72f]
    sub $58
    jr c, jr_000_3e00

jr_000_3de0:
    ld hl, $d1c2
    ld [hl], $98
    inc hl
    ld [hl], $99
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $8c
    inc hl
    ld [hl], $99
    inc hl
    ld [hl], $98
    inc hl
    ld [hl], $9f
    inc hl
    ld [hl], $9d
    inc hl
    ld [hl], $00
    jp Jump_000_3e7c


jr_000_3e00:
    ld a, [$c72e]
    or a
    jp nz, Jump_000_3e3d

    ld a, [$c72f]
    sub $64
    jp c, Jump_000_3e13

    or a
    jp nz, Jump_000_3e3d

Jump_000_3e13:
    ld hl, $d1c2
    ld a, $83
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    ld hl, $c5fd
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    call $5ac2
    jp Jump_000_3e7c


Jump_000_3e3d:
    ld hl, $c730
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $c5fd
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld a, [$c72f]
    sub $64
    ld c, a
    ld a, [$c72e]
    sbc $00
    ld b, a

jr_000_3e65:
    ld hl, $c730
    call Call_000_3e80
    ld hl, $c5fd
    call Call_000_3e80
    dec bc
    ld a, b
    or c
    jr nz, jr_000_3e65

    call Call_000_3ea6
    call $5ac2

Jump_000_3e7c:
    pop bc
    pop de
    pop hl
    ret


Call_000_3e80:
    push hl
    push de
    push bc
    ld bc, $0003
    add hl, bc
    ld a, [hl]
    ld b, $40
    sub b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    pop bc
    pop de
    pop hl
    ret


Call_000_3ea6:
    push hl
    push de
    push bc
    ld hl, $c731
    ld de, $d1c1
    ld b, $03
    ld c, $00

Jump_000_3eb3:
    ld a, [hl]
    swap a
    and $0f
    or a
    jr z, jr_000_3ec2

    ld c, $01
    add $81
    ld [de], a
    jr jr_000_3ec9

jr_000_3ec2:
    ld a, c
    or a
    jr z, jr_000_3ec9

    ld a, $81
    ld [de], a

jr_000_3ec9:
    inc de
    ld a, [hl]
    and $0f
    or a
    jr z, jr_000_3ed7

    ld c, $01
    add $81
    ld [de], a
    jr jr_000_3ede

jr_000_3ed7:
    ld a, c
    or a
    jr z, jr_000_3ede

    ld a, $81
    ld [de], a

jr_000_3ede:
    inc hl
    inc de
    dec b
    jp nz, Jump_000_3eb3

    pop bc
    pop de
    pop hl
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_3efc:
    nop
    nop
    nop

Jump_000_3eff:
    nop

Jump_000_3f00:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
