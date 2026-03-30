default rel
global main
extern fopen
extern fprintf
extern fclose
extern snprintf
extern system

section .data
    ; i est un entier de 32 bits (dword) initialisé à 5. Il représente le nombre de générations de fichiers Sully à créer.
    ; L'intérêt d'utiliser un dword (dd) et non un simple byte est que les fonctions de la libc attendent 
    ; des int (32 bits) comme argument pour les entiers, ce qui permet d'éviter des problèmes de conversion.
    i dd 5

    mode db 'w',0
    fnamefmt db 'Sully_%d.s',0
    cmdfmt db 'nasm -felf64 %s -o Sully_%d.o && gcc Sully_%d.o -o Sully_%d',0
    runfmt db './Sully_%d',0
    fmt db 'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern system',10,10,'section .data',10,'    i dd %d',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,"%%ifidn __?FILE?__, 'Sully.s'",10,'%%else',10,'    dec dword [i]',10,'%%endif',10,'    mov eax, [i]',10,'    test eax, eax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    sub rsp, 8',10,'    push 96',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, [i]',10,'    lea rcx, [src]',10,'    mov r8d, 96',10,'    lea r9, [src]',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 16',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, [i]',10,'    mov r9d, [i]',10,'    sub rsp, 16',10,'    mov eax, [i]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jnz .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,0
    src db `'default rel',10,'global main',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,'extern snprintf',10,'extern system',10,10,'section .data',10,'    i dd %d',10,"    mode db 'w',0",10,"    fnamefmt db 'Sully_%%d.s',0",10,"    cmdfmt db 'nasm -felf64 %%s -o Sully_%%d.o && gcc Sully_%%d.o -o Sully_%%d',0",10,"    runfmt db './Sully_%%d',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,10,'section .text',10,'main:',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 368',10,"%%ifidn __?FILE?__, 'Sully.s'",10,'%%else',10,'    dec dword [i]',10,'%%endif',10,'    mov eax, [i]',10,'    test eax, eax',10,'    js .done',10,'    lea rdi, [rbp-80]',10,'    mov esi, 64',10,'    lea rdx, [fnamefmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-80]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz .fail',10,'    mov [rbp-8], rax',10,'    sub rsp, 8',10,'    push 96',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    mov edx, [i]',10,'    lea rcx, [src]',10,'    mov r8d, 96',10,'    lea r9, [src]',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    add rsp, 16',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [cmdfmt]',10,'    lea rcx, [rbp-80]',10,'    mov r8d, [i]',10,'    mov r9d, [i]',10,'    sub rsp, 16',10,'    mov eax, [i]',10,'    mov [rsp], rax',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    add rsp, 16',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'    test eax, eax',10,'    jnz .fail',10,'    lea rdi, [rbp-336]',10,'    mov esi, 256',10,'    lea rdx, [runfmt]',10,'    mov ecx, [i]',10,'    xor eax, eax',10,'    call snprintf wrt ..plt',10,'    lea rdi, [rbp-336]',10,'    call system wrt ..plt',10,'.done:',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'.fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,10,'section .note.GNU-stack noalloc noexec nowrite progbits',10`,0

section .text
main:
    ; Prologue
    push rbp
    mov rbp, rsp
    sub rsp, 368 ; Alloue 368 octets de mémoire sur la pile.
                 ; 48 (variables locales) + 64 (buffer du nom de fichier) + 256 (buffer pour les commandes) = 368.

; Comme en C, NASM permet d'utiliser des directives de préprocesseur pour inclure ou exclure du code de façon conditionnelle.
; ifidn (if identical) compare la string 'Sully.s' avec la macro prédéfinie __?FILE?__ qui contient le nom du fichier source en cours de compilation.
; Si les deux sont identiques, le code entre ifidn et else est inclus, sinon c'est le code entre else et endif qui est inclus.
; Donc si __?FILE?__ = 'Sully.s', on ne fait rien et i reste à 5, sinon on décrémente i de 1.
%ifidn __?FILE?__, 'Sully.s'
%else
    dec dword [i]
