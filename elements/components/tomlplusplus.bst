# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:marzer/tomlplusplus.git
  track: v*
  ref: v3.5.0-0-gb3f4f173e4a8f1306e314b641658ee7ae4cee79a
