INC = -Iinc
SRC = $(wildcard src/*.m)
OUT = cards

.PHONY: clean

all:
	gcc `gnustep-config --objc-flags` -lgnustep-base -lobjc $(INC) $(SRC) -o $(OUT)

clean:
	rm $(OUT) *.d
