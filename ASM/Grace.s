default rel
extern fopen
extern fprintf
extern fclose

%macro DATA 0
section .data
    fname db 'Grace_kid.s',0
    mode db 'w',0
    fmt db 'default rel',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,10,'%%macro DATA 0',10,'section .data',10,"    fname db 'Grace_kid.s',0",10,"    mode db 'w',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,'%%endmacro',10,10,'%%macro CODE 0',10,'section .text',10,'global main',10,'main:',10,'    ; Grace comment',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 16',10,'    lea rdi, [fname]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz %%%%fail',10,'    mov [rbp-8], rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    lea rdx, [src]',10,'    mov ecx, 96',10,'    lea r8, [src]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'%%%%fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,'%%endmacro',10,10,'%%macro RUN 0',10,'DATA',10,'CODE',10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,'%%endmacro',10,10,'RUN',10,0
    src db `'default rel',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,10,'%%macro DATA 0',10,'section .data',10,"    fname db 'Grace_kid.s',0",10,"    mode db 'w',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,'%%endmacro',10,10,'%%macro CODE 0',10,'section .text',10,'global main',10,'main:',10,'    ; Grace comment',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 16',10,'    lea rdi, [fname]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz %%%%fail',10,'    mov [rbp-8], rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    lea rdx, [src]',10,'    mov ecx, 96',10,'    lea r8, [src]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'%%%%fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,'%%endmacro',10,10,'%%macro RUN 0',10,'DATA',10,'CODE',10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,'%%endmacro',10,10,'RUN',10`,0
%endmacro

%macro CODE 0
section .text
global main
main:
    ; Grace comment
    push rbp
    mov rbp, rsp
    sub rsp, 16
    lea rdi, [fname]
    lea rsi, [mode]
    call fopen wrt ..plt
    test rax, rax
    jz %%fail
    mov [rbp-8], rax
    mov rdi, [rbp-8]
    lea rsi, [fmt]
    lea rdx, [src]
    mov ecx, 96
    lea r8, [src]
    mov r9d, 96
    xor eax, eax
    call fprintf wrt ..plt
    mov rdi, [rbp-8]
    call fclose wrt ..plt
    xor eax, eax
    leave
    ret
%%fail:
    mov eax, 1
    leave
    ret
%endmacro

%macro RUN 0
DATA
CODE
section .note.GNU-stack noalloc noexec nowrite progbits
%endmacro

RUN
