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
    DOWNLOAD https://github.com/threeal/assertion-cmake/releases/download/v1.0.0/Assertion.cmake
      ${CMAKE_BINARY_DIR}/Assertion.cmake
    EXPECTED_MD5 1d8ec589d6cc15772581bf77eb3873ff)
  include(${CMAKE_BINARY_DIR}/Assertion.cmake)

  assertion_add_test(test/mkdir_recursive.cmake
    NAME "recursive directory creation")
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
