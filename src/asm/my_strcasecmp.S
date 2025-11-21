; int my_strcasecmp(const char* str_1, const char* str_2)
; rdi = str_1, rsi = str_2

global my_strcasecmp
section .text

my_strcasecmp:

.loop:
    movzx eax, byte [rdi]     ; load str_1[i]
    movzx edx, byte [rsi]     ; load str_2[i]

    test al, al               ; check if both characters are null terminators
    jz .check_str2_end
    test dl, dl
    jz .not_equal

    call .to_lower            ; convert both characters to lowercase for comparison
    mov r8b, al               ; save lowercase version of str1[i]
    mov al, dl                ; move str2[i] to al for conversion
    call .to_lower
    mov r9b, al               ; save lowercase version of str2[i]

    mov al, r8b               ; compare the lowercase characters
    cmp al, r9b
    jne .not_equal

    inc rdi
    inc rsi
    jmp .loop


.to_lower:
    cmp al, 'A'              ; check if char to is uppercase, convert to lowercase if it is
    jl .to_lower_end
    cmp al, 'Z'
    jg .to_lower_end
    add al, 32               ; convert uppercase to lowercase
.to_lower_end:
    ret


.check_str2_end:
    test dl, dl               ; check if str_2 ended
    jz .equal                 ; both ended
    jmp .not_equal            ; str1 ended but str2 didn't

.not_equal:
    movzx eax, byte [rdi]             ; load char from str_1
    movzx edx, byte [rsi]             ; load char from str_2
    sub eax, edx                      ; return the difference
    ret

.equal:
    xor eax, eax             ; return 0
    ret