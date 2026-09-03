# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook5-xsl.bst
- components/git.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst
- components/libxslt.bst

environment:
  CPPFLAGS: '-I/usr/include/libxml2'

variables:
  build-dir: ''
  conf-local: >-
    --enable-build-docs

config:
  configure-commands:
    (<):
    - |
      sed -i 's/ATTRIBUTE_UNUSED/__attribute__((unused))/g' src/xml_pyx.c
      autoreconf -sif

sources:
- kind: git_repo
  url: sourceforge_git:xmlstar/code
  ref: 9a470e3db6a632a31d75ed2a6112407e05f92e8d
