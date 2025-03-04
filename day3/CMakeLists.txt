# cmake minimum requirement
cmake_minimum_required(VERSION 3.10)

# project name
project(matrix_multiplication)

# enable fortran
enable_language(Fortran)

# find blas
find_package(BLAS REQUIRED)

# add subdirectory
add_subdirectory(src)

# add executable
add_executable(${PROJECT_NAME} main.f90)
target_link_libraries(${PROJECT_NAME} PRIVATE matrix_ops)

# Rename output
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "mm")

