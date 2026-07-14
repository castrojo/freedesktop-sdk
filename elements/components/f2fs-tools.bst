# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-libs.bst

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/jaegeuk/f2fs-tools.git
  track: v*
  ref: v1.16.0-0-g06c027abc6153c4a97cba5317844e8dcaaee3cf7
- kind: patch
  path: patches/f2fs-tools/android-config-filter.patch
- kind: patch
  path: patches/f2fs-tools/f2fs-tools-use-stdbool.h-instead-of-bool.patch
