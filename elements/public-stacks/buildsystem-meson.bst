# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/gcc.bst
- components/gettext.bst
- components/meson.bst
- components/ninja.bst
- components/pkg-config.bst
- components/stripper.bst
