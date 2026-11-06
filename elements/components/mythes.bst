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
  ref: v1.2.7-0-gdd077939ef2cf3a1a866e3d40ae7c6d5cc78abbb
