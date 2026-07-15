# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/apparmor-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/apparmor-manifest.bst

config:
  include:
  - libapparmor

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libapparmor.so'
