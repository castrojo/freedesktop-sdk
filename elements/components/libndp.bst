# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:jpirko/libndp.git
  track: v*
  ref: v1.9-0-g2730638bf88984b09531813974f9bd14e1a50165
