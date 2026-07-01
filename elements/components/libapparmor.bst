# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/apparmor-base.bst

runtime-depends:
- components/apparmor-manifest.bst
- public-stacks/runtime-minimal.bst

config:
  include:
  - libapparmor

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libapparmor.so'
