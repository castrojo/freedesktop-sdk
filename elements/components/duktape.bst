kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    -f Makefile.sharedlibrary
    INSTALL_PREFIX=%{prefix}
    LIBDIR=/%{lib}
  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install

sources:
- kind: tar
  url: github_files:svaarala/duktape/releases/download/v2.7.0/duktape-2.7.0.tar.xz
  ref: 90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890
- kind: patch
  path: patches/duktape/duktape-lm.patch

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libduktaped.so'
        - '%{libdir}/libduktape.so'