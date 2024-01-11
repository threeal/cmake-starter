list(APPEND ARGS -B ${CMAKE_CURRENT_BINARY_DIR} -D CMAKE_MODULE_PATH=${CMAKE_MODULE_PATH})

add_test(
  NAME "Create directory recursively"
  COMMAND cmake ${ARGS} -P ${CMAKE_CURRENT_SOURCE_DIR}/MkdirRecursiveTest.cmake
)
