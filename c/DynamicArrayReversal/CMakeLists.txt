cmake_minimum_required(VERSION 3.16)
project(DynamicArrayReversal VERSION 0.1.0 LANGUAGES C)

# Add source files
add_executable(ProductionCode src/main.c src/functions.c)
target_include_directories(ProductionCode PRIVATE src)

# Add test files when compiling tests
add_executable(Tests test/tests.c test/unity.c src/functions.c)
target_include_directories(Tests PRIVATE src test)

# Link libraries if needed (e.g., math library)
# target_link_libraries(Tests m)