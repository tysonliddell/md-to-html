PROG_NAME="md-to-html"

CC = gcc
INCL_FLAGS = -Ilibs/md4c
CFLAGS = -std=c23 -Wall -Wextra -pedantic-errors $(INCL_FLAGS)

OBJ = main.o md4c-html.o entity.o md4c.o
VPATH = src:libs/md4c

$(PROG_NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(PROG_NAME) $(OBJ)

.PHONY: clean
clean:
	-rm $(OBJ)

.PHONY: clobber
clobber:
	-rm $(PROG_NAME) $(OBJ)
