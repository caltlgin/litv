#pragma once

#include <regex.h>

#include "intset.h"

#define LITV_REF_SEARCH 1
#define LITV_REF_EXACT 2
#define LITV_REF_EXACT_SET 3
#define LITV_REF_RANGE 4
#define LITV_REF_RANGE_EXT 5

typedef struct litv_ref {
    int type;
    unsigned int book;
    unsigned int chapter;
    unsigned int chapter_end;
    unsigned int verse;
    unsigned int verse_end;
    intset *verse_set;
    char *search_str;
    regex_t search;
} litv_ref;

litv_ref *
litv_newref();

void
litv_freeref(litv_ref *ref);

int
litv_parseref(litv_ref *ref, const char *ref_str);
