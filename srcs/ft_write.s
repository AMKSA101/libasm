global ft_write

extern __errno_location

section .text

ft_write:
    mov rax, 1
    syscall
    test rax, rax
    jns write_success

    write_error:
        neg rax
        push rax
        call __errno_location wrt ..plt
        pop rdx
        mov [rax], edx
        mov rax, -1
        ret
        
    write_success:
    ret