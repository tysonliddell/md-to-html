#include <stdio.h>
#include <string.h>

#include <md4c.h>
#include <md4c-html.h>

#define MAX_MD_LENGTH 1000000
#define READ_CHUNK_SIZE 1000

#define TRUE 1
#define FALSE 0

void print_html(const char *html, unsigned len, void *) {
    for (unsigned i=0; i < len; i++) {
        putchar(html[i]);
    }
}

int main() {
    // Read STDIN into a buffer
    char input_buf[MAX_MD_LENGTH];
    size_t buf_len = 0;
    while (TRUE) {
        // enough room left in buffer?
        if (buf_len + READ_CHUNK_SIZE > MAX_MD_LENGTH && fgetc(stdout) != EOF) {
            fprintf(stdout, "error: input file too large\n");
            return 1;
        }

        // read next chunk
        int n = fread(input_buf+buf_len, 1, READ_CHUNK_SIZE, stdin);
        if (n < 0) {
            fprintf(stderr, "error: file read error\n");
            return 1;
        } else if (n == 0) {
            break;
        }
        buf_len += n;
    }

    if (md_html(input_buf, buf_len, print_html, NULL, MD_DIALECT_GITHUB, 0)) {
        fprintf(stderr, "error: parser error\n");
        return 1;
    }
    return 0;
}
