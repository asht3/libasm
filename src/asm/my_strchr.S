; char* my_strchr(const char* str, int search_char)

global my_strchr
section .text

my_strchr:
    xor rax, rax    ; length = 0
    mov edx, esi    ; move search char into edx

.loop:
    mov cl, byte [rdi + rax]    ; load byte at str + length into cl
    cmp cl, dl                  ; compare loaded byte to search char
    je .found                   ; jump to .found if search char is found
    test cl, cl                 ; test the loaded byte against itself
    je .not_found               ; if loaded byte is 0, char is not found (end of string)
    inc rax                     ; length++
    jmp .loop                   ; unconditional jump to begining of loop

.found:
    lea rax, [rax + rdi]        ; load address of str[index]
    ret                         ; return &str[index]

.not_found:
    xor rax, rax
    ret                         ; return NULL