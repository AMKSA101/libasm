#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

size_t  ft_strlen(const char *string);
size_t  ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);

int main(void) {
    const char *s1 = "aad";
    ssize_t result = 0;

    errno = 0;
    result = ft_write(-1, s1, 3);
    printf("ft_write returned: %zd\n", result);
    printf("errno: %d\n", errno);
    errno = 0;
    result = write(-1, s1, 3);
    printf("\nwrite returned: %zd\n", result);
    printf("errno: %d\n", errno);
    return 0;
}