cmake_minimum_required(VERSION 3.16)
project(HelloWorldTest VERSION 0.1.0 LANGUAGES C)

set(CMAKE_C_STANDARD 11)  # Replace '11' with the desired version
set(CMAKE_C_STANDARD_REQUIRED ON)

# Add source files
add_executable(HelloWorld src/main.c src/functions.c)
target_include_directories(HelloWorld PRIVATE src)

# Add test files when compiling tests
add_executable(Tests test/test_sample.c test/unity.c src/functions.c)
target_include_directories(Tests PRIVATE src test)

# Export compile_commands.json for clangd integration
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Link libraries if needed (e.g., math library)
# target_link_libraries(Tests m)