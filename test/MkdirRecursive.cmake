cmake_minimum_required(VERSION 3.5)

find_package(MyMkdir REQUIRED PATHS ${CMAKE_CURRENT_LIST_DIR}/../cmake)
include(Assertion.cmake)

file(REMOVE_RECURSE parent)

mkdir_recursive(parent/child)
assert(EXISTS parent/child)
