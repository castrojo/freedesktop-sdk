all: freedesktop-sdk-stripper

OBJS=						\
	main.o					\
	thread_pool.o				\
	mapped_file.o				\
	fd.o					\
	arch.o					\
	elfutils.o				\
	named_tmp_file.o			\
	run.o

freedesktop-sdk-stripper: $(OBJS)
	$(CXX) $(CFLAGS) -D_FILE_OFFSET_BITS=64 -std=c++17 -W -Wall -g $(OBJS) -pthread -o $@

.cpp.o:
	$(CXX) $(LDFLAGS) -D_FILE_OFFSET_BITS=64 -std=c++17 -W -Wall -g -c $<

clean:
	rm -f $(OBJS) freedesktop-sdk-stripper

.SUFFIXES: .cpp .o
