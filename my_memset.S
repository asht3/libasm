; void* my_memset(void* ptr, int value, size_t num)

global my_memset
section .text

my_memset:
; ptr -> rdi, value -> esi, num -> rdx

;    for (size_t i = 0; i < num; ++i)
;        p[i] = v
;    return ptr;

    xor rax, rax    ; index = 0

.loop:
    cmp rax, rdx    ; compare index to num
    je .endloop
    mov byte [rax + rdi], sil   ; store low byte of value 
    inc rax
    jmp .loop

.endloop:
    mov rax, rdi    ; return ptr
    ret
