; void* my_memset(void* ptr, int value, size_t num)

global my_memset
section .text

my_memset:
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
