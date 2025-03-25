kind: autotools

depends:
- bootstrap-import.bst
- components/openssl.bst

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
  ref: v34.1-0-gc4f9d944940550b0cb36e071bca995706c1bb6fa
