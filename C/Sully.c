#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
    int i = 5;
    char fname[64];
    char cmd[256];
    char *s = "#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%c%cint main(void)%c{%c    int i = %d;%c    char fname[64];%c    char cmd[256];%c    char *s = %c%s%c;%c    if (strstr(__FILE__, %cSully_%c) != NULL) i--;%c    if (i < 0) return 0;%c    snprintf(fname, sizeof fname, %cSully_%%d.c%c, i);%c    FILE *f = fopen(fname, %cw%c);%c    if (!f) return 1;%c    fprintf(f, s, 10, 10, 10, 10, 10, 10, i, 10, 10, 10, 34, s, 34, 10, 34, 34, 10, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 34, 34, 10, 10, 10, 10);%c    fclose(f);%c    snprintf(cmd, sizeof cmd, %cclang -Wall -Wextra -Werror %%s -o Sully_%%d%c, fname, i);%c    if (system(cmd) != 0) return 1;%c    snprintf(cmd, sizeof cmd, %c./Sully_%%d%c, i);%c    system(cmd);%c    return 0;%c}%c";
    if (strstr(__FILE__, "Sully_") != NULL) i--;
    if (i < 0) return 0;
    snprintf(fname, sizeof fname, "Sully_%d.c", i);
    FILE *f = fopen(fname, "w");
    if (!f) return 1;
    fprintf(f, s, 10, 10, 10, 10, 10, 10, i, 10, 10, 10, 34, s, 34, 10, 34, 34, 10, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 34, 34, 10, 10, 10, 10);
    fclose(f);
    snprintf(cmd, sizeof cmd, "clang -Wall -Wextra -Werror %s -o Sully_%d", fname, i);
    if (system(cmd) != 0) return 1;
    snprintf(cmd, sizeof cmd, "./Sully_%d", i);
    system(cmd);
    return 0;
}
