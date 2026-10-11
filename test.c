#include <stdio.h>
#include <stddef.h>
#include <string.h>

size_t  ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);

int main(void) {
    const char *s1 = "aad";
    const char s2[22] = "ab";

    printf("strcmp output: %d\n", strcmp(s1, s2));
    printf("ft_strcmp output: %d\n", ft_strcmp(s1, s2));
    
    return 0;
}