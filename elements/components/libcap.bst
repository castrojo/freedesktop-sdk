kind: make

build-depends:
- components/perl.bst
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    DYNAMIC=yes
    prefix="%{prefix}"
    lib="%{lib}"
    SBINDIR="%{sbindir}"
    RAISE_SETFCAP=no

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

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
  ref: libcap-2.75-0-gf02e46a44a268f6ea17c95673ecdced31f1188a4
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
