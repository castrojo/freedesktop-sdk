kind: autotools
description: Multi-format archive and compression library

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/lz4.bst
- components/openssl.bst
- components/libxml2.bst
- components/zstd.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

  cpe:
    ignored:
    - CVE-2025-1632

sources:
- kind: git_repo
  url: github:libarchive/libarchive.git
  track: v*
  ref: v3.7.9-0-g8a7a9cc527fd1d6d8664315d3bed47c4259479cc
