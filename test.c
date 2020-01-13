/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arezouk <arezouk@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/17 15:41:31 by arezouk           #+#    #+#             */
/*   Updated: 2019/12/18 21:57:28 by arezouk          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <stdio.h>
#include <stdbool.h>

void        processInput(GLFWwindow *window);
void        framebuffer_size_callback(GLFWwindow *window, int width, int height);

int main()
{
    GLFWwindow *window;
   
    glfwInit();
    window = glfwCreateWindow(800, 600, "test", NULL, NULL);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    if (window == NULL)
    {
        printf("Failed to create gflw window");
        glfwTerminate();
       return (0);
    }

    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    while (!glfwWindowShouldClose(window))
    {
        glClearColor(0.5, 0.1, 0.8, 0);
        glClear(GL_COLOR_BUFFER_BIT);
        processInput(window);

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
    glfwTerminate();
    return 0;
}

void        framebuffer_size_callback(GLFWwindow *window, int width, int height)
{
    glViewport(0, 0, 800, 600);
}

void        processInput(GLFWwindow *window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

// int main()
// {
//     GLFWwindow *window;

//     glfwInit();
//     window = glfwCreateWindow(800, 600, "test", NULL, NULL);
//     glViewport(0, 0, 640, 480);
//     while(!glfwWindowShouldClose(window))
//     {
//         glfwSwapBuffers(window);
//         glfwPollEvents();    
//     }
//     glfwTerminate();
//     return (0);
// }