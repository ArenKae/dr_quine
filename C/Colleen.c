#include <stdio.h>

/*
    outside comment
*/
int output(void)
{
    const char *s = "#include <stdio.h>%c%c/*%c    outside comment%c*/%cint output(void)%c{%c    const char *s = %c%s%c;%c    if (printf(s,10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10) < 0)%c        return 1;%c    return ferror(stdout);%c}%c%cint main(void)%c{%c/*%c    inside comment%c*/%c    return output();%c}%c";
    if (printf(s,10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10) < 0)
        return 1;
    return ferror(stdout);
}

int main(void)
{
/*
    inside comment
*/
    return output();
}
