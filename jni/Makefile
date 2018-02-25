
CFLAGS = -O2 \
	-DSYS_UNIX \
	-DUSE_DIRENT \
	-DHAVE_STDLIB \
	-DHAVE_TERMIO \
	-DANSI_ARROWS

LIBS = -lm -lreadline

HUGS_CFLAGS = $(CFLAGS) \
	-DSYS_UNIX \
	-DUSE_DIRENT \
	-DHAVE_STDLIB \
	-DHAVE_TERMIO \
	-DANSI_ARROWS

COMMON_SRC = \
    builtin.c \
    char.c \
    compiler.c \
    edit.c \
    errors.c \
    evaluator.c \
    ffi.c \
    goal.c \
    input.c \
    machdep.c \
    machine.c \
    module.c \
    opts.c \
    output.c \
    plugin.c \
    script.c \
    static.c \
    storage.c \
    strutil.c \
    subst.c \
    type.c \
    version.c

HUGS_SRC = hugs.c observe.c

COMMON_OBJ = $(patsubst %.c, %.o, $(COMMON_SRC))

DEPS = Make.deps

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

all : hugs runhugs ffihugs

deps :
	cc -MM $(CFLAGS) $(COMMON_SRC) > $(DEPS)

install : all
	mkdir -p /usr/local/bin
	cp hugs runhugs ffihugs /usr/local/bin/.

clean :
	rm -f hugs runhugs ffihugs
	rm -f $(COMMON_OBJ)

hugs : $(COMMON_OBJ) hugs.c observe.c
	cc -o hugs $(HUGS_CFLAGS) $(LIBS) \
		hugs.c observe.c \
		$(COMMON_OBJ)

runhugs : $(COMMON_OBJ) runhugs.c server.c
	cc -o runhugs $(CFLAGS) $(LIBS) \
		runhugs.c server.c \
		$(COMMON_OBJ)

ffihugs : $(COMMON_OBJ) runhugs.c server.c
	cc -o ffihugs -DFFI_COMPILER $(CFLAGS) $(LIBS) \
		runhugs.c server.c \
		$(COMMON_OBJ)

include $(DEPS)
