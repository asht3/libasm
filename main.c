#include "tests.h"

// Incoming Argument Registers: rdi, rsi, rdx, r10, r8, r9
//  (registers are in order of importance... they are different that X86-32 FYI)

// Caller-Saved (Volatile): RAX, RCX, RDX, RSI, RDI, R8-R11

// Callee-Saved (Non-Volatile): RBX, RBP, R12-R15, RSP --> The callee (Inside the fuction if it wants to use them)

// Returning from function: RAX and RDX

int main(void) {
    // char hello_world[13] = "Hello, World!";

    // if (strlen(hello_world) != my_strlen(hello_world)) {
    //     printf("my_strlen test failed\n");
    //     return 1;
    // }

    test_my_strlen();
    test_my_strchr();
    test_my_memset();

    // char* my_strchr_res = my_strchr(hello_world, 'o');
    // char* strchr_res = strchr(hello_world, 'o');
    // if (strchr_res != my_strchr_res) {
    //     printf("my_strchr test failed: %s\n", my_strchr_res);
    //     return 1;
    // }

    // if (memset(hello_world + 5, '/', 3 * sizeof(char)) != my_memset(hello_world + 5, '/', 3 * sizeof(char))) {
    //     printf("my_memset test failed\n");
    //     return 1;
    // }

    printf("All tests passed!\n");

    return 0;
}