# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/m4.bst

depends:
- public-stacks/runtime-minimal.bst

environment:
  NOWERROR: "TRUE"

sources:
- kind: git_repo
  url: github:acpica/acpica.git
  track: version-*
  ref: version-20240827-0-ge80cbd7b52de20aa8c75bfba9845e9cb61f2e681
