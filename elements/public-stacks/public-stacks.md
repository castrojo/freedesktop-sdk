<!--
SPDX-FileCopyrightText: Freedesktop-SDK Developers
SPDX-License-Identifier: MIT
-->

# Inheriting Public Stacks

Public stacks are pre-defined collections of build and runtime dependencies that
can be referenced by other BuildStream elements. They provide a convenient way to
simplify declaring common dependency sets for different build systems and runtime
environments. Freedesktop SDK provides two main kinds of stacks those for buildsystems
and those for runtimes.

## Stacks for Build Systems

This collection of stacks is designed to provide the required build backends for a given element.
These do not include any installation or configuration steps associated with a given build type.

|Name|Purpose|
|--|--|
|[buildsystems.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystems.html)|A composed element that aggregates all three major native build system stacks Autotools, CMake, Meson.|
|[buildsystem-autotools.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-autotools.html)|An extension of the Make public stack, features dependencies for projects that use the **GNU Autotools** build system|
|[buildsystem-cmake.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-cmake.html)|Build dependencies for projects that use [**CMake**](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/cmake.html) as their build system.|
|[buildsystem-make.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-make.html)|Build dependencies for projects that use a traditional [**GNU Make**](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/make.html) build system.|
|[buildsystem-meson.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-meson.html)|Build dependencies for projects that use [**Meson**](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/meson.html) as their build system.|
|[buildsystem-python.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python.html)|Aggregated Python build stack that combines all four major Python PEP 517 backend stacks(Flit, Hatchling, Poetry, Setuptools) along with `pip`.|
|[buildsystem-python-flit.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python-flit.html)|Build dependencies for Python projects that use the **Flit** PEP 517 backend ([`flit_core`](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/python3-flit-core.html)).|
|[buildsystem-python-hatchling.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python-hatchling.html)|Build dependencies for Python projects that use the [**Hatchling**](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/python3-hatchling.html) PEP 517 backend.|
|[buildsystem-python-maturin.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python-maturin.html)|Build dependencies for Python projects that use [**Maturin**](https://freedesktop-sdk.gitlab.io/documentatio), the build tool for Rust-based Python extensions.|
|[buildsystem-python-poetry.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python-poetry.html)|Build dependencies for Python projects that use the **Poetry** PEP 517 backend ([`poetry-core`](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/python3-poetry-core.html)).|
|[buildsystem-python-setuptools.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/buildsystem-python-setuptools.html)|Build dependencies for Python projects that use [**Setuptools**](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/components/python3-setuptools.html) as their build backend.|

## Stacks for Runtimes

This collection of stacks is designed to provide runtime resources and tools.

|Name|Purpose|
|--|--|
|[runtime-minimal.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/runtime-minimal.html)|Minimal runtime environment consisting of the GNU C library (glibc), essential symlinks, GCC shared libraries (`gcc-libs`), and UTF-8 locale support. These intentionally do not include the GNU userland allowing for users of this stack to potentially substitute their desired alternates. See [Choose Your Own Userland](https://freedesktop-sdk.gitlab.io/documentation/concepts/userland.html) for more information|
|[runtime-gnu.bst](https://freedesktop-sdk.gitlab.io/documentation/reference/api-reference/fdsdk/elements/public-stacks/runtime-gnu.html)|Runtime environment providing a typical **GNU userland**. Extends the minimal runtime stack with Bash and coreutils, giving you a standard POSIX-compatible shell and command-line utilities at runtime. This stack is commonly inherited by the buildsystem stacks to enable their build platforms.|
