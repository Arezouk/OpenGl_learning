NAME	= opengl

CC  = gcc

PWD = \"$(shell pwd)\"


SRCDIR   = .
OBJDIR   = objs
BINDIR   = .
INCLUDESDIR = .

LIBGLEWDIR = ~/.brew/Cellar/glew/2.1.0_1
LIBGLEW_INCLUDEDIR = include
LIBGLEW = $(LIBGLEWDIR)/lib/libGLEW.a
GLMDIR = ~/.brew/Cellar/glm/0.9.9.5/
GLM_INCLUDEDIR = include
LIBGLFWDIR = ~/.brew/Cellar/glfw/3.2.1
LIBGLFW_INCLUDEDIR = include
LIBGLFW = $(LIBGLFWDIR)/lib/


DONE_COLOR = \x1b[32;01m
EOC = \033[0m

SRCS_NO_PREFIX = test.c
				 
INCLUDES_NO_PREFIX = .

SOURCES = $(addprefix $(SRCDIR)/, $(SRCS_NO_PREFIX))
OBJECTS = $(addprefix $(OBJDIR)/, $(SRCS_NO_PREFIX:%.c=%.o))
INCLUDES = $(addprefix $(INCLUDESDIR)/, $(INCLUDES_NO_PREFIX))

INC = -I $(INCLUDESDIR) -I $(GLMDIR)/$(GLM_INCLUDEDIR) -I $(LIBGLFWDIR)/$(LIBGLFW_INCLUDEDIR) \
	  -I $(LIBGLEWDIR)/$(LIBGLEW_INCLUDEDIR)
	  

CFLAGS = -DPATH=$(PWD) $(INC) 
LFLAGS = -L $(LIBGLEWDIR)/lib -L $(LIBGLFWDIR)/lib  -lGLEW -lglfw  -framework OpenGL 

all:
	@make $(BINDIR)/$(NAME)

$(BINDIR)/$(NAME): $(OBJECTS)
	@$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)
	@echo "$(DONE_COLOR)$(NAME) linked with success !$(EOC)"

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(INCLUDES)
	@mkdir -p $(OBJDIR)
	$(CC) -c $< -o $@ $(CFLAGS) 

clean:
	@rm -f $(OBJECTS)
	@rm -rf $(OBJDIR)
	@echo "$(DONE_COLOR) $(BINDIR)/$(NAME) objs successfully removed !$(EOC)"

fclean: clean
	@rm -f $(BINDIR)/$(NAME)
	@echo "$(DONE_COLOR) $(BINDIR)/$(NAME) files successfully removed !$(EOC)"

re: fclean all

.PHONY: all clean fclean re