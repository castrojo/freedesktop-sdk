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
  ref: libcap-2.74-0-gdef8fab2a37d82aa69a534c93da580f335026cbb
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
