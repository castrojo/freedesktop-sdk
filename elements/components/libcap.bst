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
  ref: libcap-2.77-0-g3b2513a1ba696f01d31edfa93f35c30b379cc70e
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
