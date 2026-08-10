# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/gcc.bst
- components/rust.bst
- components/stripper.bst
