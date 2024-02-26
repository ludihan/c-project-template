CC      = gcc
TARGET  = app
INCLUDE = src/include/
SRC     = $(wildcard src/*.c)
OBJ     = $(SRC:src/%.c=obj/%.o)
CFLAGS  = -I$(INCLUDE)       \
          -Wall              \
          -Wextra            \
          -Wpedantic         \
          -Werror            \
          -fsanitize=address \
          -std=c17

.PHONY = all clean git-update

all: $(TARGET) git-update

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(CFLAGS)

./obj/%.o: ./src/%.c
	$(CC) -c $< -o $@ $(CFLAGS)

run: all
	./$(TARGET)

clean:
	rm $(TARGET) $(OBJ)

git-update:
	@printf "$(TARGET)\nobj/*\nlib/*\n" > .gitignore
