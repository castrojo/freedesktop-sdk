kind: autotools

depends:
- bootstrap-import.bst
- components/lz4.bst
- components/openssl.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

variables:
  builddir: ''
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man

sources:
- kind: git_tag
  url: samba:rsync.git
  track: master
  ref: v3.2.7-0-g6b5ae825db985e9d1c98576651b50c8e490ddb97
  exclude:
  - '*pre*'
