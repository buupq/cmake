# add library
add_library(matrix_ops STATIC matrix_ops.f90)
target_link_directories(matrix_ops PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(matrix_ops PUBLIC ${BLAS_LIBRARIES})

# set module output directory
set_target_properties(matrix_ops PROPERTIES Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include)   