# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:swig/swig.git
  track: v*
  exclude:
  - '*beta*'
  ref: v4.4.1-0-gc7b01379fa00ff152bc22d4dd0e0d5bb862282d9
