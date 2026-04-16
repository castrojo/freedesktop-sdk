# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/git-minimal.bst
- components/gcc.bst
- components/gettext.bst
- components/meson.bst
- components/ninja.bst
- components/pkg-config.bst
- components/stripper.bst
