cmake_minimum_required(VERSION 3.5)

include(MkdirRecursive)

function("Create directory recursively")
  file(REMOVE_RECURSE parent)

  mkdir_recursive(parent/child)

  if(NOT EXISTS parent/child)
    message(FATAL_ERROR "expected path 'parent/child' to exist")
  endif()
endfunction()

# Add more test cases here.
function("Test something")
  # Do something.
endfunction()

cmake_language(CALL "${TEST_COMMAND}")
