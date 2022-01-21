# litv

Read the **Green's Literal Translation** Bible from your terminal

> And confessedly, great is the mystery of godliness: **God** was manifested in
> flesh, was justified in **S**pirit, was seen by angels, was proclaimed among
> nations, was believed **on** in the world, was taken up in glory. (1 Timothy 3:16)

- Big thanks to [Tim Cooper](https://github.com/bontibon/kjv) for the codebase

## Usage

    usage: litv [flags] [reference...]

    Flags:
      -A num  show num verses of context after matching verses
      -B num  show num verses of context before matching verses
      -C      show matching verses in context of the chapter
      -e      highlighting of chapters and verse numbers
              (default when output is a TTY)
      -p      output to less with chapter grouping, spacing, indentation,
              and line wrapping
              (default when output is a TTY)
      -l      list books
      -h      show help

    Reference:
        <Book>
            Individual book
        <Book>:<Chapter>
            Individual chapter of a book
        <Book>:<Chapter>:<Verse>[,<Verse>]...
            Individual verse(s) of a specific chapter of a book
        <Book>:<Chapter>-<Chapter>
            Range of chapters in a book
        <Book>:<Chapter>:<Verse>-<Verse>
            Range of verses in a book chapter
        <Book>:<Chapter>:<Verse>-<Chapter>:<Verse>
            Range of chapters and verses in a book

        /<Search>
            All verses that match a pattern
        <Book>/<Search>
            All verses in a book that match a pattern
        <Book>:<Chapter>/<Search>
            All verses in a chapter of a book that match a pattern

## Build

litv can be built by cloning the repository and then running make:

    git clone https://github.com/caltlgin/litv.git
    cd litv
    make

## License

Public domain
