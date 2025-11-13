; char* my_strchr(const char* str, int search_char)

global my_strchr
section .text

my_strchr:
    xor rax, rax    ; length = 0
    mov edx, esi    ; move search char into edx

.loop:
    mov cl, byte [rdi + rax]    ; load byte at str + length into cl
    cmp cl, dl                  ; compare loaded byte to seach char
    je .found
    test cl, cl                 ; if loaded byte is 0, string is not found (end of string)
    je .not_found
    inc rax
    jmp .loop

.found:
    lea rax, [rax + rdi]        ; return &str[index]
    ret

.not_found:
    xor rax, rax                ; return NULL
    ret