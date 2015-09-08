# ASSEMBLER
AXX=yasm
# LINKER
OXX=ld
# ASSEMBER FLAGS
AFLAGS=-f elf64 -g dwarf2
# LINKER FLAGS
OFLAGS=-o
#progname
CNAME=bin/client
#OBJECT FILES
FILES=client.o

#MAIN RECIPE
client: client.o
	 $(OXX) $(OFLAGS) $(CNAME) $(FILES)

#OBJECT COMPILER
%.o: %.asm
	$(AXX) $(AFLAGS) $< -o $@

clean:
	find . -name "*.o" -type f -delete
	rm -f $(NAME)
