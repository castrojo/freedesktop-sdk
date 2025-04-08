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
  cpe:
    ignored:
    - CVE-2024-37407
    - CVE-2025-1632
    patches:
    - CVE-2024-26256
    - CVE-2024-48957
    - CVE-2024-48958

sources:
- kind: git_repo
  url: github:libarchive/libarchive.git
  ref: v3.7.2-0-g6468cd1f5c9b76e2c3b10cdd6938faf6b82823b6
- kind: patch
  path: patches/libarchive/0001-CVE-2024-26256.patch
- kind: patch
  path: patches/libarchive/0002-CVE-2024-48957.patch
- kind: patch
  path: patches/libarchive/0003-CVE-2024-48958.patch
