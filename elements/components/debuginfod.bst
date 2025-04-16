kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/elfutils.bst
- components/libarchive.bst
- components/sqlite.bst
- components/curl.bst
- components/libmicrohttpd.bst
- components/json-c.bst
- components/bzip2.bst

(@):
- elements/bootstrap/include/elfutils-source.yml

variables:
  conf-local: >-
    --enable-debuginfod
    --enable-libdebuginfo
  make-install-args: >-
    %{make-args}
    -C "debuginfod"
    DESTDIR="%{install-root}"
    install

public:
  bst:
    overlap-whitelist:
    - "%{includedir}/elfutils/debuginfod.h"
    - "%{bindir}/debuginfod-find"
    - "%{debugdir}%{bindir}/debuginfod-find.debug"
    - "%{libdir}/libdebuginfod-*.so"
    - "%{libdir}/libdebuginfod.so*"
    - "%{debugdir}%{libdir}/libdebuginfod-*.so.debug"

    split-rules:
      devel:
        (>):
        - "%{libdir}/libdebuginfod.so"
