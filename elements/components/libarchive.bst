kind: autotools
description: Multi-format archive and compression library

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
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
    - CVE-2024-48615
    patches:
    - CVE-2024-48957
    - CVE-2024-48958

sources:
- kind: git_repo
  url: github:libarchive/libarchive.git
  ref: v3.7.4-0-g313aa1fa10b657de791e3202c168a6c833bc3543
- kind: patch
  path: patches/libarchive/0001-CVE-2024-48957.patch
- kind: patch
  path: patches/libarchive/0002-CVE-2024-48958.patch
