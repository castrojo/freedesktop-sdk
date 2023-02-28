kind: autotools
description: GNU readline

build-depends:
- bootstrap/readline-build-deps.bst

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
- kind: git_tag
  url: savannah:readline.git
  track: master
  match:
  - 'readline-*'
  exclude:
  - '*-alpha*'
  - '*-beta*'
  - '*-rc*'
  ref: readline-8.1-0-gcf3c762ecfff5b2f445647a0f1543693984a5540
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
