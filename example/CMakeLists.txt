cmake_minimum_required(VERSION 3.13.4)
project(AnotherFanucExample LANGUAGES C CXX VERSION 0.1)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_library(config SHARED IMPORTED ${CMAKE_SOURCE_DIR}/extern/libconfig/build/out/Debug/libconfig.dll)
set_target_properties(config PROPERTIES LINKER_LANGUAGE C)
target_include_directories(config INTERFACE ${CMAKE_SOURCE_DIR}/extern/libconfig/lib/)

add_subdirectory(src)

enable_testing()
include(GoogleTest)

add_subdirectory(test)

set_target_properties(fanuc_example
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin"
)

install (TARGETS fanuc_example
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION bin
  ARCHIVE DESTINATION lib
  INCLUDES DESTINATION include
  DESTINATION /usr/local/bin)
