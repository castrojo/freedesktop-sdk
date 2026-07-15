# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxslt.bst
- components/python3.bst

variables:
  conf-local: PYTHON="/usr/bin/python3"

sources:
- kind: git_repo
  url: github:itstool/itstool.git
  track: '*.*.*'
  ref: 2.0.7-0-gf1c6544dcd83a73a5ccea9e0c48cf9a47e006190
