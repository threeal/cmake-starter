cmake_minimum_required(VERSION 3.21)

project(
  MyMkdir
  VERSION 0.0.0
  DESCRIPTION "A starter CMake package for creating directories recursively"
  HOMEPAGE_URL https://github.com/threeal/cmake-starter
  LANGUAGES NONE)

option(MY_MKDIR_ENABLE_TESTS "Enable test targets.")
option(
  MY_MKDIR_ENABLE_INSTALL "Enable install targets." ${PROJECT_IS_TOP_LEVEL})

include(cmake/MkdirRecursive.cmake)

if(MY_MKDIR_ENABLE_TESTS)
  enable_testing()

  file(
    DOWNLOAD https://threeal.github.io/assertion-cmake/v0.3.0
      ${CMAKE_BINARY_DIR}/Assertion.cmake
    EXPECTED_MD5 851f49c10934d715df5d0b59c8b8c72a)

  add_test(
    NAME "recursive directory creation"
    COMMAND "${CMAKE_COMMAND}"
      -P ${CMAKE_CURRENT_SOURCE_DIR}/test/MkdirRecursive.cmake)
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
