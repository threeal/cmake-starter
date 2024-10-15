<!-- TODO: Replace the content of this file with the new project description. -->

# CMake Starter

A minimalistic template to start a new [CMake](https://cmake.org/) project.

This template provides a minimal sample CMake project that supports installation and testing. The project mainly consists of a CMake module that provides functions for use by other CMake projects.

In this template, the sample project is named `MyProject`, which includes a sample `MyProject.cmake` module. The module contains a sample `git_clone` function that can be used to clone a [Git](https://git-scm.com/) repository to a specific directory.

## Key Features

- Provides a minimalistic CMake project with installation and testing support.
- Tests CMake variables and functions using [Assertion.cmake](https://github.com/threeal/assertion-cmake/tree/v1.0.0).
- Preconfigured [Dependabot](https://docs.github.com/en/code-security/dependabot) and [GitHub Actions](https://github.com/features/actions) workflows.

## Usage Guide

The following guide shows how to use this template to start a new CMake project, from creation to release.

### Create a New Project

Follow [this link](https://github.com/new?template_name=cmake-starter&template_owner=threeal) to create a new project using this template. It will create a new repository based on this template. Refer to [this documentation](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) for more information about creating a new repository from a template in GitHub.

Alternatively, you can also clone this repository locally to start using this template.

### Choose a License

By default, this template is [unlicensed](https://unlicense.org/). Before modifying this template, it is suggested to replace the [`LICENSE`](./LICENSE) file with the license that will be used by the new project. Refer to [this documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) for more information about licensing a repository.

Alternatively, you can also remove the `LICENSE` file or leave it as is to mark the new project as unlicensed.

### Fill in Information

Do the following steps to replace all the sample information from the template with the new project information:
- Replace the content of this `README.md` file with the description of the new project. Refer to [this documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes) for more information about adding READMEs to a project.
- Rename the main module file ([`cmake/MyProject.cmake`](./cmake/MyProject.cmake)) to match the correct project name.
- Modify the test files ([`test/test_git_clone.cmake`](./test/test_git_clone.cmake)) to include the correct main module file.
- Modify the [`CMakeLists.txt`](./CMakeLists.txt) file as follows:
  - Replace the project name, version, description, and homepage URL.
  - Rename the options to be prefixed with the correct project name.
  - Modify to include the correct main module file.
  - Rename the package config file to be prefixed with the correct project name and modify it to include the correct main module file.
  - Rename the package config version file to be prefixed with the correct project name.
  - Modify to install the correct files to the correct destination.
- Modify the [`CMakePresets.json`](./CMakePresets.json) file as follows:
  - Rename the options to be prefixed with the correct project name.
- Modify workflow files as follows:
  - Use the correct project name in the [`build.yaml`](./.github/workflows/build.yaml) workflow file.

> Note: You can also search for the `TODO` comments for a list of information that needs to be replaced.

### Developing Modules

Modify the contents of the main module file ([`cmake/MyProject.cmake`](./cmake/MyProject.cmake)) with variables or functions provided by the new CMake project. If you are new to CMake, refer to [this documentation](https://cmake.org/cmake/help/v3.21/index.html) for more information about CMake.

Additional module files can be added under the [`cmake`](./cmake) directory. Just ensure the new module files are included in the build and install lists in the [`CMakeLists.txt`](./CMakeLists.txt) file.

After writing the module files, you can build the project using the following command:

```sh
cmake --preset default
```

### Testing Modules

Rename and modify the sample test file ([`test/test_git_clone.cmake`](./test/test_git_clone.cmake)) to test the variables and functions provided by the module files. The sample test file uses the [Assertion.cmake](https://github.com/threeal/assertion-cmake/tree/v1.0.0) module for testing CMake projects. Refer to [this documentation](https://github.com/threeal/assertion-cmake/tree/v1.0.0#assertion-example) for more information about testing CMake projects using Assertion.cmake.

More test files can also be added under the [`test`](./test) directory. Just make sure to add the new test files to the test list in the [`CMakeLists.txt`](./CMakeLists.txt) file.

After writing the test files, you can test the project using the following command:

```sh
cmake --preset development
ctest --preset development
```

### Cut a Release

When everything is complete, run the following command to package the project:

```sh
cpack --preset default
```

The project will be packaged into the `build/*.tar.gz` file, which can be included in the release files. Before releasing, ensure that this project is at the correct version and has been pushed to the upstream repository. Refer to [this documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) for more information about releasing a project.
