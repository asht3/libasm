; void* my_memset(void* ptr, int value, size_t num)

global my_memset
section .text

my_memset:
    xor rax, rax    ; index = 0
    mov cl, sil     ; copy value's low byte into CL (caller-saved)

.loop:
    cmp rax, rdx                ; compare index to num
    je .endloop                 ; jump if index equal to num
    mov byte [rdi + rax], cl    ; store low byte of value 
    inc rax                     ; index++
    jmp .loop                   ; unconditional jump to begining of loop

.endloop:
    mov rax, rdi    ; move ptr to rax to return
    ret             ; return ptr
