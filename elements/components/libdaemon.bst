# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: fdsdk_mirror:libdaemon/libdaemon.git
  track: v*
  ref: v0.14-0-g9fcc28e0e8f84968d1fb8b6d544a42efb13803ec
