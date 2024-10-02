include(${CMAKE_CURRENT_LIST_DIR}/../cmake/MyProject.cmake)

section("it should clone a Git repository")
  file(REMOVE_RECURSE repo)

  git_clone(https://github.com/threeal/cmake-starter repo)

  assert(EXISTS repo)
  assert_execute_process(git -C repo rev-parse --is-inside-work-tree)
endsection()

section("it should fail to clone an invalid Git repository")
  file(REMOVE_RECURSE repo)

  assert_fatal_error(
    CALL git_clone https://github.com repo
    MESSAGE "Failed to clone 'https://github.com'")

  assert(NOT EXISTS repo)
endsection()
