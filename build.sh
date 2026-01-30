LIBS_DIR="./libs"
SRC_DIR="./src"
BUILD_DIR="./build"
PROG_NAME="md-to-html"

INCL_FLAGS="-I$LIBS_DIR/md4c"
CFLAGS="-std=c23 -Wall -Wextra -pedantic-errors $INCL_FLAGS"

mkdir -p $BUILD_DIR
gcc $CFLAGS $LIBS_DIR/md4c/entity.c -c -o $BUILD_DIR/entity.o
gcc $CFLAGS $LIBS_DIR/md4c/md4c-html.c -c -o $BUILD_DIR/md4c-html.o
gcc $CFLAGS $LIBS_DIR/md4c/md4c.c -c -o $BUILD_DIR/md4c.o
gcc $CFLAGS $SRC_DIR/main.c ./build/*.o -o $BUILD_DIR/$PROG_NAME

# TODO: do this in a Makefile instead, once I get back online and can check the
# Makefile syntax.
