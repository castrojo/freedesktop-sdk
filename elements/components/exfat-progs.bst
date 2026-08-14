# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux.bst

sources:
- kind: git_repo
  url: github:exfatprogs/exfatprogs.git
  track: '*.*.*'
  ref: 1.4.3-0-ga37d327389358017d78026ddcba22706773a9cbe
