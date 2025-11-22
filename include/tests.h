#ifndef TESTS_H
#define TESTS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>

// Assembly function prototypes
size_t my_strlen(const char* str_1);
char* my_strchr(const char* str, int search_char);
void* my_memset(void* ptr, int value, size_t num);
void* my_memcpy(void *dest, const void *src, size_t num_bytes);
int my_strcmp(const char* str_1, const char* str_2);
void* my_memmove(void* dest, const void* src, size_t n);
int my_strncmp(const char* str_1, const char* str_2, int n);
int my_strcasecmp(const char* str_1, const char* str_2);
char* my_index(const char* str, int search_char);
ssize_t my_read(int fd, void* buf, size_t count);
ssize_t my_write(int fd, const void* buf, size_t count);

// Functions that test assembly implementations
void test_my_strlen();
void test_my_strchr();
void test_my_memset();
void test_my_memcpy();
void test_my_strcmp();
void test_my_memmove();
void test_my_strncmp();
void test_my_strcasecmp();
void test_my_index();
void test_my_read();
void test_my_write();

#endif