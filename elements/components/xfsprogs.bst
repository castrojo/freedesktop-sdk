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
  make: make %{make-args}
  make-install: make %{make-args} -j1 install install-dev DESTDIR='%{install-root}'

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
  ref: v6.4.0-0-gbacc3981d747ee33c13023426c22bdfb72c5a04d
- kind: patch
  path: patches/xfsprogs/po-Fix-invalid-.de-translation-format-string.patch
