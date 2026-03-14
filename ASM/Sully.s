default rel
global main
extern fopen
extern fprintf
extern fclose
extern snprintf
extern strstr
extern system

section .data
    ival dq 5
    mark db 'Sully_',0
    self db `Sully.s`,0
    mode db 'w',0
    fnamefmt db 'Sully_%d.s',0
    cmdfmt db 'nasm -felf64 %s -o Sully_%d.o && gcc Sully_%d.o -o Sully_%d',0
    runfmt db './Sully_%d',0
    fmt db 'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern strstr',10,'extern system',10,10,'section .data',10,'    ival dq %d',10,"    mark db 'Sully_',0",10,'    self db %c%s%c,0',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,'    lea rdi, [self]',10,'    lea rsi, [mark]',10,'    call strstr wrt ..plt',10,'    test rax, rax',10,'    jz .nodec',10,'    dec qword [ival]',10,'.nodec:',10,'    mov rax, [ival]',10,'    test rax, rax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, dword [ival]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    push 96',10,'    lea rax, [src]',10,'    push rax',10,'    push 96',10,'    lea rax, [src]',10,'    push rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, dword [ival]',10,'    mov ecx, 96',10,'    lea r8, [rbp-80]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 32',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, dword [ival]',10,'    mov r9d, dword [ival]',10,'    sub rsp, 16',10,'    mov eax, dword [ival]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jne .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, dword [ival]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,0
    src db `'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern strstr',10,'extern system',10,10,'section .data',10,'    ival dq %d',10,"    mark db 'Sully_',0",10,'    self db %c%s%c,0',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,'    lea rdi, [self]',10,'    lea rsi, [mark]',10,'    call strstr wrt ..plt',10,'    test rax, rax',10,'    jz .nodec',10,'    dec qword [ival]',10,'.nodec:',10,'    mov rax, [ival]',10,'    test rax, rax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, dword [ival]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    push 96',10,'    lea rax, [src]',10,'    push rax',10,'    push 96',10,'    lea rax, [src]',10,'    push rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, dword [ival]',10,'    mov ecx, 96',10,'    lea r8, [rbp-80]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 32',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, dword [ival]',10,'    mov r9d, dword [ival]',10,'    sub rsp, 16',10,'    mov eax, dword [ival]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jne .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, dword [ival]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10`,0

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 368
    lea rdi, [self]
    lea rsi, [mark]
    call strstr wrt ..plt
    test rax, rax
    jz .nodec
    dec qword [ival]
.nodec:
    mov rax, [ival]
    test rax, rax
    js .done
    lea rdi, [rbp-80]
    mov esi, 64
    lea rdx, [fnamefmt]
    mov ecx, dword [ival]
    xor eax, eax
    call snprintf wrt ..plt
    lea rdi, [rbp-80]
    lea rsi, [mode]
    call fopen wrt ..plt
    test rax, rax
    jz .fail
    mov [rbp-8], rax
    push 96
    lea rax, [src]
    push rax
    push 96
    lea rax, [src]
    push rax
    mov rdi, [rbp-8]
    lea rsi, [fmt]
    mov edx, dword [ival]
    mov ecx, 96
    lea r8, [rbp-80]
    mov r9d, 96
    xor eax, eax
    call fprintf wrt ..plt
    add rsp, 32
    mov rdi, [rbp-8]
    call fclose wrt ..plt
    lea rdi, [rbp-336]
    mov esi, 256
    lea rdx, [cmdfmt]
    lea rcx, [rbp-80]
    mov r8d, dword [ival]
    mov r9d, dword [ival]
    sub rsp, 16
    mov eax, dword [ival]
    mov [rsp], rax
    xor eax, eax
    call snprintf wrt ..plt
    add rsp, 16
    lea rdi, [rbp-336]
    call system wrt ..plt
    test eax, eax
    jne .fail
    lea rdi, [rbp-336]
    mov esi, 256
    lea rdx, [runfmt]
    mov ecx, dword [ival]
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