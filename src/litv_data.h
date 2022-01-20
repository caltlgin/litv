#pragma once

typedef struct {
    int number;
    char *name;
    char *abbr;
} litv_book;

typedef struct {
    int book;
    int chapter;
    int verse;
    char *text;
} litv_verse;

extern litv_verse litv_verses[];

extern int litv_verses_length;

extern litv_book litv_books[];

extern int litv_books_length;
