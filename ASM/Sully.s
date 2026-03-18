default rel
global main
extern fopen
extern fprintf
extern fclose
extern snprintf
extern system

section .data
    i dd 5
    mode db 'w',0
    fnamefmt db 'Sully_%d.s',0
    cmdfmt db 'nasm -felf64 %s -o Sully_%d.o && gcc Sully_%d.o -o Sully_%d',0
    runfmt db './Sully_%d',0
    fmt db 'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern system',10,10,'section .data',10,'    i dd %d',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,"%%ifidn __?FILE?__, 'Sully.s'",10,'%%else',10,'    dec dword [i]',10,'%%endif',10,'    mov eax, [i]',10,'    test eax, eax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    sub rsp, 8',10,'    push 96',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, [i]',10,'    lea rcx, [src]',10,'    mov r8d, 96',10,'    lea r9, [src]',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 16',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, [i]',10,'    mov r9d, [i]',10,'    sub rsp, 16',10,'    mov eax, [i]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jnz .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,0
    src db `'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern system',10,10,'section .data',10,'    i dd %d',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,"%%ifidn __?FILE?__, 'Sully.s'",10,'%%else',10,'    dec dword [i]',10,'%%endif',10,'    mov eax, [i]',10,'    test eax, eax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    sub rsp, 8',10,'    push 96',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, [i]',10,'    lea rcx, [src]',10,'    mov r8d, 96',10,'    lea r9, [src]',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 16',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, [i]',10,'    mov r9d, [i]',10,'    sub rsp, 16',10,'    mov eax, [i]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jnz .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10`,0

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 368
%ifidn __?FILE?__, 'Sully.s'
%else
    dec dword [i]
%endif
    mov eax, [i]
    test eax, eax
    js .done
    lea rdi, [rbp-80]
    mov esi, 64
    lea rdx, [fnamefmt]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt
    lea rdi, [rbp-80]
    lea rsi, [mode]
    call fopen wrt ..plt
    test rax, rax
    jz .fail
    mov [rbp-8], rax
    sub rsp, 8
    push 96
    mov rdi, [rbp-8]
    lea rsi, [fmt]
    mov edx, [i]
    lea rcx, [src]
    mov r8d, 96
    lea r9, [src]
    xor eax, eax
    call fprintf wrt ..plt
    add rsp, 16
    mov rdi, [rbp-8]
    call fclose wrt ..plt
    lea rdi, [rbp-336]
    mov esi, 256
    lea rdx, [cmdfmt]
    lea rcx, [rbp-80]
    mov r8d, [i]
    mov r9d, [i]
    sub rsp, 16
    mov eax, [i]
    mov [rsp], rax
    xor eax, eax
    call snprintf wrt ..plt
    add rsp, 16
    lea rdi, [rbp-336]
    call system wrt ..plt
    test eax, eax
    jnz .fail
    lea rdi, [rbp-336]
    mov esi, 256
    lea rdx, [runfmt]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt
    lea rdi, [rbp-336]
    call system wrt ..plt
.done:
    xor eax, eax
    leave
    ret
.fail:
    mov eax, 1
    leave
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
