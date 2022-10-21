kind: make

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build

variables:
  make-args: >-
    DYNAMIC=yes
    prefix="%{prefix}"
    lib="lib/%{gcc_triplet}"
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
- kind: git_tag
  url: kernel:libs/libcap/libcap.git
  track: master
  match:
  - 'libcap-*'
  exclude:
  - 'libcap-korg-*'
  ref: libcap-2.66-0-g4f96e6788d535da5f57a3452a54b8d92bd41cd8e
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
