# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- components/gnutls.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:qpdf/qpdf.git
  track: v*
  exclude:
  - "vcpkg*"
  ref: v12.3.2-0-ga898bb3a7289d1d05789d6d3f0d5dd534943a8da
