global ft_atoi_base

extern ft_strlen

section .text

ft_atoi_base:
    push rdi
    push rsi
    mov rcx, 0
    sub rsp, 8
    mov rdi, [rsp + 8]
    call ft_strlen
    mov rcx, rax
    cmp rcx, 2
    jl invalid_base
    mov rsi, [rsp + 8]
    mov r8, 0
    validation_loop:
        cmp r8, rcx
        je dup_check
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
    dup_check:
        mov r8, 0
        duplicate_outer:
            cmp r8, rcx
            jae base_chars_valid
            mov r9, r8
            inc r9
            mov al, [rsi + r8]
        duplicate_inner:
            cmp r9, rcx
            jae next_outer
            mov dl, [rsi + r9]
            cmp al, dl
            je invalid_base
            inc r9
            jmp duplicate_inner
        next_outer:
            inc r8
            jmp duplicate_outer

    base_chars_valid:
        mov eax, 0
        mov r10d, 1
        mov rdi, [rsp + 16]
        jmp skip_whitespace

    skip_whitespace:
        cmp al, [rdi]
        je after_whitespace
        mov al, [rdi]
        cmp al, '-'
        je after_whitespace
        cmp al, '+'
        je after_whitespace
        cmp al, 9
        je is_whitespace
        cmp al, 10
        je is_whitespace
        cmp al, 11
        je is_whitespace
        cmp al, 12
        je is_whitespace
        cmp al, 13
        je is_whitespace
        cmp al, 32
        je is_whitespace
        jmp skip_whitespace

    is_whitespace:
        inc rdi
        jmp skip_whitespace
    
    after_whitespace:
        cmp al, '+'
        jmp is_sign
        cmp al, '-'
        neg r10d
        jmp is_sign
        jmp parse_digits

    parse_digits:
        add rsp, 24
        ret

    is_sign:
        inc rdi
        jmp base_chars_valid

    invalid_base:
        add rsp, 24
        xor eax, eax
        ret