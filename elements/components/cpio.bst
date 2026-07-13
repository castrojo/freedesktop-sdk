# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst

depends:
- public-stacks/runtime-minimal.bst
- components/tar.bst

variables:
  autogen: ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
  conf-local: >-
    --with-rmt="%{libexecdir}/rmt"
  make-args: >-
    MAKEINFO=true

config:
  install-commands:
    (>):
    # man8 is empty and this causes issue with compose element.
    - rm -rf "%{install-root}%{mandir}/man8"

public:
  cpe:
    ignored:
    - CVE-2010-4226

sources:
- kind: git_repo
  url: savannah:cpio.git
  track: v*
  ref: v2.15-0-g900bab656ff24db5e3099941fb909c79c07962ed
- kind: git_module
  url: savannah:paxutils.git
  path: paxutils
  ref: 9ad2a83e9c8de70d83dbe956c144be51f66a9abb
- kind: git_module
  url: savannah:gnulib.git
  path: gnulib
  ref: 29d705ead11382c8d608dcc254394439cb43b9b8
- kind: patch
  path: patches/cpio/Fix-c23-conformity.patch
