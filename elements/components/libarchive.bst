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
  ref: v3.7.4-0-g313aa1fa10b657de791e3202c168a6c833bc3543
