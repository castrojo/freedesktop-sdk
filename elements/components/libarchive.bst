kind: autotools
description: Multi-format archive and compression library

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

sources:
- kind: git_tag
  url: github:libarchive/libarchive.git
  track: master
  ref: v3.6.1-0-g6c3301111caa75c76e1b2acb1afb2d71341932ef
- kind: patch_queue
  path: patches/libarchive
