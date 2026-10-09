# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- bootstrap/gzip.bst

runtime-depends:
- components/bash.bst
#- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/utf-locale.bst
