CC      = gcc
TARGET  = calculadora
INCLUDE = include/
SRC     = $(wildcard src/*.c)
OBJ     = $(SRC:src/%.c=lib/%.o)
#LIB    = libs externas do sistemas operacional
CFLAGS = -I$(INCLUDE)       \
		 -Wall              \
		 -Wextra            \
		 -Wpedantic         \
		 -Werror            \
		 -fsanitize=address \
		 -std=c99

.PHONY = all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(CFLAGS)

./lib/%.o: ./src/%.c
	$(CC) $< -c -o $@ $(CFLAGS)

clean:
	rm calculadora $(OBJ)
