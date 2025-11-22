#include "../include/tests.h"

// Incoming Argument Registers: rdi, rsi, rdx, r10, r8, r9
//  (registers are in order of importance... they are different that X86-32 FYI)

// Caller-Saved (Volatile): RAX, RCX, RDX, RSI, RDI, R8-R11

// Callee-Saved (Non-Volatile): RBX, RBP, R12-R15, RSP --> The callee (Inside the fuction if it wants to use them)

// Returning from function: RAX and RDX

int main(void) {
    test_my_strlen();
    test_my_strchr();
    test_my_memset();
    test_my_memcpy();
    test_my_strcmp();
    test_my_memmove();
    test_my_strncmp();
    test_my_strcasecmp();
    test_my_index();
    test_my_read();
    
    return 0;
}