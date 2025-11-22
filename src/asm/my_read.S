; ssize_t my_read(int fd, void* buf, size_t count)
; rdi = fd, rsi = buf, rdx = count

global my_read
section .text

my_read:
    mov rax, 0      ; call sys_read
    syscall

    ret             ; returns any of the following:
                    ; bytes read if rax > 0
                    ; EOF if rax = 0
                    ; error code if rax < 0