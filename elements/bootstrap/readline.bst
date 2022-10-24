kind: autotools
description: GNU readline

depends:
- filename: bootstrap/readline-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

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
  ref: readline-8.1-0-gcf3c762ecfff5b2f445647a0f1543693984a5540
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
