; int my_strcmp(const char* str_1, const char* str_2)
; rdi = str_1, rsi = str_2

global my_strcmp
section .text

my_strcmp:

.loop:
    movzx eax, byte [rdi]     ; load str_1[i] to eax (zero extended)
    movzx edx, byte [rsi]     ; load str_2[i] to edx (zero extended)
    cmp al, dl                ; compare bytes
    jl .less_than
    jg .greater_than
    ;jne .not_equal            ; jump if not equal
    test al, al               ; if str_1[i] == 0, both strings ended
    je .equal                 ; jump if equal
    inc rdi                   ; str_1++
    inc rsi                   ; str_2++
    jmp .loop

.equal:
    xor eax, eax              ; return 0
    ret

.not_equal: 
    ; sub eax, edx              ; return (str_1[i] - str_2[i])
    cmp eax, edx
    jl .less_than
    jg .greater_than
    ret

.less_than:
    mov eax, -1     ; return -1
    ret

.greater_than:
    mov eax, 1      ; return 1
    ret