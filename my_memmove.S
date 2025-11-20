; void* my_memmove(void* dest, const void* src, size_t n)
; rdi = dest, rsi = src, rdx = n

global my_memmove
section .text

my_memmove:
    mov r8, rdi             ; Save original destination for return
    test rdx, rdx           ; if n == 0, return
    jz .done

    cmp rdi, rsi            ; compare dest and src
    jle .copy_forward       ; if dest <= src copy forward direction

    mov rax, rsi            ; store src value in rax
    add rax, rdx            ; get value of src + n
    cmp rdi, rax            ; compare dest with sum of src + n
    jge .copy_forward       ; if dest >= src + n copy forward direction

    jmp .copy_backwards     ; else there is overlap so copy backwards

.copy_backwards:
    mov rax, rdx                    ; i = n
.loop_back:
    cmp rax, 0                      ; for (size_t i = n; i > 0; i--)
    jle .done                       ; exit loop when i <= 0
    mov cl, byte [rsi + rax - 1]    ; load src[i - 1]
    mov byte [rdi + rax - 1], cl    ; store in dest[i - 1]
    dec rax                         ; index--
    jmp .loop_back

.copy_forward:
    xor rax, rax
.loop_fwd:
    cmp rax, rdx                  ; for (size_t i = 0; i < n; i++)
    jge .done                     ; exit loop when i >= n
    mov cl, byte [rsi + rax]      ; load src[i]
    mov byte [rdi + rax], cl      ; store in dest[i]
    inc rax                       ; index++
    jmp .loop_fwd

.done:
    mov rax, r8
    ret