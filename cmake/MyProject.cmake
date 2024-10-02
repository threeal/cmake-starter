# TODO: Rename this module to match the correct project name.

# Clone a Git repository to a specified directory.
#
# git_clone(<url> <dir>)
#
# This function clones a Git repository from the `<url>` and saves it to the
# `<dir>` directory. It outputs a fatal error message if the operation fails.
function(git_clone URL DIR)
  execute_process(
    COMMAND git clone "${URL}" "${DIR}"
    ERROR_VARIABLE ERR
    RESULT_VARIABLE RES)
  if(NOT RES EQUAL 0)
    message(FATAL_ERROR "Failed to clone '${URL}': ${ERR}")
  endif()
endfunction()
