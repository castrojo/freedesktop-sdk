# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
description: |
  Composes dependencies into the image to be exported
  This is the point where devel split rules are implemented,
  and we define docs and local split rules.

build-depends:
- components/nsswitch-config.bst
- components/python3-sitecustomize.bst
- integration/debug-app-link.bst
- integration/flatpak-builder-configuration.bst
- integration/split-docs.bst
- integration/split-locales.bst
- manifests/sdk-manifest.bst
- multiarch/multiarch-sdk.bst
- sdk.bst

config:
  exclude:
  - extra
  - static-blocklist
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
      headers:
      - '%{includedir}/**'
