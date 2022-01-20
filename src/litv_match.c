#include <assert.h>
#include <regex.h>
#include <stdbool.h>
#include <stdlib.h>

#include "litv_data.h"
#include "litv_match.h"
#include "intset.h"

static bool
litv_verse_matches(const litv_ref *ref, const litv_verse *verse)
{
    switch (ref->type) {
        case LITV_REF_SEARCH:
            return (ref->book == 0 || ref->book == verse->book) &&
                (ref->chapter == 0 || verse->chapter == ref->chapter) &&
                regexec(&ref->search, verse->text, 0, NULL, 0) == 0;

        case LITV_REF_EXACT:
            return ref->book == verse->book &&
                (ref->chapter == 0 || ref->chapter == verse->chapter) &&
                (ref->verse == 0 || ref->verse == verse->verse);

        case LITV_REF_EXACT_SET:
            return ref->book == verse->book &&
                (ref->chapter == 0 || verse->chapter == ref->chapter) &&
                intset_contains(ref->verse_set, verse->verse);

        case LITV_REF_RANGE:
            return ref->book == verse->book &&
                ((ref->chapter_end == 0 && ref->chapter == verse->chapter) ||
                    (verse->chapter >= ref->chapter && verse->chapter <= ref->chapter_end)) &&
                (ref->verse == 0 || verse->verse >= ref->verse) &&
                (ref->verse_end == 0 || verse->verse <= ref->verse_end);

        case LITV_REF_RANGE_EXT:
            return ref->book == verse->book &&
                (
                    (verse->chapter == ref->chapter && verse->verse >= ref->verse && ref->chapter != ref->chapter_end) ||
                    (verse->chapter > ref->chapter && verse->chapter < ref->chapter_end) ||
                    (verse->chapter == ref->chapter_end && verse->verse <= ref->verse_end && ref->chapter != ref->chapter_end) ||
                    (ref->chapter == ref->chapter_end && verse->chapter == ref->chapter && verse->verse >= ref->verse && verse->verse <= ref->verse_end)
                );

        default:
            return false;
    }
}

#define LITV_DIRECTION_BEFORE -1
#define LITV_DIRECTION_AFTER 1

static int
litv_chapter_bounds(int i, int direction, int maximum_steps)
{
    assert(direction == LITV_DIRECTION_BEFORE || direction == LITV_DIRECTION_AFTER);

    int steps = 0;
    for ( ; 0 <= i && i < litv_verses_length; i += direction) {
        bool step_limit = (maximum_steps != -1 && steps >= maximum_steps) ||
            (direction == LITV_DIRECTION_BEFORE && i == 0) ||
            (direction == LITV_DIRECTION_AFTER && i + 1 == litv_verses_length);
        if (step_limit) {
            break;
        }

        const litv_verse *current = &litv_verses[i], *next = &litv_verses[i + direction];
        if (current->book != next->book || current->chapter != next->chapter) {
            break;
        }
        steps++;
    }
    return i;
}

static int
litv_next_match(const litv_ref *ref, int i)
{
    for ( ; i < litv_verses_length; i++) {
        const litv_verse *verse = &litv_verses[i];
        if (litv_verse_matches(ref, verse)) {
            return i;
        }
    }
    return -1;
}

static void
litv_next_addrange(litv_next_data *next, litv_range range) {
    if (next->matches[0].start == -1 && next->matches[0].end == -1) {
        next->matches[0] = range;
    } else if (range.start < next->matches[0].end) {
        next->matches[0] = range;
    } else {
        next->matches[1] = range;
    }
}

int
litv_next_verse(const litv_ref *ref, const litv_config *config, litv_next_data *next)
{
    if (next->current >= litv_verses_length) {
        return -1;
    }

    if (next->matches[0].start != -1 && next->matches[0].end != -1 && next->current >= next->matches[0].end) {
        next->matches[0] = next->matches[1];
        next->matches[1] = (litv_range){-1, -1};
    }

    if ((next->next_match == -1 || next->next_match < next->current) && next->next_match < litv_verses_length) {
        int next_match = litv_next_match(ref, next->current);
        if (next_match >= 0) {
            next->next_match = next_match;
            litv_range bounds = {
                .start = litv_chapter_bounds(next_match, LITV_DIRECTION_BEFORE, config->context_chapter ? -1 : config->context_before),
                .end = litv_chapter_bounds(next_match, LITV_DIRECTION_AFTER, config->context_chapter ? -1 : config->context_after) + 1,
            };
            litv_next_addrange(next, bounds);
        } else {
            next_match = litv_verses_length;
        }
    }

    if (next->matches[0].start == -1 && next->matches[0].end == -1) {
        return -1;
    }

    if (next->current < next->matches[0].start) {
        next->current = next->matches[0].start;
    }

    return next->current++;
}
