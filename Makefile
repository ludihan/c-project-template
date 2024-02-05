CC      = gcc
TARGET  = calculadora
INCLUDE = include/
SRC     = $(wildcard src/*.c)
LIB     = $(SRC:src/%.c=lib/%.o)
CFLAGS = -I$(INCLUDE)       \
		 -Wall              \
		 -Wextra            \
		 -Wpedantic         \
		 -Werror            \
		 -fsanitize=address \
		 -std=c99

.PHONY = all clean

all: $(TARGET)

$(TARGET): $(LIB)
	$(CC) $(LIB) -o $(TARGET) $(CFLAGS)

./lib/%.o: ./src/%.c
	$(CC) $< -c -o $@ $(CFLAGS)

clean:
	rm calculadora $(LIB)
