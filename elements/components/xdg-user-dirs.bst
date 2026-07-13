# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: 'v*.*'
  ref: v0.20-0-gcd05b6d29da1abdb3cd253ef496ae7fd1593e4bb
