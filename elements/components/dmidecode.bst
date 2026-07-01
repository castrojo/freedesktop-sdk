# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{sbindir}"
    mandir="%{mandir}"

sources:
- kind: git_repo
  url: savannah:dmidecode.git
  track: dmidecode-*
  ref: dmidecode-3-7-0-g21a2ee3ff73e71875d171ed1b9b851afa27aa90b
