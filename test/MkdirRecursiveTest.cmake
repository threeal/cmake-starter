# Matches everything if not defined
if(NOT TEST_MATCHES)
  set(TEST_MATCHES ".*")
endif()

if("Create directory recursively" MATCHES ${TEST_MATCHES})
  if(EXISTS parent)
    message(STATUS "Removing test directory")
    file(REMOVE_RECURSE parent)
  endif()

  include(MkdirRecursive)

  message(STATUS "Creating test directory recursively")
  mkdir_recursive(parent/child)

  if(NOT EXISTS parent/child)
    message(FATAL_ERROR "Directory `parent/child` should exist!")
  endif()

  message(STATUS "Removing test directory")
  file(REMOVE_RECURSE parent)
endif()

# Add more test cases here.
if("Test name" MATCHES ${TEST_MATCHES})
  # Do something.
endif()
