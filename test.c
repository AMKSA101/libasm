#include "libasm.h"

int main(void) {
    char *buffer;

    buffer = ft_strdup("amksa");
    buffer[0] = 'A';
    printf("ft_strdup output: %s\t %p\n", buffer, buffer);
    free(buffer);
    buffer = strdup("amksa");
    printf("strdup output: %s\t %p\n", buffer, buffer);
    free(buffer);
    return 0;
}