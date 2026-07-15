# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU nano

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/ncurses.bst
- components/file.bst

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

sources:
- kind: git_repo
  url: savannah:nano.git
  track: v*
  ref: v9.1-0-g6d980262852d5d915b4a1efe6069408314428555
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
