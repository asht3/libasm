#include "../include/tests.h"

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
    char hello_world_cpy_1[20];
    char hello_world_cpy_2[20];
    strcpy(hello_world_cpy_1, hello_world);
    strcpy(hello_world_cpy_2, hello_world);

    memset(hello_world_cpy_1 + 5, '/', 3);
    my_memset(hello_world_cpy_2 + 5, '/', 3);
    
    if (memcmp(hello_world_cpy_1, hello_world_cpy_2, strlen(hello_world)) != 0) {
        printf("my_memset test failed\n");
    }
}

void test_my_memcpy() {
    char dest1[20];
    char dest2[20];
    strcpy(dest1, hello_world);
    strcpy(dest2, hello_world);

    memcpy(dest1, "Test", sizeof(char) * 4);
    my_memcpy(dest2, "Test", sizeof(char) * 4);

    if (memcmp(dest1, dest2, strlen(dest1)) != 0) {
        printf("memcpy result: %s, my_memcpy result: %s\n", dest1, dest2);
        printf("my_memcpy test failed\n");
    }
}

void test_my_strcmp() {
    if (strcmp(hello_world, "Hello, World!") != my_strcmp(hello_world, "Hello, World!")) {
        printf("strcmp: %d, my_strcmp: %d \n", strcmp(hello_world, "Hello, World!"), my_strcmp(hello_world, "Hello, World!"));
        printf("my_strcmp equal strings test failed\n");
    }

    // if (strcmp(empty_str, hello_world) != my_strcmp(empty_str, hello_world)) {
    //     printf("strcmp: %d, my_strcmp: %d \n", strcmp(empty_str, hello_world), my_strcmp(empty_str, hello_world));
    //     printf("my_strcmp unequal strings test with empty string failed\n");
    // }

    if (strcmp("A", "B") != my_strcmp("A", "B")) {
        printf("my_strcmp unequal single char strings test failed\n");
    }

    if (strcmp("World", "Hello") != my_strcmp("World", "Hello")) {
        printf("strcmp: %d, my_strcmp: %d \n", strcmp("World", "Hello"), my_strcmp("World", "Hello"));
        printf("my_strcmp unequal strings test failed\n");
    }
}

void test_my_memmove() {
    char buffer1[20] = {0};
    char buffer2[20] = {0};

    strcpy(buffer1, "Hello, World!");
    strcpy(buffer2, "Hello, World!");
    // Overlapping regions
    my_memmove(buffer1 + 7, buffer1, 6); // Move "Hello," to after "World!"
    memmove(buffer2 + 7, buffer2, 6);
    if (memcmp(buffer1, buffer2, strlen(buffer1)) != 0) {
        printf("my_memmove overlapping test failed\n");
    }

    // Non-overlapping regions
    strcpy(buffer1, "Hello, World!");
    strcpy(buffer2, "Hello, World!");
    my_memmove(buffer1 + 13, buffer1, 6);
    memmove(buffer2 + 13, buffer2, 6);
    if (memcmp(buffer1, buffer2, 20) != 0) {
        printf("my_memmove non-overlapping test failed\n");
    }
}

void test_my_strncmp() {
    if (strncmp(hello_world, "Hello, World!", 5) != my_strncmp(hello_world, "Hello, World!", 5)) {
        printf("my_strncmp equal first n characters test failed\n");
    }

    if (strncmp("Apple", "Apricot", 2) != my_strncmp("Apple", "Apricot", 2)) {
        printf("my_strncmp unequal strings first n characters are the same test failed\n");
    }

    if (strncmp("Banana", "Bandana", 4) != my_strncmp("Banana", "Bandana", 4)) {
        printf("strncmp: %d, my_strncmp: %d \n", strncmp("Banana", "Bandana", 4), my_strncmp("Banana", "Bandana", 4));
        printf("my_strncmp unequal strings first n characters are different test failed\n");
    }

    if (strncmp(empty_str, "Band", 1) != my_strncmp(empty_str, "Band", 1)) {
        printf("strncmp: %d, my_strncmp: %d \n", strncmp(empty_str, "Band", 1), my_strncmp(empty_str, "Band", 1));
        printf("my_strncmp one empty string test failed\n");
    }

    if (strncmp(empty_str, empty_str, 1) != my_strncmp(empty_str, empty_str, 1)) {
        printf("strncmp: %d, my_strncmp: %d \n", strncmp(empty_str, empty_str, 1), my_strncmp(empty_str, empty_str, 1));
        printf("my_strncmp two empty strings test failed\n");
    }
}