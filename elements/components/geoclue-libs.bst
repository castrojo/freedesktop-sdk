# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/geoclue-base.bst

runtime-depends:
- components/geoclue-manifest.bst
- components/glib.bst
- components/json-glib.bst
- components/libsoup.bst

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
