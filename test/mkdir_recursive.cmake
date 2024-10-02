find_package(MyProject REQUIRED PATHS ${CMAKE_CURRENT_LIST_DIR}/../cmake)

section("it should create a directory recursively")
  file(REMOVE_RECURSE parent)

  mkdir_recursive(parent/child)

  assert(EXISTS parent/child)
  assert(IS_DIRECTORY parent/child)
endsection()
