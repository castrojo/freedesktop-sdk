# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/geoclue-base.bst

runtime-depends:
- components/json-glib.bst
- components/glib.bst
- components/libsoup.bst
- components/geoclue-manifest.bst

config:
  include:
  - libgeoclue
  - geoclue-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgeoclue-2.so'
