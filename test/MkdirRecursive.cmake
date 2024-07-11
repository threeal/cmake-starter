find_package(MyMkdir REQUIRED PATHS ${CMAKE_CURRENT_LIST_DIR}/../cmake)

file(REMOVE_RECURSE parent)

mkdir_recursive(parent/child)
assert(EXISTS parent/child)
