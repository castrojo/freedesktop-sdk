kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/icu.bst
- components/inih.bst
- components/liburcu.bst
- components/util-linux.bst

variables:
  # This build system does not generate required files under build-dir
  build-dir: ''
  autogen: make configure
  make-args: >-
    PKG_ROOT_SBIN_DIR='%{sbindir}'
    PKG_ROOT_LIB_DIR='%{libdir}'
    PKG_LIB_DIR='%{libdir}'
  make-install: make -j1 %{make-install-args} install-dev

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhandle.so'

sources:
- kind: git_repo
  url: kernel:fs/xfs/xfsprogs-dev.git
  track: v*.*.*
  ref: v6.18.0-0-g8b892adad226bb9fef4009c4cba4dbc25b70b011