%endif

    ; Charge la valeur de i dans rax et teste si elle est négative (js = jump if sign). 
    ; Si c'est le cas on saute à .done pour terminer le programme.
    mov eax, [i]
    test eax, eax
    js .done

    ; SNPRINTF
    ; Construit le nom du fichier à créer 'Sully_%d.s' et le stocke dans un buffer.
    lea rdi, [rbp-80] ; rdi pointe vers le buffer de 64 octets alloué sur la pile pour stocker le nom du fichier.
    mov esi, 64 ; esi contient la taille du buffer (64 octets).
    lea rdx, [fnamefmt]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

    ; FOPEN
    ; Crée et ouvre le fichier dont le nom a été construit précédemment.
    lea rdi, [rbp-80]
    lea rsi, [mode]
    call fopen wrt ..plt
    test rax, rax
    jz .fail
    mov [rbp-8], rax ; En cas de réussite, sauvegarde le pointeur du fichier ouvert dans la stack frame à l'adresse [rbp-8].

    ; FPRINTF
    ; Ecrit le contenu de fmt dans le fichier ouvert.
    ; Puisqu'il y a plus que 6 arguments à passer à fprintf, on doit utiliser la stack pour les arguments supplémentaires (ici, le 7ème argument qui est 96).
    sub rsp, 8 ; Puisque la pile doit être alignée sur 16 bytes, on doit réserver 8 octets avant de push.
    push 96 ; Push le 7eme argument de fprintf (96) sur la stack dans 8 octets supplémentaires (implicite).
    mov rdi, [rbp-8] ; Charge le pointeur du fichier dans rdi, le premier argument de fprintf.
    lea rsi, [fmt]
    mov edx, [i]
    lea rcx, [src]
    mov r8d, 96
    lea r9, [src]
    xor eax, eax
    call fprintf wrt ..plt
    add rsp, 16 ; Libère les 16 octets réservés précédemment (8 pour l'alignement + 8 pour le push).

    ; FCLOSE
    mov rdi, [rbp-8]
    call fclose wrt ..plt

    ; SNPRINTF
    ; Construit la commande pour assembler et linker le fichier créé précédemment, et la stocke dans un buffer.
    lea rdi, [rbp-336] ; rdi pointe vers le buffer de 256 octets alloué sur la pile pour stocker la commande.
    mov esi, 256	; esi contient la taille du buffer (256 octets).
    lea rdx, [cmdfmt]
    lea rcx, [rbp-80]
    mov r8d, [i]
    mov r9d, [i]
    sub rsp, 16	; Réserver 16 octets sur la pile pour les arguments supplémentaires (ici, le 7ème argument qui est i).
    mov eax, [i] ; Charge la valeur de i dans rax avant de l'envoyer sur la stack.
    mov [rsp], rax ; Place la valeur de i dans l'espace réservé sur la stack pour le 7ème argument de snprintf.
    xor eax, eax
    call snprintf wrt ..plt
    add rsp, 16 ; Libère les 16 octets réservés précédemment sur la stack.

    ; SYSTEM
    ; Exécute la commande construite précédemment pour assembler et linker le fichier créé.
    lea rdi, [rbp-336]
    call system wrt ..plt
    test eax, eax
    jnz .fail ; Si la commande a échoué (retourne une valeur non nulle, jnz = jump if not zero), 
              ; on saute à .fail pour terminer le programme avec une erreur.

    ; SNPRINTF
    ; Construit la commande pour exécuter le fichier créé précédemment, et la stocke dans un buffer.
    lea rdi, [rbp-336]
    mov esi, 256
    lea rdx, [runfmt]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

    ; SYSTEM
    ; Exécute la commande construite précédemment pour exécuter le fichier créé.
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
