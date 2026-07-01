# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/glib.bst
- components/libslirp.bst
- components/libcap.bst
- components/libseccomp.bst

sources:
- kind: git_repo
  url: github:rootless-containers/slirp4netns.git
  track: v*
  exclude:
  - '*beta*'
  - '*rc*'
  ref: v1.3.4-0-g129916bd8dc2b8eaf621671b3431799c827d689e
