kind: autotools
description: GNU ncurses

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/ncurses-sources.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/ncurses-stage1.bst
- bootstrap/ncurses-pkgconfig-dir.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  local_flags: -std=gnu17
  common-conf-flags: >-
    --build=%{bootstrapper-triplet}
    --host=%{triplet}
    --disable-stripping
    --libdir=%{libdir}
    --with-pkg-config="%{bindir}/pkg-config"
    --with-pkg-config-libdir="%{libdir}/pkgconfig"
    --disable-root-access
    --disable-root-environ
    --disable-setuid-environ
    --with-shared
    --without-ada
    --without-normal
    --enable-pc-files
    --with-termlib
    --prefix=/usr
    TIC="%{tools}/bin/tic"

config:
  configure-commands:
  - |
    mkdir ncurses-build &&
    cd ncurses-build &&
    ../configure \
    %{common-conf-flags} \
    --disable-widec

  - |
    mkdir ncursesw-build &&
    cd ncursesw-build &&
    ../configure \
    %{common-conf-flags} \
    --enable-widec

  build-commands:
  - |
    cd ncurses-build && %{make}

  - |
    cd ncursesw-build && %{make}

  install-commands:
  - |
    cd ncurses-build && %{make-install}

  - |
    cd ncursesw-build && %{make-install}

  - |
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
    mv "%{install-root}%{includedir}/curses.h" "%{install-root}%{includedir}/%{gcc_triplet}/"
    mv "%{install-root}%{includedir}/ncurses.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

  - |
    find "%{install-root}" -name "lib*.a" -delete

  - |
    %{delete-libtool-archives}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/ncurses6-config'
        - '%{bindir}/ncursesw6-config'
        - '%{libdir}/libtinfo.so'
        - '%{libdir}/libtinfow.so'
        - '%{libdir}/libformw.so'
        - '%{libdir}/libform.so'
        - '%{libdir}/libpanel.so'
        - '%{libdir}/libmenuw.so'
        - '%{libdir}/libmenu.so'
        - '%{libdir}/libcurses.so'
        - '%{libdir}/libncursesw.so'
        - '%{libdir}/libncurses.so'
        - '%{libdir}/libpanelw.so'

  cpe:
    version-match: '(\d+)_(\d+)'
