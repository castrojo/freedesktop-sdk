# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU readline

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/ncurses.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/ncurses.bst

variables:
  conf-local: |
    --with-curses \
    CPPFLAGS="${CPPFLAGS} -I%{sysroot}%{includedir}"

config:
  build-commands:
  - |
    cd "%{build-dir}"
    %{make} SHLIB_LIBS="-Wl,--push-state,--no-as-needed -lncursesw -Wl,--pop-state"

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libreadline.so'
        - '%{libdir}/libhistory.so'

sources:
- kind: git_repo
  url: savannah:readline.git
  # readline doesn't provide patch releases, and just commits patches
  # to git. We track master to get those latest fixes without having
  # to backport them one by one.
  # When reviewing an update, please review what patches it introduces
  track: master
  ref: readline-8.3-3-g553d6bb272f26400d6d4d1cac7c1df84c447449b
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
