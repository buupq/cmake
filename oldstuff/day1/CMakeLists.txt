cmake_minimum_required(VERSION 3.10)
project(GreetProject)

# Find Boost
find_package(Boost REQUIRED COMPONENTS optional)

# Define the library
add_library(GreetLib SHARED greet.cpp farewell.cpp)
target_include_directories(GreetLib PUBLIC ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(GreetLib PUBLIC Boost::optional)

# Define the executable
add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME} PRIVATE GreetLib)

# Optional: Rename output
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "GreetApp")