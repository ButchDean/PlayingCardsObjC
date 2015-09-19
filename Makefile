INC = -Iinc
SRC = $(wildcard src/*.m)
OUT = cards

.PHONY: clean

all:
	gcc `gnustep-config --objc-flags` -lgnustep-base -lobjc -lbsd -std=c11 $(INC) $(SRC) -o $(OUT)

clean:
	rm $(OUT) *.d
