# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: |
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_HTML_DOCS:BOOL=OFF \
    -DBUILD_MAN_DOCS:BOOL=OFF \
    -DBUILD_QTHELP_DOCS:BOOL=OFF

sources:
- kind: git_repo
  url: github:KDE/extra-cmake-modules.git
  track: v*
  exclude:
  - '*rc*'
  ref: v6.30.0-0-g68483132b87f4d7b953aec94ef51d1234d41f937
