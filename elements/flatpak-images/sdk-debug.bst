kind: flatpak_image

config:
  directory: '%{debugdir}'
  exclude:
  - docs
  - locale
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

build-depends:
- sdk-image.bst
- integration/debug-gl-dir.bst
