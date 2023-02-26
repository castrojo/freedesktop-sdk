kind: autotools
description: Multi-format archive and compression library

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

sources:
- kind: git_repo
  url: github:libarchive/libarchive.git
  track: v*
  ref: v3.6.2-0-gba80276ccc3c941c4918ec6e2460059f0c525c43
- kind: patch_queue
  path: patches/libarchive
