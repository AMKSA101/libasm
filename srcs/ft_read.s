global ft_read

extern __errno_location

section .text

ft_read:
    mov rax, 0
    syscall
    test rax, rax
    jns success_exit
    
    failure_exit:
        neg rax
        push rax
        call __errno_location wrt ..plt
        pop rdx
        mov [rax], edx
        mov rax, -1
        ret

    success_exit:
    ret