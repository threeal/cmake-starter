<!-- TODO: Replace the content of this file with the new project description. -->

# CMake Starter

The CMake Starter is a [GitHub repository template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) that provides a minimalistic boilerplate to kickstart your [CMake](https://cmake.org/) project.
This template offers a streamlined foundation, complete with predefined file structures, essential tools, and recommended settings, ensuring a swift and efficient start to your CMake development journey.

## Key Features

- Standard template for CMake projects supporting installation and testing of CMake modules.
- Automated CI with [GitHub Actions](https://github.com/features/actions) workflows for building and testing the CMake project.
- [Dependabot](https://docs.github.com/en/code-security/dependabot) integration for checking updates on GitHub Actions dependencies.

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
- Modify the package config file ([`cmake/MyProjectConfig.cmake`](./cmake/MyProjectConfig.cmake)) as follows:
  - Rename the file to match the correct project name.
  - Modify the content to include the correct main module file.
- Modify the test files ([`test/git_clone.cmake`](./test/git_clone.cmake)) to include the correct main module file.
- Modify the [`CMakeLists.txt`](./CMakeLists.txt) file as follows:
  - Replace the project name, version, description, and homepage URL.
  - Rename the options to be prefixed with the correct project name.
  - Modify to include the correct main module file.
  - Rename the package version file to be prefixed with the correct project name.
  - Modify to install the correct files to the correct destination.
- Modify workflow files as follows:
  - Use the correct project name in the [`build.yaml`](./.github/workflows/build.yaml) workflow file.
  - Use the correct options in the [`test.yaml`](./.github/workflows/test.yaml) workflow file.

> Note: You can also search for the `TODO` comments for a list of information that needs to be replaced.

### Developing Modules

Modify the contents of the main module file ([`cmake/MyProject.cmake`](./cmake/MyProject.cmake)) with variables or functions provided by the new CMake project. If you are new to CMake, refer to [this documentation](https://cmake.org/cmake/help/v3.21/index.html) for more information about CMake.

More module files can also be added under the [`cmake`](./cmake) directory. Just make sure to add the new module files to the include list and install list in the [`CMakeLists.txt`](./CMakeLists.txt) file and the package config file ([`cmake/MyProjectConfig.cmake`](./cmake/MyProjectConfig.cmake)).

After writing the module files, you can build the project using the following command:

```sh
cmake -B build
```

### Testing Modules

Rename and modify the sample test file ([`test/git_clone.cmake`](./test/git_clone.cmake)) to test the variables and functions provided by the module files. The sample test file uses the [Assertion.cmake](https://github.com/threeal/assertion-cmake/tree/v1.0.0) module for testing CMake projects. Refer to [this documentation](https://github.com/threeal/assertion-cmake/tree/v1.0.0#assertion-example) for more information about testing CMake projects using Assertion.cmake.

More test files can also be added under the [`test`](./test) directory. Just make sure to add the new test files to the test list in the [`CMakeLists.txt`](./CMakeLists.txt) file.

After writing the test files, you can test the project using the following command:

```sh
cmake -B build -D MY_PROJECT_ENABLE_TESTS=ON
ctest --test-dir build --output-on-failure
```

> Note: Replace the `MY_PROJECT_ENABLE_TESTS` option with the correct test option.

### Cut a Release

When everything is complete, run the following command to install the new project to the `install` directory:

```sh
cmake --install build --prefix install
```

Files inside the `install` directory can be included in the release files. Before releasing, ensure that this project is at the correct version and pushed to the upstream repository. Refer to [this documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) for more information about releasing a project.
