kind: autotools
description: GNU readline

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/ncurses.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/ncurses.bst

(@): elements/bootstrap/include/target.yml

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
  ref: readline-8.2-13-g037d85f199a8c6e5b16689a46c8bc31b586a0c94
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
