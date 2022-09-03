kind: compose

build-depends:
- bootstrap/build/base-sdk/filtered.bst
- bootstrap/build/base-sdk/symlinks.bst

sandbox:
  build-arch: '%{bootstrap_build_arch}'
