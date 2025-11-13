NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

TARGET = my_libasm
SRCS = my_strlen.S main.c

OBJS = $(SRCS:.c=.o)
OBJS := $(OBJS:.S=.o)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(NASM) $(NASMFLAGS) $< -o $@

.PHONY: clean
clean:
	-rm -f *.o $(TARGET)