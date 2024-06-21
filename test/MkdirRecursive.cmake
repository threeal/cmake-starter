cmake_minimum_required(VERSION 3.5)

find_package(MyMkdir REQUIRED PATHS ${CMAKE_CURRENT_LIST_DIR}/../../cmake)

file(REMOVE_RECURSE parent)

mkdir_recursive(parent/child)

if(NOT EXISTS parent/child)
  message(FATAL_ERROR "expected path 'parent/child' to exist")
endif()
