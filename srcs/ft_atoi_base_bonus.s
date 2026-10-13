global ft_atoi_base

extern ft_strlen

section .text

ft_atoi_base:
    push rdi
    push rsi
    sub rsp, 8
    mov rcx, 0
    mov rdi, [rsp]
    call ft_strlen
    mov rcx, rax
    cmp rcx, 2
    jl invalid_base

    continue:
        mov rsi, [rsp]
        mov r8, 0
        validation_loop:
            cmp r8, rcx
            je base_chars_valid
            mov al, [rsi + r8]
            cmp al, 32
            je invalid_base
            cmp al, '-'
            je invalid_base
            cmp al, '+'
            je invalid_base
            cmp al, 9
            je invalid_base
            cmp al, 10
            je invalid_base
            cmp al, 11
            je invalid_base
            cmp al, 12
            je invalid_base
            cmp al, 13
            je invalid_base
            inc r8
            jmp validation_loop

    base_chars_valid:
        add rsp, 24
        xor eax, eax
        ret

    invalid_base:
        add rsp, 24
        xor eax, eax
        ret