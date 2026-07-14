# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  Because sdk-image.bst re-tags ld.so.debug as debug it fails to
  appear in the SDK.

build-depends:
- public-stacks/runtime-minimal.bst

variables:
  linker-pattern: ld-linux*.so*.debug
  (?):
  - target_arch in ("ppc64", "ppc64le"):
      linker-pattern: ld64.so.*.debug


config:
  commands:
  - |
    for path in '%{debugdir}%{libdir}'/%{linker-pattern}; do
      install -D -t "%{install-root}$(dirname "${path}")" "${path}"
    done
  - install -D -t '%{install-root}%{debugdir}/dwz/bootstrap/glibc.bst/' '%{debugdir}/dwz/bootstrap/glibc.bst'/*

public:
  bst:
    split-rules:
      debug: []
