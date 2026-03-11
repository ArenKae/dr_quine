default rel
; Dit au compilateur nasm que les adresses sont relatives à l'instruction.
; Par défaut, il utilise des adresses absolues, qui ne sont pas connues au
; moment de la compilation. Sans cela, le code devient position dépendant,
; c'est à dire qu'il ne peut être chargé qu'à une adresse précise.
; En x86-64, le processeur possède un registre spécial appelé RIP (Instruction Pointer)
; qui contient l'adresse de l'instruction en cours d'exécution.
; La directive "default rel" indique à nasm d'utiliser des adresses relatives à RIP 
; pour les instructions de saut et les accès aux données, ce qui rend le code position indépendant.

extern printf	; Déclare que la fonction printf est définie dans une bibliothèque externe (la libc).
global main
; Permet d'exporter le symbole 'main' et de le rendre visible pour le linker 
; (i.e. un éditeur de lien comme gcc, qui lie les fichiers .o pour former un exécutable).
; Puisque l'exécution commence forcément par la fonction main, il est nécessaire de la déclarer 
; comme globale pour que le linker puisse trouver le point d'entrée du programme.

section .rodata	; Section read-only data (constantes, mémoire non modifiable).
msg: db "Hello, World!", 10, 0
; Déclare un symbole 'msg' qui contient la chaîne de caractères "Hello, World!" 
; suivie d'un saut de ligne (10 en ASCII) et d'un caractère nul (0) pour marquer la fin de la chaîne.
; db (define byte) est utilisé pour définir des données de type octet, 
; mais on peut aussi utiliser dw (define word) pour des données de 2 octets, dd (define double word) pour des données de 4 octets, etc.


section .text	; Section de code exécutable.
main:			; Label (étiquette) qui marque le début de la fonction main.

lea rdi, [msg]
; lea = Load Effective Address, 
; Charge l'adresse de la chaîne 'msg' dans le registre rdi, 
; qui est utilisé pour passer le premier argument à une fonction selon la convention d'appel x86-64
; Sans la directive "default rel", nasm aurait généré une adresse absolue pour 'msg'.
; Il aurait donc fallu écrire "lea rdi, [rel msg]" pour obtenir une adresse relative à RIP.

xor eax, eax
; Met le registre eax à zéro en effectuant un XOR (OU exclusif) de lui-même avec lui-même.
; Cela est nécessaire pour indiquer à printf que nous n'avons pas d'arguments supplémentaires à passer.
; On aurait aussi pu utiliser "mov eax, 0" pour obtenir le même résultat, mais "xor eax, eax" est plus efficace.
; Il faut aussi savoir qu'en architecture 64 bits, le fait d'écrire dans les 32 bits inférieurs d'un registre (comme eax) 
; met automatiquement les 32 bits supérieurs à zéro. On se retrouve donc avec rax = 0 dans les deux cas.

call printf		; Appelle la fonction printf, qui affiche la chaîne de caractères pointée par rdi (c'est à dire 'msg') à l'écran.
xor eax, eax	; Met à nouveau le registre eax à zéro pour indiquer que la fonction main se termine normalement (code de retour 0).
ret				; Retourne de la fonction main vers l'instruction qui l'a appelée (l'OS), ce qui termine l'exécution du programme.
