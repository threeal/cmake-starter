cmake_minimum_required(VERSION 3.21)

# TODO: Replace the project name, version, description, and homepage URL.
project(
  MyProject
  VERSION 0.0.0
  DESCRIPTION "A sample CMake project"
  HOMEPAGE_URL https://github.com/threeal/cmake-starter
  LANGUAGES NONE)

# TODO: Rename these options to be prefixed with the correct project name.
option(MY_PROJECT_ENABLE_TESTS "Enable test targets.")
option(MY_PROJECT_ENABLE_INSTALL "Enable install targets." "${PROJECT_IS_TOP_LEVEL}")

list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Prefer system packages over the find modules provided by this project.
if(NOT DEFINED CMAKE_FIND_PACKAGE_PREFER_CONFIG)
  set(CMAKE_FIND_PACKAGE_PREFER_CONFIG TRUE)
endif()

# Include the main module.
# TODO: Replace `MyProject` with the correct main module file.
include(MyProject)

# TODO: Replace `MY_PROJECT_ENABLE_TESTS` with the correct option.
if(MY_PROJECT_ENABLE_TESTS)
  enable_testing()

  find_package(Assertion 2.0.0 REQUIRED)
  list(APPEND CMAKE_SCRIPT_TEST_DEFINITIONS CMAKE_MODULE_PATH)

  add_cmake_script_test(test/test_git_clone.cmake)
endif()

# TODO: Replace `MY_PROJECT_ENABLE_INSTALL` with the correct option.
if(MY_PROJECT_ENABLE_INSTALL)
  # TODO: Rename the output file to be prefixed with the correct project name.
  # TODO: Replace `MyProject` with the correct main module file.
  file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/cmake/MyProjectConfig.cmake
    "list(PREPEND CMAKE_MODULE_PATH \${CMAKE_CURRENT_LIST_DIR})\n"
    "include(MyProject)\n")

  # TODO: Rename the output file to be prefixed with the correct project name.
  include(CMakePackageConfigHelpers)
  write_basic_package_version_file(cmake/MyProjectConfigVersion.cmake
    COMPATIBILITY SameMajorVersion ARCH_INDEPENDENT)

  # TODO: Replace the `FILES` arguments with the correct files.
  # TODO: Rename the `DESTINATION` argument to match the correct project name.
  install(
    FILES cmake/MyProject.cmake
      ${CMAKE_CURRENT_BINARY_DIR}/cmake/MyProjectConfig.cmake
      ${CMAKE_CURRENT_BINARY_DIR}/cmake/MyProjectConfigVersion.cmake
    DESTINATION lib/cmake/MyProject)

  set(CPACK_SYSTEM_NAME any)
  include(CPack)
endif()
