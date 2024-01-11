function(add_cmake_test FILE)
  foreach(NAME ${ARGN})
    add_test(
      NAME ${NAME}
      COMMAND ${CMAKE_COMMAND}
        -B ${CMAKE_CURRENT_BINARY_DIR}
        -D CMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}
        -D TEST_MATCHES="^${NAME}$"
        -P ${CMAKE_CURRENT_SOURCE_DIR}/${FILE}
    )
  endforeach()
endfunction()

add_cmake_test(
  MkdirRecursiveTest.cmake
  "Create directory recursively"
)
