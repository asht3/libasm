; ssize_t my_write(int fildes, const void* buf, size_t nbyte)

global my_write
section .text

my_write:
    mov rax, 1    ; sys_write = 1
    syscall
    
    ret           ; returns bytes read or the error code
