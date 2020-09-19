kind: autotools
description: GNU readline

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
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
    cd "%{builddir}"
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
- kind: git_tag
  url: savannah:readline.git
  track: master
  match:
  - 'readline-*'
  exclude:
  - '*-alpha*'
  - '*-beta*'
  - '*-rc*'
  ref: readline-8.0-0-g8e6ccd0373d77b86ed37a9a7d232ccfea3d6670c
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
