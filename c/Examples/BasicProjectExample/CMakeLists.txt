cmake_minimum_required(VERSION 3.16)
project(HelloWorld VERSION 0.1.0 LANGUAGES C)

set(CMAKE_C_STANDARD 11)  # Replace '11' with the desired version
set(CMAKE_C_STANDARD_REQUIRED ON)

# Add your source files
add_executable(HelloWorld main.c)

# Export compile_commands.json for clangd integration
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)