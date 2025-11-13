#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char* str_1);

int main(void) {
    if (strlen("Hello, World!") != my_strlen("Hello, World!")) {
        printf("my_strlen strength failed\n");
        return 1;
    }


    printf("All tests passed!\n");

    return 0;
}