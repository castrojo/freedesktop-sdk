# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst
- components/libxslt.bst

environment:
  CPPFLAGS: '-I/usr/include/libxml2'

variables:
  build-dir: ''
  conf-local: >-
    --disable-build-docs

config:
  configure-commands:
    (<):
    - |
      sed -i 's/ATTRIBUTE_UNUSED/__attribute__((unused))/g' src/xml_pyx.c

sources:
- kind: tar
  url: tar_https:downloads.sourceforge.net/project/xmlstar/xmlstarlet/1.6.1/xmlstarlet-1.6.1.tar.gz
  ref: 15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca
