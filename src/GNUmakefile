SOURCES := $(wildcard *.c)
OBJECTS := list.o
TARGET	:= libpn.so

CFLAGS := -Wall -MMD -std=gnu11 -fPIC
LDFLAGS := -shared

BISON := bison
BISON_FLAGS := -t -r all
FLEX := flex

%.tab.c %.tab.h : %.y 
	$(BISON) $(BISON_FLAGS) -d $<

%.yy.c : %.l
	$(FLEX) -o $@ $<

.PHONY : clean

pn : $(OBJECTS) parse.tab.o scan.yy.o
	$(CC) $^ -o $@ -ll -ly

$(TARGET) : $(OBJECTS) parse.tab.o scan.yy.o
	$(CC) $(LDFLAGS) $(CFLAGS) $(OBJECTS) -o $(TARGET) -ll -ly

parse.tab.o 	:	parse.y

scan.yy.c	: scan.l

$(OBJECTS) : $(SOURCES)

-include *.d

clean:
	rm -f $(TARGET) *.o *.tab.* *.d *.yy.* pn
