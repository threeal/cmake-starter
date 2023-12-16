cmake_minimum_required(VERSION 3.12)

project(
    MyMkdir
    VERSION 0.0.0
    DESCRIPTION "A starter CMake package for creating directories recursively"
    HOMEPAGE_URL https://github.com/threeal/cmake-starter)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(MkdirRecursive)
