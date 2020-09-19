kind: autotools
description: GNU ncurses

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

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/ncurses-sources.yml

config:
  configure-commands:
  - |
    mkdir ncurses-build &&
    cd ncurses-build &&
    ../configure \
    --build=%{bootstrapper-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config="%{bindir}/pkg-config" \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --disable-widec \
    --disable-root-environ \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    TIC="%{tools}/bin/tic"

  - |
    mkdir ncursesw-build &&
    cd ncursesw-build &&
    ../configure \
    --build=%{bootstrapper-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config="%{bindir}/pkg-config" \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --enable-widec \
    --disable-root-environ \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    TIC="%{tools}/bin/tic"

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
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

  - |
    %{delete_libtool_files}

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
