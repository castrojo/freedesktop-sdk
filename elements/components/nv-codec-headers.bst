# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="lib/%{gcc_triplet}"

sources:
- kind: git_repo
  track: n*
  url: git_videolan:git/ffmpeg/nv-codec-headers.git
  ref: n13.1.15.0-0-g0a6fba9a2820628b8103464f4c8753ee05838baa
