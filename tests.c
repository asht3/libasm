#include "tests.h"

// Global variables
char hello_world[13] = "Hello, World!";
char empty_str[1] = "";

void test_my_strlen() {
    if (strlen(hello_world) != my_strlen(hello_world)) {
        printf("my_strlen test failed\n");
    }

    if (strlen(empty_str) != my_strlen(empty_str)) {
        printf("my_strlen empty string test failed\n");
    }
}

void test_my_strchr() {
    char* my_strchr_res = my_strchr(hello_world, 'o');
    char* strchr_res = strchr(hello_world, 'o');
    if (strchr_res != my_strchr_res) {
        printf("my_strchr test failed: %s\n", my_strchr_res);
    }
}

void test_my_memset() {
    if (memset(hello_world + 5, '/', 3 * sizeof(char)) != my_memset(hello_world + 5, '/', 3 * sizeof(char))) {
        printf("my_memset test failed\n");
    }
}