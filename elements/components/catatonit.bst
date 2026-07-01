# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:openSUSE/catatonit.git
  track: 'v*.*.*'
  ref: v0.2.1-0-gbb3b96b99668e544618c5aec427c1f4b6b9ee9bb
