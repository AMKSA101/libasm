global ft_strcpy

section .text

ft_strcpy:
    mov rax, rdi
    copy_loop:
        mov dl, [rsi]
        mov [rdi], dl
        cmp dl, 0
        je copy_done
        inc rsi
        inc rdi
        jmp copy_loop

    copy_done:
        ret