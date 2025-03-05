# add test
add_executable(test_matrix_ops test_matrix_ops.f90)
target_link_libraries(test_matrix_ops PRIVATE matrix_ops)
target_include_directories(test_matrix_ops PRIVATE ${CMAKE_SOURCE_DIR}/src/include)