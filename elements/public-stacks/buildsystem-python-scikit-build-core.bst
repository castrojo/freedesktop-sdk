# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/cmake.bst
- components/gcc.bst
- components/ninja.bst
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-scikit-build-core.bst
- components/stripper.bst
