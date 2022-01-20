#pragma once

#include "litv_config.h"
#include "litv_ref.h"

typedef struct {
    int start;
    int end;
} litv_range;

typedef struct {
    int current;
    int next_match;
    litv_range matches[2];
} litv_next_data;

int
litv_next_verse(const litv_ref *ref, const litv_config *config, litv_next_data *next);
