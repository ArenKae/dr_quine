default rel
global main
extern printf

section .data
    fmt db 'default rel',10,'global main',10,'extern printf',10,10,'section .data',10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'; outside comment',10,'print:',10,'    ; inside comment',10,'    lea rdi, [fmt]',10,'    lea rsi, [src]',10,'    mov edx, 34',10,'    lea rcx, [src]',10,'    mov r8d, 34',10,'    xor eax, eax',10,'    call printf wrt ..plt',10,'    ret',10,10,'main:',10,'    call print',10,'    xor eax, eax',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,0
    src db "'default rel',10,'global main',10,'extern printf',10,10,'section .data',10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'; outside comment',10,'print:',10,'    ; inside comment',10,'    lea rdi, [fmt]',10,'    lea rsi, [src]',10,'    mov edx, 34',10,'    lea rcx, [src]',10,'    mov r8d, 34',10,'    xor eax, eax',10,'    call printf wrt ..plt',10,'    ret',10,10,'main:',10,'    call print',10,'    xor eax, eax',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10",0

section .text
; outside comment
print:
    ; inside comment
    lea rdi, [fmt]
    lea rsi, [src]
    mov edx, 34
    lea rcx, [src]
    mov r8d, 34
    xor eax, eax
    call printf wrt ..plt
    ret

main:
    call print
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
