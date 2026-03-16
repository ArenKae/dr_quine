default rel ; Indique que les adresses dans le code sont relatives à l'instruction courante, 
; ce qui est nécessaire pour les appels de fonctions externes comme fopen, fprintf et fclose.
global main
extern printf

section .data
    fmt db 'default rel',10,'global main',10,'extern printf',10,10,'section .data',10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'; outside comment',10,'main:',10,'    ; inside comment',10,'    lea rdi, [fmt]',10,'    lea rsi, [src]',10,'    mov edx, 34',10,'    lea rcx, [src]',10,'    mov r8d, 34',10,'    xor eax, eax',10,'    call printf wrt ..plt',10,'    xor eax, eax',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,0
    src db "'default rel',10,'global main',10,'extern printf',10,10,'section .data',10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'; outside comment',10,'main:',10,'    ; inside comment',10,'    lea rdi, [fmt]',10,'    lea rsi, [src]',10,'    mov edx, 34',10,'    lea rcx, [src]',10,'    mov r8d, 34',10,'    xor eax, eax',10,'    call printf wrt ..plt',10,'    xor eax, eax',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10",0

section .text
; outside comment
main:
	; Alignement de la stack (elle doit etre alignée sur 16 bits, l'appel d'une fonction comme printf en pousse 8 pour stocker la valeur de retour, 8+8=16)
	sub rsp, 8
	; On prépare les arguments pour fprintf
    lea rdi, [fmt]
    lea rsi, [src]
    mov edx, 34
    lea rcx, [src]
    mov r8d, 34
    xor eax, eax ; On met eax à 0 pour indiquer à printf qu'on a fini de charger les arguments dans les registres.
	; C'est une convention d'appel pour les fonctions variadiques comme printf.
    call printf wrt ..plt
	add rsp, 8	; Rétablit la stack d'origine
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
