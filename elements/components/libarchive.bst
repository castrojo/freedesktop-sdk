# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: Multi-format archive and compression library

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst
- components/lz4.bst
- components/openssl.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - |
      ln -s %{install-root}%{bindir}/bsdunzip %{install-root}%{bindir}/unzip

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
  ref: v3.8.9-0-g27cbc7827172698143e440801fc0ba39ccb4f1f5
