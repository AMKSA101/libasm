#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>

size_t  ft_strlen(const char *string);
size_t  ft_strcpy(char *dest, const char *src);
size_t  ft_strcmp(const char *s1, const char *s2);
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);
char    *ft_strdup(const char *source);

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