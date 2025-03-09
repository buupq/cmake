cmake_minimum_required(VERSION 3.10)
project(DGEMMExample LANGUAGES Fortran)

# Enable Fortran
enable_language(Fortran)

# Platform-specific messages
if(WIN32)
    message("Configuring for Windows")
elseif(UNIX)
    message("Configuring for Unix-like system: ${CMAKE_SYSTEM_NAME}")
    if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        message("Detected macOS")
    elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
        message("Detected Linux")
    endif()
else()
    message(WARNING "Unknown platform: ${CMAKE_SYSTEM_NAME}")
endif()

# Find BLAS with platform-specific hints
if(WIN32)
    # Windows might use OpenBLAS or MKL
    set(BLA_VENDOR "OpenBLAS" CACHE STRING "BLAS vendor for Windows")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    # macOS often uses Accelerate framework or OpenBLAS
    set(BLA_VENDOR "All" CACHE STRING "BLAS vendor for macOS")
endif()
find_package(BLAS REQUIRED)
if(BLAS_FOUND)
    message("BLAS libraries: ${BLAS_LIBRARIES}")
endif()

# Define the library
add_library(MatrixOps SHARED matrix_ops.f90)
target_include_directories(MatrixOps PUBLIC ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(MatrixOps PUBLIC ${BLAS_LIBRARIES})

# Define the executable
add_executable(DGEMMApp main.f90)
target_link_libraries(DGEMMApp PRIVATE MatrixOps)

# Platform-specific compile options
if(UNIX)
    target_compile_options(MatrixOps PRIVATE -Wall)
elseif(WIN32)
    # Windows with gfortran might need different flags
    target_compile_options(MatrixOps PRIVATE -Wall)
endif()

# Rename output
set_target_properties(DGEMMApp PROPERTIES OUTPUT_NAME "DGEMMTest")