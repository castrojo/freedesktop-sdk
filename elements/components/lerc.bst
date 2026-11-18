# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libLerc.so'

sources:
- kind: git_repo
  url: github:Esri/lerc.git
  track: v*
  ref: v4.3.0-0-gbbd9531494ac54e49134a19acf4faab4d5cbb7cd
