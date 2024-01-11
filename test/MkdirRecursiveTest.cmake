# Matches everything if not defined
if(NOT TEST_MATCHES)
  set(TEST_MATCHES ".*")
endif()

if("Create directory recursively" MATCHES ${TEST_MATCHES})
  if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/parent)
    message(STATUS "Removing test directory")
    file(REMOVE_RECURSE ${CMAKE_CURRENT_BINARY_DIR}/parent)
  endif()

  include(MkdirRecursive)

  message(STATUS "Creating test directory recursively")
  mkdir_recursive(${CMAKE_CURRENT_BINARY_DIR}/parent/child)

  if(NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/parent/child)
    message(FATAL_ERROR "Directory `${CMAKE_CURRENT_BINARY_DIR}/parent/child` should exist!")
  endif()

  message(STATUS "Removing test directory")
  file(REMOVE_RECURSE ${CMAKE_CURRENT_BINARY_DIR}/parent)
endif()
