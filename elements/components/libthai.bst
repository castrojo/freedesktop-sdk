# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libdatrie.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: git_repo
  url: github:tlwg/libthai.git
  track: v*
  ref: v0.1.30-0-ge10e6af55634a993e60e80521ab03b1947044f38
