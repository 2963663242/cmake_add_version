cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

project(test)




add_subdirectory(lib)

file(GLOB SOURCEFILE "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")

add_executable(main ${SOURCEFILE})

target_include_directories(main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib)

target_link_libraries(main test)