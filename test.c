#include <stdio.h>
#include <stddef.h>

size_t ft_strlen(const char *text);

int main(void) {
    const char *text = "Amksa";
    size_t result = ft_strlen(text);

    printf("Input: %s\n", text);
    printf("Input: %zu\n", result);
    
    return 0;
}