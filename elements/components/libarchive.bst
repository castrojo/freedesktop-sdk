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
  ref: v3.7.2-0-g6468cd1f5c9b76e2c3b10cdd6938faf6b82823b6
