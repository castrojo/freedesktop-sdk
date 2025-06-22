kind: flatpak_image

config:
  directory: '%{datadir}/runtime/locale'
  exclude:
  - debug
  - docs
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

build-depends:
- sdk-image.bst
