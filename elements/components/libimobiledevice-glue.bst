# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libplist.bst

sources:
- kind: git_repo
  url: github:libimobiledevice/libimobiledevice-glue.git
  track: '*.*.*'
  ref: 1.3.3-0-gecc0f1ba4fca96f3d7ef060b6c53f2e0bcfe829f
