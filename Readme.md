
# Book Generator

 This book generator is built using the work of TJ Holowaychuk and his book [Mastering Node](http://github.com/visionmedia/masteringnode).

## Formats

 Chapters are written using the markdown files provided in `./chapters`, which can then be converted to several output formats, currently including _pdf_, and _html_.

 As new chapters are added to `./chapters`, update the Makefile appropriately.

## All Formats

    $ make

## PDF

Required by `make book.pdf`:

    $ brew install htmldoc
    $ make book.pdf

## HTML

Required by `make book.html`:

    $ gem install ronn
    $ make book.html
