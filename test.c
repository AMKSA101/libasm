#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

size_t  ft_strlen(const char *string);
size_t  ft_strcpy(char *dest, const char *src);
size_t  ft_strcmp(const char *s1, const char *s2);
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);

int main(void) {
    char buffer[10];

    errno = 0;
    ssize_t result = ft_read(0, buffer, sizeof(buffer));

    printf("ft_read returned: %zd\n", result);
    printf("errno: %d\n", errno);
    return 0;
}