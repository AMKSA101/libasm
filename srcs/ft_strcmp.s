global ft_strcmp

section .text

ft_strcmp:
    compare_loop:
        mov al, [rdi]
        mov dl, [rsi]
        cmp al, dl
        jne calculate_differ
        cmp al, 0
        je strings_equal
        inc rdi
        inc rsi
        jmp compare_loop
    calculate_differ:
        movzx eax, al
        movzx edx, dl
        sub eax, edx
        ret
    strings_equal:
        xor eax, eax
        ret
    
