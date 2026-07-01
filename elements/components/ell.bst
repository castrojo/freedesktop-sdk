# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libell.so'

sources:
- kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.83-0-g002b32d7c091993c5036956bf92d2444aca1c799
