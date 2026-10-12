#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>

char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strdup(const char *source);
size_t ft_strlen(const char *string);
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);
int ft_atoi_base(char *str, char *base);