# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/openssl.bst

sources:
- kind: git_repo
  url: github:libevent/libevent.git
  track: release-*-stable
  ref: release-2.1.13-stable-0-g79ddfb460847999b807cba76d04e73891f29c6ee
