kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst
- components/xz.bst
- components/zlib.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/scdoc.bst

variables:
  conf-local: >-
    --with-xz
    --with-zlib
    --with-openssl
    --enable-tools

sources:
- kind: git_repo
  url: kernel:utils/kernel/kmod/kmod.git
  track: v*
  ref: v33-0-ge193aeb99a04fb4b63ce47eb2c7f119db59446a0
