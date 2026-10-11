global ft_strdup

extern malloc, ft_strlen, ft_strcpy

section .text

ft_strdup:
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc wrt ..plt
    test rax, rax
    jz allocation_failed
    mov rdi, rax
    mov rsi, [rsp]
    call ft_strcpy
    add rsp, 8
    ret

    allocation_failed:
        add rsp, 8
        xor eax, eax
        ret
