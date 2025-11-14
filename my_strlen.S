; size_t my_strlen(const char* str_1)

global my_strlen
section .text

my_strlen:
    xor rax, rax     ; set the length to 0
.loop:
    cmp byte [rdi + rax], 0    ; compare byte at s + length with 0
    je .endloop                ; exit loop when NULL
    inc rax
    jmp .loop
.endloop:
    ret