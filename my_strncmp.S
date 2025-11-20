; int my_strncmp(const char* str_1, const char* str_2, int n)
; rdi = str_1, rsi = str_2, rdx = n

global my_strncmp
section .text

my_strncmp:
    ;test rdi, rdi
    ;jz .ret_zero
    ;test rsi, rsi
    ;jz .ret_zero

    xor rax, rax

.loop:
    cmp rax, rdx              ; for (int i = 0; i < n; i++)
    jge .ret_zero             ; return 0

    movzx eax, byte [rdi]     ; load str_1[i] to eax (zero extended)
    movzx edx, byte [rsi]     ; load str_2[i] to edx (zero extended)

    or al, dl                 ; if (str1[i] == '\0' && str2[i] == '\0')
    jz .ret_zero

    test al, al               ; if (str1[i] == '\0') 
    jz .ret_neg_one

    test dl, dl               ; if (str2[i] == '\0')
    jz .ret_one

    cmp al, dl                ; compare bytes
    jl .ret_neg_one           ; if (str1[i] < str2[i]) 
    jg .ret_one               ; if (str1[i] > str2[i]) 
    
    jmp .loop

.ret_neg_one:
    mov rax, -1
    ret

.ret_one:
    mov rax, 1
    ret

.ret_zero:
    xor rax, rax
    ret
