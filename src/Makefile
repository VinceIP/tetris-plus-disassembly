all: game.gb

%.2bpp: %.png
	rgbgfx --colors embedded -o $@ $

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $

game.o: game.asm bank_*.asm
	rgbasm -o game.o game.asm

wram.o: wram.asm
	rgbasm -o wram.o wram.asm

hram.o: hram.asm
	rgbasm -o hram.o hram.asm

game.gb: game.o wram.o hram.o
	rgblink -n game.sym -m game.map -o $@ $^
	rgbfix -v -p 255 $@
	@echo "Comparing SHA1..."
	@ORIG=$$(sha1sum baserom.gb | awk '{print $$1}'); \
	 NEW=$$(sha1sum $@ | awk '{print $$1}'); \
	 if [ "$$ORIG" = "$$NEW" ]; then \
	   echo "OK — Match: $$NEW"; \
	 else \
	   echo "MISMATCH"; \
	   echo "Original: $$ORIG"; \
	   echo "Rebuilt : $$NEW"; \
	 fi

clean:
	rm -f game.o wram.o hram.o game.gb game.sym game.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +