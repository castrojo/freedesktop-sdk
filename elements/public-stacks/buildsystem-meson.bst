# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- components/gcc.bst
- components/stripper.bst
- components/gettext.bst
- components/_private/git-minimal.bst
- components/meson.bst
- components/ninja.bst
- components/pkg-config.bst
