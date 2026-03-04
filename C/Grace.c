#include <stdio.h>

/* Grace comment */

#define S "#include <stdio.h>%c%c/* Grace comment */%c%c#define S %c%s%c%c#define F %c%s%c%c#define RUN() int main(void){FILE*fp=fopen(F,%cw%c);if(!fp)return 1;fprintf(fp,S,10,10,10,10,34,S,34,10,34,F,34,10,34,34,10,10,10);fclose(fp);return 0;}%c%cRUN()%c"
#define F "Grace_kid.c"
#define RUN() int main(void){FILE*fp=fopen(F,"w");if(!fp)return 1;fprintf(fp,S,10,10,10,10,34,S,34,10,34,F,34,10,34,34,10,10,10);fclose(fp);return 0;}

RUN()
