; boot.asm

SECTION "Interrupts and Header", ROM0[$0000]

RST_00::                                        ; reset vector
    db $e1, $87, $ef, $2a, $66, $6f, $e9, $00

RST_08::                                        ; reset vector
    reti


Jump_000_0009:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_10::                                        ; reset vector
    ld [$2000], a
    ret


    nop
    nop
    nop
    nop

RST_18::                                        ; reset vector
    ld [$2000], a
    ret


    nop
    nop
    nop
    nop

RST_20::                                        ; reset vector
    add l
    ld l, a
    ret c

    dec h
    ret


    nop
    nop
    nop

RST_28::                                        ; reset vector
    add l
    ld l, a
    ret nc

    inc h
    ret


    nop
    nop
    nop

RST_30::                                        ; reset vector
    add a

Jump_000_0031:
    rst $28
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


    nop
    nop

RST_38::
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ret


Jump_000_003c:
    nop
    nop
    nop

Jump_000_003f:
    nop

VBlankInterrupt::
    jp Jump_000_02ed


    nop

Jump_000_0044:
    nop
    nop
    nop
    nop

LCDCInterrupt::
    reti


    nop
    nop
    nop
    nop
    nop
    nop
    nop

TimerOverflowInterrupt::
    jp Jump_000_21c1


    nop
    nop
    nop
    nop
    nop

SerialTransferCompleteInterrupt::
    jp Jump_000_211e


    nop
    nop
    nop
    nop
    nop

JoypadTransitionInterrupt::
    reti


    nop
    nop
    nop

Call_000_0064:
    nop
    nop
    nop
    nop

    nop
    nop
    nop

Call_000_006b:
    nop
    nop

Jump_000_006d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_0081:
    nop

Jump_000_0082:
    nop
    nop

Call_000_0084:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_008d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_00aa:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_00bc:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_00c3:
    nop
    nop
    nop
    nop
    nop

Call_000_00c8:
    nop
    nop
    nop
    nop

Call_000_00cc:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_00e0:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_00ff:
Jump_000_00ff:
    nop

Boot::
    nop

Jump_000_0101:
    jp Jump_000_0150

; ROM header
HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "TETRIS PLUS", $00, $00, $00, $00, $00

HeaderNewLicenseeCode::
    db $30, $31

HeaderSGBFlag::
    db $03              ; has SGB features

HeaderCartridgeType::
    db $03              ; MBC1 + RAM + battery

HeaderROMSize::
    db $03              ; size of 256k

HeaderRAMSize::
    db $02

HeaderDestinationCode::
    db $01

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $08

HeaderGlobalChecksum::
    db $5c, $63