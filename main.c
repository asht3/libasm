#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char* str_1);
char* my_strchr(const char* str, int search_char);

int main(void) {
    if (strlen("Hello, World!") != my_strlen("Hello, World!")) {
        printf("my_strlen test failed\n");
        return 1;
    }

    char* my_strchr_res = my_strchr("Hello, World!", 'o');
    char* strchr_res = strchr("Hello, World!", 'o');
    if (strchr_res != my_strchr_res) {
        printf("my_strchr test failed: %s\n", my_strchr_res);
        return 1;
    }

    printf("All tests passed!\n");

    return 0;
}