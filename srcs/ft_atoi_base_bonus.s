global ft_atoi_base

extern ft_strlen

section .text

ft_atoi_base:
    push rbx
    push r12
    push r13
    push r14
    push r15

    mov rbx, rdi            ; rbx = str
    mov r12, rsi            ; r12 = base

    ; ---- validate base ----
    mov rdi, r12
    call ft_strlen
    mov r13, rax            ; r13 = base length
    cmp r13, 2
    jb invalid_base

    xor r8, r8
validation_loop:
    cmp r8, r13
    jae convert
    mov al, [r12 + r8]
    cmp al, 32              ; space
    je invalid_base
    cmp al, '-'
    je invalid_base
    cmp al, '+'
    je invalid_base
    cmp al, 9               ; tab, LF, VT, FF, CR
    jb no_whitespace
    cmp al, 13
    jbe invalid_base
no_whitespace:
    mov r9, r8
    inc r9
duplicate_inner:
    cmp r9, r13
    jae next_outer
    mov dl, [r12 + r9]
    cmp al, dl
    je invalid_base
    inc r9
    jmp duplicate_inner
next_outer:
    inc r8
    jmp validation_loop

    ; ---- skip leading whitespace in str ----
    convert:
        mov al, [rbx]
        cmp al, 32
        je skip_space
        cmp al, 9
        jb parse_sign
        cmp al, 13
        ja parse_sign
    skip_space:
        inc rbx
        jmp convert

    ; ---- optional single sign ----
    parse_sign:
        mov r15, 1
        cmp al, '+'
        je consume_sign
        cmp al, '-'
        jne parse_digits
        mov r15, -1
    consume_sign:
        inc rbx

    ; ---- convert digits ----
    parse_digits:
        xor r14, r14        ; r14 = result
    digit_loop:
        movzx eax, byte [rbx]
        test al, al
        jz  conversion_done
        xor r8, r8
    find_digit:
        cmp r8, r13
        jae conversion_done
        cmp al, [r12 + r8]
        je  digit_found
        inc r8
        jmp find_digit
    digit_found:
        mov rax, r14
        imul rax, r13
        add rax, r8
        mov r14, rax
        inc rbx
        jmp digit_loop

    conversion_done:
        mov rax, r14
        imul rax, r15
        jmp epilogue

    invalid_base:
        xor eax, eax

    epilogue:
        pop r15
        pop r14
        pop r13
        pop r12
        pop rbx
        ret
