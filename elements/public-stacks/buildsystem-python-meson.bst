# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/gcc.bst
- components/pkg-config.bst
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-meson-python.bst
- components/stripper.bst
