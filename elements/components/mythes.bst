# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/hunspell.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmythes-1.2.so'

sources:
- kind: git_repo
  url: github:hunspell/mythes.git
  track: v*
  ref: v1.2.6-0-g3d296572882a81f9efd6de8ff0e43dd71296c2ec
