add_test(
  NAME "recursive directory creation"
  COMMAND "${CMAKE_COMMAND}"
    -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/MkdirRecursive.cmake)
