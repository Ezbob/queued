DC = gdc
EXEC = queue
CFLAGS =
SRCS = main.d queue.d
HDRS = 
OBJS = $(SRCS:.d=.o)

.PHONY: all clean run

all: $(SRCS) $(EXEC) 

$(EXEC): $(OBJS)
	$(DC) $^ -o $@
	
%.o: %.d
	$(DC) $(CFLAGS) $^ -c -o $@

run: $(SRCS) $(EXEC)
	./$(EXEC)

clean:
	$(RM) -rf *.o $(EXEC)
