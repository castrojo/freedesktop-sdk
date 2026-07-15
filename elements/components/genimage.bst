# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libconfuse.bst

runtime-depends:
- components/dosfstools.bst
- components/e2fsprogs.bst
- components/mtools.bst

sources:
- kind: git_repo
  url: github:pengutronix/genimage.git
  track: v*
  ref: v20-0-g48f63eefd69809b62f68cc78ad7c4142a94a6744
