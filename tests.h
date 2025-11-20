#ifndef TESTS_H
#define TESTS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Global variables
// extern char hello_world[13];
// extern char empty_str[1];

// Assembly function prototypes
size_t my_strlen(const char* str_1);
char* my_strchr(const char* str, int search_char);
void* my_memset(void* ptr, int value, size_t num);
void* my_memcpy(void *dest, const void *src, size_t num_bytes);
int my_strcmp(const char* str_1, const char* str_2);
void* my_memmove(void* dest, const void* src, size_t n);
int my_strncmp(const char* str_1, const char* str_2, int n);

// Functions that test assembly implementations
void test_my_strlen();
void test_my_strchr();
void test_my_memset();
void test_my_memcpy();
void test_my_strcmp();
void test_my_memmove();

#endif