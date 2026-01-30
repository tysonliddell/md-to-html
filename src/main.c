#include <stdio.h>
#include <string.h>
#include <md4c-html.h>

void process_md(const char *md, unsigned len, void *unused) {
    for (unsigned i=0; i < len; i++) {
        putchar(md[i]);
    }
}

int main() {
    const char *md = "# Heading\nSome text\n";
    md_html(md, strlen(md), process_md, NULL, 0, 0);
    return 0;
}
