kind: autotools
description: Multi-format archive and compression library

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/lz4.bst
- components/openssl.bst
- components/libxml2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

sources:
- kind: git_repo
  url: github:libarchive/libarchive.git
  ref: v3.7.4-0-g313aa1fa10b657de791e3202c168a6c833bc3543
