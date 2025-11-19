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

void test_my_memcpy() {
    char dest1[20] = "Hello, World!";
    char dest2[20] = "Hello, World!";

    memcpy(dest1, "Test", 4);
    my_memcpy(dest2, "Test", 4);

    if (memcmp(dest1, dest2, sizeof(dest1)) != 0) {
        printf("memcpy result: %s \nmy_memcpy result: %s\n", dest1, dest2);
        printf("my_memcpy test failed\n");
    }

    // if (memcpy(dest1, "Test", 4 * sizeof(char)) != my_memcpy(dest2, "Test", 4 * sizeof(char))) {
    //     // print my_memcpy result
    //     printf("memcpy result: %s \nmy_memcpy result: %s\n", dest1, dest2);
    //     printf("my_memcpy test failed\n");
    // }
}