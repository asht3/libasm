; void* my_memcpy(void *dest, const void *src, size_t num_bytes)
; rdi = dest, rsi = src, rdx = num_bytes

global my_memcpy
section .text

my_memcpy:
    mov rax, rdi    ; char* d = dest save the original dest value to return
    test rdx, rdx   ; test rdx against itself (bitwise AND)
    je .done        ; jump to return if equal to zero

.loop:
    mov cl, byte [rsi]      ; load byte from src
    mov byte [rdi], cl      ; store byte to dest
    inc rdi                 ; dest++
    inc rsi                 ; src++
    dec rdx                 ; num_bytes--
    jne .loop               ; jump if rdx is not equal to zero

.done:
    ret                     ; return dest