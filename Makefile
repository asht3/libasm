NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

TARGET = my_libasm
SRCS = src/asm/my_strlen.S \
		src/asm/my_strchr.S \
		src/asm/my_memset.S \
		src/asm/my_memcpy.S \
		src/asm/my_strcmp.S \
		src/asm/my_memmove.S \
		src/asm/my_strncmp.S \
		src/asm/my_strcasecmp.S \
		src/asm/my_index.S \
		src/main.c \
		src/tests.c

OBJ_DIR = obj
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))
OBJS := $(OBJS:.S=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: %.S | $(OBJ_DIR)
	mkdir -p $(dir $@)
	$(NASM) $(NASMFLAGS) $< -o $@

.PHONY: all clean

clean:
	rm -rf $(OBJ_DIR) $(TARGET)