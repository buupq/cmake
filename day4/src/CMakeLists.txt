# add library
add_library(matrix_ops STATIC matrix_ops.f90)
target_include_directories(matrix_ops PUBLIC ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(matrix_ops PUBLIC ${BLAS_LIBRARIES})

# copy module to include directory
set_target_properties(matrix_ops PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include)
