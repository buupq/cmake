# cmake minimum requirement
cmake_minimum_required(VERSION 3.10)

# project name
project(matrix_multiplication)

# enable fortran
enable_language(Fortran)

# find blas
find_package(BLAS REQUIRED)

# # add library
# add_library(matrix_ops STATIC matrix_ops.f90)
# target_include_directories(matrix_ops PUBLIC ${CMAKE_SOURCE_DIR}/include)
# target_link_libraries(matrix_ops PUBLIC ${BLAS_LIBRARIES})

# add subdirectory
add_subdirectory(src)

# add executable
add_executable(${PROJECT_NAME} main.f90)
target_link_libraries(${PROJECT_NAME} PRIVATE matrix_ops)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/src/include)

# Rename output
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "mm")
# set_target_properties(matrix_ops PROPERTIES
#     Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include)
