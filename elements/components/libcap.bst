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
  track: libcap-*.*
  exclude:
  - 'libcap-korg-*'
  ref: libcap-2.70-0-g8fe536b53f26b93849336713e50fd0d17272d200
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
