LIBS_DIR="./libs"
SRC_DIR="./src"
BUILD_DIR="./build"

mkdir -p $BUILD_DIR
gcc ./libs/md4c/entity.c -I./libs/md4c -c -o $BUILD_DIR/entity.o
gcc ./libs/md4c/md4c-html.c -I./libs/md4c -c -o $BUILD_DIR/md4c-html.o
gcc ./libs/md4c/md4c.c -I./libs/md4c -c -o $BUILD_DIR/md4c.o
gcc ./src/main.c -I./libs/md4c ./build/*.o -o $BUILD_DIR/run

# TODO: do this in a Makefile instead, once I get back online and can check the
# Makefile syntax.
