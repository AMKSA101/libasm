global ft_strlen

section .text

ft_strlen:
    mov rax, 0
    loop_start:
        cmp byte [rdi], 0
        je loop_end
        inc rdi
        inc rax
        jmp loop_start


    loop_end:
        ret