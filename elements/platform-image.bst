# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
description: |
  Composes dependencies into the image to be exported.
  This is the point where devel is split out of the runtime,
  and we define the domains for docs and locale. We also include
  a manifest.json containing version/source information.

build-depends:
- components/nsswitch-config.bst
- components/python3-sitecustomize.bst
- integration/split-docs.bst
- integration/split-locales.bst
- manifests/platform-manifest.bst
- multiarch/multiarch-platform.bst
- platform.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - static-allowlist
  - vm-only
  - tests
  - shells

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'
      source:
      - '%{sourcedir}/**'
