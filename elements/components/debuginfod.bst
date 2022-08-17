kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libarchive.bst
- components/sqlite.bst
- components/curl.bst
- components/libmicrohttpd.bst

(@):
- elements/bootstrap/include/elfutils-source.yml

config:
  install-commands:
  - |
    cd debuginfod
    %{make-install}

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
