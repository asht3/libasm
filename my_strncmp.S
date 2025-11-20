; int my_strncmp(const char* str_1, const char* str_2, int n)
; rdi = str_1, rsi = str_2, rdx = n

global my_strncmp
section .text

my_strncmp:
    xor rcx, rcx              ; i = 0

.loop:
    cmp rcx, rdx                    ; for (int i = 0; i < n; i++)
    jge .ret_zero                   ; return 0

    movzx r8d, byte [rdi + rcx]     ; load str_1[i]
    movzx r9d, byte [rsi + rcx]     ; load str_2[i]

    cmp r8b, r9b              ; compare bytes
    jne .not_equal            ; if not equal, return difference

    test r8b, r8b             ; check if null terminator is reached
    jz .ret_zero              ; if null, strings are equal up to this point

    inc rcx                   ; i++
    jmp .loop

.not_equal:
    movsx eax, r8b           ; load char to eax and sign-extend
    movsx ecx, r9b           ; load char to ecx and sign-extend
    sub eax, ecx             ; return the difference
    ret

.ret_zero:
    xor eax, eax             ; return 0
    ret
