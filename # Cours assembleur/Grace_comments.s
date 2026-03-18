default rel
extern fopen
extern fprintf
extern fclose

; Début de macro, 0 est pour le nombre d'arguments
%macro DATA 0
section .data
; Certaines chaînes contiennent des guillements simples, on utilise donc les guillemets doubles pour les délimiter et éviter d'avoir à escape.
    fname db 'Grace_kid.s',0	; Le nom du fichier à créer, suivi d'un octet nul pour marquer la fin de la chaîne.
    mode db 'w',0	; Le mode d'ouverture du fichier, 'w' pour write.
    fmt db 'default rel',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,10,'%%macro DATA 0',10,'section .data',10,"    fname db 'Grace_kid.s',0",10,"    mode db 'w',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,'%%endmacro',10,10,'%%macro CODE 0',10,'section .text',10,'global main',10,'main:',10,'    ; Grace comment',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 16',10,'    lea rdi, [fname]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz %%%%fail',10,'    mov [rbp-8], rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    lea rdx, [src]',10,'    mov ecx, 96',10,'    lea r8, [src]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'%%%%fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,'%%endmacro',10,10,'%%macro RUN 0',10,'DATA',10,'CODE',10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,'%%endmacro',10,10,'RUN',10,0
    ; On délimite src avec des backquotes pour pouvoir y inclure des guillemets simples et doubles sans avoir à les échapper.
	src db `'default rel',10,'extern fopen',10,'extern fprintf',10,'extern fclose',10,10,'%%macro DATA 0',10,'section .data',10,"    fname db 'Grace_kid.s',0",10,"    mode db 'w',0",10,'    fmt db %s,0',10,'    src db %c%s%c,0',10,'%%endmacro',10,10,'%%macro CODE 0',10,'section .text',10,'global main',10,'main:',10,'    ; Grace comment',10,'    push rbp',10,'    mov rbp, rsp',10,'    sub rsp, 16',10,'    lea rdi, [fname]',10,'    lea rsi, [mode]',10,'    call fopen wrt ..plt',10,'    test rax, rax',10,'    jz %%%%fail',10,'    mov [rbp-8], rax',10,'    mov rdi, [rbp-8]',10,'    lea rsi, [fmt]',10,'    lea rdx, [src]',10,'    mov ecx, 96',10,'    lea r8, [src]',10,'    mov r9d, 96',10,'    xor eax, eax',10,'    call fprintf wrt ..plt',10,'    mov rdi, [rbp-8]',10,'    call fclose wrt ..plt',10,'    xor eax, eax',10,'    leave',10,'    ret',10,'%%%%fail:',10,'    mov eax, 1',10,'    leave',10,'    ret',10,'%%endmacro',10,10,'%%macro RUN 0',10,'DATA',10,'CODE',10,'section .note.GNU-stack noalloc noexec nowrite progbits',10,'%%endmacro',10,10,'RUN',10`,0
%endmacro

%macro CODE 0
section .text
global main
main:
	;
    ; Prologue de la fonction, qui prépare la stack frame.
	; Une stack frame est la portion de la pile associée à une fonction pendant son exécution,
	; afin de stocker l'adresse de retour, des variables locales et les paramètres de la fonction.
	;
    push rbp
	; Sauvegarde l'ancien rbp (base pointer) hérité de la fonction appelante en le poussant au sommet de la stack. 
	; rbp est un registre "preserved" : si la fonction le modifie, elle doit le restaurer avant de retourner.
	; Après cette instruction, rsp (stack pointer) pointe vers l'emplacement mémoire où la valeur de l’ancien rbp a été stockée.
	; Mais rsp est souvent modifié par divers instructions, on ne peut donc pas compter dessus comme repère stable pour accéder à la stack frame.
	; La prochaine étape consiste donc à copier la valeur de rsp dans rbp pour établir une nouvelle stack frame pour la fonction courante.
    mov rbp, rsp
	; rsp est un registre qui pointe sur le sommet de la stack.
	; On copie rsp dans rbp pour faire de rbp un repère fixe pour la stack frame courante.
	; A ce stade, la valeur initiale de rbp est stockée sur la pile, et rbp contient l'adresse de cet emplacement mémoire.
	; Cet emplacement devient alors le début de la nouvelle stack frame, et on peut y accéder via des offsets à partir de rbp (ex: [rbp-8] pour accéder à une variable locale).
	sub rsp, 16
	; La stack grandit vers les adresses les plus basses : en poussant des données sur la stack, rsp diminue.
	; On soustrait donc 16 à rsp pour réserver 16 bytes d'espace pour les variables locales de la fonction.
	; Les conventions d'appel  x86-64 stipulent que la stack doit être alignée sur 16 bytes avant d'appeler une fonction.

	; FOPEN
    lea rdi, [fname] ; rdi doit contenir le premier argument de fopen, qui est le nom du fichier à ouvrir.
    lea rsi, [mode]	; rsi doit contenir le deuxième argument de fopen, qui est le mode d'ouverture du fichier ('w' pour write).
    call fopen wrt ..plt
	; rax contient le résultat de fopen : un pointeur de fichier valide si l'ouverture a réussi, ou NULL si elle a échoué.
	; On test si rax vaut 0 en faisant un AND binaire de rax avec lui-même : si rax est 0, le résultat sera 0, sinon il sera non nul.
    test rax, rax
	; (jz = jump if zero) Si rax est 0, on saute à l'étiquette fail pour gérer l'erreur.
	; %% est utilisé pour définir une étiquette locale à la macro. En dehors d'une macro, on écrirait simplement '.fail'
	; Une étiquette locale n'est pas un symbole global ou une routine distincte, elle est uniquement visible à l'intérieur 
	; de la précédente étiquette à laquelle elle est associée (ici, main). On les utilise typiquement pour les sauts 
	; conditionnels ou les boucles à l'intérieur d'une fonction.
    jz %%fail
	; Si rax n'est pas 0, il contient un pointeur de fichier valide. 
	; On le sauvegarde dans la stack frame à l'adressse [rbp-8] pour pouvoir y accéder plus tard.
    mov [rbp-8], rax

	; FPRINTF
	; On prépare les arguments pour fprintf
    mov rdi, [rbp-8] ; rdi = FILE* que l'on vient de stocker dans la stack frame
    lea rsi, [fmt]
    lea rdx, [src]
    mov ecx, 96 ; 96 = ASCII pour la backquote (`), utilisée pour délimiter src
    lea r8, [src]
    mov r9d, 96
    xor eax, eax
    call fprintf wrt ..plt

	; FCLOSE
    mov rdi, [rbp-8] ; rdi = FILE* que l'on avait stocké dans la stack frame
    call fclose wrt ..plt
    xor eax, eax ; Valeur de retour de main = 0 (succès)
    leave ; Épiloque de la fonction, qui nettoie la stack frame avant de retourner.
    ret
%%fail: ; Gestion d'erreur si fopen échoue
    mov eax, 1 ; Valeur de retour de main = 1 (échec)
    leave
    ret
%endmacro

%macro RUN 0
DATA
CODE
section .note.GNU-stack noalloc noexec nowrite progbits
%endmacro

RUN
