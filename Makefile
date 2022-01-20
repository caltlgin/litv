OBJS = src/litv_main.o \
       src/litv_match.o \
       src/litv_ref.o \
       src/litv_render.o \
       src/intset.o \
       src/strutil.o \
       data/litv_data.o
CFLAGS += -Wall -Isrc/
LDLIBS += -lreadline

litv: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LDLIBS)

src/litv_main.o: src/litv_main.c src/litv_config.h src/litv_data.h src/litv_match.h src/litv_ref.h src/litv_render.h src/strutil.h

src/litv_match.o: src/litv_match.h src/litv_match.c src/litv_config.h src/litv_data.h src/litv_ref.h

src/litv_ref.o: src/litv_ref.h src/litv_ref.c src/intset.h src/litv_data.h

src/litv_render.o: src/litv_render.h src/litv_render.c src/litv_config.h src/litv_data.h src/litv_match.h src/litv_ref.h

src/insetset.o: src/intset.h src/insetset.c

src/strutil.o: src/strutil.h src/strutil.c

data/litv_data.o: src/litv_data.h data/litv_data.c

data/litv_data.c: data/litv.tsv data/generate.awk src/litv_data.h
	awk -f data/generate.awk $< > $@

.PHONY: clean
clean:
	rm -rf $(OBJS) litv
