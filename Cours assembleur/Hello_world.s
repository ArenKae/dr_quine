default rel 
extern printf
global main

section .rodata
msg: db "Hello, World!", 10, 0

section .text
main:
lea rdi, [msg]
xor eax, eax
call printf
xor eax, eax
ret
