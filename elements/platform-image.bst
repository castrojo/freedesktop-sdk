# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
description: |
  Composes dependencies into the image to be exported.
  This is the point where devel is split out of the runtime,
  and we define the domains for docs and locale. We also include
  a manifest.json containing version/source information.

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

build-depends:
- platform.bst
- components/nsswitch-config.bst
- components/python3-sitecustomize.bst
- multiarch/multiarch-platform.bst
- integration/split-locales.bst
- integration/split-docs.bst
- manifests/platform-manifest.bst
