kind: make

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build

variables:
  make-args: >-
    DYNAMIC=yes
    prefix="%{prefix}"
    lib="%{lib}"
    SBINDIR="%{sbindir}"
    RAISE_SETFCAP=no

  make: make %{make-args}
  make-install: make -j1 install %{make-args} DESTDIR="%{install-root}"

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap.so'
        - '%{libdir}/libpsx.so'

sources:
- kind: git_repo
  url: kernel:libs/libcap/libcap.git
  ref: libcap-2.75-0-gf02e46a44a268f6ea17c95673ecdced31f1188a4
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
