NAME = libasm.a
SRC_FILES = srcs/ft_read.s srcs/ft_strcmp.s srcs/ft_strcpy.s srcs/ft_strdup.s srcs/ft_strlen.s srcs/ft_write.s
OBJ_FILES = $(SRC_FILES:.s=.o)
ASSEMBLE = nasm -f elf64

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar rcs $@ $^

%.o: %.s
	$(ASSEMBLE) $< -o $@

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all