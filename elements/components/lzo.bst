# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzo2.so'

sources:
- kind: tar
  url: tar_https:www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
  ref: c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072
