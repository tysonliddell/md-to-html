# md-to-html
A small wrapper around the md4c library (v0.5.2) to generate static HTML pages
from Markdown.

## Build
```
make            # build the executable
make clean      # clean up object files
make clobber    # clean up object files and delete executable
```

## Usage
Converting a single markdown document to HTML
```
cat file.md | ./build/md-to-html > file.html
```
