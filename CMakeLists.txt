cmake_minimum_required(VERSION 3.21)

project(
  MyMkdir
  VERSION 0.0.0
  DESCRIPTION "A starter CMake package for creating directories recursively"
  HOMEPAGE_URL https://github.com/threeal/cmake-starter
  LANGUAGES NONE)

option(MY_MKDIR_ENABLE_TESTS "Enable test targets.")
option(MY_MKDIR_ENABLE_INSTALL "Enable install targets." "${PROJECT_IS_TOP_LEVEL}")

# Prefer system packages over the find modules provided by this project.
if(NOT DEFINED CMAKE_FIND_PACKAGE_PREFER_CONFIG)
  set(CMAKE_FIND_PACKAGE_PREFER_CONFIG TRUE)
endif()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(MkdirRecursive)

if(MY_MKDIR_ENABLE_TESTS)
  enable_testing()

  find_package(Assertion 1.0.0 REQUIRED)
  assertion_add_test(test/mkdir_recursive.cmake)
endif()

if(MY_MKDIR_ENABLE_INSTALL)
  include(CMakePackageConfigHelpers)
  write_basic_package_version_file(
    MyMkdirConfigVersion.cmake COMPATIBILITY SameMajorVersion)

  install(
    FILES cmake/MkdirRecursive.cmake
      cmake/MyMkdirConfig.cmake
      ${CMAKE_CURRENT_BINARY_DIR}/MyMkdirConfigVersion.cmake
    DESTINATION lib/cmake/MyMkdir)
endif()
