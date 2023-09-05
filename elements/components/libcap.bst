kind: make

build-depends:
- bootstrap/diffutils.bst
- bootstrap/findutils.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
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
  ref: libcap-2.70-0-g8fe536b53f26b93849336713e50fd0d17272d200
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
