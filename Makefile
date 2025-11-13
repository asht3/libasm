NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

TARGET = my_libasm
SRCS = my_strlen.S main.c

OBJ_DIR = obj
OBJS = $(patsubst src/%.c, $(OBJ_DIR)/%.o, $(SRCS))
# OBJS = $(SRCS:.c=.o)
OBJS := $(OBJS:.S=.o)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: src/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# %.o: %.c
# 	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(NASM) $(NASMFLAGS) $< -o $@

.PHONY: clean

clean:
	rm -f $(OBJS) $(TARGET)