kind: compose
description: |
  Composes dependencies into the image to be exported
  This is the point where devel split rules are implemented,
  and we define docs and local split rules.

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'
      headers:
      - '%{includedir}/**'

config:
  exclude:
    - extra
    - static-blocklist
    - vm-only
    - tests
    - shells

build-depends:
- sdk.bst
- components/nsswitch-config.bst
- components/python3-sitecustomize.bst
- multiarch/multiarch-sdk.bst
- integration/split-locales.bst
- integration/split-docs.bst
- integration/flatpak-builder-configuration.bst
- integration/debug-app-link.bst
- manifests/sdk-manifest.bst
